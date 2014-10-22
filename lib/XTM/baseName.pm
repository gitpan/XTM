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
$VERSION = '0.03';

=pod

=head1 NAME

XTM::baseName - trivial class definition

=head1 SYNOPSIS

  # see XTM::generic

=head1 DESCRIPTION

Class covering a baseName

=head2 Methods

Following accessor methods are available via L<XTM::generic> (see that package how
to set/add values):

=over

=item I<baseNameString>:

I<$b>->baseNameString

returns a L<XTM::baseNameString> node

=item I<scope>:

I<$b>->scope

returns a L<XTM::scope> node

=back

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
