package XTM::scope;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

use XTM::generic;
use XTM::topicRef;
use XTM::resourceRef;
use XTM::subjectIndicatorRef;

@ISA = qw(Exporter AutoLoader XTM::generic);
@EXPORT = qw( );
$VERSION = '0.03';

=pod

=head1 NAME

XTM::scope - trivial class definition

=head1 SYNOPSIS

  # see XTM::generic

=head1 DESCRIPTION

Most functions are inherited from XTM::generic. The only exceptions are below.

=over

=item I<scope_eq>

This B<function> expects to scope references and returns 0 if they are different and
1 otherwise. This function - for performance reasons - expects that the scope references are
sorted by their ref() and then by the value of C<href>.

=cut

sub scope_eq {
  my $sr1 = shift;
  my $sr2 = shift;

  # this is a set comparison, but I assume that this set is SORTED along the type (topicRef, ...) and href
  return 0 unless scalar @{$sr1} == scalar @{$sr2};
  for (my $i = 0; $i < scalar @{$sr1}; $i++) {
    return 0 if ref($sr1->[$i])  ne ref($sr2->[$i]);  # should have the same types
    return 0 if $sr1->[$i]->href ne $sr2->[$i]->href; # should have the same link
  }
  return 1;
}

=pod



=cut

sub xml {
  my $self   = shift;
  my $writer = shift;

  $writer->startTag ('scope');
  foreach my $s (@{$self->references}) {
    $s->xml ($writer);
  }
  $writer->endTag ('scope');
};

=pod

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
