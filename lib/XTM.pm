package XTM;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

@ISA = qw(Exporter AutoLoader);
@EXPORT = qw();
@EXPORT_OK = qw( );
$VERSION = '0.20';

use XTM::Memory;
use XTM::Log ('elog');

=pod

=head1 NAME

XTM - Topic Map management

=head1 SYNOPSIS

  use XTM;

  $tm = new XTM; # creating an empty map

  # reading a topic map description from an XML file
  use XTM::XML;
  $xml = new XTM::XML (file => 'mymap.tm'); # create an XML channel, see XTM::XML
  $tm  = new XTM (tie => $xml); # binds variable to channel

  # primitive accessor to fetch/set the memory representation of the map
  print Dumper $tm->memory;
  # basic statistics about a map
  print Dumper $tm->info;


=head1 DESCRIPTION

Topic Maps are a means for layering multidimensional topic spaces on top of
information assets. The standard covers concepts like topics,
associations, scopes and occurrences. Topic Maps are
expected to have a major impact on future information systems (semantic web).

See http://www.topicmaps.org/xtm/1.0/ for more information.

Topic maps can be loaded from an XML based resource (local or remote
via an URL) as prescribed by the XTM standard. There is also a way
to tie a map to a persistent medium. The latter is especially interesting
when running this module along with a (web) server.

=head1 PACKAGES

Following package come with this distribution (L<XTM::Server> is in preparation):

      XTM                          this package, toplevel wrapper for (non-threaded) maps
      XTM::Memory                  in-memory representation of a map

      XTM::XML::PSI                PSI definitions
      XTM::XML                     XML parser
      XTM::XML::Latin1Parser       
      XTM::XML::UTF8
      XTM::XML::Grove2TM

      XTM::Log                     logging facility will be used by others

      XTM::generic                 accessor functions for all below
      XTM::topic                   implementation of the 'topic' class
      XTM::association             implementation of the 'association' class

      XTM::topicRef                generic class definition
      XTM::baseName                generic class definition
      XTM::scope                   generic class definition
      XTM::resourceRef             generic class definition
      XTM::instanceOf              generic class definition
      XTM::subjectIdentity         generic class definition
      XTM::subjectIndicatorRef     generic class definition
      XTM::variant                 generic class definition
      XTM::variantName             generic class definition
      XTM::parameters              generic class definition
      XTM::roleSpec                generic class definition
      XTM::member                  generic class definition
      XTM::mergeMap                generic class definition
      XTM::resourceData            generic class definition
      XTM::baseNameString          generic class definition
      XTM::occurrence              generic class definition


=head1 INTERFACE

=head2 Constructor

The constructor expects no mandatory parameters but you can provide a hash with the
following fields:

=over

=item I<tie>: 

If you provide a tieable object (L<XTM::XML>, ...), then this object
is bound to the topic map. 

=item I<staleness>: (not implemented in this public version)

This additional field  lets you specify how strong the relationship
between the original source (say, XML file) and the map is. Whenever the time difference
between memory copy and the copy on the tie-ed medium exceeds the I<staleness> given, then 
a sync (either in or out) will be done.

=back

  $tm = new XTM ();
  $tm = new XTM (tie => new XTM::XML (file => 'map.xtm'));

=cut

sub new {
  my $class    = shift;  
  my %options  = @_;

  if ($options{tie}->isa ('XTM::Virtual')) {
    elog ('XTM', 3, "in new before virtual syncin");
    return $options{tie}->sync_in();
  } elsif ($options{tie}->isa ('XTM::Remote')) {
    die "XTM: Remote forwarding not yet implemented";
  } elsif ($options{tie}) {
    my $self = bless {
		      tie       => $options{tie},
		      staleness => $options{staleness},
		      depends   => [],
		      memory    => $options{tie}->sync_in()
		     }, $class;

    elog ('XTM', 4, 'before sync in');
    $self->{last_mod} = $self->{last_syncin} = time;
    return $self;
  } else { # unnamed ?
    return bless { memory => new XTM::Memory }, $class;
  }
}

sub DESTROY {
  my $self = shift;
  return unless defined $self->{id}; # strange calls
  elog ('XTM',3,"in DESTROY $self'".$self->{id}."'");
  return if $self->{id} =~ /^\d+$/;  ## SOAP::Lite hack: using object-by-reference obviously stub objects are bless as 'XTM'
                                       ## dont want DESTROYs of them here.  
  elog ('XTM',5,"    still in DESTROY ", $self->info());
## sync out in case
}

=pod

=head1 Methods

All, except the methods below, are handed over to the corresponding C<memory> component.

=cut

use vars qw($AUTOLOAD); 
sub AUTOLOAD {
  my($method) = $AUTOLOAD =~ m/([^:]+)$/;
  return if $method eq 'DESTROY';

  $_[0]->{last_read} = time;
  elog ('XTM', 4, "AUTOLOAD forwarding '$method' to memory object"); 
  no strict 'refs';
  *$AUTOLOAD = sub { shift->{memory}->$method(@_) };
  goto &$AUTOLOAD;
}


=pod

=over

=item I<memory> 

returns/sets the L<XTM::Memory> component. Setting will NOT check the consistency with the
other components.

=cut

sub memory {
  my $self = shift;
  if ($_[0]) {
    elog ('XTM', 5, "memory"); 
    $self->{memory} = $_[0];
    $self->{last_mod} = time;
  }
  return $self->{memory};
}

=pod

=item I<info> 

returns some meta/statistical information about the map in form of
a hash reference.
 

=cut

sub info {
  my $self  = shift;
  return { address     => $self,
           nr_topics   => scalar keys %{$self->{memory}->{topics}},
           nr_assocs   => scalar keys %{$self->{memory}->{associations}},
           last_mod    => $self->{last_mod},
           last_syncin => $self->{last_syncin},
           depends     => [ map { $_->{memory}->{id} } @{$self->{depends}} ],
           tieref      => ref ($self->{tie}),
           id          => $self->{memory} ? $self->{memory}->{id} : undef
           };
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
