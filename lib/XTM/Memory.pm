package XTM::Memory;

use Carp;
use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;
use UNIVERSAL qw(isa);

@ISA = qw(Exporter AutoLoader);
@EXPORT = qw( );
$VERSION = '0.14';

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

I<$mem> = new XTM::Memory ( [ id => I<$id> ] )

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
  my $class   = shift;
  my %options  = @_;
  my $self = bless {id           => $options{id},
		    topics       => {}, # topics ALL have an id
		    associations => {}, # assocs ALL have an id, I love ids....
		    subjects     => {}, # this hash records all subjectIdentifiers and the topics for it
		    merged       => {}, # hash, topic-id -> topic-id, after merging this will be set
		    consistency  => $options{consistency},
		   }, $class;
  return $self;
}

=pod

=head2 Methods

=over

=item B<id>

I<$id> = I<$mem>->id ( [ I<$id> ] )

Returns the id of the topic map. This can be empty if it has never been provided. If a parameter is provided, that scalar will be the new value for the id.

=cut

sub id {
  my $self = shift;
  my $id   = shift;
  return defined $id ? $self->{id} = $id : $self->{id};
}

=pod

=item B<add_topic>

I<$mem>->add_topic ( I<$topic> )

Adds/merge a single topic to the map.

=item B<add>

I<$mem>->add ( I<$topic>, ... )

I<$mem>->add ( I<$association>, ... )

I<$mem>->add ( I<$tm>, ... )

Adds a (list of) topic(s), associations and/or maps. There is a small overhead
involved determining the kind of object to be added. See L<XTM> for the merging rules.

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

sub __do_merge {
  my $self = shift;
  my $t    = shift;   # topic to which everything will be merged into
  my $s    = shift;   # topic which has to be merged, that one will die afterwards (except the tid)
  my $reason = shift; # for some particular reason

#  warn "merging ", $t->id, " and " , $s->id, " ", $reason, "\n";

  # merging instanceOfs is list management
  $t->add__s ($s->instanceOf_s);
  $t->add__s ($s->baseName_s);
  $t->add__s ($s->occurrence_s);
  { # merging Identities, I love complicated if statements
    my $ti = $t->subjectIdentity;
    my $si = $s->subjectIdentity;
    if ($ti && !$si) {                # ignore, nothing new
    } elsif (!$ti && $si) {           # $t did not have, gets one now
      $t->add_ ($s->subjectIdentity);
    } elsif (!$ti && !$si) {          # none where here
    } else {                          # both have something
      my $trr = $ti->resourceRef ? $ti->resourceRef->href : undef;
      my $srr = $si->resourceRef ? $si->resourceRef->href : undef;
      use URI;
      if (defined $trr and defined $srr) { # both resourceRefs defined? then the URI must match
	my $u1 = URI->new($trr);
	my $u2 = URI->new($srr);
	warn "XTM::Memory: incompatible resourceRefs encountered on merging '".$t->id."' and '".$s->id."'"
	  unless URI::eq ($u1, $u2);
	                                   # but we leave it as it is
      } elsif (defined $trr) {             # $srr undefined, leave that
      } elsif (defined $srr) {             # $trr undefined, we have something new
	$t->subjectIdentity->add_resourceRef ($si->resourceRef);
      } else {                             # both undefined
      }
      $ti->add_reference_s (@{$si->references}) if $si->references;
    }
  }
  # merging variants is list management
  $t->add__s ($s->variant_s);

#  unless ($t->id eq $s->id) {                # if we were dealing with different topic ids
#    $self->{merged}->{$s->id} = $t->id;      # note that a merge has happened
#  }                                          # Haensel & Gretel mechanism

  $self->__update_subjects ($t->subjectIdentity, $t->id); # tell the world for which subjects we stand

  foreach my $sid (@{$s->ids}) {
    $self->{topics}->{$sid} = $t;             # get rid of old topic, add the merged results
    $t->add_id_s ($sid);                      # merged topic receives all ids of s
  }
#warn "s sids are ", @{$s->ids};
#warn "t afterwards has ", Dumper $t;
#warn "after merge: ", Dumper $self;

  # we are done now with s

#warn "followup merge check for ", $t->id;
  $self->__check_for_merge ($t->id);          # check whether this merge will trigger a followup merge
#warn "completed merge check for ", $t->id;
}

sub __check_for_merge {
  my $self = shift;
  my $tid  = shift;                                               # new arrived/created/merged topic, might have to merged ...
  my $t    = $self->{topics}->{$tid};                             # ... with something we have already have

#print "_check ", $tid, Dumper $t;

  # now we canonicalize the topic
  $t->canonicalize();

  if (grep ($_ eq 'Subject_based_Merging', @{$self->{consistency}->{merge}})) {
    # check F.5.2.1 (share both the same resourceRef)
    my ($href, $href2);
    if ($t->subjectIdentity && $t->subjectIdentity->resourceRef && ($href = $t->subjectIdentity->resourceRef->href)) {
      foreach my $t2 (grep ($_ != $t, values %{$self->{topics}})) {
#warn "checking sub for ", $t2->id;
	use URI;
	if ($t2->subjectIdentity &&                               # we have identity
	    $t2->subjectIdentity->resourceRef &&                  # and it has an addressable resource
	    ($href2 = $t2->subjectIdentity->resourceRef->href) && # get the href
	    URI::eq ($href, $href2) ) {                           # compare it with the other
#warn "resource ref equal";
	  $self->__do_merge ($t2, $t, "merge share both the same resourceRef");
	  return; # no need to do more with this topic
	}
      }
    }
    # check F.5.2.2 (new one pointing subjectIndicator to existing)
    foreach my $r ($t->subjectIdentity &&
		   $t->subjectIdentity->references ?
		   @{$t->subjectIdentity->references}: ()) {
#	print "afound reference for ", Dumper $r, "\n";
      if (isa($r, 'XTM::topicRef')) {
#	  print "xfound reference for ", Dumper $r, "\n";
	my $t2; eval { $t2 = $self->topic ($r->href) };              # try to find this topic in local map
	if ($t2) {
	  # get rid of this topicRef, it is useless now
	  $t->subjectIdentity->references ( [ grep ($_ != $r, @{$t->subjectIdentity->references}) ] );
	  $self->__do_merge ($t2, $t, "new one pointing subjectIndicator to existing");
	  return; # no need to do more with this topic
	}
      }
    }
    # check F.5.2.2 (existing one pointing subjectIndicator to new)
    {
      my $tid2;
#warn "topic in focus ", $t->id, Dumper $t;
#warn "subjects ", Dumper $self->{subjects};
#warn "our own ids " , Dumper $t->ids;
      if (($tid2 = $self->{subjects}->{$t->id}) && (!grep ($tid2 eq $_, @{$t->ids}))) { # this particular topic is topicRef'd by something
#warn "short before merging";
	my $t2 = $self->topic ($tid2);
	$t2->subjectIdentity->references ( [ grep ($_->href ne $t->id, @{$t2->subjectIdentity->references}) ] );
	$self->__do_merge ($t2, $t, "existing one pointing subjectIndicator to new");
	return;
      }
    }
    # check F.5.2.3 (share at least on URI in references)
    foreach my $r ($t->subjectIdentity && $t->subjectIdentity->references ?
		   @{$t->subjectIdentity->references} : ()) {
      my $uri = URI->new($r->href)->canonical->as_string;            # canonical is better
#warn "checking for ", Dumper( $t), "sharing", $uri;
      my $tid2;
#warn "comparing with subjects " , Dumper $self->{subjects};
      if (($tid2 = $self->{subjects}->{$uri}) && (!grep ($tid2 eq $_, @{$t->ids}))) {# yes we share a subjectIndicator with ourselves, ..
	my $t2 = $self->topic ($tid2);                               # but that is not the point
	$self->__do_merge ($t2, $t, "sharing a subjectIndicator");
	return;
      }
    }
  }
  if (grep ($_ eq 'Topic_Naming_Constraint', @{$self->{consistency}->{merge}})) {
    # F.5.3, same baseName in same scope
    foreach my $t2 (grep ($_ != $t, values %{$self->{topics}})) {
      foreach my $bn2 (@{$t2->baseNames}) {
	foreach my $bn (@{$t->baseNames}) {
	  next unless $bn->baseNameString->string eq $bn2->baseNameString->string;
	  next unless XTM::scope::scope_eq ($bn->scope->references, $bn2->scope->references);
	  $self->__do_merge ($t2, $t, "TNC");
	  return;
	}
      }
    }
  }
  $self->__update_subjects ($t->subjectIdentity, $t->id); # tell the world for which subjects we stand
#  warn "no merge for $tid\n";
}

sub __update_subjects {
  my $self = shift;
  my $si   = shift;
  my $tid  = shift;

  return unless $si;
  $self->{subjects}->{$si->resourceRef->href} = $tid if $si->resourceRef;
  foreach my $r ($si->references ? @{$si->references} : ()) {
    my $uri = URI->new($r->href)->canonical->as_string;
    $self->{subjects}->{$uri} = $tid;
  }
}

sub add_topic {
  my $self = shift;
  my $t    = shift;

  if ($self->{topics}->{$t->id}) {                                      # there exists already a topic with this id
    if (grep ($_ eq 'Id_based_Merging', @{$self->{consistency}->{merge}}))  { # allow merging based on id
      $self->__do_merge ($self->{topics}->{$t->id}, $t, "same id");
    } else {                                                            # there can only be one and we overwrite
      $self->{topics}->{$t->id} = $t;
    }
  } else {                                                              # we see a new id
    $self->{topics}->{$t->id} = $t;
  }
  $self->__check_for_merge ($t->id);                                    # here various merging checks are performed
}

sub add {
  my $self = shift;

  elog ('XTM::Memory', 4, "add ".ref ($_[0])."....");

  foreach my $at (@_) {
    if ($at->isa ('XTM::topic')) {
      $self->add_topic ($at);
    } elsif ($at->isa ('XTM::association')) {
      $self->{associations}->{$at->id} = $at;
    } elsif ($at->isa ('XTM::Memory')) {
      foreach my $t (values %{$at->{topics}}) {
	$self->add_topic ($t);
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


=item B<remove>

I<$listref> = I<$mem>->remove ( I<@list_of_topic_ids> )

removes particular topics and associations specified by their C<id>.
You can provide a list here. The method will return a list references of object (references), which were
removed from the map during this operation. Topic ids not identifying any topic or association
in the map, are silently ignored.

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

=item B<is_topic>, B<is_association>

I<$boolean> = I<$mem>->is_topic       ( I<$topic_id> )

I<$boolean> = I<$mem>->is_association ( I<$association_id> )

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

=item B<topics>

I<$list_ref> = I<$mem>->topics ( [ I<$query> ] )

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
                   'reifies'    'regexp'  regexp_string                               |
                   'indicates'  'regexp'  regexp_string                               |
##                 'instanceOfs' ( '<=' | '==' | '>=' )  set_of_topic_ids | NOT IMPLEMENTED
##                 'scoped_by' topic_id   ## NOT IMPLEMENTED
  regexp_string -> '/' regexp '/'
  regexp        -> <a perl pattern>
  topic_id      -> <id of a topic>
  string        -> <any string with no \' in it>

The regexps are all interpreted as //i, i.e. case-insensitive matching.


=cut

sub _passes_filter {
  my $self = shift;
  my $t    = shift;
  my $f    = shift;
  my $memoize = shift;

  elog ('XTM::Memory', 4, "passing filter  '$f'");
  if ($f =~ /^baseName\s+regexps\s+\/(.+)\/$/) {
    my $regexp = $1;
    elog ('XTM::Memory', 4, "    baseName regexps '$regexp'");
    foreach my $b (@{$t->baseNames}) {  # only one matches => ok
      elog ('XTM::Memory', 5, "       baseName", $b);
      return 1 if $b->baseNameString->string =~ /$regexp/i;
    }
  } elsif ($f =~ /^indicates\s+regexp\s+\/(.+)\/$/) {
    my $regexp = $1;
    if ($t->subjectIdentity) {
      foreach my $r (@{$t->subjectIdentity->references}) {
	return 1 if $r->href =~ /$regexp/i;
      }
    }
    return 0;
  } elsif ($f =~ /^reifies\s+regexp\s+\/(.+)\/$/) {
    my $regexp = $1;
    return 
      $t->subjectIdentity && 
	$t->subjectIdentity->resourceRef &&
	  $t->subjectIdentity->resourceRef->href =~ /$regexp/i;
  } elsif ($f =~ /^occurrence\s+regexps\s+\/(.+)\/$/) { # make no distinction between resourceRef and resourceData
    my $regexp = $1;
    foreach my $o (@{$t->occurrences}) {
##      return 1 if $o->baseName && $o->baseName->baseNameString->string =~ /$regexp/i;
      return 1 if $o->resource->isa ('XTM::resourceRef')  && $o->resource->href =~ /$regexp/i;
      return 1 if $o->resource->isa ('XTM::resourceData') && $o->resource->data =~ /$regexp/i;
    }
  } elsif ($f =~ /^id\s+regexps\s+\/(.+)\/$/) {
    my $regexp = $1;
    return grep ($_ =~ /$regexp/i, @{$t->ids});
  } elsif ($f =~ /^text\s+regexps\s+\/(.+)\/$/) {
    my $regexp = $1;
    foreach my $b (@{$t->baseNames}) {  # only one matches => ok
      return 1 if $b->baseNameString->string =~ /$regexp/i;
    }
    foreach my $o (@{$t->occurrences}) {
      return 1 if $o->baseName && $o->baseName->baseNameString->string =~ /$regexp/i;
      return 1 if $o->resource->isa ('XTM::resourceRef')  && $o->resource->href =~ /$regexp/i;
      return 1 if $o->resource->isa ('XTM::resourceData') && $o->resource->data =~ /$regexp/i;
    }
  } elsif ($f =~ /^id\s+eq\s+\'(.+)\'$/) {
    return grep ($_ eq $1, @{$t->ids});
  } elsif ($f =~ /^assocs(\s+via\s+(\S+))?(\s+as\s+(\S+))?(\s+with\s+(\S+))?(\s+transitively)?$/) {
    my $via   = $1 ? $2 : '';
    my $role  = $3 ? "#$4" : undef;
    my $with  = $5 ? $6 : '';
    my $trans = $7 || '';
    my $id    = $t->id;

    elog ('XTM::Memory', 4, "    assocs via '$via' ".($role ? "role '$role'" : "")." with '$with', $trans");
    my $assocs = $memoize->{"a_instances => $via"} ||
      ($memoize->{"a_instances => $via"} = $via ? $self->associations ("is-a $via") : $self->associations ());

    if ($with) { # then we better start from there, performance
      ($id, $with) = ($with, $id);
      elog ('XTM::Memory', 4, "    assocs via with optimization");
    }
    my $s = $memoize->{$id.$trans} || 
      ($memoize->{$id.$trans} = $self->_topic_tree ($id, $assocs, undef, undef, 0, $trans ? undef : 1));
    elog ('XTM::Memory', 5, "        tree", $s);
    return 0 if ($via  && !scalar             @{$s->{'children*'}}); # no topics via via reached
    return 0 if (         !grep ($with eq $_, @{$s->{'children*'}}));
    elog ('XTM::Memory', 4, "       passed via, with");
    return 1;
  } elsif ($f =~ /^is-a\s+(.+)$/) {
    return $t->has_instanceOf ($1);
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
  my $p = 0; # only used for the uniq sort below
 TOPICS:
  foreach my $t ( grep ($_ != $p && ($p = $_), sort values  %{$self->{topics}} )) {
    last TOPICS if defined $to && $i > $to;
    elog ('XTM::Memory', 4, "  working on ".$t->id);

    foreach my $f ( @filters ) { # only ANDed clauses, yet
      elog ('XTM::Memory', 4, "     checking $f, as $i. for from $from to ".(defined $to ? $to : ''));
      next TOPICS unless $self->_passes_filter ($t, $f, \%memoize);
      elog ('XTM::Memory', 4, "        passed");
    }
    push @ids, $t->id if ($from <= $i++);
  }
  return [ @ids ];
}

=pod

=item B<associations>

I<$list_ref> = I<$mem>->associations ( [ I<$query> ] )

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

=item B<topic>, B<association>

I<$topic_ref>       = I<$mem>->topic       ( I<$topic_id> )

I<$association_ref> = I<$mem>->association ( I<$association_id> )

return a topic/association object (reference) for a given C<id>. If there is no such id, an exception will be raised.

  my $john = $tm->topic ('t-john-lennon');

=cut

sub topic {
  my $self = shift;
  my $id   = shift;
#  while ($self->{merged}->{$id}) { # dereference merged indirection
#    $id = $self->{merged}->{$id}
#  };
  return $self->{topics}->{$id} if $self->{topics}->{$id};
  die "XTM::Memory: topic: No such topic '$id'", caller;
}

sub association {
  my $self = shift;
  my $id   = shift;
  return $self->{associations}->{$id} if $self->{associations}->{$id};
  die "XTM::Memory: association: No such association '$id'";
}

=pod

=item B<baseNames>

I<$hash_ref> = I<$mem>->baseNames ( I<$topic_id_list_ref>,
                              I<$scope_list_ref> )

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

Copyright 200[1-2], Robert Barta <rho@telecoma.net>, All rights reserved.

This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.
http://www.perl.com/perl/misc/Artistic.html

=cut

1;

__END__
