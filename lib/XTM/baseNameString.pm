package XTM::baseNameString;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

use XTM::generic;

@ISA = qw(Exporter AutoLoader XTM::generic);
@EXPORT = qw( );
$VERSION = '0.03';

=pod

=head1 NAME

XTM::baseNameString - trivial class definition

=head1 SYNOPSIS

  # see XTM::generic

=head1 DESCRIPTION

Class covering a baseNameString

=head2 Methods

Following accessor methods are available via L<XTM::generic> (see that package how
to set/add values):

=over

=item I<string>:

@{ I<$bns>->string}

returns a scalar

=back

=cut

sub xml {
  my $self   = shift;
  my $writer = shift;

  $writer->dataElement('baseNameString', $self->string);
};

=pod

=head1 SEE ALSO

L<XTM>

=head1 AUTHOR INFORMATION

Copyright 200[1-2], Robert Barta <rho@telecoma.net>, All rights reserved.

This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.
http://www.perl.com/perl/misc/Artistic.html

=cut

1;

__END__
