package XTM;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

@ISA = qw(Exporter AutoLoader);
@EXPORT = qw();
@EXPORT_OK = qw( );
$VERSION = '0.29';

use XTM::Memory;
use XTM::Log ('elog');

use URI;

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
  # analyze the 'clusters' of a map, see below
  print Dumper $tm->cluster;


=head1 DESCRIPTION

This class can be used to

=over

=item

to construct/manipulate topic maps and

=item

to tie a particular persistent manifestation of a topic map to an in-memory object, and

=item

to compute statistical information about a map.

=back

It can be used as a top-level class to do all topic map related operations.

=head1 INTERFACE

=head2 Constructor

I<$tm> = new XTM ([ tie         => I<some source> ],
               [ consistency => I<consistency> ]);


The constructor expects no mandatory parameters but you can provide a hash with the
following fields:

=over

=item B<tie>:

If you provide a tieable object (L<XTM::XML>, ...), then this object
is bound to the topic map.

=item B<consistency>:

A consistent map is one which has gone through processing detailled in Annex F of the
XTM specification. By default an XTM object has consistency set to 'standard' which means
that all of the above mentioned processing will occur B<at every modification> of that
with following exception(s):

=over

=item external maps will not be followed automatically (implicit topic map merge, F.5.5).
This is to protect applications from unintentionally pulling in HUGE
ontologies from external maps only because of some topicRefs pointing to these
topics. So this is turned off by default.

=back


Alternatively, the user can
control the extent of 'consistency' by providing a hash reference with the following components:

=over

=item I<merge>: The value is a list reference containing some of the following constants:

=over

=item C<Topic_Naming_Constraint>: see F.5.3

=item C<Subject_based_Merging>: see F.5.2

=item C<Id_based_Merging>: If set, then then two topics with the same id are merged. If not
set, then one topic will substitute the other. This was the old behaviour.

=item C<Application_based_Merging>: not implemented yet.

=item C<all>: includes all above, default

=back

To achieve backward compatibility, you should set

  merge => $XTM::backward_consistency

=item I<duplicate_suppression>: The value is a list reference containing some of the following
constants:

=over

=item C<Subject_Indicator>: see F.6.1

=item C<Topic_Name>: see F.6.2

=item C<Association>: see F.6.3

=item C<Role_Player>: see F.6.4

=item C<all>: includes all above, default

=back

=item I<follow_maps>: The value is a list reference containing some of the following
constants:

=over

=item C<explicit>: see F.5.4,

=item C<implicit>: see F.5.5

=item C<all>: includes all above, default

=back

=back

The use of any other constant will raise an exception whenever the map is
modified for the first time (either by reading it from a tied resource or
when programmatically changing it).

The package provides the following constants

=over

=item C<default_consistency>: all but implicit follow-up of topic references to other maps

=item C<max_consistency>: all

=item C<backward_consistency>: backward compatible behavior

=back

=cut

our $default_consistency  = {merge                 => [ qw(Topic_Naming_Constraint Subject_based_Merging Id_based_Merging) ],
                             duplicate_suppression => [ qw(Subject_Indicator Topic_Name Association Role_Player) ],
                             follow_maps           => [ qw(explicit) ]};

our $max_consistency      = {merge                 => [ qw(Topic_Naming_Constraint Subject_based_Merging Id_based_Merging) ],
                             duplicate_suppression => [ qw(Subject_Indicator Topic_Name Association Role_Player) ],
                             follow_maps           => [ qw(explicit implicit) ]};

our $backward_consistency = {merge                 => [ ],
                             duplicate_suppression => [ ],
                             follow_maps           => [ qw(explicit) ]};

=pod



=back

Examples:

  # empty map
  $tm = new XTM ();

  # map loaded and bound to a particular XTM file, see XTM::XML
  $tm = new XTM (tie         => new XTM::XML (file => 'map.xtm'));

  # fine tuning merging
  $tm = new XTM (tie         => new XTM::XML (file => 'map.xtm'),
                                # TNC is EVIL, EVIL :-)
		 consistency => { merge => [ 'Subject_based_Merging' ],
				# but I do not fear external maps
				  follow_maps => ['all']
				 });

TODO:

  - allow CODEREFs to give total control to the application



=cut

sub new {
  my $class    = shift;
  my %options  = @_;

  $options{consistency} = $default_consistency unless $options{consistency};
  foreach my $c (qw(merge duplicate_suppression follow_maps)) {
    $options{consistency}->{$c} = $default_consistency->{$c} unless $options{consistency}->{$c};
    $options{consistency}->{$c} = $max_consistency->{$c} if grep /^all$/, @{$options{consistency}->{$c}};
  }

  my $self =  bless {
		     tie         => $options{tie},
		     depends     => [],
		     memory      => new XTM::Memory (consistency => $options{consistency} || $default_consistency),
		     last_mod    => time,
		     last_syncin => time,
		    }, $class;
  $self->{memory} = $self->{tie}->sync_in($self->{memory}->{consistency}) if $self->{tie};
  return $self;
}

sub DESTROY {
  my $self = shift;
  return unless defined $self->{id}; # strange calls
  elog ('XTM',3,"in DESTROY $self'".$self->{id}."'");
  return if $self->{id} =~ /^\d+$/;  ## SOAP::Lite hack: using object-by-reference obviously stub objects are bless as 'XTM'
                                     ## dont want DESTROYs of them here.  
  elog ('XTM',5,"    still in DESTROY ", $self->info());
## TODO: sync out in case!!
}

=pod

=head2 Methods

All, except the methods below, are handed over to the corresponding C<memory> component
(L<XTM::Memory>).

=cut

use vars qw($AUTOLOAD);
sub AUTOLOAD {
  my($method) = $AUTOLOAD =~ m/([^:]+)$/;
  return if $method eq 'DESTROY';

#print " in XTM autoload:".join (",",@_);

  $_[0]->{last_read} = time;
  elog ('XTM', 4, "AUTOLOAD forwarding '$method' to memory object"); 
  no strict 'refs';
  *$AUTOLOAD = sub { shift->{memory}->$method(@_) };
  goto &$AUTOLOAD;
}


=pod

=over

=item B<memory>

I<$tm>->memory

returns/sets the L<XTM::Memory> component. Changing this value will cause big, big harm
as there will NOT be a consistency check with the other internal components.

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

=item B<consistency>

I<$hashref> = I<$tm>->consistency

returns the I<consistency> component as hash reference as described in the constructor
above. Currently, this is a read-only method.

=cut

sub consistency {
   my $self = shift;
   return $self->{memory}->{consistency};
}

=pod

=item B<info>

I<$hashref> = I<$tm>->info (I<list of info items>)

returns some meta/statistical information about the map in form of
a hash reference containing one or more of the following components (you might
want to discover the return values with Data::Dumper):

=over

=item (a)

I<informational>: this hash reference contains the number of topics, the number of associations,
the UNIX date of the last modification and synchronisation with the external tied object and
a list reference to other topic maps on which this particular map depends.

=item (b)

I<warnings>

This hash reference contains a list (reference) of topic ids of topics I<not_used> anywhere in the map.
There is also a list (I<no_baseName>) of topics which do not contain any baseName (yes this is allowed in section
3.6.1 of the standard).

=item (c)

I<errors>

This component contains a list reference I<undefined_topics> containing a list of topic identifiers
of topics not defined in the map. 

=item (d)

I<statistics>

This component contains a hash reference to various statistics information, as the number of clusters,
maximum and minimum size of clusters, number of topics defined and topics mentioned.


TODOs:

=over

=item

detect cyclic dependency of topic types

=back

=back

You can control via a parameter in which information you are interested in:

Example:

   $my_info = $tm->info ('informational', 'warning', 'errors', 'statistics');


=cut

sub info {
  my $self  = shift;
  my @what  = @_;

  my $info;
  my $usage;

  foreach my $w (@what) {
    if ($w eq 'informational') {
      $info->{$w} = { #address     => $self,
		      nr_topics   => scalar @{$self->topics},
		      nr_assocs   => scalar @{$self->associations},
		      last_mod    => $self->{last_mod},
		      last_syncin => $self->{last_syncin},
		      depends     => [ map { $_->{memory}->{id} } @{$self->{depends}} ],
		      tieref      => ref ($self->{tie}),
		      id          => $self->{memory} ? $self->{memory}->{id} : undef
		    };
    } elsif ($w eq 'warnings') {
      # figure out those topics which do not seem to have a single baseName
      $info->{$w}->{'no_baseName'} = [];
      foreach my $tid (@{$self->topics()}) {
	push @{$info->{$w}->{'no_baseName'}}, $tid unless $self->topic($tid)->baseNames && @{$self->topic($tid)->baseNames};
      }
      $usage = $self->_usage() unless $usage;

sub _usage {
  my $self = shift;

  my $usage;
  # figure out which topics are used as topicRef (scope, member, role, instanceOf)
  foreach my $tid (@{$self->topics()}) {
    # instanceOfs
    foreach my $i (@{$self->topic($tid)->instanceOfs}) {
      $usage->{as_instanceOf}->{$1}++ if $i->reference->href =~ /^\#(.+)/;
      $usage->{as_instance}->{$tid}++ unless $i->reference->href eq $XTM::PSI::xtm{topic};
    }
    # scopes
    foreach my $b (@{$self->topic($tid)->baseNames}) { 
      foreach my $s (@{$b->scope->references}) {
	if ($s->href =~ /^\#(.+)/) {
	  $usage->{as_scope}->{$1}++;
	}
      }
    }
    foreach my $o (@{$self->topic($tid)->occurrences}) { 
	if ($o->instanceOf->reference->href =~ /^\#(.+)/) {
            $usage->{as_instanceOf}->{$1}++;
	}
        foreach my $r (@{$o->scope->references}) {
	    if ($r->href =~ /^\#(.+)/) {
                $usage->{as_scope}->{$1}++;
	    }
	}
    }
  }
  foreach my $aid (@{$self->associations()}) {
    # instanceOfs
    if (my $i = $self->association($aid)->instanceOf) {
      if ($i->reference->href =~ /^\#(.+)/) {
	$usage->{as_instanceOf}->{$1}++;
      }
    }
    foreach my $m (@{$self->association($aid)->members}) {
      # roles
      if ($m->roleSpec) {
	$usage->{as_role}->{$1}++ if ($m->roleSpec->reference->href =~ /^\#(.+)/);
      }
      # members
      foreach my $r (@{$m->references}) {
	$usage->{as_member}->{$1}++ if ($r->href =~ /^\#(.+)/);
      }
    }
  }
  return $usage;
}
      use Data::Dumper;
##      print STDERR Dumper \%as_instanceOf, \%as_scope, \%as_member, \%as_role;
##print Dumper $usage;

      $info->{$w}->{'not_used'} = [ 
         grep (! ( $usage->{as_instanceOf}->{$_} || 
		   $usage->{as_instance}->{$_}   || 
		   $usage->{as_scope}->{$_}      || 
		   $usage->{as_member}->{$_}     ||
		   $usage->{as_role}->{$_}), @{$self->topics()}) 
				  ];
    } elsif ($w eq 'errors') {
      $usage = $self->_usage() unless $usage;
      $info->{$w}->{'undefined_topics'} = [
         grep (!$self->is_topic($_), (keys %{$usage->{as_instanceOf}},
				      keys %{$usage->{as_instance}},
				      keys %{$usage->{as_scope}},
				      keys %{$usage->{as_member}},
				      keys %{$usage->{as_role}})
	      )
					    ];
    } elsif ($w eq 'statistics') {
      $usage       = $self->_usage() unless $usage;
#use Data::Dumper;
#print STDERR Dumper ($usage);
      my $clusters = $self->clusters();
      my ($tot, $min, $max) = (0, undef, 0);
      foreach my $c (keys %$clusters) {
	  $tot += scalar @{$clusters->{$c}};
	  $min = $min ? ($min > scalar @{$clusters->{$c}} ? scalar @{$clusters->{$c}} : $min) : scalar @{$clusters->{$c}};
	  $max =         $max < scalar @{$clusters->{$c}} ? scalar @{$clusters->{$c}} : $max;
      }

      $info->{$w} = {
		     nr_topics_defined   => scalar @{$self->topics},
		     nr_assocs           => scalar @{$self->associations},
		     nr_clusters         => scalar keys %$clusters,
		     mean_topics_per_cluster => %$clusters ? 1.0 * $tot / scalar keys %$clusters : 1, # empty map => 1 cluster (do not argue with me here)
		     max_topics_per_cluster  => $max,
		     min_topics_per_cluster  => $min,
		     nr_topics_mentioned     => $tot,
		     };
    }; # ignore other directives
  }
  return $info;
}

=pod

=item B<clusters>

I<$hashref> = I<$tm>->clusters

computes the 'islands' of topics. It figures out which topics are connected via is-a, scoping
or other associations and - in case they are - will collate them into clusters. The result is
a hash reference to a hash containing list references of topic ids organized in a cluster.

Example:

  my $clusters = $tm->clusters();
  foreach (keys %$clusters) {
     print "we are connnected: ", join (",", @{$clusters->{$_}});
  }

=cut

sub _assert_cluster {
  my $clusters = shift;
  my $t        = shift;

  unless (defined $clusters->{t2c}->{$t}) {
#print STDERR "node $t not yet\n c2t: because", Dumper ($clusters);
      my $n = keys %{$clusters->{c2t}} ? (sort { $b <=> $a } keys (%{$clusters->{c2t}}))[0] + 1 : 0; # find an unused index
#print STDERR "n is $n";
    $clusters->{c2t}->{$n} = [ $t ]; # new singleton cluster
    $clusters->{t2c}->{$t} = $n;     # we make a link, this is for a quicker access later
  }
#print STDERR Dumper ("after _assert $t cluster is", $clusters);
  return $clusters;
}

sub _merge_clusters {
  my $clusters = shift;
  my ($t1, $t2) = @_; # clusters belonging to these topics should be merged

#print STDERR "merge $t1 $t2??\n";
  my $n1 = $clusters->{t2c}->{$t1};
  my $n2 = $clusters->{t2c}->{$t2};
  ($n1, $n2) = ($n2, $n1) if $n1 > $n2; # I want the first be smaller
  unless ($n1 == $n2) { # merge them unless not already in one boat
#print STDERR "merge $n1 $n2!!\n", Dumper ($clusters);
    grep ($clusters->{t2c}->{$_} = $n1, @{$clusters->{c2t}->{$n2}});   # point to t1's cluster
    push @{$clusters->{c2t}->{$n1}}, @{$clusters->{c2t}->{$n2}};
    delete $clusters->{c2t}->{$n2};  # get rid of old cluster
  }
#print STDERR Dumper ("after _merge $t1, $t2 clusters is", $clusters);
  return $clusters;
}

sub clusters {
  my $self  = shift;

  my $clusters = { c2t => {}, t2c => {}};

  # figure out which topics are used as topicRef (scope, member, role, instanceOf)
  foreach my $tid (@{$self->topics()}) {
    $clusters = _assert_cluster ($clusters, $tid);
    # instanceOfs
    foreach my $i (@{$self->topic($tid)->instanceOfs}) {
      if ($i->reference->href =~ /^\#(.+)/) {
	$clusters = _assert_cluster ($clusters,  $1) ;
	$clusters = _merge_clusters ($clusters,  $tid, $1);
      }
    }
    # scopes
    foreach my $b (@{$self->topic($tid)->baseNames}) {
      foreach my $s (@{$b->scope->references}) {
	if ($s->href =~ /^\#(.+)/) {
	  $clusters = _assert_cluster ($clusters,  $1) ;
	  $clusters = _merge_clusters ($clusters,  $tid, $1);
	}
      }
    }
    # occurrences
    foreach my $o (@{$self->topic($tid)->occurrences}) {
#print STDERR Dumper ($o);
	if ($o->instanceOf->reference->href =~ /^\#(.+)/) {
	    $clusters = _assert_cluster ($clusters,  $1) ;
	    $clusters = _merge_clusters ($clusters,  $tid, $1);
	}
        foreach my $r (@{$o->scope->references}) {
#print STDERR "r is: ", Dumper ($r);
	    if ($r->href =~ /^\#(.+)/) {
		$clusters = _assert_cluster ($clusters,  $1) ;
		$clusters = _merge_clusters ($clusters,  $tid, $1);
	    }
	}
      }
    }
  
  foreach my $aid (@{$self->associations()}) {
    my $ref_t; # reference topic in this association
    # instanceOfs
    if (my $i = $self->association($aid)->instanceOf) {
      if ($i->reference->href =~ /^\#(.+)/) {
	$ref_t ||= $1;
	$clusters = _assert_cluster ($clusters,  $1) ;
	$clusters = _merge_clusters ($clusters,  $ref_t, $1);
      }
    }
    foreach my $m (@{$self->association($aid)->members}) {
      # roles
      if ($m->roleSpec) {
	if ($m->roleSpec->reference->href =~ /^\#(.+)/) {
	  $ref_t ||= $1;
	  $clusters = _assert_cluster ($clusters,  $1) ;
	  $clusters = _merge_clusters ($clusters,  $ref_t, $1);
	}
      }
      # members
      foreach my $r (@{$m->references}) {
	if ($r->href =~ /^\#(.+)/) {
	  $ref_t ||= $1;
	  $clusters = _assert_cluster ($clusters,  $1) ;
	  $clusters = _merge_clusters ($clusters,  $ref_t, $1);
	}
      }
    }
  }
  return $clusters->{c2t};
}

=pod

=item B<induced_assoc_tree>

I<$treeref> = I<$tm>->induced_assoc_tree (
                 [ topic      => I<$start_topic>, ]
                 [ assoc_type => I<$type_topic>,  ]
                 [ a_role     => I<$role_topic>,  ]
                 [ b_role     => I<$role_topic>,  ]
                 [ depth      => I<integer>       ])

computes a tree of topics based on a starting topic, an association type
and two roles. Whenever an association of the given type is found and the given topic appears in the
role given in this very association, then all topics appearing in the other given role are regarded to be
children in the result tree. There is also an optional C<depth> parameter. If it is not defined, no limit
applies. If there are loops implied by this relation, so be it.

Examples:

 
  $hierarchy = $tm->induced_assoc_tree (topic      => $start_node,
					assoc_type => 'at-relation',
					a_role     => 'tt-parent',
					b_role     => 'tt-child' );
  $yhcrareih = $tm->induced_assoc_tree (topic      => $start_node,
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

=item B<induced_vortex>

I<$vortex> = I<$tm>->induced_vortex (I<$some_topic>,
                               I<$what_hashref>,
                               I<$scope_list_ref> )

returns B<a lot> of information about a particular topic. The function expects
the following parameters:

=over

=item I<topic_id>:

the tid of the topic in question (vortex)

=item I<what>:

a hash reference describing the extent of the information (see below)

=item I<scopes>:

a list (reference) to scopes (currently NOT honored)

=back

To control _what_ exactly should be returned, the C<what> hash reference can contain following components:

=over

=item I<t_instances>:

fetches all topics which are instances of the vortex

=item I<t_types>:

fetches all (direct) types of the vortex

=item I<a_instances>:

fetches all associations which are instances of the vortex, additional integers define the C<from> and C<to>
value (say to ask for the first twenty, use 0, 20)

=item I<topic>:

fetches the complete topic itself

=item I<roles>:

fetches all associations where the vortex _is_ a role, additional integers define the C<from> and C<to>
value (say to ask for the first twenty, use 0, 20)

=item I<members>:

fetches all associations where the vortex _plays_ a role, additional integers define the C<from> and C<to>
value (say to ask for the first twenty, use 0, 20)

=item I<tree>:

tries to build a 'tree-view' from the map induced by particular associations.
These associations are characterized via a type (instanceOf) and the relevant roles.
There is also an optional level which allows you to control the depth of the tree.
If the map contains cycles, they will NOT YET be detected. In other words, the
function may loop.

=back

The function will determine all of the requested information and will prepare a hash
reference storing each information into a hash component. Under which name this information
is stored, the caller can determine with the hash above as the example shows:

Example:

  $vortex = $tm->induced_vortex ('some-topic-id',
                                 {
				  't_types'     => [ 't_types' ],
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

#  my $test = $self->association ('a-0000000001');

#  use Data::Dumper;
#print STDERR Dumper $test;

#		   'scope' => bless({
##{
##				      'references' => 'xxxx'
#[
#                                                       bless( {
#							       'href' => 'http://www.topicmaps.org/xtm/1.0/#psi-universal-scope'
#                                                              }, 'XTM::topicRef' )
#						      ]
##				     },
#				     }, 'XTM::scope' ),
#		   'instanceOf' => bless( {
#					   'id' => undef,
#					   'reference' => bless( {
#                                                                  'id' => undef,
#                                                                  'href' => '#at-is-a-topic-map-of'
#								 }, 'XTM::topicRef' )
#					  }, 'XTM::instanceOf' ),
#		   'members' => [
#				 bless( {
#                                         'references' => [
#							  bless( {
#								  'id' => undef,
#								  'href' => '#e-semantopic'
#								 }, 'XTM::topicRef' )
#                                                         ],
#                                         'roleSpec' => bless( {
#							       'id' => undef,
#							       'reference' => bless( {
#										      'id' => undef,
#										      'href' => '#t-topic-maps'
#										     }, 'XTM::topicRef' )
#                                                              }, 'XTM::roleSpec' ),
#                                         'id' => undef
#					}, 'XTM::member' ),
#				 bless( {
#                                         'references' => [
#							  bless( {
#								  'id' => undef,
#								  'href' => '#t-topic-maps'
#								 }, 'XTM::topicRef' )
#                                                         ],
#                                         'roleSpec' => bless( {
#							       'id' => undef,
#							       'reference' => bless( {
#										      'id' => undef,
#										      'href' => '#tt-theme'
#										     }, 'XTM::topicRef' )
#                                                              }, 'XTM::roleSpec' ),
#					 'id' => undef
#					}, 'XTM::member' )
#				],
#		   'id' => 'a-0000000001'
#		  }, 'XTM::association' );
  foreach my $where (keys %{$what}) {
    my $w     = shift @{$what->{$where}};

    if ($w eq 'topic') {
      $_t->{$where} = $t;
      elog ('XTM', 4, "   wish topic");
    } elsif ($w eq 't_instances') {
      my @tids  = @{$self->topics ("is-a $id")};
      my ($from, $to) = _calc_limits (scalar @tids, shift @{$what->{$where}}, shift @{$what->{$where}});
sub _calc_limits {
  my $last  = (shift) - 1; # last available
  my $from  = shift || 0;
  my $want  = shift || 10;
  my $to = $from + $want - 1;
  $to = $last if $to > $last;
  return ($from, $to);
}
      $_t->{$where} = [ @tids[ $from .. $to ] ];
    } elsif ($w eq 't_types') {
      my @tids  = map { $_ =~ s/\#(.*)/$1/; $_ } map { $_->reference->href } @{$t->instanceOfs};
      my ($from, $to) = _calc_limits (scalar @tids, shift @{$what->{$where}}, shift @{$what->{$where}});
      $_t->{$where} = [ @tids[ $from .. $to ] ];
    } elsif ($w eq 'role' || $w eq 'member') {
      my @aids = @{$self->associations ("has-$w $id")};
      my ($from, $to) = _calc_limits (scalar @aids, shift @{$what->{$where}}, shift @{$what->{$where}});
##      $_t->{$where} = [ $test ];
      $_t->{$where} = [ map { $self->association ($_) } @aids[ $from .. $to ] ];
    } elsif ($w eq 'a_instances') {
      my @aids = @{$self->associations ("is-a $id")};
      my ($from, $to) = _calc_limits (scalar @aids, shift @{$what->{$where}}, shift @{$what->{$where}});
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

L<XTM::Memory>, L<XTM::base>

=head1 AUTHOR INFORMATION

Copyright 200[1-2], Robert Barta <rho@telecoma.net>, All rights reserved.

This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.
http://www.perl.com/perl/misc/Artistic.html

=cut

1;

__END__
