package XTM::XML::MemoryBuilder;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);
use base qw(XML::SAX::Base);
use XML::SAX::Exception;
@XML::SAX::Exception::XTMError::ISA = ('XML::SAX::Exception');

require Exporter;
require AutoLoader;

use XTM;
use XTM::PSI;
use XTM::Log ('elog');
use XTM::Namespaces;

$VERSION = '0.06';


my $tmns    = $XTM::Namespaces::topicmap_ns;
my $xlinkns = $XTM::Namespaces::xlink_ns;

use Data::Dumper;
$Data::Dumper::Indent = 1;


=pod

=head1 NAME

  XTM::XML::MemoryBuilder - XTM XML parser

=head1 SYNOPSIS

  use XTM::XML::MemoryBuilder;
  my $builder = new XTM::XML::MemoryBuilder (tm => new XTM::Memory);
  my $parser  = find a SAX parser here (Handler => $builder);
  $parser->parse_string($XTM_string);

=head1 DESCRIPTION

This package builds an in-memory representation of the XTM topic map.

=cut

my %handlers = 
  (
#-- topicMap ------------------------------------------------------------------------------------
   'topicMap' => 
   {
    'start' =>
    sub {
      my $handler = shift;
      my $element = shift;

      elog ('XTM::XML::MemoryBuilder', 5, "$element->{Name} found with ", $element->{Attributes});
#               <!ATTLIST topicMap
#                   id              ID        #IMPLIED
#                   xmlns           CDATA     #FIXED 'http://www.topicmaps.org/xtm/1.0/'
#                   xmlns:xlink     CDATA     #FIXED 'http://www.w3.org/1999/xlink'
#                   xml:base        CDATA     #IMPLIED
#                >
      my %atts = %{$element->{Attributes} || {}};
      $handler->{tm}->{id} = $atts{'{}id'}->{Value} || $atts{'id'}->{Value} ;
      push @{$handler->{parent}}, $handler->{tm};
    },
#               <!ELEMENT topicMap
#                   ( topic | association | mergeMap )*
#                >
    'allowed_elements' => [ qw(topic association mergeMap) ],
    'end' =>
    sub {
      my $handler = shift;
      my $element = shift;

      pop @{$handler->{parent}}; # no need to memorize this as tm is in the handler as well
    }
   },
#-- topic ---------------------------------------------------------------------------------------
   'topic' =>
   {
    'start' =>
    sub {
      my $handler = shift;
      my $element = shift;

      elog ('XTM::XML::MemoryBuilder', 5, "$element->{Name} found with ", $element->{Attributes});
#               <!ATTLIST topic
#                   id              ID        #REQUIRED
#                >
      my %atts = %{$element->{Attributes} || {}};
      push @{$handler->{parent}}, new XTM::topic (id   => $atts{'{}id'}->{Value} || $atts{'id'}->{Value});
    },
#               <!ELEMENT topic
#                   ( instanceOf*, subjectIdentity?, ( baseName | occurrence )* )
#                >
    'allowed_elements' => [qw( instanceOf subjectIdentity baseName occurrence) ],
    'end' =>
    sub {
      my $handler = shift;
      my $element = shift;

#print "topic end: ", Dumper $element;

      my $t = pop @{$handler->{parent}};
      unless ($t->instanceOfs && @{$t->instanceOfs}) {               # if instanceOf not defined, default (3.6.1)
	$t->add__s (new XTM::instanceOf ( reference => new XTM::topicRef (href => $XTM::PSI::xtm{topic})));
      }
      die "XTM::XML::MemoryBuilder, conformance error in '$element->{Name}': see XTM standard, 3.6.1\n"
	if $t->subjectIdentity_s > 1;
      $t->add_subjectIdentity ($t->subjectIdentity_s);  $t->undefine (qw (subjectIdentitys));
      $handler->{parent}->[-1]->add ($t);
#print "topic end is :", Dumper $t;
    }
   },
#-- topicRef ------------------------------------------------------------------------------------
   'topicRef' =>
   {
    'start' =>
    sub {
      my $handler = shift;
      my $element = shift;

      elog ('XTM::XML::MemoryBuilder', 5, "$element->{Name} found with ", $element->{Attributes});
#                 <!ATTLIST topicRef
#                   id              ID        #IMPLIED
#                   xlink:type      NMTOKEN   #FIXED 'simple'
#                   xlink:href      CDATA     #REQUIRED
#                >
      my %atts = %{$element->{Attributes}};
      $handler->xtm_error ( "XTM::XML::MemoryBuilder: required attribute 'xlink:href' missing: see XTM standard, 3.2.1\n" )
	unless $atts{"{$xlinkns}href"};
      my $tr = new XTM::topicRef (href => $atts{"{$xlinkns}href"}->{Value});
      $handler->{parent}->[-1]->add__s ($tr);
    },
#                 <!ELEMENT topicRef EMPTY>
    'allowed_elements' => [ ],
    'end' => sub {}
   },
#-- subjectIndicatorRef ------------------------------------------------------------------------------------
   'subjectIndicatorRef' =>
   {
    'start' =>
    sub {
      my $handler = shift;
      my $element = shift;

      elog ('XTM::XML::MemoryBuilder', 5, "$element->{Name} found with ", $element->{Attributes});
#                 <!ATTLIST subjectIndicatorRef
#                   id              ID        #IMPLIED
#                   xlink:type      NMTOKEN   #FIXED 'simple'
#                   xlink:href      CDATA     #REQUIRED
#                 >
      my %atts = %{$element->{Attributes} || {}};
      $handler->xtm_error ( "XTM::XML::MemoryBuilder: required attribute 'xlink:href' missing: see XTM standard, 3.2.2\n" )
	unless $atts{"{$xlinkns}href"};
      $handler->{parent}->[-1]->add__s (new XTM::subjectIndicatorRef (href => $atts{"{$xlinkns}href"}->{Value}));
    },
#                 <!ELEMENT subjectIndicatorRef EMPTY>
    'allowed_elements' => [],
    'end' => sub {},
   },
#-- scope --------------------------------------------------------------------------------------------------
   'scope' =>
   {
    'start' =>
    sub {
      my $handler = shift;
      my $element = shift;

      elog ('XTM::XML::MemoryBuilder', 5, "$element->{Name} found with ", $element->{Attributes});
#                <!ATTLIST scope
#                   id              ID        #IMPLIED
#                >
      push @{$handler->{parent}}, new XTM::scope ();
    },
#                <!ELEMENT scope  ( topicRef  | resourceRef | subjectIndicatorRef )+ >
    'allowed_elements' => [ qw(topicRef resourceRef subjectIndicatorRef) ],
    'end' =>
    sub {
      my $handler = shift;
      my $element = shift;

      my $s = pop @{$handler->{parent}};
      die "XTM::XML::MemoryBuilder, conformance error in '$element->{Name}': see XTM standard, 3.3.1\n" 
	if $s->topicRef_s + $s->resourceRef_s + $s->subjectIndicatorRef_s == 0;

      $s->add_reference_s ($s->topicRef_s, $s->resourceRef_s, $s->subjectIndicatorRef_s); $s->undefine (qw (topicRefs resourceRefs subjectIndicatorRefs));
      $handler->{parent}->[-1]->add__s ($s);
    },
   },
#-- instanceOf ---------------------------------------------------------------------------------------------
   'instanceOf' =>
   {
    'start' =>
    sub {
      my $handler = shift;
      my $element = shift;

      elog ('XTM::XML::MemoryBuilder', 5, "$element->{Name} found with ", $element->{Attributes});
#                <!ATTLIST instanceOf
#                   id              ID        #IMPLIED
#                >
      push @{$handler->{parent}}, new XTM::instanceOf ();

    },
#                <!ELEMENT instanceOf  ( topicRef | subjectIndicatorRef ) >
    'allowed_elements' => [ qw(topicRef subjectIndicatorRef) ],
    'end' =>
    sub {
      my $handler = shift;
      my $element = shift;

      my $i = pop @{$handler->{parent}};
      die "XTM::XML::MemoryBuilder, conformance error in '$element->{Name}': see XTM standard, 3.4.1\n"
	unless $i->topicRef_s + $i->subjectIndicatorRef_s == 1;

      $i->add_reference ($i->topicRef_s, $i->subjectIndicatorRef_s);  $i->undefine (qw (topicRefs subjectIndicatorRefs));
      $handler->{parent}->[-1]->add__s ($i);
    },
   },
#-- subjectIdentity ----------------------------------------------------------------------------------------
   'subjectIdentity' =>
   {
    'start' =>
    sub {
      my $handler = shift;
      my $element = shift;

      elog ('XTM::XML::MemoryBuilder', 5, "$element->{Name} found with ", $element->{Attributes});
#             <!ATTLIST subjectIdentity
#               id              ID        #IMPLIED
#             >
      push @{$handler->{parent}}, new XTM::subjectIdentity ();
    },
#              <!ELEMENT subjectIdentity
#                        ( resourceRef?, ( topicRef | subjectIndicatorRef )* )
#              >
    'allowed_elements' => [ qw( resourceRef topicRef subjectIndicatorRef ) ],
    'end' =>
    sub {
      my $handler = shift;
      my $element = shift;

      my $s = pop @{$handler->{parent}};
      die "XTM::XML::MemoryBuilder, conformance error in '$element->{Name}': see XTM standard, 3.6.2\n"  if $s->resourceRef_s > 1;
      $s->add_resourceRef ($s->resourceRef_s);  $s->undefine (qw (resourceRefs));

      $s->add_reference_s ($s->topicRef_s, $s->subjectIndicatorRef_s);  $s->undefine (qw (topicRefs subjectIndicatorRefs));
      $handler->{parent}->[-1]->add__s ($s);
    },
   },
#-- baseName -----------------------------------------------------------------------------------------------
   'baseName' =>
   {
    'start' =>
    sub {
      my $handler = shift;
      my $element = shift;

      elog ('XTM::XML::MemoryBuilder', 5, "$element->{Name} found with ", $element->{Attributes});
#             <!ATTLIST baseName
#               id              ID        #IMPLIED
#             >
      push @{$handler->{parent}}, new XTM::baseName ();
    },
#              <!ELEMENT baseName  ( scope?, baseNameString, variant* ) >
    'allowed_elements' => [ qw( scope baseNameString variant )  ],
    'end' =>
    sub {
      my $handler = shift;
      my $element = shift;

      my $b = pop @{$handler->{parent}};
      die "XTM::XML::MemoryBuilder, conformance error in '$element->{Name}': too many scopes, see XTM standard, 3.7.1\n"  
	if $b->scope_s > 1;

      unless ($b->scope_s) {
	$b->add__s (new XTM::scope ( references => [ new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) ]));
      }

      $b->add_scope ($b->scope_s);  $b->undefine (qw (scopes));
      $handler->xtm_error ( "XTM::XML::MemoryBuilder, conformance error in '$element->{Name}': too many baseNameStrings, see XTM standard, 3.7.1\n" )
	if $b->baseNameString_s != 1;
      $b->add_baseNameString ($b->baseNameString_s);  $b->undefine (qw (baseNameStrings));

      $handler->{parent}->[-1]->add__s ($b);
    },
   },
#-- baseNameString -----------------------------------------------------------------------------------------
   'baseNameString' =>
   {
    'start' =>
    sub {
      my $handler = shift;
      my $element = shift;

      elog ('XTM::XML::MemoryBuilder', 5, "$element->{Name} found with ", $element->{Attributes});
#              <!ATTLIST baseNameString
#                id              ID        #IMPLIED
#              >
      push @{$handler->{parent}}, new XTM::baseNameString (string => '');
    },
#              <!ELEMENT baseNameString  ( #PCDATA ) >
    'allowed_elements' => [],
    'end' =>
    sub {
      my $handler = shift;
      my $element = shift;

      my $bs = pop @{$handler->{parent}};
      $bs->add_string ($handler->{content});
      $handler->{parent}->[-1]->add__s ($bs);
    },
   },

#-- variant ------------------------------------------------------------------------------------------------
   'variant' =>
   {
    'start' =>
    sub {
      my $handler = shift;
      my $element = shift;

      elog ('XTM::XML::MemoryBuilder', 5, "$element->{Name} found with ", $element->{Attributes});
#             <!ATTLIST variant
#               id              ID        #IMPLIED
#             >
      push @{$handler->{parent}}, new XTM::variant ();
    },
#              <!ELEMENT variant  ( parameters, variantName, variant* ) >
    'allowed_elements' => [ qw( parameters variantName variant ) ],
    'end' =>
    sub {
      my $handler = shift;
      my $element = shift;

      my $v = pop @{$handler->{parent}};
      $handler->xtm_error ( "XTM::XML::MemoryBuilder, conformance error in '$element->{Name}': see XTM standard, 3.7.3\n")  unless $v->parameters_s == 1;
      $v->add_parameters ($v->parameters_s);                $v->undefine (qw (parameterss));
      $handler->xtm_error ( "XTM::XML::MemoryBuilder, conformance error in '$element->{Name}': see XTM standard, 3.7.3\n")  unless $v->variantName_s == 1;
      $v->add_variantName ($v->variantName_s);              $v->undefine (qw (variantNames));
      # variants should be just fine
      $handler->{parent}->[-1]->add__s ($v);
    },
   },
#-- variantName --------------------------------------------------------------------------------------------
   'variantName' =>
   {
    'start' =>
    sub {
      my $handler = shift;
      my $element = shift;

      elog ('XTM::XML::MemoryBuilder', 5, "$element->{Name} found with ", $element->{Attributes});
#              <!ATTLIST variantName
#                id              ID        #IMPLIED
#              >
      push @{$handler->{parent}}, new XTM::variantName ();
    },
#              <!ELEMENT variantName  ( resourceRef | resourceData ) >
    'allowed_elements' => [ qw( resourceRef resourceData ) ],
    'end' =>
    sub {
      my $handler = shift;
      my $element = shift;

      my $vn = pop @{$handler->{parent}};
      $handler->xtm_error ( "XTM::XML::MemoryBuilder, conformance error in '$element->{Name}': see XTM standard, 3.7.4\n" )
	if $vn->resourceRef_s + $vn->resourceData_s != 1;

      $vn->add_resource ($vn->resourceRef_s, $vn->resourceData_s);  $vn->undefine (qw (resourceRefs resourceDatas));
      $handler->{parent}->[-1]->add__s ($vn);
    },
   },
#-- parameters ---------------------------------------------------------------------------------------
   'parameters' =>
   {
    'start' =>
    sub {
      my $handler = shift;
      my $element = shift;

      elog ('XTM::XML::MemoryBuilder', 5, "$element->{Name} found with ", $element->{Attributes});
#              <!ATTLIST parameters
#                id              ID        #IMPLIED
#              >
      push @{$handler->{parent}}, new XTM::parameters ();

    },
#              <!ELEMENT parameters  ( topicRef | subjectIndicatorRef )+ >
    'allowed_elements' => [ qw( topicRef subjectIndicatorRef ) ],
    'end' =>
    sub {
      my $handler = shift;
      my $element = shift;

      my $ps = pop @{$handler->{parent}};
      $handler->xtm_error ( "XTM::XML::MemoryBuilder, conformance error in '$element->{Name}': see XTM standard, 3.7.5\n" )
	if $ps->topicRef_s + $ps->subjectIndicatorRef_s == 0;

      $ps->add_reference_s ($ps->topicRef_s, $ps->subjectIndicatorRef_s);  $ps->undefine (qw (topicRefs subjectIndicatorRefs));
      $handler->{parent}->[-1]->add__s ($ps);
    },
   },
#-- association --------------------------------------------------------------------------------------------
   'association' =>
   {
    'start' =>
    sub {
      my $handler = shift;
      my $element = shift;

      elog ('XTM::XML::MemoryBuilder', 5, "$element->{Name} found with ", $element->{Attributes});
#              <!ATTLIST association
#                id              ID        #IMPLIED
#              >
      push @{$handler->{parent}}, new XTM::association ();
    },
#              <!ELEMENT association
#               ( instanceOf?, scope?, member+ )
#              >
    'allowed_elements' => [ qw( instanceOf scope member ) ],
    'end' =>
    sub {
      my $handler = shift;
      my $element = shift;

      my $a = pop @{$handler->{parent}};
      # if instanceOf not defined, default (3.8.1)
      unless ($a->instanceOf_s) {
	$a->add__s (new XTM::instanceOf ( reference => new XTM::topicRef (href => $XTM::PSI::xtm{association})));
      }
      $handler->xtm_error ( "XTM::XML::MemoryBuilder, conformance error in '$element->{Name}': see XTM standard, 3.8.1\n" )
	if $a->instanceOf_s > 1;
      $a->add_instanceOf ($a->instanceOf_s);  $a->undefine (qw (instanceOfs));

      $handler->xtm_error ( "XTM::XML::MemoryBuilder, conformance error in '$element->{Name}': see XTM standard, 3.8.1\n" )
	if $a->scope_s > 1;
      unless ($a->scope_s) {
	$a->add__s (new XTM::scope ( references =>  [ new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) ]));
      }
      $a->add_scope ($a->scope_s);  $a->undefine (qw (scopes));

      $handler->xtm_error ( "XTM::XML::MemoryBuilder, conformance error in '$element->{Name}': see XTM standard, 3.8.1\n" )
	if $a->member_s == 0;

      $handler->{parent}->[-1]->add ($a);
    },
   },
#-- member ------------------------------------------------------------------------------------------
   'member' =>
   {
    'start' =>
    sub {
      my $handler = shift;
      my $element = shift;

      elog ('XTM::XML::MemoryBuilder', 5, "$element->{Name} found with ", $element->{Attributes});
#              <!ATTLIST member
#                id              ID        #IMPLIED
#              >
      push @{$handler->{parent}}, new XTM::member ();
    },
#              <!ELEMENT member
#               ( roleSpec?, ( topicRef | resourceRef | subjectIndicatorRef )+ )
#              >
    'allowed_elements' => [ qw( roleSpec topicRef resourceRef subjectIndicatorRef ) ],
    'end' =>
    sub {
      my $handler = shift;
      my $element = shift;

      my $m = pop @{$handler->{parent}};
      $handler->xtm_error ( "XTM::XML::MemoryBuilder, conformance error in '$element->{Name}': see XTM standard, 3.8.2\n" )
	if $m->rolesSpec_s > 1;
      $m->add_roleSpec ($m->roleSpec_s);  $m->undefine (qw (roleSpecs));
      $handler->xtm_error ( "XTM::XML::MemoryBuilder, conformance error in '$element->{Name}': see XTM standard, 3.8.2\n" )
	unless $m->topicRef_s + $m->resourceRef_s + $m->subjectIndicatorRef_s > 0;
      $m->add_reference_s ($m->topicRef_s, $m->resourceRef_s, $m->subjectIndicatorRef_s);  $m->undefine (qw (topicRefs resourceRefs subjectIndicatorRefs));
      
      $handler->{parent}->[-1]->add__s ($m);
    },
   },
#-- roleSpec ---------------------------------------------------------------------------------------
   'roleSpec' =>
   {
    'start' =>
    sub {
      my $handler = shift;
      my $element = shift;

      elog ('XTM::XML::MemoryBuilder', 5, "$element->{Name} found with ", $element->{Attributes});
#              <!ATTLIST roleSpec
#                id              ID        #IMPLIED
#              >
      push @{$handler->{parent}}, new XTM::roleSpec ();
    },
#              <!ELEMENT roleSpec  ( topicRef | subjectIndicatorRef ) >
    'allowed_elements' => [ qw( topicRef subjectIndicatorRef ) ],
    'end' =>
    sub {
      my $handler = shift;
      my $element = shift;

      my $r = pop @{$handler->{parent}};
      $handler->xtm_error ( "XTM::XML::MemoryBuilder, conformance error in '$element->{Name}': see XTM standard, 3.8.3\n" )
	unless $r->topicRef_s + $r->subjectIndicatorRef_s == 1;
      $r->add_reference  ($r->topicRef_s,  $r->subjectIndicatorRef_s);  $r->undefine (qw (topicRefs subjectIndicatorRefs));
      
      $handler->{parent}->[-1]->add__s ($r);
    },
   },
#-- occurrence ------------------------------------------------------------------------------------
   'occurrence' =>
   {
    'start' =>
    sub {
      my $handler = shift;
      my $element = shift;

      elog ('XTM::XML::MemoryBuilder', 5, "$element->{Name} found with ", $element->{Attributes});
#              <!ATTLIST occurrence
#                id              ID        #IMPLIED
#              >
      push @{$handler->{parent}}, new XTM::occurrence ();
    },
#              <!ELEMENT occurrence
#               ( instanceOf?, scope?, ( resourceRef | resourceData ) )
#              >
    'allowed_elements' => [ qw( instanceOf scope resourceRef resourceData ) ],
    'end' =>
    sub {
      my $handler = shift;
      my $element = shift;

      my $o = pop @{$handler->{parent}};

      # if instanceOf not defined, default (3.9.1)
      unless ($o->instanceOf_s) {
	$o->add__s (new XTM::instanceOf ( reference => new XTM::topicRef (href => $XTM::PSI::xtm{occurrence})));
      }
      $handler->xtm_error ( "XTM::XML::MemoryBuilder, conformance error in '$element->{Name}': see XTM standard, 3.9.1\n" )
	if $o->instanceOf_s > 1;
      $o->add_instanceOf ($o->instanceOf_s);  $o->undefine (qw (instanceOfs));
      $handler->xtm_error ( "XTM::XML::MemoryBuilder, conformance error in '$element->{Name}': see XTM standard, 3.9.1\n" )
	if $o->scope_s > 1;
      unless ($o->scope_s) {
	$o->add__s (new XTM::scope ( references => [ new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) ]));
      }
      $o->add_scope ($o->scope_s);  $o->undefine (qw (scopes));
      $handler->xtm_error ( "XTM::XML::MemoryBuilder, conformance error in '$element->{Name}': see XTM standard, 3.9.1\n" )
	unless $o->resourceRef_s + $o->resourceData_s == 1;
      $o->add_resource ($o->resourceRef_s, $o->resourceData_s);  $o->undefine (qw (resourceRefs resourceDatas));

      $handler->{parent}->[-1]->add__s ($o);
    },
   },
#-- resourceRef -----------------------------------------------------------------------------------------
   'resourceRef' =>
   {
    'start' =>
    sub {
      my $handler = shift;
      my $element = shift;

      elog ('XTM::XML::MemoryBuilder', 5, "$element->{Name} found with ", $element->{Attributes});
#              <!ATTLIST resourceRef
#                id              ID        #IMPLIED
#                xlink:type      NMTOKEN   #FIXED 'simple'
#                xlink:href      CDATA     #REQUIRED
#              >
      my %atts = %{$element->{Attributes} || {}};
      $handler->xtm_error ( "XTM::XML::MemoryBuilder: required attribute 'xlink:href' missing: see XTM standard, 3.10.1\n" )
	unless $atts{"{$xlinkns}href"};
      my $r = new XTM::resourceRef (href => $atts{"{$xlinkns}href"}->{Value});
      $handler->{parent}->[-1]->add__s ($r);
    },
#              <!ELEMENT resourceRef EMPTY>
    'allowed_elements' => [],
    'end' => sub {},
   },
#-- resourceData -------------------------------------------------------------------------------------
   'resourceData' =>
   {
    'start' =>
    sub {
      my $handler = shift;
      my $element = shift;

      elog ('XTM::XML::MemoryBuilder', 5, "$element->{Name} found with ", $element->{Attributes});
#              <!ATTLIST resourceData
#                id              ID        #IMPLIED
#              >
#              <!ELEMENT resourceData  ( #PCDATA ) >
      push @{$handler->{parent}}, new XTM::resourceData (data => '');
    },
    'allowed_elements' => [],
    'end' =>
    sub {
      my $handler = shift;
      my $element = shift;

      my $rd = pop @{$handler->{parent}};
      $rd->add_data ($handler->{content});
      $handler->{parent}->[-1]->add__s ($rd);
    },
   },
#-- mergeMap -----------------------------------------------------------------------------------------------
   'mergeMap' =>
   {
    'start' =>
    sub {
      my $handler = shift;
      my $element = shift;

      elog ('XTM::XML::MemoryBuilder', 5, "$element->{Name} found with ", $element->{Attributes});
#              <!ATTLIST mergeMap
#               id              ID        #IMPLIED
#               xlink:type      NMTOKEN   #FIXED 'simple'
#               xlink:href      CDATA     #REQUIRED
#               >
      my %atts = %{$element->{Attributes} || {}};
      $handler->xtm_error ( "XTM::XML::MemoryBuilder: required attribute 'xlink:href' missing: see XTM standard, 3.10.1\n" )
	unless $atts{"{$xlinkns}href"};
      push @{$handler->{parent}}, new XTM::mergeMap (href => $atts{"{$xlinkns}href"}->{Value});
    },
#              <!ELEMENT mergeMap  ( topicRef | resourceRef | subjectIndicatorRef )* >
    'allowed_elements' => [ qw( topicRef resourceRef subjectIndicatorRef ) ],
    'end' =>
    sub {
      my $handler = shift;
      my $element = shift;

      my $mm = pop @{$handler->{parent}};

      my $tm2 = (new XTM::XML (auto_complete => 0,
			       url           => $mm->href))->sync_in;
      foreach my $t (map { $tm2->topic($_) } @{$tm2->topics()}) {
	foreach my $b (@{$t->baseNames}) {
	  $b->scope->add_reference_s ($mm->topicRef_s, $mm->resourceRef_s, $mm->subjectIndicatorRef_s);
	}
	foreach my $o (@{$t->occurrences}) {
	  $o->scope->add_reference_s ($mm->topicRef_s, $mm->resourceRef_s, $mm->subjectIndicatorRef_s);
	}
      }
      foreach my $a (map { $tm2->association($_) } @{$tm2->associations()}) {
	$a->scope->add_reference_s ($mm->topicRef_s, $mm->resourceRef_s, $mm->subjectIndicatorRef_s);
      }
      $handler->{parent}->[-1]->add ($tm2);
    },
   },

  );

sub new {
  my $class  = shift;
  my %options = @_;
  my $self = bless \%options, $class;
  push @{$self->{allowed_elements}}, { element => undef, children => [ qw(topicMap) ] };
  return $self;
}

sub start_element {
  my $self = shift;
  my $data = shift;

#  print "start_element $data->{LocalName}", "\n",Dumper ($self, $data);

  if ($data->{NamespaceURI} eq $tmns) {
    unless (grep ($data->{LocalName} eq $_, @{$self->{allowed_elements}->[-1]->{children}})) {
      $self->xtm_error( "XTM::XML::MemoryBuilder: DTD violation, got '$data->{LocalName}', but expected any of ". join ',', @{$self->{allowed_elements}->[-1]->{children}} );
    } elsif (!defined $handlers{$data->{LocalName}}) {
      $self->xtm_error ( "XTM::XML::MemoryBuilder: Unhandled element start $data->{Name}" );
    } else {
      &{$handlers{$data->{LocalName}}->{'start'}} ($self, $data);
      push @{$self->{allowed_elements}}, { element  => $data->{LocalName}, 
					   children => $handlers{$data->{LocalName}}->{'allowed_elements'} };
      $self->{content} = '';
    }
  }
  $self->SUPER::start_element ($data);
}

sub characters {
  my $self = shift;
  my $data = shift;

#  print "found data", Dumper $data;
  $self->{content} .= $data->{Data};
  $self->SUPER::characters ($data);
}

sub end_element {
  my $self = shift;
  my $data = shift;

#print "end_element $data->{LocalName}", Dumper ($self, $data);

#print "looking for $tmns getting: ", $data->{NamespaceURI}, "\n";
  if ($data->{NamespaceURI} eq $tmns) { # ignore the others
#print "foud ns\n";
    if ($self->{allowed_elements}->[-1]->{element} eq $data->{LocalName}) {
      pop @{$self->{allowed_elements}};
    }
    if (!defined $handlers{$data->{LocalName}}) {
      warn "XTM::XML::MemoryBuilder: Unhandled element end $data->{Name}";
    } else {
      &{$handlers{$data->{LocalName}}->{'end'}} ($self, $data);
    }
  }
  $self->SUPER::end_element ($data);
}


sub xtm_error {
  my $self    = shift;
  my $message = shift;

  throw XML::SAX::Exception::XTMError (Message => $message.
				       " [Ln: " . $self->{LineNumber} . ", Col: " . $self->{ColumnNumber} . "]");
}

sub error {
  my $self    = shift;
  my $message = shift;

  throw XML::SAX::Exception (Message => $message.
			    " [Ln: " . $self->{LineNumber} . ", Col: " . $self->{ColumnNumber} . "]");
}

=pod

=head1 AUTHOR INFORMATION

Copyright 2002, Robert Barta <rho@telecoma.net>, All rights reserved.

This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.
http://www.perl.com/perl/misc/Artistic.html

=cut

1;

__END__
