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
$VERSION = '0.10';

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
  my $t3 = new XTM::topic (id => '1234', populate => XTM::topic::default);


  # see XTM::generic for more methods

=head1 DESCRIPTION

This package provides the primitive class Topic for Topic Maps.

=head1 INTERFACE

=head2 Constructor

The constructor expects a hash with following (optional) fields:

=over

=item id: a topic id (unique in the map in use), if not given, it will be generated

=back

  $t = new XTM::topic ('id' => '#123');

=cut

my $topic_cntr = 0;

sub new {
  my $class   = shift;
  my %options = @_;
  elog ($class, 5, "new '$options{id}'");

  elog ($class, 1, "topic ID '$options{id}' might make problems with XML processors")
    unless $options{id} =~ /^[\w_:][\w\d\-\.]*/ && $options{id} !~ /^xml:/;  # Professional XML, page 33


  my $self  = bless { id          => $options{id} || sprintf ("t-%10.10d", $topic_cntr++),
		      instanceOfs => [],
		      baseNames   => [],
		      occurrences => []
		    }, $class;
  &{$options{populate}} ($self)
      if (defined $options{populate} && ref ($options{populate}) eq 'CODE');
  return $self;
}


# this is a simple routine (NO method) to fill a basename with a default scope
sub default_populate {
  my $t = shift;

  my $name = $t->id;  # default base name
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

=item I<occurrences>

returns the occurrences of the topic as a list reference. If provided with a parameter, this value
will be used as new occurrences list reference (no validation will happen).

=cut

sub occurrences {
  my $self = shift;
  my $sub  = shift;
  
  elog ('XTM::topic', 5, "occurrences", $sub);
  return $sub ? [ grep (&$sub ($_), @{$self->{occurrences}}) ] : $self->{occurrences};
}

=pod

=item I<map>

is an accessor method for the C<map> component.

=cut

sub map {
  my $self = shift;
  $_[0] ? $self->{map} = shift : $self->{map};
}

=pod

=item I<has_instanceOf>

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

=item I<connected>

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
     push @connected, $self->subjectIdentity->href;
  }
  # TOBEDONE
  # variants
  return \@connected;
}

=pod

=item I<xml>

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

L<XTM>

=head1 AUTHOR INFORMATION

Copyright 2001, 2002, Robert Barta <rho@telecoma.net>, All rights reserved.

This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.
http://www.perl.com/perl/misc/Artistic.html


=cut

1;

__END__

