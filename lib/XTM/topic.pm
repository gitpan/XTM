package XTM::topic;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

use XTM::generic;
use XTM::instanceOf;
use XTM::baseName;
use XTM::scope;
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

@ISA = qw(Exporter AutoLoader XTM::generic);
@EXPORT = qw( );
$VERSION = '0.05';

=pod

=head1 NAME

XTM::topic - Topic Map management, Topic

=head1 SYNOPSIS

  use XTM::topic;

  my $t = new XTM::topic;
  ...
  print join (",", @{$t->occurrences()});
  print "bliss and happiness" if $t->has_instanceOf ('t-billionair');

  # see XTM::generic for more

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
  my $class = shift;
  my %pars  = @_;
  elog ($class, 5, "new '$pars{id}'");

  my $self  = bless { id          => $pars{id} || sprintf ("t-%10.10d", $topic_cntr++),
		      instanceOfs => [],
		      baseNames   => [],
		      occurrences => []
		    }, $class;
  return $self;
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

  foreach my $i (@{$self->{instanceOfs}}) {
    return 1 if $i->{reference}->{href} eq "#$ioid";
  }
  return 0;
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

