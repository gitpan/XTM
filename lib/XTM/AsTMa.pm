package XTM::AsTMa;

use strict;
use vars qw($VERSION @EXPORT_OK);

require Exporter;
require AutoLoader;

use base qw (XTM::IO);

$VERSION = '0.07';

use Carp;
use XTM::Log ('elog');
use XTM::Memory;

=pod

=head1 NAME

XTM::AsTMa - Topic Map Parsing of AsTMa instances.

=head1 SYNOPSIS

  # reading a topic map description from a file/url
  $atm = new XTM::AsTMa (file => 'mymap.atm');
  $tm  = $atm->sync_in();

=head1 DESCRIPTION

This package provides parsing functionality for AsTMA instances as described in the
package documentation (doc directory) or at

=begin html

<BLOCKQUOTE>
<A HREF="http://topicmaps.bond.edu.au/astma/">http://topicmaps.bond.edu.au/astma/</A>
</BLOCKQUOTE>

=end html

=begin man

   http://topicmaps.bond.edu.au/astma/

=end man

Currently, only AsTMa= is supported, with the following constraints/additions:

=over

=item no macro support

This feature was experimental and is now deprecated.

=item following directives are supported:

=over

=item %cancel

Cancels the parse process on this very line and ignores the rest of the AsTMa instance. Useful for
debugging faulty maps. There is an appropriate line written to STDERR.

=item %log [ message ]

Writes a line to STDERR reporting the line number and an optional message. Useful for debugging.

=item %name [ name ]

Adds a name attribute to the topic map.

=item %encoding [ encoding ]

Specifies which encoding to use to interpret the B<following> text. This implies that this
directive may appear several times to change the encoding. Whether this is a good idea
in terms of information management, is a different question.

Note: It is still not allowed to use several I<name> : I<encoding> clauses.

Note: If no encoding is provided, utf8 is assumed.

=item %auto_complete [ on/off ]

Turns on/off auto completion.

Note: topics which have been mentioned in a 'is-reified-by' clause will be B<always>
generated.

=back

A directive can be inserted anywhere in the document but must be at the start of
a line.

=back



=head1 INTERFACE

=head2 Constructor

The constructor expects a hash as parameter containing one of the following fields:

=over

=item I<url>:

If given, then the AsTMa instance will be read from this url.

=item I<file>:

If given, then the AsTMa data will be read from this file (This
is just a convenience function as it will be mapped to I<url>).

=item I<text>:

If given, then the AsTMa instance will be read directly from this text.

=item I<auto_complete>

If set to 0, the AsTMa loader will NOT try to automatically generate topics which
have been mentioned without being declared.

Note: topics which have been mentioned in a 'is-reified-by' clause will be B<always>
generated.

=back

If several fields (C<file>, C<url>, C<text>) are specified, it is undefined which 
one will be taken.

Examples:

   $atm = new XTM::AsTMa (file => 'here.atm');
   $atm = new XTM::AsTMa (url  => 'file:here.atm',  # the same
			  auto_complete => 0);      # but with auto_completion turned off
   $atm = new XTM::AsTMa (text => '# this is AsTMa');

=cut

sub new {
  my $class = shift;
  my %options = @_;
  elog ($class, 4, 'new');

  my $self = bless { }, $class;
  $self->{url} = 'inline:'.$options{text} if $options{text};
  $self->{url} = 'file:'.  $options{file} if $options{file};
  $self->{url} =           $options{url}  if $options{url};

  $self->{auto_complete} = defined $options{auto_complete} ? $options{auto_complete} : 1;
  return $self;
}

=pod

=head2 Methods

=over

=item C<last_mod>

I<$time> = I<$atm>->last_mod

returns the UNIX time when the resource has been modified last. C<undef> is
returned if the result cannot be determined.


=cut

sub last_mod {
  my $self = shift;

  elog ('XTM::AsTMa', 4, "last mod on AsTMa ".$self->{url});
  if ($self->{url} =~ /^file:(.+)/) {
    use File::stat;
    my $stats = stat($1);
    return $stats->mtime;
  } elsif ($self->{url} =~ /^inline:/) {
    return undef;
  } else {
    elog ('XTM::AsTMa', 3, "Warning: unimplemented scheme '".$self->{url}."' in last_mod");
    return undef;
  }
}

=pod

=item C<sync_in>

I<$tmmemory> = I<$atm>->sync_in

loads an AsTMa instance and returns a L<XTM::Memory> object. Note that that all undefined
topics will be defined automatically, unless C<auto_complete> is set to 0.

The only optional parameter is C<consistency>. It will be used when building the map
while reading the AsTMa instance. See L<XTM> for details.

=cut

sub sync_in {
  my $self        = shift;
  my $consistency = shift || $XTM::default_consistency;

  elog ('XTM::AsTMa', 3, 'sync in '.$self->{url});

  my $atm_stream;                             # fetch the stuff in there
  if ($self->{url} =~ /^inline:(.*)/s) {
    $atm_stream = $1;
  } else {                                    # some kind of URL
    use LWP::Simple;
    $atm_stream = get($self->{url}) || die "XTM::AsTMa: Unable to load '$self->{url}'\n";
    elog ('XTM::AsTMa', 5, "synced in stream", \$atm_stream);
  }

  use XTM::AsTMa::MemoryBuilder;
  my $ap = new XTM::AsTMa::MemoryBuilder(tm => new XTM::Memory (consistency => $consistency));
  $ap->handle_astma (text          => $atm_stream,
#		     log_level     => 2,
		     auto_complete => $self->{auto_complete});
  return $ap->{tm};
}

=pod

=item C<sync_out>

is not implemented.

=cut

sub sync_out {
  die "XTM::AsTMa: sync_out not implementable.";
}

=pod

=back

=head1 SEE ALSO

L<XTM>

=head1 AUTHOR INFORMATION

Copyright 200[1-2], Robert Barta <rho@telecoma.net>, All rights reserved.

This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.
http://www.perl.com/perl/misc/Artistic.html

=cut

1;

__END__

