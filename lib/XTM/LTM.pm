package XTM::LTM;

use strict;
use vars qw($VERSION @EXPORT_OK);

require Exporter;
require AutoLoader;

use base qw (XTM::IO);

$VERSION = '0.02';

use Carp;
use XTM::Log ('elog');
use XTM::Memory;

=pod

=head1 NAME

XTM::LTM - Topic Map Parsing of LTM instances.

=head1 SYNOPSIS

  # reading a topic map description from a file/url
  $ltm = new XTM::LTM (file => 'mymap.ltm');
  $tm  = $ltm->sync_in();

=head1 DESCRIPTION

This package provides parsing functionality for LTM instances as described in the
package documentation (doc directory) or at

=begin html

<BLOCKQUOTE>
<A HREF="http://www.ontopia.net/download/ltm.html">http://www.ontopia.net/download/ltm.html</A>
</BLOCKQUOTE>

=end html

=begin man

   http://www.ontopia.net/download/ltm.html

=end man

Following clarifications and deviations relative to the LTM specification hold:

=over

=item B<comments>:

The parser does NOT recognizes nested comments. Any closest following */ sequence
terminates a comment.

=item B<scope>:

Only exactly ONE topic can be specified for a scope, but violations are currently
not captured (open issue).

=item B<role type>:

If a role is not specified, it will remain empty and not - as the specification
mandates - will be substituted by the topic type. 

The reasons for this are that, first, a topic might have several
types (which one to use?), secondly that there might be several topics in a member and
thirdly, a role should generally NOT be the type of a member.

This approach would somehow violate the idea of roles in associations, so this should
not be encouraged by any tool.

=item B<merging>:

Merging happens according to the XTM standard. This may affect the item 4 of
section 3.2 according to which topics may be merged without error having different 
subject addresses.

=item B<encoding>:

Only the encodings supported by the local Text::Iconv module are supported.

=item B<BASEURI directive>:

Not (yet) implemented.

=item B<TOPICMAP directive>:

Not implemented.

This directive can give a name to the current topic map. The idea is that this
name can be used inside the map to I<point> to the map. An example would be a
topic reifying the map.

As the map is a resource (either explicit or via a map expression, L<XTM::Virtual>),
there seems to be no good reason to provide an additional name.

=item B<MERGEMAP directive>:

The HyTime, ISO13250 format is not implemented as there is currently no driver in 
XTM::base.
The strings determining the format are checked case-insensitive, so ASTMA and AsTMa
are treated equally.

The location of the map can be defined via any URI handled by LWP::Simple.
If no scheme is provided I<file:> will be assumed.

The format string can be omitted. Then the parser will interpret the location
string as tau expression (L<XTM::Virtual>).

=back


=head1 INTERFACE

=head2 Constructor

The constructor expects a hash as parameter containing one of the following fields:

=over

=item I<url>:

If given, then the LTM instance will be read from this url.

=item I<file>:

If given, then the LTM data will be read from this file (This
is just a convenience function as it will be mapped to I<url>).

=item I<text>:

If given, then the LTM instance will be read directly from this text.

=back

If several fields (C<file>, C<url>, C<text>) are specified, it is undefined which
one will be taken.

Examples:

   $ltm = new XTM::LTM (file => 'here.ltm');
   $ltm = new XTM::LTM (text => '/* this is LTM */ [ ltm ]');

=cut

sub new {
  my $class = shift;
  my %options = @_;
  elog ($class, 4, 'new');

  my $self = bless { }, $class;
  $self->{url} = 'inline:'.$options{text} if $options{text};
  $self->{url} = 'file:'.  $options{file} if $options{file};
  $self->{url} =           $options{url}  if $options{url};

  return $self;
}

=pod

=head2 Methods

=over

=item C<last_mod>

I<$time> = I<$ltm>->last_mod

returns the UNIX time when the resource has been modified last. C<undef> is
returned if the result cannot be determined.


=cut

sub last_mod {
  my $self = shift;

  elog ('XTM::LTM', 4, "last mod on LTM ".$self->{url});
  if ($self->{url} =~ /^file:(.+)/) {
    use File::stat;
    my $stats = stat($1);
    return $stats->mtime;
  } elsif ($self->{url} =~ /^inline:/) {
    return undef;
  } else {
    elog ('XTM::LTM', 3, "Warning: unimplemented scheme '".$self->{url}."' in last_mod");
    return undef;
  }
}

=pod

=item C<sync_in>

I<$tmmemory> = I<$ltm>->sync_in


loads an LTM instance and returns a L<XTM::Memory> object. The only optional parameter is 
C<consistency>. It will be used when building the map while reading the LTM instance. 
See L<XTM> for details.

Notes:

=over

=item All undefined topics will be defined automatically. There is no way to suppress this.

=item Automatically generated topic will NOT have any baseName

=back


=cut

sub sync_in {
  my $self        = shift;
  my $consistency = shift || $XTM::default_consistency;

  elog ('XTM::LTM', 3, 'sync in '.$self->{url});

  my $ltm_stream;                             # fetch the stuff in there
  if ($self->{url} =~ /^inline:(.*)/s) {
    $ltm_stream = $1;
  } else {                                    # some kind of URL
    use LWP::Simple;
    $ltm_stream = get($self->{url}) || die "XTM::LTM: Unable to load '$self->{url}'\n";
    elog ('XTM::LTM', 5, "synced in stream", \$ltm_stream);
  }

  use XTM::LTM::MemoryBuilder;
  my $ap = new XTM::LTM::MemoryBuilder(tm => new XTM::Memory (consistency => $consistency));
  $ap->handle_ltm (text          => $ltm_stream,
		   ##		     log_level     => 2,
		   #auto_complete => $self->{auto_complete}
		  );
  return $ap->{tm};
}

=pod

=item C<sync_out>

is not implemented.

=cut

sub sync_out {
  die "XTM::LTM: sync_out not implementable.";
}

=pod

=back

=head1 SEE ALSO

L<XTM::base>

=head1 AUTHOR INFORMATION

Copyright 200[2], Robert Barta <rho@telecoma.net>, All rights reserved.

This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.
http://www.perl.com/perl/misc/Artistic.html

=cut

1;

__END__

