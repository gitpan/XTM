package XTM::association;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

use XTM::generic;
use XTM::instanceOf;
use XTM::scope;
use XTM::member;
use XTM::baseName;
use XTM::resourceRef;
use XTM::subjectIdentity;
use XTM::subjectIndicatorRef;
use XTM::roleSpec;

use XTM::Log ('elog');

@ISA = qw(Exporter AutoLoader XTM::generic);
@EXPORT = qw( );
$VERSION = '0.06';

my $assoc_cntr = 0;

sub new {
  my $class = shift;
  my %pars  = @_;
#  elog ($class, 5, "new");

  my $self  = bless { id => $pars{id} || sprintf ("a-%10.10d", $assoc_cntr++),
		    }, $class;
  return $self;
}

=pod

=head1 NAME

XTM::association - trivial class definition

=head1 SYNOPSIS

  # see XTM::generic

=head1 DESCRIPTION

Generic container for accessor functions.

=head2 Methods

=over

=item I<xml>

I<$association>->xml (I<$xmlwriter>)

returns an XML representation of the association.

Example:

   $a->xml($xmlwriter)

=cut

sub xml {
  my $self = shift;
  my $writer = shift;

  $writer->startTag ('association');
  $self->instanceOf->xml($writer) if $self->instanceOf;
  $self->scope->xml ($writer);
  foreach my $m (@{$self->members}) {
    $m->xml($writer);
  }
  $writer->endTag ('association');
}

=pod

=item I<add_defaults>

I<$association>->add_defaults

This methods add default values according to the XTM standard. Specifically,
it assures that

=over

=item The association has at exactly one C<instanceOf> component and there
is an entry. If not, one will be generated (XTM clause 3.8.1).

=item If a scope exists, then at
least one reference must be there (XTM clause 3.8.1).

=back

=cut

sub add_defaults {
  my $self = shift;

  # 3.8.1
  unless ($self->instanceOf) {
    $self->add (new XTM::instanceOf ( reference => new XTM::topicRef (href => $XTM::PSI::xtm{association})));
  }
  # 3.3.1
  unless ($self->scope) {
    $self->add (new XTM::scope ( references => [ new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) ]));
  }
}

=pod

=item I<connected>

returns a list reference of all topic references mentioned in this association.
 These references might be 'internal' or 'external' ones.

Example:

   foreach (@{$t->connected}) {
     print "$t->id mentions $_\n";
   }

=cut

sub connected {
  my $self = shift;
  my @connected = ();

  push @connected, $self->instanceOf->reference->href;

  foreach my $r (@{$self->scope->references}) {
    push @connected, $r->href;
  }
  foreach my $m (@{$self->members}) {
    push @connected, $m->roleSpec->reference->href
      if $m->roleSpec;
    foreach my $r (@{$m->references}) {
      push @connected, $r->href;
    }
  }
  return \@connected;
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
