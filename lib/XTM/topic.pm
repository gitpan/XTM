package XTM::topic;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

use Data::Dumper;

use XTM::generic;
use XTM::instanceOf;
use XTM::baseName;
use XTM::scope;
use XTM::PSI;
use XTM::subjectIdentity;
use XTM::occurrence;
use XTM::topicRef;
use XTM::resourceRef;
use XTM::subjectIndicatorRef;
use XTM::variant;
use XTM::variantName;
use XTM::parameters;
use XTM::resourceData;
use XTM::baseNameString;

use XTM::Log ('elog');

use URI;

@ISA = qw(Exporter AutoLoader XTM::generic);
@EXPORT = qw( );
$VERSION = '0.13';

=pod

=head1 NAME

XTM::topic - Topic Map management, Topic

=head1 SYNOPSIS

  use XTM::topic;

  my $t = new XTM::topic;
  ...
  print join (",", @{$t->occurrences()});
  print "bliss and happiness" if $t->has_instanceOf ('t-billionair');

  # now this time I am providing the id myself
  my $t2 = new XTM::topic (id => '1234');

  # there is also a cheap way to populate the topic with a default
  my $t3 = new XTM::topic (id => '1234', populate => \&XTM::topic::default_populate);


  # see XTM::generic for more methods

=head1 DESCRIPTION

This package provides the primitive class Topic for Topic Maps.

=head1 INTERFACE

=head2 Constructor

The constructor expects a hash with following (optional) fields:

=over

=item C<id>:

a topic id (unique in the map in use), if not given, it will be generated

=item C<populate>:

a code reference to a subroutine populating the topic. There are the following B<predefined>
subroutines:

=over

=item I<default_populate>

This routine expects as first parameter a C<XTM::topic>-blessed object and fills in
the PSI topic as 'instanceOf', global scope where appropriate. It also generates in a fairly
ad-hoc manner a 'baseName' from the topic id (substituting '-' by ' ').

=back


=back
Example:

  $t = new XTM::topic ('id' => 'x123');

=cut

our $topic_cntr = 0;

sub new {
  my $class   = shift;
  my %options = @_;

  if ($options{id}) {
    unless ($options{id} =~ /^[\w_:][\w\d\-\.]*/ && $options{id} !~ /^xml:/) {  # Professional XML, page 33
      elog ($class, 1, "topic ID '$options{id}' might make problems with XML processors");
    }
  } else {
    $options{id} = sprintf ("t-%10.10d", $topic_cntr++);
  }
  elog ($class, 5, "new '$options{id}'");

  my $self  = bless { id          => $options{id},
		      instanceOfs => [],
		      baseNames   => [],
		      occurrences => []
		    }, $class;
  $self->{ids} = [ $self->{id} ]; # eventually this will contain id and all aliases of this topic
  &{$options{populate}} ($self)
      if (defined $options{populate} && ref ($options{populate}) eq 'CODE');
  return $self;
}

#sub ids {
#  my $self = shift;
#  return @{$self->{ids}};
#}

# this is a simple routine (NO method) to fill a basename with a default scope
sub default_populate {
  my $t = shift;

  my $name = $t->{id};  # default base name
  $name =~ s/-/ /g;
  my $b = new XTM::baseName ();
  $b->add_baseNameString (new XTM::baseNameString (string => $name));
  $b->add_scope          (new XTM::scope());
  $b->scope->add_reference_s (new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) );
  $t->add__s ($b);
  my $i = new XTM::instanceOf (reference => new XTM::topicRef (href => $XTM::PSI::xtm{topic}));
  $t->add__s ($i);
}

=pod

=head2 Methods

=over

=item I<id>:

print I<$t>->id

I<$t>->id ("x123");

returns the id of the topic. If provided with a non-empty scalar parameter, this value will be
used to change the id.

=cut

sub id {
  my $self = shift;
  my $id   = shift;

  if ($id) {
     $self->{ids} = [ grep ($_ ne $self->{id}, @{$self->{ids}}), $id ];
     $self->{id}  = $id;
  }
  return $self->{id};
}

=pod

=item I<occurrences>:

@{ I<$t>->occurrences }

I<$t>->occurrences ( I<$coderef> )

I<$t>->occurrences ( I<$arrayref> )

returns the occurrences of the topic as a list reference. If provided with a CODEREF parameter,
this subroutine will be used to filter the occurrences. If provided with a ARRAYREF
parameter, this will be used as new value.

=cut

sub occurrences {
  my $self = shift;
  my $sub  = shift;
  
  elog ('XTM::topic', 5, "occurrences", $sub);
  return ref ($sub) eq 'CODE' ?
         [ grep (&$sub ($_), @{$self->{occurrences}}) ] :
	   ref ($sub) eq 'ARRAY' ? 
	     $self->{occurrences} = $sub :
	       $self->{occurrences};
}

=pod

=item I<map>:

I<$t>->map

I<$t>->map ( I<$newmap> )

is an accessor method for the C<map> component.

=cut

sub map {
  my $self = shift;
  $_[0] ? $self->{map} = shift : $self->{map};
}

=pod

=item I<has_instanceOf>:

I<$t>->has_instanceOf ( I<$type_topic_id> )

returns true if the topic is a B<direct> subtype of a topic specified as C<tid> for
the only parameter.

Example:

   print "bliss and happiness" if $t->has_instanceOf ('t-billionair');

=cut

sub has_instanceOf {
  my $self = shift;
  my $ioid = shift;

  my $u = new URI ($ioid);
  if ($u->scheme) { # absolute
    foreach my $i (@{$self->{instanceOfs}}) {
      return 1 if $i->{reference}->{href} eq $ioid;
    }
  } else { # relative
    foreach my $i (@{$self->{instanceOfs}}) {
      return 1 if $i->{reference}->{href} eq "#$ioid";
    }
  }
  return 0;
}

=pod

=item I<add_defaults>

I<$t>->add_defaults

This methods add default values according to the XTM standard. Specifically,
it assures that

=over

=item The topic has at least one C<instanceOf> component and there at least
one entry. If not, one will be generated (XTM clause 3.6.1).

=item Every occurrence must have a type (XTM clause 3.9.1).

=item If a scope exists (in an occurrence or a baseName), then at
least one reference must be there (XTM clause 3.3.1).

=back

=cut

sub add_defaults {
  my $self = shift;

  # 3.6.1
  unless ($self->{instanceOfs} && @{$self->{instanceOfs}}) {
    $self->add__s (new XTM::instanceOf ( reference => new XTM::topicRef (href => $XTM::PSI::xtm{topic})));
  }
  foreach my $o (@{$self->{occurrences}}) {
    # 3.3.1
    unless ($o->{scope}) {
      $o->add (new XTM::scope ( references => [ new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) ]));
    }
    # 3.9.1
    unless ($o->{instanceOf}) {
      $o->add (new XTM::instanceOf ( reference => new XTM::topicRef (href => $XTM::PSI::xtm{occurrence})));
    }
  }

  foreach my $b (@{$self->{baseNames}}) {
    unless ($b->{scope}) {
      $b->add (new XTM::scope ( references => [ new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) ]));
    }
  }

}

=pod

=item I<canonicalize>

I<$t>->canonicalize

This method simplifies the topic by eliminating duplicates as prescribed in F.6.

=cut

sub __make_uniq_string {
#warn " !! make _uniq called";
  my $list = shift;
  my %found;
  return [ grep ( ! $found{$_}++ , @$list ) ];
}

sub __make_uniq_ref {
  my $eval = shift;
  my $list = shift;

  my %found;
  for (my $i = 0, my $l; defined ($l = $list->[$i]); $i++) {
    my $f = &$eval ($l);;
#warn "f is ".$f;
    if ($found{$f}++) {
#      warn "found duplicate $f";
#warn "------before splice ".Dumper $list;
      splice (@$list, $i, 1);
#warn "------after splice ".Dumper $list;
    }
  }
}

use Digest::MD5;

sub canonicalize {
  my $self = shift;

#  warn " canon : ".$self->{id};

#  warn "making uniq".Dumper $self->{ids};
  $self->{ids} = __make_uniq_string  ($self->{ids}) 
    if @{$self->{ids}} > 1;
#  warn "     after making uniq".Dumper $self->{ids};
#  warn "making uniq2".Dumper $self->{instanceOfs};
  __make_uniq_ref (sub { $_[0]->{reference}->{href}}, $self->{instanceOfs}) 
    if @{$self->{instanceOfs}} > 1;
#  warn "     after making uniq2".Dumper $self->{instanceOfs};

  my $md5 = Digest::MD5->new;
  foreach my $bn ($self->{baseNames} ? @{$self->{baseNames}} : ()) {
    next if $bn->{fingerprint};
    $md5->add($bn->{baseNameString}->{string});
    my @hrefs = map { $_->{href} } @{$bn->{scope}->{references}};
    foreach my $h (sort { $a cmp $b } @hrefs) { # they have to be sorted!
      $md5->add($h);
    }
    $bn->add_fingerprint ($md5->hexdigest);  # automatically resets md5 object!
#    warn "bn: ".$bn->{baseNameString}->{string}." has ".$bn->{fingerprint};
  }

  __make_uniq_ref (sub { $_[0]->{fingerprint} }, $self->{baseNames})
    if $self->{baseNames} && @{$self->{baseNames}} > 1;

#  die "XTM::topic: topic has more than one addressable resource (violates XTM clause 3.6.2)"
#    if ($self->{subjectIdentity} && 
#	$self->{subjectIdentity}->{references} &&
#	@{$self->{subjectIdentity}->{references}} > 1 &&
#	grep (isa($_, 'XTM::resourceRef'), @{$self->{subjectIdentity}->{references}}) > 1);

  __make_uniq_ref (sub { $_[0]->{href} }, $self->{subjectIdentity}->{references})
    if ($self->{subjectIdentity} && 
	$self->{subjectIdentity}->{references} &&
	@{$self->{subjectIdentity}->{references}} > 1)

}

=pod

=item I<connected>:

@{ I<$t>->connected }

returns a list reference of all topic references mentioned in this topic. These
references might be 'internal' or 'external' ones.

Example:

   foreach (@{$t->connected}) {
     print "$t->id mentions $_\n";
   }

=cut

sub connected {
  my $self = shift;
  my @connected = ();

  foreach my $i (@{$self->instanceOfs}) {
     push @connected, $i->reference->href;
  }
  foreach my $b (@{$self->baseNames}) {
     foreach my $r (@{$b->scope->references}) {
        push @connected, $r->href;
     }
  }
  foreach my $o (@{$self->occurrences}) {
     foreach my $r (@{$o->scope->references}) {
        push @connected, $r->href;
     }
     push @connected, $o->instanceOf->reference->href;
  }
  if ($self->subjectIdentity) {
     push @connected, $self->subjectIdentity->resourceRef->href if $self->subjectIdentity->resourceRef;
  }
  # TOBEDONE
  # variants
  return \@connected;
}

=pod

=item I<xml>:

I<$t>->xml ( I<$xmlwriter> )

returns an XML representation of the topic.

Example:
   $xmlwriter = new XML::Writer ...
   ...
   $t->xml($xmlwriter); # outputs all onto $xmlwriter

=cut

sub xml {
  my $self   = shift;
  my $writer = shift;

  $writer->startTag ('topic', id => $self->{id});
  foreach my $t (@{$self->instanceOfs}) {
     $t->xml ($writer);
  }
  foreach my $b (@{$self->baseNames}) {
     $b->xml ($writer);
  }
  foreach my $o (@{$self->occurrences}) {
     $o->xml ($writer);
  }
  $self->subjectIdentity->xml ($writer) if $self->subjectIdentity;
  $writer->endTag ('topic');
# variants still missing, better wait until DB solution
}

=pod

=back

=head1 SEE ALSO

L<XTM>, L<XTM::generic>

=head1 AUTHOR INFORMATION

Copyright 200[1-2], Robert Barta <rho@telecoma.net>, All rights reserved.

This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.
http://www.perl.com/perl/misc/Artistic.html


=cut

1;

__END__

  if (0 && $self->occurrences) {
    die "I am not here";
    my $p = 0;
sub occult { # computes a value which allows to 'compare' to occurrences
  my $oc = shift;
  my $v;

  $v .= ref ($oc); # resourceRef or resourceData
  if (ref($oc) eq 'XTM::resourceRef') {
     $v .= $oc->resource->data;
  } else {
     $v .= $oc->resource->href;
  }
  $v .= join "", map { $_->href } @{$oc->scope->references};
  $v .= $oc->instanceOf->reference->href;
  return $v;
}
    $self->occurrences ([ grep (occult($_) ne $p && ($p = occult ($_)), 
                           sort {occult ($a) cmp occult ($b) } @{$self->occurrences})]);
    foreach my $oc (@{$self->occurrences}) {
      $oc->scope->references ( [ sort {ref ($a) cmp ref ($b) || $a->href cmp $b->href } @{$oc->scope->references} ]);
    }
  }
