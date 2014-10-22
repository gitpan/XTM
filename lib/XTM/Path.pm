package XTM::Path;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

@ISA = qw(Exporter AutoLoader);
@EXPORT = qw();
@EXPORT_OK = qw( );
$VERSION = '0.06';

use XTM::Memory;
use XTM::Log ('elog');
use XTM::grammar;

use XTM::topic;
use XTM::baseName;
use XTM::baseNameString;
use XTM::occurrence;
use XTM::resourceRef;
use XTM::resourceData;
use XTM::instanceOf;
use XTM::topicRef;
use XTM::subjectIndicatorRef;
use XTM::subjectIdentity;
use XTM::scope;
use XTM::association;
use XTM::member;
use XTM::roleSpec;

use XTM;

use URI;

=pod

=head1 NAME

XTM::Path - Topic Map management, XPath like retrieval and construction facility

=head1 SYNOPSIS

  use XTM::XML;
  $tm  = new XTM (tie => new XTM::XML (file => 'mymap.tm')); # binds variable to channel

  use XTM::Path;
  my $xtmp = new XTM::Path (default => $tm);

  # find particular topics and print topic id
  foreach my $t ($xtmp->find ('/topic[.//baseNameString/text() = "test"]')) {
    print $t->id;
  }

  # same using find twice
  foreach my $t ($xtmp->find ('/topic[.//baseNameString/text() = "test"]')) {
    print $xtmp->find ('@id', $t);
  }

  # create a topic
  $t = $xtmp->create ('topic[@id = "id0815"]');
  # same but with baseName
  $t = $xtmp->create ('topic[@id = "id0815"]/baseNameString[text() = "test"]');
  # associations are always cumbersome
  $a = $xtmp->create ('association[member
                                     [roleSpec/topicRef/@href = "#role1"]
                                     [topicRef/@href = "#player1"]]
                                  [member
                                     [roleSpec/topicRef/@href = "#role2"]
                                     [topicRef/@href = "#player2"]]');

=head1 DESCRIPTION

This class provides a simple way to drill down the XTM data structures by
following an XPath like approach.

The XTM standard (http://www.topicmaps.org/xtm/) is used as the basis to
formulate XTM-Path queries. To find a particular topic, for instance, you might
use

  /topic[.//baseNameString = "some name"]

It is important to note that this package will NOT work on the original XTM
document (this might even not exist if the map is created via other means),
but is instead using the L<XTM::base> data structure. This implies that all
querying is done B<after> merging and consolidation has been done.

Obviously, XTM::Path B<cannot> be a complete query language, but it is useful
in many development situations where drilling down the data structure is a cumbersome
exercise. Together with intelligent C<add> methods in L<XTM::Memory> and L<XTM::generic> this 
should simplify drastically the access, creation and manipulation of XTM data structures.


=head2 Path Expressions

=over

=item Axis:

While the syntax (see below) allows for child and descendant axes, both are
ignored as the XTM structure is known apriori. This allows a considerable simplification
compared to XPath.

As a consequence, it does not make a difference to write

  /topic//resourceData

or

  /topic/resourceData

In both cases the interpreter B<knows> that a C<resourceData> element can
only be within an occurrence.

One caveat: The path expression

  /topic/instanceOf

addresses the C<instanceOf> elements B<directly> below the C<topic> node but it
hides those C<instanceOf>s inside the occurrences.

=item Context:

Path expressions are interpreted always relative to a particular context. That might be a
complete topic map object, or any part of it. Thus the following expressions are
equivalent:

  /topic
  ./topic
  //topic
  topic

Similarily for the '//' operator:

  //member
  .//member
  ...

=item Values:

As usual, the value of a Path is the text() addressed by it. In this sense

   /topic/baseName/baseNameString/text()

and

   /topic/baseName/text()

may have the same value (In XTM there is #PCDATA data allowed in other subelements
of baseName).

=back

=head2 Syntax

Currently expressions can have the following simple syntax (EBNF):

   path 	--> { axis relativepath }

   axis         --> child | descendant

   child        --> './'  | '/'

   descendant   --> './/' | '//'

   relativepath --> ( XTM_element_name | '@' XTM_attribute_name | 'text()' ) { predicate }

   predicate    --> '[' expr ']'

   expr         --> simple_expr

   simple_expr  --> path | boolean_expr

   boolean_expr --> path compare_op value

   compare_op   --> '=' | '!=' | '<' | '>' | '<=' | '>='

   value        --> numeric | string | variable

   variable     --> ?name


=head2 Elements

Following XTM elements are B<not> included:

=over

=item C<mergeMap>:

The XTM data structures are already completely merged. This is element
would not appear.

=item C<topicMap>:

As the context is already a topic map object (or smaller), such an element
would never been found.

=back

=head2 Attributes

Following attributes are included:

=over

=item C<id>:

This is only applicable for C<topic> and C<association> elements. When creating, the
id attribute can be only be used together with topic, not with associations.

=item C<href>:

This is only application for C<topicRef>, C<subjectIndicatorRef>, C<resourceRef> elements.

=back

=head2 Variables

See the hint about speed.

=head2 Examples

   # find a particular topic by id
   topic[@id = "sheryl_crow"]
   # find a topic by baseName
   topic[baseName/baseNameString = "If it Makes You Happy"]
   # equivalently
   topic[baseName = "If it Makes You Happy"]

   # find a particular association with a role
   association[member/roleSpec/topicRef/@href = "#artist"]
   # or a particular role player
   association[member/topicRef/@href = "#sheryl_crow"]
   # combine this
   association[member/roleSpec/topicRef/@href = "#artist"][member/topicRef/@href = "#sheryl_crow"]

=head2 Hints and Tips

=over

=item I<Why is [0] and [position() = 2] not implemented?>

The method C<find> will return a Perl list. Once you have this list, you can easily slice
and index it. Also, the order in the data structure is a rather flaky criterion to search
for. It makes sense to reference an order in a document, but after merging topics no simple
and robust definition how a resulting topic is organized can be given.

=item I<Why is it not blindingly fast?>

While I tried to be not too wasteful, there are some situations in which the code
is evaluating some useless alternatives. This is when it has to 'guess' parent nodes,
as in

  topic/@href

The more hints you provide, the more biased the traversal will be. So, for instance,
the above can be sped up with:

  topic/instanceOf/topicRef/@href

=item I<Why do I see an error message about ambiguity using baseName[text() = "something"] when creating>

The XTM syntax allows #PCDATA inside a baseNameString. The baseName may also may contain
variants which - in turn - may contain another resourceData. So the above itself is not unambiguous. Use
baseNameString[text() = "something"] instead.

=item I<How can I improve the speed?>

Try to avoid parsing. The object will maintain cached copies of an already
parsed expression, so here the package tries to take care itself.

If you use always a slightly different expression, you might want to use variables,
as in

  foreach my $n (...all names...) {
     $xtmp->find ('topic[baseNameString = ?n]', undef, { n => $name});
  }

That way the expression remains the same and can be cached.

=item I<It is still not fast. What else?>

What you should also try to avoid is to create new objects too frequently.
Every object needs a parser which has to be instantiated. This is also
an expensive operation.

There is no reason (aside from a slightly increased memory consumption)
why you should not use one and the same object for various finds.

=item I<When creating data structures, they are not automatically filled
with defaults according to XTM?>

No, you should use the methods C<add_default> for XTM::topics and XTM::associations
to explicitely control this once your are done with a particular I<create>.

=back

=head1 INTERFACE

=head2 Constructor

I<$xtmp> = new XTM::Path (default => I<$tm>)

The constructor returns a new XTM::Path objects which will be used further on to
perform queries. Optional, you may pass I<any> XTM object (maps or components thereof).
This object will become the default context (ala XPath) which will be used in case
no other context is explicitely used.

Example:

  $xtmp = new XTM::Path (default => $tm);

=cut

sub new {
  my $class = shift;
  my %options = @_;

  return bless { %options }, $class;
}

=pod

=head2 Methods

=over

=item B<find>

I<@nodelist> = I<$xtmp>->find (I<$path>, [I<$context>], [I<$value_hash>])

B<find> returns a unique list of subnodes of the context which conform to the 
XTM::Path specification provided as the first parameter. If the second 
parameter is missing the XTM::Path expression will be evaluated against
the default context (see constructor). If there is no context (neither 
default or explicit), then an exception will be raised.

Examples:

  # get the first topic with 'test' as baseName
  ($t) = $xtmp->find ('/topic[.//baseNameString == "test"]');
  # retrieve all baseNames of this topic
  @basenames = $xtmp->find ('/baseName', $t);

  # same in one step
  @basenames = $xtmp->find ('/topic[.//baseNameString == "test"]//baseName');

  # find all topics, providing explicitely a context
  @topics = $xtmp->find ('/topic', $tm2);

Since version 0.06 the object caches already parsed expressions to avoid expensive 
parsing at every invocation of I<find>. To increase the cache rate you should consider 
to use variables (see Hints).


=cut

our $xtmpath_grammar = q {
                         path_startrule : path | <error: Invalid xxx syntax near "$text">

			 path : step(s)
			 {
			  $return = $item{'step(s)'};
			 }

			 step : axis(?) relative_path

			 axis :  descendant | child

                         child: './' | '/'

			 descendant : './/' | '//'

			 relative_path : XTM_thing predicate(s?)
			 {
			   $return = { %{$item{'XTM_thing'}},
				       predicates => []};
			   foreach (@{$item{'predicate(s?)'}}) {
			     push @{$return->{predicates}}, $_;
			   }

			 }

			 XTM_thing : ( XTM_element | XTM_attribute | XTM_data )

			 XTM_data : 'text()'
			 {
			  $return = { 'data' => 1 };
			  }

			 XTM_element : ('topicRef'            |
					'topic'               |
					'baseNameString'      |
					'baseName'            |
					'occurrence'          |
					'resourceRef'         |
					'resourceData'        |
					'instanceOf'          |
					'subjectIndicatorRef' |
					'subjectIdentity'     |
					'scope'               |
					'association'         |
					'member'              |
					'roleSpec' )
			 {
			  $return = { 'element' => $item[1] };
			  }

			 XTM_attribute : '@' ( 'href' | 'id' )
			 {
			  $return = { 'attribute' => $item[2] };
			  }

			 predicate : '[' expr ']'
			 {
			   $return = $item{expr};
			 }

			 expr : simple_expr

			 simple_expr : path op_value(?)
			 {
			   $return = [ $item{path} ];
			   if ($item{'op_value(?)'} && $item{'op_value(?)'}->[0]) {
			     push @$return, @{$item{'op_value(?)'}->[0]};
			   }
			 }

			 op_value : compare_op value
			 {
			   my %OPS = (
				      '=' => 'eq',
				      '!=' => 'ne',
				      '<' => '<',
				      '>' => '>',
				      '<=' => '<=',
				      '>=' => '>=',
				     );
			   my $op = $OPS{$item{compare_op}};

			   $return = [ $op, $item{value} ];
			 }

			 compare_op : '=' | '!=' | '<' | '>' | '<=' | '>='

			 value : path_numeric | path_string | variable

			 variable : /\?\w+/
			 {
			  $item[1] =~ /\?(.+)/;
			  $return = { variable => $1 };
			 }

			 path_numeric : /[\+\-\d\.]+/

			 path_string : '"' /[^\"]*/ '"'
			 {
			  $return = $item[2];
			 }
			};


sub __make_parser {
  my $parser;
  eval {
    require XTM::Path::CParser;
    $parser = XTM::Path::CParser->new();
  }; if ($@) {
    warn "could not find CParser ($@)";
    use Parse::RecDescent 1.90;
    $parser = new Parse::RecDescent ($xtmpath_grammar) or die "XTM::Path: Problem in grammar";
  };
  return $parser;
}

sub __do_parse {
  my $pe     = shift;
  my $parser = shift;
  my $p;
  eval {
    $p = $parser->path_startrule (\$pe);
    #    use Data::Dumper;
    #    warn "pe is now '$pe'\n".Dumper $p;
    die "XTM::Path: Invalid syntax around '$pe'" if $pe =~ /\S/;
  }; if ($@) {
    die $@;
  }
  return $p;
}  


sub find {
  my $self    = shift;
  my $pe      = shift;
  my $context = shift || $self->{default};
  my $values  = shift || {};
  
  die "XTM::Path: no context defined"            unless $context;
  die "XTM::Path: values must be hash reference" unless ref ($values) eq 'HASH';
  
  unless ($self->{parser}) { # used cached one
    $self->{parser} = __make_parser();
  }

  unless ($self->{cache}->{$pe}) {
    $self->{cache}->{$pe} = __do_parse($pe, $self->{parser});
  }

  return __find ($context, $values, @{$self->{cache}->{$pe}});
}

my $ACTIONS = {
	 '@id'             => {
			      'XTM::topic'               => sub { my $c = shift; $c->{id} },
			      'XTM::association'         => sub { my $c = shift; $c->{id} },
			      },
	 '@href'           => {
			      'XTM::topicRef'            => sub { my $c = shift; $c->{href} },
			      'XTM::subjectIndicatorRef' => sub { my $c = shift; $c->{href} },
			      'XTM::resourceRef'         => sub { my $c = shift; $c->{href} },
			      },
	 'topic'           => {
			      'XTM'                      => sub { my $c = shift; map { $c->topic ($_) } @{$c->topics()} },
			      'XTM::Memory'              => sub { my $c = shift; map { $c->topic ($_) } @{$c->topics()} },
			      },
	 'baseName'        => {
			      'regress' => [ 'XTM',  'XTM::Memory' ],
 			      'XTM::topic'               => sub { my $c = shift; @{$c->{baseNames}} },
			      },
	 'baseNameString'  => {
			      'regress' => [ 'XTM', 'XTM::Memory', 'XTM::topic' ],
                              'XTM::baseName'            => sub { my $c = shift; $c->{baseNameString}; },
			      },
	 'occurrence'      => {
			      'regress' => [ 'XTM', 'XTM::Memory' ],
			      'XTM::topic'               => sub { my $c = shift; @{$c->{occurrences}} },
			      },
	 'resourceRef'     => {
			      'regress' => [ 'XTM', 'XTM::Memory', 'XTM::topic', 'XTM::association' ],
			      'XTM::member'              => sub { my $c = shift; grep (ref($_) eq 'XTM::resourceRef', @{$c->{references}}) },
			      'XTM::scope'               => sub { my $c = shift; grep (ref($_) eq 'XTM::resourceRef', @{$c->{references}}) },
			      'XTM::subjectIdentity'     => sub { my $c = shift; $c->{resourceRef} },
			      'XTM::occurrence'          => sub { my $c = shift; grep (ref($_) eq 'XTM::resourceRef', ($c->{resource}))},
			      },
	 'resourceData'    => {
			      'regress' => [ 'XTM', 'XTM::Memory' ],
			      'XTM::occurrence'          => sub { my $c = shift; grep (ref($_) eq 'XTM::resourceData', ($c->{resource}))},
			      },
	 'instanceOf'      => {
			      'regress' => [ 'XTM', 'XTM::Memory', ],
			      'XTM::topic'               => sub { my $c = shift; @{$c->{instanceOfs}}},
			      'XTM::association'         => sub { my $c = shift; $c->{instanceOf}},
			      'XTM::occurrence'          => sub { my $c = shift; $c->{instanceOf}},
			      },
	 'topicRef'        => {
			      'regress' => [ 'XTM', 'XTM::Memory', 'XTM::topic', 'XTM::occurrence' ],
			      'XTM::instanceOf'          => sub { my $c = shift; grep (ref($_) eq 'XTM::topicRef',  ($c->{reference}))  },
			      'XTM::member'              => sub { my $c = shift; grep (ref($_) eq 'XTM::topicRef', @{$c->{references}}) },
			      'XTM::roleSpec'            => sub { my $c = shift; grep (ref($_) eq 'XTM::topicRef',  ($c->{reference}))  },
			      'XTM::scope'               => sub { my $c = shift; grep (ref($_) eq 'XTM::topicRef', @{$c->{references}}) },
			      'XTM::subjectIdentity'     => sub { my $c = shift; grep (ref($_) eq 'XTM::topicRef', @{$c->{references}}) },
			      },
	 'subjectIndicatorRef' => {
			      'regress' => [ 'XTM', 'XTM::Memory', 'XTM::topic', 'XTM::association' ],
			      'XTM::scope'               => sub { my $c = shift; grep (ref($_) eq 'XTM::subjectIndicatorRef', @{$c->{references}}) },
			      'XTM::instanceOf'          => sub { my $c = shift; grep (ref($_) eq 'XTM::subjectIndicatorRef',  ($c->{reference}))  },
			      'XTM::subjectIdentity'     => sub { my $c = shift; grep (ref($_) eq 'XTM::subjectIndicatorRef', @{$c->{references}}) },
			      'XTM::member'              => sub { my $c = shift; grep (ref($_) eq 'XTM::subjectIndicatorRef', @{$c->{references}}) },
			      'XTM::roleSpec'            => sub { my $c = shift; grep (ref($_) eq 'XTM::subjectIndicatorRef',  ($c->{reference}))  },
			      },
	 'subjectIdentity' => {
			      'regress' => [ 'XTM', 'XTM::Memory' ],
			      'XTM::topic'               => sub { my $c = shift; $c->{subjectIdentity} },
			      },
	 'scope'           => {
			      'regress' => [ 'XTM', 'XTM::Memory', 'XTM::topic' ],
			      'XTM::baseName'            => sub { my $c = shift; $c->{scope} },
			      'XTM::association'         => sub { my $c = shift; $c->{scope} },
			      'XTM::occurrence'          => sub { my $c = shift; $c->{scope} },
			      },
	 'association'     => {
			      'XTM'                      => sub { my $c = shift; map { $c->association ($_) } @{$c->associations()} },
			      'XTM::Memory'              => sub { my $c = shift; map { $c->association ($_) } @{$c->associations()} },
			      },
	 'member'          => {
			      'regress' => [ 'XTM', 'XTM::Memory' ],
			      'XTM::association'         => sub { my $c = shift; @{$c->{members}} },
			      },
	 'roleSpec'        => {
			      'regress' => [ 'XTM', 'XTM::Memory', 'XTM::association' ],
			      'XTM::member'              => sub { my $c = shift; $c->{roleSpec} },
			      },
	};



sub __find {
  my $c      = shift; # context
  my $values = shift; # variable values
  my @p      = @_;    # path (parsed)

  my $s = shift @p;   # one step after the other

#  warn "looking in ".ref($c)." for ".Dumper ($s, \@p);
  my @candidates;
  if ($s->{element}) {
    if (ref (my $action = $ACTIONS->{$s->{element}}->{ref($c)}) eq 'CODE') {   # there is a defined action
      @candidates = &$action ($c);
    } elsif (grep (ref ($c) eq $_, @{$ACTIONS->{$s->{element}}->{regress}})) { # we can regress to a higher level
#      warn "regressing: from ".$s->{element}." to ".join(',',@{$XTM::grammar::ISIN->{$s->{element}}});
      my @candidates2;
      for my $r (@{$XTM::grammar::ISIN->{$s->{element}}}) {                    # collect ALL regressable and return that
	push @candidates2,__find ($c,$values,
				  (
				   { element    => $r,                     # add intermediate step
				     predicates => [] },
				   $s,
				   @p)
				 );
      }
      return @candidates2;
    } else {
#      warn "XTM::Path: There is no ".$s->{element}." subelement in a ".ref($c);
      @candidates = ();
    }
  } elsif ($s->{data}) {
    if ($c->isa ('XTM::baseNameString')) {
      @candidates = ( $c->{string} );
    } elsif ($c->isa ('XTM::baseName')) {
      @candidates = ( $c->{baseNameString}->{string} );
    } elsif ($c->isa ('XTM::resourceData')) {
      @candidates = ( $c->{data} );
    } elsif ($c->isa ('XTM::occurrence')) {
      @candidates = $c->{resource}->isa ('XTM::resourceData') ? ($c->{resource}->{data}) : ('');
    } elsif ($c->isa ('XTM::topic')) {
      my $pcdata;  # baseNames, resourceDatas
      foreach my $path ([ 
			 {
			  element => 'baseName',
			  predicates => []
			 },
			 {
			  element => 'baseNameString',
			  predicates => []
			 },
			 {
			  data => 1
			 }
			],
			[
			 {
			  element => 'occurrence',
			  predicates => []
			 },
			 {
			  element => 'resourceData',
			  predicates => []
			 },
			 {
			  data => 1
			 }
			]) {
	push @candidates, __find ($c, $values, @{$path});
      }
    } elsif ($c->isa ('XTM') || $c->isa ('XTM::Memory')) {
      my $pcdata;  # topics
      foreach my $path ([ 
			 {
			  element => 'topic',
			  predicates => []
			 },
			 {
			  data => 1
			 }
			]) {
	push @candidates, __find ($c, $values, @{$path});
      }
    } else {
      @candidates = ();
    }
  } elsif ($s->{attribute}) {
    if (ref (my $action = $ACTIONS->{'@'.$s->{attribute}}->{ref($c)}) eq 'CODE') {
      @candidates = &$action ($c);
    } elsif ($XTM::grammar::ISIN->{'@'.$s->{attribute}}) {
#      warn "regressing: from ".$s->{attribute}." to ".join ',',@{$XTM::generic::ISIN->{'@'.$s->{attribute}}};
      my @candidates2;
      for my $r (@{$XTM::grammar::ISIN->{'@'.$s->{attribute}}}) {              # collect ALL regressable and return that
	push @candidates2, __find ($c, $values, ( 
						 { element    => $r,
						   predicates => []
						 },
						 $s,
						 @p));
      }
      return @candidates2;
    } else {
      die "XTM::Path: Internal inconsistency: attribute has no parents?";
#      @candidates = ();
    }
  }


  # check predicates on all candidates
  foreach my $predicate (@{$s->{predicates}}) {
#    warn "checking predicate".Dumper ($predicate)." for ". map {ref($_)} @candidates;
    @candidates = grep (__check_predicate ($_, $predicate, $values), @candidates);
#    warn "    after that ". map {ref($_)} @candidates;
  }

  # should we do tail recursion with more of the path?
  if (@p) { # yet another step down
    my @candidates2;
    foreach my $c2 (@candidates) {
      push @candidates2, __find ($c2, $values, @p);
    }
    return @candidates2;
  } else {
    return @candidates;
  }
}

sub __check_predicate {
  my $c  = shift;
  my $p  = shift;
  my $vs = shift;

  use Data::Dumper;
#  warn "predicate: ". Dumper( $p) . "context: " . ref($c);

  my $path2 = $p->[0];
#warn "new path2: ".Dumper $path2;
  if ($path2->[-1]->{element} && $p->[1]) {  # I need compare something, so I need text to compare!
    push @$path2, { 'data' => 1 };
  }
#warn "new new path2: ".Dumper $path2;

  my @candidates =  __find ($c, $vs, @{$p->[0]});
#  warn "now really checking candidates: ".Dumper \@candidates;

  foreach my $candidate (@candidates) {
    if ($p->[1]) {  # [something op value]
#      warn "evaluating: ". "'$candidate' ".Dumper ($p->[1])." '".Dumper ($p->[2])."'";
      my $op    = $p->[1];
      my $value = ref ($p->[2]) && $p->[2]->{variable} ? $vs->{$p->[2]->{variable}} : $p->[2];
#      warn " really : ". "'$candidate' $op '$value'";
#      my $b;
#      eval "\$b = '$candidate' ".$p->[1]." '".$p->[2]."'";
#warn "b has now $b";
      return 1 if eval "'$candidate' $op '$value'";
    } else {        # [something]
#      warn "evaluating only a value '$candidate'";
      return 1 if defined $candidate;
    }
  }

  return 0;
}

=pod

=item B<create>

I<$node> = I<$xtmp>->create (I<$path>)

B<create> returns exactly one new node conforming to the XTM::Path expression
provided as first parameter. As the new data structure is built stand-alone, there
is no need to pass-in or use a context.

If the path specification is not consistent with XTM, an exception will be raised.
If XTM::Path cannot find a UNIQUE path between two subsequent path steps, an exception
will be raised (as in 'topic/member' or 'topic/topicRef').

Examples:

  my $o = $xtmp->create ('topic[baseNameString = "xxxx"][@id = "x11"]');

The object will cache successfully parsed expression. You cannot use variable
inside path expressions here.

=cut

sub __create_element {
  my $e = shift;

# brute force as other methods have problems, suspect Parse::RecDescent, but...
  return new XTM::topic if ($e eq 'topic');
  return new XTM::baseName if ($e eq 'baseName');
  return new XTM::baseNameString if ($e eq 'baseNameString');
  return new XTM::occurrence if ($e eq 'occurrence');
  return new XTM::resourceRef if ($e eq 'resourceRef');
  return new XTM::resourceData if ($e eq 'resourceData');
  return new XTM::instanceOf if ($e eq 'instanceOf');
  return new XTM::topicRef if ($e eq 'topicRef');
  return new XTM::subjectIndicatorRef if ($e eq 'subjectIndicatorRef');
  return new XTM::subjectIdentity if ($e eq 'subjectIdentity');
  return new XTM::scope if ($e eq 'scope');
  return new XTM::association if ($e eq 'association');
  return new XTM::member if ($e eq 'member');
  return new XTM::roleSpec if ($e eq 'roleSpec');
}

# THAT did not work
#      die "XTM::Path: unhandled standalone element '".$s->{element}."'" unless $CREATE->{$s->{element}};
#      $a = &{$CREATE->{$s->{element}}} ("XTM::".$s->{element});
# why does this not work under special circumstances?      
#      my $s = "\$a = XTM::".$s->{element}."->new";
#      warn "creating a new standalone with '$s'";
#      eval $s;
#      warn "eval result $@";

#my $CREATE = { 
#	       'topic'               => \&XTM::topic::new,
#	       'baseName'            => \&XTM::baseName::new,
#	       'baseNameString'      => \&XTM::baseNameString::new,
#	       'occurrence'          => \&XTM::occurrence::new,
#	       'resourceRef'         => \&XTM::resourceRef::new,
#	       'resourceData'        => \&XTM::resourceData::new,
#	       'instanceOf'          => \&XTM::instanceOf::new,
#	       'topicRef'            => \&XTM::topicRef::new,
#	       'subjectIndicatorRef' => \&XTM::subjectIndicatorRef::new,
#	       'subjectIdentity'     => \&XTM::subjectIdentity::new,
#	       'scope'               => \&XTM::scope::new,
#	       'association'         => \&XTM::association::new,
#	       'member'              => \&XTM::member::new,
#	       'roleSpec'            => \&XTM::roleSpec::new,
#	      };


sub __create {
  my $c = shift;
  my $v = shift; # string, text, @href, @id value
  my @p = @_;
  my $s = shift @p;

  my $guide   = $s->{element} || 
                ($s->{attribute} ? '@'.$s->{attribute} : undef) || 
                'text()';                                            # can't be anything else, lookup in PATHS, ISIN
  my $context = ref($c); $context =~ s/XTM:://;                      # contains the element name of $c, lookup in PATHS

  use Data::Dumper;
#  warn "my new step is: ".Dumper ($s)." and the value '$v' guide '$guide' context is: ".ref($c);
  my $a; # this will contain the data structure devised by $s

  if (! defined $c) {                                                # standalone object, no problem to create
    if ($s->{attribute}) {
      die "XTM::Path: inconsistent path expression (no attribute '".$s->{attribute}."' allowed without context)";
    } elsif ($s->{data}) {
      die "XTM::Path: inconsistent path expression (no text '".$s->{data}."' allowed without context)";
    }
    {
#      warn "before creating an element: ".$s->{element};
      $a = __create_element ($s->{element});
#      warn "we created a as ".ref($a);
      die unless defined $a;
    }
  } elsif (my $parents = $XTM::grammar::ISIN->{$guide}) {            # we have parents
#    warn " we have parents for $guide ".join (",",@$parents);
    if (grep ($_ eq $context, @$parents)) {                          # find that context is immediate parent
      if ($s->{element}) {
	eval "\$a = new XTM::$s->{element}";
      } elsif ($s->{data}) {                                         # this is about setting text() in context $a
	$c->add (['text()', $v]);                                    # we hope the add does the right thing
	return $c;
      } elsif ($s->{attribute}) {
	$c->add (['@'.$s->{attribute}, $v]);
	return $c;
      }
    } elsif (my $paths = $XTM::grammar::PATHS->{$context}->{$guide}) {
#      warn "found paths: ".join (",", Dumper $paths);
      if (scalar @$paths == 1) {                                     # not immediate parent, but there is only one path
#	warn "found EXACTLY ONE path: ".join (",", @$paths);
	my $parent;
	if (scalar @$parents == 1) {
		$parent = $parents->[0];
	} else {
		# several possible parents
		# pick the one that's mentioned in the path
		my @candidates;
		for my $p (@$parents) {
			push @candidates, $p if grep { $_ eq $p } @{$paths->[0]};
		}
		if (scalar @candidates == 1) {
			$parent = $candidates[0];
		} else { 
			# several or no parents mentioned in the path 
			# this shouldn't happen; should we raise an exception?
			# fall back to the "old behaviour" for now
			$parent = $parents->[0];
		}
	}
	return __create ($c, $v,
			 { element    => $parent,              # call recursively with the parent in front of the path
			   predicates => [] },
			 $s, 
			 @p);
      } else {
	die "XTM::Path: multiple paths from '".ref($c)."' to '$guide' are ambiguous";
      }
    } else {
      die "XTM::Path: specification inconsistent with XTM";
    }
  } else {
    die "XTM::Path: internal consistency violated";
  }

#  warn " now we have a :".Dumper $a;

  foreach my $pred (@{$s->{predicates}}) {
#    warn " in preds: walk through ".Dumper $pred;
    if (defined $pred->[1]) {                                            # we have an operator defined
      die "XTM::Path: Only '=' allowed in predicates when constructing." unless $pred->[1] eq "eq";
      push @{$pred->[0]}, { data => 1 } if $pred->[0]->[-1]->{element};  # text() is missing, add it here
    }

#    warn " before pred we have a :".Dumper $a;
    my $new =  __create ($a, $pred->[2], @{$pred->[0]});
#    warn " in preds: returned ".Dumper $new. " and a is ".Dumper $a;
    if (defined $new && $new != $a) {                                    # if same object, do nothing
      $a->add ($new);
    }
  }

#warn "before add a: ".ref($a);
  if (@p) { # tail recursion with rest of path
    my $new = __create ($a, $v, @p);
    if (defined $new && $new != $a) {                                    # if same object, do nothing
      $a->add ($new);
    }
  }
#warn "returning ".ref($a);
  return $a;
}

sub create {
  my $self = shift;
  my $pe   = shift;
  my $context = shift || $self->{default};


  unless ($self->{parser}) { # used cached one
    $self->{parser} = __make_parser();
  }

  unless ($self->{cache}->{$pe}) {
    $self->{cache}->{$pe} = __do_parse($pe, $self->{parser});
  }

  return __create (undef, undef, @{$self->{cache}->{$pe}});
}

=pod

=back

=head1 SEE ALSO

L<XTM::base>

=head1 AUTHOR INFORMATION

Copyright 2002, Robert Barta <rho@telecoma.net>, Jan Gylta <jgylta@online.no>, All rights reserved.

This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.
http://www.perl.com/perl/misc/Artistic.html


=cut

1;

__END__
