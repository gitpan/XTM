package XTM::parameters;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

use XTM::generic;
use XTM::topicRef;
use XTM::subjectIndicatorRef;

@ISA = qw(Exporter AutoLoader XTM::generic);
@EXPORT = qw( );
$VERSION = '0.02';

=pod

=head1 NAME

XTM::parameters - trivial class definition

=head1 SYNOPSIS

  # see XTM::generic

=head1 DESCRIPTION

Generic container for accessor functions.

=cut

sub xml {
  my $self   = shift;
  my $writer = shift;

  $writer->startTag ('parameters');
  foreach my $r (@{$self->references}) {
    $r->xml ($writer);
  }
  $writer->endTag ('parameters');
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
