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
$VERSION = '0.03';

=pod

=head1 NAME

XTM::occurrence - trivial class definition

=head1 SYNOPSIS

  # see XTM::generic

=head1 DESCRIPTION

Class covering occurrences

=head2 Methods

Following accessor methods are available via L<XTM::generic> (see that package how
to set/add values):

=over

=item I<instanceOf>:

I<$o>->instanceOf

returns a L<XTM::instanceOf> node

=item I<scope>:

I<$o>->scope

returns a L<XTM::scope> node

=item I<resource>:

I<$o>->resource

returns a L<XTM::resourceRef> or L<XTM::resourceData> node

=back


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

Copyright 200[1-2], Robert Barta <rho@telecoma.net>, All rights reserved.

This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.
http://www.perl.com/perl/misc/Artistic.html

=cut

1;

__END__
