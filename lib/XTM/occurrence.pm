package XTM::occurrence;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

use XTM::generic;
use XTM::scope;
use XTM::baseNameString;
use XTM::resourceRef;
use XTM::resourceData;

@ISA = qw(Exporter AutoLoader XTM::generic);
@EXPORT = qw( );
$VERSION = '0.02';

=pod

=head1 NAME

XTM::occurrence - trivial class definition

=head1 SYNOPSIS

  # see XTM::generic

=head1 DESCRIPTION

Generic container for accessor functions.

=cut

sub xml {
  my $self   = shift;
  my $writer = shift;

  $writer->startTag ('occurrence');
  $self->instanceOf->xml ($writer) if $self->instanceOf;
  $self->scope->xml ($writer)      if $self->scope->references;
  $self->resource->xml ($writer);
  $writer->endTag ('occurrence');
};

=pod

=head1 SEE ALSO

L<XTM>

=head1 AUTHOR INFORMATION

Copyright 2001, Robert Barta <rho@telecoma.net>, All rights reserved.
 
This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.

=cut

1;

__END__
