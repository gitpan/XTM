package XTM::baseName;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

use XTM::generic;
use XTM::scope;
use XTM::baseNameString;

@ISA = qw(Exporter AutoLoader XTM::generic);
@EXPORT = qw( );
$VERSION = '0.02';

=pod

=head1 NAME

XTM::baseName - trivial class definition

=head1 SYNOPSIS

  # see XTM::generic

=head1 DESCRIPTION

Generic container for accessor functions.

=cut

=item B<add>

I<$t>->add (I<$y>)

I<add> analyses the type of the data structure to be added and will integrate the
information accordingly as simple component or as list. An exception will be raised
if the internal consistency would be broken.

=cut

sub xml {
  my $self   = shift;
  my $writer = shift;

  $writer->startTag ('baseName');
  $self->scope->xml ($writer) if $self->scope->references;
  $self->baseNameString->xml ($writer);
#  foreach my $v ($self->variants ? @{$self->variants} : ()) {
#     $v->xml ($writer);
#  }
  $writer->endTag ('baseName');
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
