package XTM::XML;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

@ISA = qw(Exporter AutoLoader);
@EXPORT = qw( );
$VERSION = '0.06';

use Carp;
use XML::Grove;     
use XML::Grove::Path;
use XML::Parser::PerlSAX;

use XTM::Memory;
use XTM::Log ('elog');

=pod

=head1 NAME

XTM::XML - Topic Map management, syncing with XML data

=head1 SYNOPSIS

  use XTM::XML;

  # reading a topic map description from an XML file
  $xml = new XTM::XML (file => 'mymap.tm');

=head1 DESCRIPTION

This package provides an abstract class to deal with TMs stored in XML form,
be it on files or as a string.

=head1 INTERFACE

=head2 Constructor

The constructor expects a hash as parameter containing one of the following fields:

=over

=item I<url>: 

If given then the XML data will be read/written from/to this url.

=item I<file>: 

If given then the XML data will be read/written from/to this file (This
is just a convenience function as it will be mapped to I<url>).

=item I<text>: 

If given then the XML data will be read/written from/to this text. (See method
I<text> how to retrieve the current value).

=back

If several fields are specified, an exception will be raised.

Examples:

   $xtm = new XTM::XML (file => 'here.xml');
   $xtm = new XTM::XML (url  => 'file:here.xml');  # the same
   $xtm = new XTM::XML (text => '<?xml version="1.0"?><topicmap> ...</topicmap>');

=cut

sub new {
  my $class = shift;
  my %options = @_;
  elog ($class, 4, 'new');
  die "XTM::XML: constructor: too many contradicting sources" if keys %options > 1;
  my $self = bless { }, $class;
  $self->{url} = 'inline:'.$options{text} if $options{text};
  $self->{url} = 'file:'.  $options{file} if $options{file};
  $self->{url} =           $options{url}  if $options{url};
  return $self;
}

my $tmns   = 'http://www.topicMaps.org/xtm/1.0/';

=pod

=head2 Methods

The methods C<sync_in>, C<sync_out> and C<last_mod> implement the methods from
the abstract class.

=over

=item C<last_mod> 

returns the UNIX time when the resource has been modified last. C<undef> is
returned if the result cannot be determined.


=cut

sub last_mod {
  my $self = shift;

  elog ('XTM::XML', 4, "last mod on XML ".$self->{url});
  if ($self->{url} =~ /^file:(.+)/) {
    use File::stat;
    my $stats = stat($1);
    return $stats->mtime;
  } elsif ($self->{url} =~ /^inline:/) {
    return undef;
  } else {
    elog ('XTM::XML', 3, "Warning: unimplemented scheme '".$self->{url}."' in last_mod");
    return undef;
  }
}

=pod

=item C<sync_in>

actually loads an XTM resource and returns a L<XTM::Memory> object.


=cut

sub sync_in {
  my $self = shift;

  elog ('XTM::XML', 3, 'sync in '.$self->{url});
  my $stream;
  if ($self->{url} =~ /^inline:(.*)/) {
    $stream = $1;
  } else { # some kind of URL
    use LWP::Simple;
    $stream = get($self->{url}) || die "XTM::XML: Unable to load '$self->{url}'\n";
    elog ('XTM::XML', 5, "synced in stream", \$stream);
  }
  use XTM::XML::Latin1Parser;
  my $grove_builder = XTM::XML::Latin1Parser->new;
  my $parser = XML::Parser::PerlSAX->new ( Handler => $grove_builder );
  my $grove;
  $grove  = $parser->parse ( Source => { String => $stream,
                                         Encoding => 'ISO-8859-1' } );
  use Data::Grove::Visitor;
  my $tm = new XTM::Memory;
  use XTM::XML::Grove2TM;
  $grove->accept_name (XTM::XML::Grove2TM->new, $tm);
  elog ('XTM::XML', 5, '   sync in tm: ', $tm);
  return $tm;
}

=pod

=item C<sync_out>

is currently not implemented.


=cut

sub sync_out {
  die "XTM::XML: sync_out not yet implemented.";
}

=pod

=back

=head1 SEE ALSO

L<XTM>

=head1 AUTHOR INFORMATION

Copyright 2001, Robert Barta <rho@telecoma.net>, All rights reserved.
 
This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.

=cut

1;

__END__

