package XTM;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

@ISA = qw(Exporter AutoLoader);
@EXPORT = qw();
@EXPORT_OK = qw( );
$VERSION = '0.22';

use XTM::Memory;
use XTM::Log ('elog');

=pod

=head1 NAME

XTM - Topic Map management, single thread class

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

This class can be used to

   - construct/manipulate topic maps and to
   - tie a particular persistent manifestation of a topic map to an in-memory object

=head1 INTERFACE

=head2 Constructor

The constructor expects no mandatory parameters but you can provide a hash with the
following fields:

=over

=item I<tie>: 

If you provide a tieable object (L<XTM::XML>, ...), then this object
is bound to the topic map. 

=back

  $tm = new XTM ();
  $tm = new XTM (tie => new XTM::XML (file => 'map.xtm'));

=cut

sub new {
  my $class    = shift;  
  my %options  = @_;

  my $self =  bless {
		     tie         => $options{tie},
		     depends     => [],
		     memory      => new XTM::Memory,
		     last_mod    => time,
		     last_syncin => time,
		    }, $class;
  $self->{memory} = $self->{tie}->sync_in() if $self->{tie};
  return $self;
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

=item I<induced_assoc_tree>

computes a tree of topics based on a starting topic, an association type
and two roles. Whenever an association of the given type is found and the given topic appears in the
role given in this very association, then all topics appearing in the other given role are regarded to be
children in the result tree. There is also an optional C<depth> parameter. If it is not defined, no limit
applies. If there are loops implied by this relation, so be it.

Examples:

 
  $hierachy = $tm->induced_assoc_tree (topic      => $start_node,
				       assoc_type => 'at-relation',
				       a_role     => 'tt-parent',
				       b_role     => 'tt-child' );
  $yhcareih = $tm->induced_assoc_tree (topic      => $start_node,
				       assoc_type => 'at-relation',
				       b_role     => 'tt-parent',
				       a_role     => 'tt-child',
				       depth      => 42 );


=cut

sub induced_assoc_tree {
  my $self   = shift;
  my $topic  = shift;
  my $params = shift;
 
  elog ('XTM', 3, "induced_assoc_tree for '$topic' (depth = ".$params->{depth}.")");

  (my $assoc_type  = $params->{assoc_type}) =~ s/^\#//; # if it happens to have a #
  my $t = $self->memory->_topic_tree ($topic, 
				      # where are the associations which are relevant?
				      # (do not recompute them over and over, again
				      $self->associations ("is-a $assoc_type"),
				      $params->{a_role}, 
				      $params->{b_role}, 
				      0, 
				      $params->{depth});
  return $t;
}

=pod

=item I<induced_vortex> 

returns _a lot_ of information about a particular topic. The function expects
the following parameters:

=over

=item C<topic_id>:

the tid of the topic in question

=item C<what>:

a hash reference describing the extent of the information (see below)

=item C<scopes>:

a list (reference) to scopes (currently NOT honored)

=back

=item

To control _what_ exactly should be returned, the C<what> hash reference can contain following components:

=over

=item C<t_instances>:

fetches all topics which are instances of the vortex

=item C<a_instances>:

fetches all associations which are instances of the vortex, additional integers define the C<from> and C<to>
value (say to ask for the first twenty, use 0, 20)

=item C<topic>:

fetches the complete topic itself

=item C<roles>:

fetches all associations where the vortex _is_ a role, additional integers define the C<from> and C<to>
value (say to ask for the first twenty, use 0, 20)

=item C<members>:

fetches all associations where the vortex _plays_ a role, additional integers define the C<from> and C<to>
value (say to ask for the first twenty, use 0, 20)

=item C<tree>:

tries to build a 'tree-view' from the map induced by particular associations.
These associations are characterized via a type (instanceOf) and the relevant roles.
There is also an optional level which allows you to control the depth of the tree.
If the map contains cycles, they will NOT YET be detected. In other words, the
function may loop.

=back

=item

The function will determine all of the requested information and will prepare a hash
reference storing each information into a hash component. Under which name this information
is stored, the caller can determine with the hash above as the example shows:

Example:

  $vortex = $tm->induced_vortex ('some-topic-id',
                                 {
				  't_instances' => [ 't_instances' ],
				  'a_instances' => [ 'a_instances', 0, 20 ],
				  'topic'       => [ 'topic' ],
				  'roles'       => [ 'role', 0, 10 ],
				  'members'     => [ 'member' ],
				  'treeup'      => [ 'tree', {assoc_type => '#at-content-relation',
							      a_role     => '#tt-content-parent',
							      b_role     => '#tt-content-child',
							      depth      => 2} ],
				  'treedown'    => [ 'tree', {assoc_type => '#at-content-relation',
							      b_role     => '#tt-content-parent',
							      a_role     => '#tt-content-child',
							      depth      => 2} ] 
				 },
				 [ 'scope1', 'scope2', .... ]
				);

=cut

sub induced_vortex {
  my $self   = shift;
  my $id     = shift;
  my $what   = shift;
  my $scopes = shift;

  use Data::Dumper;
  elog ('XTM', 3, "induced_vortex '$id'");
  elog ('XTM', 4, "     ", $what);
  
  my $t = $self->topic ($id);
  my $_t; # here all the goodies go

  foreach my $where (keys %{$what}) {
    my $w     = shift @{$what->{$where}};

    if ($w eq 'topic') {
      $_t->{$where} = $t;
      elog ('XTM', 4, "   wish topic");
    } elsif ($w eq 't_instances') {
      my $from  = shift @{$what->{$where}} || 0;
      my $to    = shift @{$what->{$where}} || $from + 10 - 1; # I love hard-coded limits...
      my @tids  = @{$self->topics ("is-a $id")};
      $_t->{$where} = [ @tids[ $from .. $to ] ];
    } elsif ($w eq 'role' || $w eq 'member') {
      my $from  = shift @{$what->{$where}} || 0;
      my $to    = shift @{$what->{$where}} || $from + 10 - 1; # I love hard-coded limits...
      my @aids = @{$self->associations ("has-$w $id")};
      $_t->{$where} = [ map { $self->association ($_) } @aids[ $from .. $to ] ];
    } elsif ($w eq 'a_instances') {
      my $from  = shift @{$what->{$where}} || 0;
      my $to    = shift @{$what->{$where}} || $from + 10 - 1; # I love hard-coded limits...
      my @aids = @{$self->associations ("is-a $id")};
      $_t->{$where} = [ map { $self->association ($_) } @aids[ $from .. $to ] ];
    } elsif ($w eq 'tree') {
      my $how = shift @{$what->{$where}}  ;
      $_t->{$where} = $self->induced_assoc_tree ($id, $how);
      }
  }
  return $_t;
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
