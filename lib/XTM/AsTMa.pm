package XTM::AsTMa;

use strict;
use vars qw($VERSION @EXPORT_OK);

require Exporter;
require AutoLoader;

use base qw (XTM::IO);

@EXPORT_OK = qw( astma2xtm );
$VERSION = '0.03';

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

This package provides parsing functionality for AsTMA instances:

=begin html

<BLOCKQUOTE>
<A HREF="http://topicmaps.bond.edu.au/astma/">http://topicmaps.bond.edu.au/astma/</A>
</BLOCKQUOTE>

=end html

=begin man

   http://topicmaps.bond.edu.au/astma/

=end man

Currently, only AsTMa= is supported, but WITHOUT macros.

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

If given, then the AsTMa instance will be read directly from this text. (See method
I<text> how to retrieve the current value).

=item I<auto_complete>

If set to 0, the AsTMa loader will NOT try to automatically generate topics which
have been mentioned without being declared.

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

loads an AsTMa instance and returns a L<XTM::Memory> object. Note that that all undefined
topics will be defined automatically, unless C<auto_complete> is set to 0.

=cut

sub sync_in {
  my $self = shift;

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
  my $ap = new XTM::AsTMa::MemoryBuilder(tm => new XTM::Memory);              # will hold/build the Topic Map
  $ap->handle_astma (text          => $atm_stream,
		     auto_complete => $self->{auto_complete},
		     log_level     => 0);
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

Copyright 2001, 2002, Robert Barta <rho@telecoma.net>, All rights reserved.
 
This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.

=cut

1;

__END__

