package XTM::variant;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

use XTM::generic;
use XTM::parameters;
use XTM::variantName;

@ISA = qw(Exporter AutoLoader XTM::generic);
@EXPORT = qw( );
$VERSION = '0.02';

=pod

=head1 NAME

XTM::variant - trivial class definition

=head1 SYNOPSIS

  # see XTM::generic

=head1 DESCRIPTION

Generic container for accessor functions.

=cut

sub xml {
  my $self   = shift;
  my $writer = shift;

  $writer->startTag ('variant');
  $self->parameters->xml ($writer);
  $self->variantName->xml ($writer) if $self->variantName;
  foreach my $v (@{$self->variants}) {
    $v->xml ($writer);
  }
  $writer->endTag ('variant');
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
