package XTM::XML::Grove2TM;

use XTM;
use XTM::Log ('elog');
use XML::Grove::AsString;
use XTM::PSI;

use strict;
use vars qw{$AUTOLOAD};

=pod

=head1 NAME

  XTM::XML::Grove2TM - XTM XML parser

=head1 SYNOPSIS

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

=head1 DESCRIPTION

Once you have a grove with parsed XML data, you can iterate over this grove,
letting the package do the work of creating a L<XTM::Memory> structure.

=cut

sub new {
    my $class = shift;
    return bless { result => ''}, $class;
}

sub visit_document {
    my $self = shift;
    my $grove = shift;

    $grove->children_accept_name ($self, @_);
}

sub visit_name_topicRef {
  my $self    = shift;
  my $element = shift;
  my $parents = shift;
  my $x       = shift;

  elog ('XTM::XML', 5, "$element->{Name} found with ", $element->{Attributes});
#                 <!ELEMENT topicRef EMPTY>
  die "XTM::XML: syntax violation: expected ".join (",",@$parents)." but found $element->{Name}\n" unless grep ($element->{Name} eq $_, @$parents);
  my %atts = %{$element->{Attributes}};
#                 <!ATTLIST topicRef
#                   id              ID        #IMPLIED
#                   xlink:type      NMTOKEN   #FIXED 'simple'
#                   xlink:href      CDATA     #REQUIRED
#                >
  my $tr = new XTM::topicRef (id   => $atts{id},
			      href => $atts{'xlink:href'});
  $x->add__s ($tr);
}

sub visit_name_subjectIndicatorRef {
  my $self    = shift;
  my $element = shift;
  my $parents = shift;
  my $x       = shift;

  elog ('XTM::XML', 5, "$element->{Name} found with ", $element->{Attributes});
#                 <!ELEMENT subjectIndicatorRef EMPTY>
  die "XTM::XML: syntax violation: expected ".join (",",@$parents)." but found $element->{Name}\n" unless grep ($element->{Name} eq $_, @$parents);
  my %atts = %{$element->{Attributes}};
#                 <!ATTLIST subjectIndicatorRef
#                   id              ID        #IMPLIED
#                   xlink:type      NMTOKEN   #FIXED 'simple'
#                   xlink:href      CDATA     #REQUIRED
#                 >
  my $sr = new XTM::subjectIndicatorRef (id   => $atts{id},
					 href => $atts{'xlink:href'});
  $x->add__s ($sr);
}

sub visit_name_scope {
  my $self    = shift;
  my $element = shift;
  my $parents = shift;
  my $x       = shift;

  elog ('XTM::XML', 5, "$element->{Name} found with ", $element->{Attributes});
  die "XTM::XML: syntax violation: expected ".join (",",@$parents)." but found $element->{Name}\n" unless grep ($element->{Name} eq $_, @$parents);
  my %atts = %{$element->{Attributes}};
#                <!ATTLIST scope
#                   id              ID        #IMPLIED
#                >
  my $s = new XTM::scope (id   => $atts{id});
#                <!ELEMENT scope  ( topicRef  | resourceRef | subjectIndicatorRef )+ >
  $element->children_accept_name ($self, [ qw(topicRef resourceRef subjectIndicatorRef) ], $s);

  die "XTM::XML, conformance error in '$element->{Name}': see XTM standard, 3.3.1\n" 
    if $s->topicRef_s + $s->resourceRef_s + $s->subjectIndicatorRef_s == 0;

  $s->add_reference_s ($s->topicRef_s, $s->resourceRef_s, $s->subjectIndicatorRef_s); $s->undefine (qw (topicRefs resourceRefs subjectIndicatorRefs));
  $x->add__s ($s);
}

sub visit_name_instanceOf {
  my $self    = shift;
  my $element = shift;
  my $parents = shift;
  my $x       = shift;

  elog ('XTM::XML', 5, "$element->{Name} found with ", $element->{Attributes});
  die "XTM::XML: syntax violation: expected ".join (",",@$parents)." but found $element->{Name}\n" unless grep ($element->{Name} eq $_, @$parents);
  my %atts = %{$element->{Attributes}};
#                <!ATTLIST instanceOf
#                   id              ID        #IMPLIED
#                >
  my $i = new XTM::instanceOf (id   => $atts{id});
#                <!ELEMENT instanceOf  ( topicRef | subjectIndicatorRef ) > 
  $element->children_accept_name ($self, [ qw(topicRef subjectIndicatorRef) ], $i);

  die "XTM::XML, conformance error in '$element->{Name}': see XTM standard, 3.4.1\n" 
    unless $i->topicRef_s + $i->subjectIndicatorRef_s == 1;

  $i->add_reference ($i->topicRef_s, $i->subjectIndicatorRef_s);  $i->undefine (qw (topicRefs subjectIndicatorRefs));
  $x->add__s ($i);
}

sub visit_name_topicMap {
  my $self    = shift;
  my $element = shift;
  my $tm      = shift;

  elog ('XTM::XML', 5, "$element->{Name} found with ", $element->{Attributes});
#               <!ATTLIST topicMap
#                   id              ID        #IMPLIED
#                   xmlns           CDATA     #FIXED 'http://www.topicmaps.org/xtm/1.0/'
#                   xmlns:xlink     CDATA     #FIXED 'http://www.w3.org/1999/xlink'
#                   xml:base        CDATA     #IMPLIED
#                >
  my %atts = %{$element->{Attributes}};
  $tm->{id} = $atts{id};
#               <!ELEMENT topicMap
#                   ( topic | association | mergeMap )*
#                >
  $element->children_accept_name ($self, [ qw(topic association mergeMap) ], $tm);
}

sub visit_name_topic {
  my $self    = shift;
  my $element = shift;
  my $parents = shift;
  my $tm      = shift;

  elog ('XTM::XML', 5, "$element->{Name} found with ", $element->{Attributes});
  die "XTM::XML: syntax violation: expected ".join (",",@$parents)." but found $element->{Name}\n" unless grep ($element->{Name} eq $_, @$parents);
#               <!ATTLIST topic
#                   id              ID        #REQUIRED
#                >
  my %atts = %{$element->{Attributes}};
  my $t = new XTM::topic (id   => $atts{id});
#               <!ELEMENT topic
#                   ( instanceOf*, subjectIdentity?, ( baseName | occurrence )* )
#                >
  $element->children_accept_name ($self, [qw( instanceOf subjectIdentity baseName occurrence) ], $t);

# if instanceOf not defined, default (3.6.1)
  unless ($t->instanceOfs) {
    $t->add__s (new XTM::instanceOf ( reference => new XTM::topicRef (href => $XTM::PSI::xtm{topic})));
  }

  die "XTM::XML, conformance error in '$element->{Name}': see XTM standard, 3.6.1\n"
    if $t->subjectIdentity_s > 1;
  $t->add_subjectIdentity ($t->subjectIdentity_s);  $t->undefine (qw (subjectIdentitys));

  $tm->add ($t);
}

sub visit_name_subjectIdentity {
  my $self    = shift;
  my $element = shift;
  my $parents = shift;
  my $x       = shift;

  elog ('XTM::XML', 5, "$element->{Name} found with ", $element->{Attributes});
  die "XTM::XML: syntax violation: expected ".join (",",@$parents)." but found $element->{Name}\n" unless grep ($element->{Name} eq $_, @$parents);
#             <!ATTLIST subjectIdentity
#               id              ID        #IMPLIED
#             >
  my %atts = %{$element->{Attributes}};
  use XTM::subjectIdentity;
  
  my $s = new XTM::subjectIdentity (id   => $atts{id});
#              <!ELEMENT subjectIdentity
#                        ( resourceRef?, ( topicRef | subjectIndicatorRef )* )
#              >
  $element->children_accept_name ($self, [ qw( resourceRef topicRef subjectIndicatorRef ) ], $s);
  die "XTM::XML, conformance error in '$element->{Name}': see XTM standard, 3.6.2\n"  if $s->resourceRef_s > 1;
  $s->add_resourceRef ($s->resourceRef_s);  $s->undefine (qw (resourceRefs));

  $x->add__s ($s);
}

sub visit_name_baseName {
  my $self    = shift;
  my $element = shift;
  my $parents = shift;
  my $x       = shift;

  elog ('XTM::XML', 5, "$element->{Name} found with ", $element->{Attributes});
  die "XTM::XML: syntax violation: expected ".join (",",@$parents)." but found $element->{Name}\n" unless grep ($element->{Name} eq $_, @$parents);
#             <!ATTLIST baseName
#               id              ID        #IMPLIED
#             >
  my %atts = %{$element->{Attributes}};
  my $b = new XTM::baseName (id   => $atts{id});
#              <!ELEMENT baseName  ( scope?, baseNameString, variant* ) >
  $element->children_accept_name ($self, [ qw( scope baseNameString variant )  ], $b);
# quantitative contraints
  die "XTM::XML, conformance error in '$element->{Name}': see XTM standard, 3.7.1\n"  if $b->scope_s > 1;

  unless ($b->scope_s) {
    $b->add__s (new XTM::scope ( references => [ new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) ]));
  }

  $b->add_scope ($b->scope_s);  $b->undefine (qw (scopes));
  die "XTM::XML, conformance error in '$element->{Name}': see XTM standard, 3.7.1\n"  if $b->baseNameString_s != 1;
  $b->add_baseNameString ($b->baseNameString_s);  $b->undefine (qw (baseNameStrings));

  $x->add__s ($b);
}

sub visit_name_baseNameString {
  my $self    = shift;
  my $element = shift;
  my $parents = shift;
  my $x       = shift;

  elog ('XTM::XML', 5, "$element->{Name} found with ", $element->{Attributes});
  die "XTM::XML: syntax violation: expected ".join (",",@$parents)." but found $element->{Name}\n" unless grep ($element->{Name} eq $_, @$parents);
#              <!ATTLIST baseNameString
#                id              ID        #IMPLIED
#              >
  my %atts = %{$element->{Attributes}};
#              <!ELEMENT baseNameString  ( #PCDATA ) >
  my $bs = new XTM::baseNameString (id => $atts{id}, string => $element->as_string);
  $x->add__s ($bs);
}

sub visit_name_variant {
  my $self    = shift;
  my $element = shift;
  my $parents = shift;
  my $x       = shift;

  elog ('XTM::XML', 5, "$element->{Name} found with ", $element->{Attributes});
  die "XTM::XML: syntax violation: expected ".join (",",@$parents)." but found $element->{Name}\n" unless grep ($element->{Name} eq $_, @$parents);
#             <!ATTLIST variant
#               id              ID        #IMPLIED
#             >
  my %atts = %{$element->{Attributes}};
  my $v = new XTM::variant (id   => $atts{id});
#              <!ELEMENT variant  ( parameters, variantName, variant* ) >
  $element->children_accept_name ($self, [ qw( parameters variantName variant ) ], $v);
  die "XTM::XML, conformance error in '$element->{Name}': see XTM standard, 3.7.3\n"  unless $v->parameters_s == 1;
  $v->add_parameters ($v->parameters_s);                $v->undefine (qw (parameterss));
  die "XTM::XML, conformance error in '$element->{Name}': see XTM standard, 3.7.3\n"  unless $v->variantName_s == 1;
  $v->add_variantName ($v->variantName_s);              $v->undefine (qw (variantNames));
  $x->add__s ($v);
}

sub visit_name_variantName {
  my $self    = shift;
  my $element = shift;
  my $parents = shift;
  my $x       = shift;

  elog ('XTM::XML', 5, "$element->{Name} found with ", $element->{Attributes});
  die "XTM::XML: syntax violation: expected ".join (",",@$parents)." but found $element->{Name}\n" unless grep ($element->{Name} eq $_, @$parents);
#              <!ATTLIST variantName
#                id              ID        #IMPLIED
#              >
  my %atts = %{$element->{Attributes}};
  my $vn = new XTM::variantName (id   => $atts{id});
#              <!ELEMENT variantName  ( resourceRef | resourceData ) >
  $element->children_accept_name ($self, [ qw( resourceRef resourceData ) ], $vn);

  die "XTM::XML, conformance error in '$element->{Name}': see XTM standard, 3.7.4\n" 
    if $vn->resourceRef_s + $vn->resourceData_s != 1;

  $vn->add_resource ($vn->resourceRef_s, $vn->resourceData_s);  $vn->undefine (qw (resourceRefs resourceDatas));
  $x->add__s ($vn);
}

sub visit_name_parameters {
  my $self    = shift;
  my $element = shift;
  my $parents = shift;
  my $x       = shift;

  elog ('XTM::XML', 5, "$element->{Name} found with ", $element->{Attributes});
  die "XTM::XML: syntax violation: expected ".join (",",@$parents)." but found $element->{Name}\n" unless grep ($element->{Name} eq $_, @$parents);
#              <!ATTLIST parameters
#                id              ID        #IMPLIED
#              >
  my %atts = %{$element->{Attributes}};
  my $ps = new XTM::parameters (id   => $atts{id});
#              <!ELEMENT parameters  ( topicRef | subjectIndicatorRef )+ >
  $element->children_accept_name ($self, [ qw( topicRef subjectIndicatorRef ) ], $ps);

  die "XTM::XML, conformance error in '$element->{Name}': see XTM standard, 3.7.5\n" 
    if $ps->topicRef_s + $ps->subjectIndicatorRef_s == 0;

  $ps->add_reference ($ps->topicRef_s, $ps->subjectIndicatorRef_s);  $ps->undefine (qw (topicRefs subjectIndicatorRefs));
  $x->add__s ($ps);
}

sub visit_name_association {
  my $self    = shift;
  my $element = shift;
  my $parents = shift;
  my $tm      = shift; # must be topic map

  elog ('XTM::XML', 5, "$element->{Name} found with ", $element->{Attributes});
  die "XTM::XML: syntax violation: expected ".join (",",@$parents)." but found $element->{Name}\n" unless grep ($element->{Name} eq $_, @$parents);
#              <!ATTLIST association
#                id              ID        #IMPLIED
#              >
  my %atts = %{$element->{Attributes}};
  my $a = new XTM::association (id   => $atts{id});
#              <!ELEMENT association
#               ( instanceOf?, scope?, member+ )
#              >
  $element->children_accept_name ($self, [ qw( instanceOf scope member ) ], $a);

# if instanceOf not defined, default (3.8.1)
  unless ($a->instanceOf_s) {
    $a->add__s (new XTM::instanceOf ( reference => new XTM::topicRef (href => $XTM::PSI::xtm{association})));
  }
  die "XTM::XML, conformance error in '$element->{Name}': see XTM standard, 3.8.1\n" if $a->instanceOf_s > 1;
  $a->add_instanceOf ($a->instanceOf_s);  $a->undefine (qw (instanceOfs));

  die "XTM::XML, conformance error in '$element->{Name}': see XTM standard, 3.8.1\n" if $a->scope_s > 1;
  unless ($a->scope_s) {
    $a->add__s (new XTM::scope ( references =>  [ new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) ]));
  }
  $a->add_scope ($a->scope_s);  $a->undefine (qw (scopes));

  die "XTM::XML, conformance error in '$element->{Name}': see XTM standard, 3.8.1\n" if $a->member_s == 0;

  $tm->add ($a);
}

sub visit_name_member {
  my $self    = shift;
  my $element = shift;
  my $parents = shift;
  my $a       = shift; # must be association

  elog ('XTM::XML', 5, "$element->{Name} found with ", $element->{Attributes});
  die "XTM::XML: syntax violation: expected ".join (",",@$parents)." but found $element->{Name}\n" unless grep ($element->{Name} eq $_, @$parents);
#              <!ATTLIST member
#                id              ID        #IMPLIED
#              >
  my %atts = %{$element->{Attributes}};
  my $m = new XTM::member (id   => $atts{id});
#              <!ELEMENT member
#               ( roleSpec?, ( topicRef | resourceRef | subjectIndicatorRef )+ )
#              >
  $element->children_accept_name ($self, [ qw( roleSpec topicRef resourceRef subjectIndicatorRef ) ], $m);

  die "XTM::XML, conformance error in '$element->{Name}': see XTM standard, 3.8.2\n" if $m->rolesSpec_s > 1;
  $m->add_roleSpec ($m->roleSpec_s);  $m->undefine (qw (roleSpecs));
  die "XTM::XML, conformance error in '$element->{Name}': see XTM standard, 3.8.2\n" 
    unless $m->topicRef_s + $m->resourceRef_s + $m->subjectIndicatorRef_s > 0;
  $m->add_reference_s ($m->topicRef_s, $m->resourceRef_s, $m->subjectIndicatorRef_s);  $m->undefine (qw (topicRefs resourceRefs subjectIndicatorRefs));

  $a->add__s ($m);
}

sub visit_name_roleSpec {
  my $self    = shift;
  my $element = shift;
  my $parents = shift;
  my $m       = shift; # must be member

  elog ('XTM::XML', 5, "$element->{Name} found with ", $element->{Attributes});
  die "XTM::XML: syntax violation: expected ".join (",",@$parents)." but found $element->{Name}\n" unless grep ($element->{Name} eq $_, @$parents);
#              <!ATTLIST roleSpec
#                id              ID        #IMPLIED
#              >
  my %atts = %{$element->{Attributes}};
  my $r = new XTM::roleSpec (id   => $atts{id});
#              <!ELEMENT roleSpec  ( topicRef | subjectIndicatorRef ) >
  $element->children_accept_name ($self, [ qw( topicRef subjectIndicatorRef ) ], $r);

  die "XTM::XML, conformance error in '$element->{Name}': see XTM standard, 3.8.3\n"  
    unless $r->topicRef_s + $r->subjectIndicatorRef_s == 1;
  $r->add_reference  ($r->topicRef_s,  $r->subjectIndicatorRef_s);  $r->undefine (qw (topicRefs subjectIndicatorRefs));

  $m->add__s ($r);
}

sub visit_name_occurrence {
  my $self    = shift;
  my $element = shift;
  my $parents = shift;
  my $t       = shift; # must be topic

  elog ('XTM::XML', 5, "$element->{Name} found with ", $element->{Attributes});
  die "XTM::XML: syntax violation: expected ".join (",",@$parents)." but found $element->{Name}\n" unless grep ($element->{Name} eq $_, @$parents);
#              <!ATTLIST occurrence
#                id              ID        #IMPLIED
#              >
  my %atts = %{$element->{Attributes}};
  my $o = new XTM::occurrence (id   => $atts{id});
#              <!ELEMENT occurrence
#               ( instanceOf?, scope?, ( resourceRef | resourceData ) )
#              >
  $element->children_accept_name ($self, [ qw( instanceOf scope resourceRef resourceData ) ], $o);

# if instanceOf not defined, default (3.9.1)
  unless ($o->instanceOf_s) {
    $o->add__s (new XTM::instanceOf ( reference => new XTM::topicRef (href => $XTM::PSI::xtm{occurrence})));
  }
  die "XTM::XML, conformance error in '$element->{Name}': see XTM standard, 3.9.1\n" if $o->instanceOf_s > 1;
  $o->add_instanceOf ($o->instanceOf_s);  $o->undefine (qw (instanceOfs));
  die "XTM::XML, conformance error in '$element->{Name}': see XTM standard, 3.9.1\n" if $o->scope_s > 1;
  unless ($o->scope_s) {
    $o->add__s (new XTM::scope ( references => [ new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) ]));
  }
  $o->add_scope ($o->scope_s);  $o->undefine (qw (scopes));
  die "XTM::XML, conformance error in '$element->{Name}': see XTM standard, 3.9.1\n" 
    unless $o->resourceRef_s + $o->resourceData_s == 1;
  $o->add_resource ($o->resourceRef_s, $o->resourceData_s);  $o->undefine (qw (resourceRefs resourceDatas));

  $t->add__s ($o);
}

sub visit_name_resourceRef {
  my $self    = shift;
  my $element = shift;
  my $parents = shift;
  my $x       = shift;

  elog ('XTM::XML', 5, "$element->{Name} found with ", $element->{Attributes});
  die "XTM::XML: syntax violation: expected ".join (",",@$parents)." but found $element->{Name}\n" unless grep ($element->{Name} eq $_, @$parents);
#              <!ATTLIST resourceRef
#                id              ID        #IMPLIED
#                xlink:type      NMTOKEN   #FIXED 'simple'
#                xlink:href      CDATA     #REQUIRED
#              >
  my %atts = %{$element->{Attributes}};
#              <!ELEMENT resourceRef EMPTY>
  my $r = new XTM::resourceRef (id   => $atts{id}, href => $atts{'xlink:href'});
  $x->add__s ($r);
}

sub visit_name_resourceData {
  my $self    = shift;
  my $element = shift;
  my $parents = shift;
  my $x       = shift;

  elog ('XTM::XML', 5, "$element->{Name} found with ", $element->{Attributes});
  die "XTM::XML: syntax violation: expected ".join (",",@$parents)." but found $element->{Name}\n" unless grep ($element->{Name} eq $_, @$parents);
#              <!ATTLIST resourceData
#                id              ID        #IMPLIED
#              >
  my %atts = %{$element->{Attributes}};
#              <!ELEMENT resourceData  ( #PCDATA ) >
  my $rd = new XTM::resourceData (id => $atts{id}, data => $element->as_string);
  $x->add__s ($rd);
}

sub visit_name_mergeMap {
  my $self    = shift;
  my $element = shift;
  my $parents = shift;
  my $tm      = shift; # must be topic map

  warn "XTM::XML: mergeMap deprecated feature, use TM algebras instead\n";

  elog ('XTM::XML', 5, "$element->{Name} found with ", $element->{Attributes});
  die "XTM::XML: syntax violation: expected ".join (",",@$parents)." but found $element->{Name}\n" unless grep ($element->{Name} eq $_, @$parents);
#              <!ATTLIST mergeMap
#               id              ID        #IMPLIED
#               xlink:type      NMTOKEN   #FIXED 'simple'
#               xlink:href      CDATA     #REQUIRED
#               >
  my %atts = %{$element->{Attributes}};

  die "XTM::XML: required attribute 'xlink:href' missing: see XTM standard, 3.10.1\n" unless $atts{'xlink:href'};
  my $mm = new XTM::mergeMap (id   => $atts{id}, href => $atts{'xlink:href'});
#              <!ELEMENT mergeMap  ( topicRef | resourceRef | subjectIndicatorRef )* >
  $element->children_accept_name ($self, [ qw( topicRef resourceRef subjectIndicatorRef ) ], $mm);

  my $tm2 = (new XTM::XML (url => $atts{'xlink:href'}))->sync_in;
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
  $tm->add ($tm2);
}

=pod

=head1 AUTHOR INFORMATION

Copyright 2001, Robert Barta <rho@telecoma.net>, All rights reserved.
 
This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.

=cut

1;
