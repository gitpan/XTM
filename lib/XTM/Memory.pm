package XTM::Memory;

use Carp;
use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

@ISA = qw(Exporter AutoLoader);
@EXPORT = qw( );
$VERSION = '0.11';

use Data::Dumper;

use XTM::Log ('elog');
use XTM::topic;
use XTM::association;
use XTM::mergeMap;
use XTM::PSI;

=pod

=head1 NAME

XTM - Topic Map management, in-memory data structure.

=head1 SYNOPSIS

   use XTM::Memory;
   $tm = new XTM::Memory ();

   # adding something
   $tm->add (new XTM::topic (id => "t-beatles", ...));
   $tm->add (new XTM::association (....));

   # removing something
   $tm->remove ('t-beatles');

   # checking something
   print "Hurray" if 
    $tm->is_topic ('t-john-lennon') ||
    $tm->is_association ('a-played-in');

   # finding something
   @rumstis = @{$tm->topics ( "baseName regexps /rumsti.*/" )};

   # fetching names for a scope
   %names = %{$tm->baseNames ([ 't-paul-mccartney', 't-john-lennon' ], 
			      [ 'http://www.topicmaps.org/xtm/language.xtm#en' ])};

=head1 DESCRIPTION

This package provides an in-memory data structure for topic maps. Basically, the
object maintains a hash of topics and a hash of associations. The interface provides
for basic operations to add/delete topics/associations and to query the map via a query language.

=head1 INTERFACE

The interface offers basic access function but also some sophisticated filters to create
sub maps. More convenient functions to retrieve topic and association information can
be found in the XTM::server package distributed seperately.

=head2 Constructor

The constructor expects only one optional parameter, C<id>. If not provided, the C<id> will remain
undefined.

=begin html

<PRE>
   $tm = new XTM::Memory ();
</PRE>

=end html

=begin man

   $tm = new XTM::Memory ();

=end man

=cut
  
sub new {
  my $class    = shift;  
  my %options  = @_;
  my $self = bless {id           => $options{id},
		    topics       => {}, # topics ALL have an id
		    associations => {}, # assocs ALL have an id, I love ids....
		   }, $class;
  return $self;
}

=pod

=head2 Methods

=over

=item I<id>

Returns the id of the topic map. This can be empty it it has never been provided.

=cut

sub id {
  my $self = shift;
  return $self->{id};
}

=pod

=item I<add> 

Adds a (list of) topics, associations and/or maps to the map object with the following rules:

=over


=item 1

If a particular topic/association C<id> does already exist in the map object, the corresponding topic 
will simply be B<overwritten>. This also happens when another map with such a topic/association is merged.


=item 2

No topic merging will (yet) occur.


=back

Examples:

   $t = new XTM::topic (id => "t-portishead", ...);
   $a = new XTM::association (....);
   $tm->add ($t);
   $tm->add ($t1, $t2);
   $a = new XTM::association (....);
   $tm->add ($a);
   $tm->add ($a, $t);
   $tm2 = new XTM::Memory;
   ...
   $tm->add ($tm2);

If a parameter is neither a topic nor an association nor a topic map, an exception will be raised.


=cut

sub add {
  my $self = shift;
  my @ats  = @_;

  elog ('XTM::Memory', 4, "add ".ref ($_[0])."....");

  foreach my $at (@ats) {
    if ($at->isa ('XTM::topic')) {
      $self->{topics}->{$at->id} = $at;
    } elsif ($at->isa ('XTM::association')) {
      $self->{associations}->{$at->id} = $at;
    } elsif ($at->isa ('XTM::Memory')) {
      foreach my $t (values %{$at->{topics}}) {
	$self->{topics}->{$t->id} = $t;
      }
      foreach my $a (values %{$at->{associations}}) {
	$self->{associations}->{$a->id} = $a;
      }
    } else {
      die "XTM: add: invalid parameter, expected topic, association or map";
    }
    # here TNC will kick in. Or not.
  }
}

=pod


=item I<remove>

removes particular topics and associations specified by their C<id>.
You can provide a list here. The method will return a list references of object (references), which were
removed from the map during this operation. C<id>s not identifying any topic or association
in the map, are ignored.

Examples:

  # get rid of a particular topic
  $tm->remove ('t-portishead'); 

=cut

sub remove {
  my $self = shift;
  my @doomed  = @_;
  my @removed = ();
  foreach my $d (@doomed) {
    if ($self->{topics}->{$d}) {
      push @removed, $self->{topics}->{$d};
      delete $self->{topics}->{$d};
    } elsif ($self->{associations}->{$d}) {
      push @removed, $self->{associations}->{$d};
      delete $self->{associations}->{$d};
    }
  }
  return [ @removed ] ;
}                                                                                                                                            
=pod

=item I<is_topic>, I<is_association>

check whether a particular topic/association with a given C<id> exists in the map. 
Returns 1 in that case, C<undef> otherwise.

Examples:

   print "Hurray" if $tm->is_topic ('t-john-lennon') || 
                     $tm->is_association ('a-played-in');

=cut

sub is_topic {
  my $self = shift;
  my $id   = shift;
  return 1 if $self->{topics}->{$id};
}

sub is_association {
  my $self = shift;
  my $id   = shift;
  return 1 if $self->{associations}->{$id};
}

=pod

=item I<topics>

returns a list reference of topic ids for this given map. An optional filter
specification can filter only relevant topics:

Example:

   # get all of them (or at least what the implementation is willing to give)
   $tm->topics ();
   # only with some name
   $tm->topics ( "baseName regexps /rumsti.*/" );

The filter specifications follow the syntax:

  filter        -> clause { 'AND' clause } 
  clause        -> 'baseName'   'regexps' regexp_string                               |
                   'occurrence' 'regexps' regexp_string                               |
                   'text'       'regexps' regexp_string                               | # any text within the topic
                   'id'         'regexps' regexp_string                               |
                   'id'         'eq'      ''' string '''                              |
                   'assocs' [ 'via' topic_id ] [ 'with' topic_id ] [ 'transitively' ] |
                   'is-a'  topic_id                                                   |
##                 'instanceOfs' ( '<=' | '==' | '>=' )  set_of_topic_ids | NOT IMPLEMENTED
##                 'scoped_by' topic_id   ## NOT IMPLEMENTED
  regexp_string -> '/' regexp '/'
  regexp        -> <a perl pattern>
  topic_id      -> <id of a topic>
  string        -> <any string with no \' in it>

=cut

sub _passes_filter {
  my $self = shift;
  my $id   = shift;
  my $f    = shift;
  my $memoize = shift;

  elog ('XTM::Memory', 4, "passing filter  '$f'");
  if ($f =~ /^baseName\s+regexps\s+\/(.+)\/$/) {
    my $regexp = $1;
    elog ('XTM::Memory', 4, "    baseName regexps '$regexp'");
    foreach my $b (@{$self->{topics}->{$id}->baseNames}) {  # only one matches => ok
      elog ('XTM::Memory', 5, "       baseName", $b);
      return 1 if $b->baseNameString->string =~ /$regexp/i;
    }
  } elsif ($f =~ /^occurrence\s+regexps\s+\/(.+)\/$/) { # make no distinction between resourceRef and resourceData
    my $regexp = $1;
    foreach my $o (@{$self->{topics}->{$id}->occurrences}) {
      return 1 if $o->baseName && $o->baseName->baseNameString->string =~ /$regexp/i;
      return 1 if $o->resource->isa ('XTM::resourceRef')  && $o->resource->href =~ /$regexp/i;
      return 1 if $o->resource->isa ('XTM::resourceData') && $o->resource->data =~ /$regexp/i;
    }
  } elsif ($f =~ /^id\s+regexps\s+\/(.+)\/$/) {
    my $regexp = $1;
    return $id =~ /$regexp/i;
  } elsif ($f =~ /^text\s+regexps\s+\/(.+)\/$/) {
    my $regexp = $1;
    foreach my $b (@{$self->{topics}->{$id}->baseNames}) {  # only one matches => ok
      return 1 if $b->baseNameString->string =~ /$regexp/i;
    }
    foreach my $o (@{$self->{topics}->{$id}->occurrences}) {
      return 1 if $o->baseName && $o->baseName->baseNameString->string =~ /$regexp/i;
      return 1 if $o->resource->isa ('XTM::resourceRef')  && $o->resource->href =~ /$regexp/i;
      return 1 if $o->resource->isa ('XTM::resourceData') && $o->resource->data =~ /$regexp/i;
    }
  } elsif ($f =~ /^id\s+eq\s+\'(.+)\'$/) {
    return $id eq $1;
  } elsif ($f =~ /^assocs(\s+via\s+(\S+))?(\s+as\s+(\S+))?(\s+with\s+(\S+))?(\s+transitively)?$/) {
    my $via   = $1 ? $2 : '';
    my $role  = $3 ? "#$4" : undef;
    my $with  = $5 ? $6 : '';
    my $trans = $7 || '';
    elog ('XTM::Memory', 4, "    assocs via '$via' ".($role ? "role '$role'" : "")." with '$with', $trans");
    my $assocs = $memoize->{"a_instances => $via"} ||
      ($memoize->{"a_instances => $via"} = $via ? $self->associations ("is-a $via") : $self->associations ());

    if ($with) { # then we better start from there, performance
      ($id, $with) = ($with, $id);
      elog ('XTM::Memory', 4, "    assocs via with optimization");
    }
    my $t = $memoize->{$id.$trans} || 
      ($memoize->{$id.$trans} = $self->_topic_tree ($id, $assocs, undef, undef, 0, $trans ? undef : 1));
    elog ('XTM::Memory', 5, "        tree", $t);
    return 0 if ($via  && !scalar             @{$t->{'children*'}}); # no topics via via reached
    return 0 if (         !grep ($with eq $_, @{$t->{'children*'}}));
    elog ('XTM::Memory', 4, "       passed via, with");
    return 1;
  } elsif ($f =~ /^is-a\s+(.+)$/) {
    return $self->{topics}->{$id}->has_instanceOf ($1);
  } else {
    die "XTM::Memory: Unimplemented filter '$f'\n";
  }
  return 0;
}

sub topics {
  my $self   = shift;
  my $filter = shift || '';
  my $from   = shift || 0;
  my $to     = shift || undef;

  elog ('XTM::Memory', 3,"topics");
  elog ('XTM::Memory', 5,"    filter  $filter, $from -> ", defined $to ? $to : undef);

  my @ids;
  my $i = 0; # indexes the matches

  $filter =~ s/\s+$//;  # strip leading and
  $filter =~ s/^\s+//;  # trailing blanks
  my @filters = split (/\s+and\s+/i, $filter); # poor man's parsing, only ANDed clauses, no brackets

  my %memoize;  # optimization
 TOPICS:
  foreach my $id ( keys %{$self->{topics}} ) {
    last TOPICS if defined $to && $i > $to;
    elog ('XTM::Memory', 4, "  working on $id");

    foreach my $f ( @filters ) { # only ANDed clauses, yet
      elog ('XTM::Memory', 4, "     checking $f, as $i. for from $from to ".(defined $to ? $to : ''));
      next TOPICS unless _passes_filter ($self, $id, $f, \%memoize);
      elog ('XTM::Memory', 4, "        passed");
    }
    push @ids, $id if ($from <= $i++);
  }
  return [ @ids ];
}

=pod

=item I<associations>

returns the C<id>s of associations. An optional filter specification can filter only relevant associations:

Examples:

  # get _all_  from the map
  @assocs = @{$tm->associations()};
  # get only these matching a specific regexp for the id
  @assocs = @{$tm->associations ('id  regexps /^#a-some-assoc/')};
  # get only these containing a particular topic as a role player
  @assocs = @{$tm->associations ('has_role t-some-role')};
  # get only these containing a particular topic as a member
  @assocs = @{$tm->associations ('has_member t-some-topic AND has_role t-some-role')};
  # with a specific type
  @assocs = @{$tm->associations ('is-a at-relation')};

The filter specifications follow the syntax:

  filter        -> clause { 'AND' clause } 
  clause        -> 'id'    'regexps' regexp_string      |
                   'id'    'eq'      ''' string '''     |
                   'has-role'        topic_id           |
                   'has-member'      topic_id           |
                   'is-a'            topic_id           |
  regexp_string -> '/' regexp '/'
  regexp        -> <a perl pattern>
  topic_id      -> <id of a topic>


=cut

sub _assoc_contains_topic_as_role {
  my $a    = shift;
  my $role = shift;
  use Data::Dumper;
  
  foreach my $m (@{$a->members}) {
    return 1 if $m->{roleSpec}->reference->href eq "#$role";
  }
  return 0;
}

sub _assoc_contains_topic_as_member {
  my $a  = shift;
  my $id = shift;

  use Data::Dumper;
  foreach my $m (@{$a->members}) {
    foreach my $r (@{$m->references}) {
      return 1 if $r->href eq "#$id";
    }
  }
  return 0;
}

sub _assoc_has_instanceOf {
  my $a  = shift;
  my $id = shift;
  
  return $a->instanceOf && ($id =~ /^urn:/ ? 
			      $a->instanceOf->reference->href eq $id :
			      $a->instanceOf->reference->href eq "#$id");
}

sub associations {
  my $self   = shift;
  my $filter = shift || '';

  elog ('XTM::Memory', 3,"associations filter='$filter'");

  $filter =~ s/\s+$//;  # strip leading and
  $filter =~ s/^\s+//;  # trailing blanks
  my @filters = split (/\s+and\s+/i, $filter); # poor man's parsing, only ANDed clauses, no brackets

  my @aids  = keys %{ $self->{associations} };
  foreach my $f (@filters) {
    if ($f =~ /id\s+regexps\s+\/(.+)\//) { # select by id regexp
      my $pattern = $1;
      @aids = grep ( $_ =~ /$pattern/,  @aids);
    } elsif ($f =~ /^id\s+eq\s+\'(.+)\'$/) {
      my $id = $1;
      @aids = grep ( $_ eq $id,  @aids);
    } elsif ($f =~ /has-role\s+(\S+)\s*/) { # only fetch those which contain a specific role
      my $role = $1;
      @aids = grep ( _assoc_contains_topic_as_role ($self->{associations}->{$_}, $role),  @aids);
    } elsif ($f =~ /has-member\s+(\S+)\s*/) { # only fetch those which contain a specific member
      my $member = $1;
      @aids = grep ( _assoc_contains_topic_as_member ($self->{associations}->{$_}, $member),  @aids);
    } elsif ($f =~ /is-a\s+(\S+)\s*/) {
      my $instanceOf = $1;
      @aids = grep ( _assoc_has_instanceOf ($self->{associations}->{$_}, $instanceOf),  @aids);
    } else {
      die "XTM::Memory: Unknown filter '$f' in associations\n";
    }
  }
  return [ @aids ];
}

=pod

=item I<topic>, I<association>

return a topic/association object (reference) for a given C<id>. If there is no such id, an exception will be raised.

  my $john = $tm->topic ('t-john-lennon');

=cut

sub topic {
  my $self = shift;
  my $id   = shift;
  return $self->{topics}->{$id} if $self->{topics}->{$id};
  die "XTM::Memory: topic: No such topic '$id'";
}

sub association {
  my $self = shift;
  my $id   = shift;
  return $self->{associations}->{$id} if $self->{associations}->{$id};
  die "XTM::Memory: association: No such association '$id'";
}

=pod

=item I<baseNames>

receives a list reference containing topic C<id>s. It returns a hash reference containing
the baseName for each topic as a value with the topic id the key. The additional parameter is interpreted as
list reference to scoping topics. If this list is undef, then any basename may be returned. If the list is
empty ([]), then NO basename will ever be returned. If it is non-empty, then - according to the order in
this list - the first basename matching will be selected.

Example:

   $names_ref = $tm->baseNames ([ 't-topic1', 't-topic-2' ], 
				[ 'http://www.topicmaps.org/xtm/language.xtm#en' ]);

=cut

sub baseNames {
  my $self   = shift;
  my $names  = shift;
  my $scopes = shift;

  push @$scopes, $XTM::PSI::xtm{universal_scope} unless ($scopes && @$scopes); # default scope
  
  elog ('XTM::Memory', 3, "baseNames for.... ");
  elog ('XTM::Memory', 4, "  baseNames for ", $names, $scopes);

  my %dict;
  foreach my $n (@{$names}) {
    next if $dict{$n};
    (my $m = $n) =~ s/^\#//;
    if ( $self->{topics}->{$m} ) {  # skip ids where there is nothing
    FIND:
      foreach my $scope (@$scopes) { # iterate over all scopes and find first matching
	elog ('XTM::Memory', 5, "     looking for scope ", $scope);
	foreach my $b (@{$self->{topics}->{$m}->baseNames}) { 
	  elog ('XTM::Memory', 5, "      in baseName ", $b, "scope", $b->scope->references);
	  if (grep ($_->href eq $scope, @{$b->scope->references})) { # OK, perfect match
	    $dict{$n} = $b->baseNameString->string;
	    elog ('XTM::Memory', 5, "      perfect match: found $dict{$n}");
	    last FIND;
	  } elsif (grep ($_->href eq $XTM::PSI::xtm{universal_scope}, @{$b->scope->references})) { 
            # topic map did not care
	    $dict{$n} = $b->baseNameString->string;
	    elog ('XTM::Memory', 5, "      map not care: found $dict{$n}");
	    last FIND;
	  } elsif ($scope eq $XTM::PSI::xtm{universal_scope}) { # user did not care
	    $dict{$n} = $b->baseNameString->string;
	    elog ('XTM::Memory', 5, "      user not care: found $dict{$n}");
	    last FIND;
	  }
	}
      }
    }
    unless ($dict{$n}) { # silent desperation, leave it up to the app to handle this
      $dict{$n} = undef;
    }
  }
  elog ('XTM::Memory', 4, "  result ", \%dict);
  return { %dict };
}



##------------------------------------------------------------
# functions where I am still unsure where they belong to, hmmm.

sub _topic_tree {
  my $self    = shift;
  my $topic   = shift;
  my $aids    = shift;
  my ($a, $b) = (shift, shift);
  my ($currdepth, $maxdepth) = (shift, shift);
  
  elog ('XTM::Memory', 3, "_topic_tree ".
	defined $a ? $a : 'no a'.", ".
	defined $b ? $b : 'no b'.
	" with node $topic type ?? ($currdepth, ".
	defined $maxdepth ? $maxdepth : '-'.")");
  elog ('XTM::Memory', 5, "    assocs: ", $aids);
  
  my $n = { tid         => $topic,
	    children    => [],# contains direct children
	    'children*' => [] # contains also indirect one
	  };

  if (!defined $maxdepth || $currdepth < $maxdepth) {
    foreach my $ar (map { $self->association ($_) } @{$aids}) {
      elog ('XTM::Memory', 4,"checking assoc ",$ar->id);
      my ($a_topic, @b_topics);
      # look whether $a has an instance here
      foreach my $m ( @{$ar->members} ) {
	elog ('XTM::Memory', 4,"    checking for role ", $m->roleSpec->reference->href);
	next if defined $a && $a ne $m->roleSpec->reference->href;
	elog ('XTM::Memory', 4,"      still there because of child");
	foreach my $lr (@{$m->references}) {
	  elog ('XTM::Memory', 4,"  checking out reference ".$lr->href);
	  if ($lr->href eq "#$topic") {
	    elog ('XTM::Memory', 4,"    found $topic playing first role");
	    foreach my $m2 ( @{$ar->members} ) { 
	      elog ('XTM::Memory', 4,"    inner loop for other members");
	      if ($m->roleSpec->reference->href ne $m2->roleSpec->reference->href) { # get forward drift
	        next if defined $b && $b ne $m2->roleSpec->reference->href;
		elog ('XTM::Memory', 4,"    found other playing second role");
		foreach my $ls (@{$m2->references}) {
		  (my $b_topic = $ls->href) =~ s/^\#//;
		  elog ('XTM::Memory', 4,"    drill down for $b_topic");
		  my $child = $self->_topic_tree ($b_topic, 
						  $aids, 
						  $a, 
						  $b, 
						  $currdepth+1, 
						  $maxdepth);
		  push @{$n->{'children'}},  $child;
		  push @{$n->{'children*'}}, $child->{tid}, @{$child->{'children*'}};
		}
	      }
	    }
	    last; # I'm only interested in a tree here
	  }
	}
      }
    }
  }
  return $n;
}



=pod

=back

=head1 SEE ALSO

L<XTM>

=head1 AUTHOR INFORMATION

Copyright 2001, 2002, Robert Barta <rho@telecoma.net>, All rights reserved.

This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.
http://www.perl.com/perl/misc/Artistic.html

=cut

1;

__END__
