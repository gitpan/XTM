package XTM::subjectIdentity;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

use XTM::resourceRef;
use XTM::topicRef;
use XTM::subjectIndicatorRef;
use XTM::generic;

@ISA = qw(Exporter AutoLoader XTM::generic);
@EXPORT = qw(  );
$VERSION = '0.02';

=pod

=head1 NAME

XTM::subjectIdentity - trivial class definition

=head1 SYNOPSIS

  # see XTM::generic

=head1 DESCRIPTION

Generic container for accessor functions.

=cut

sub xml {
  my $self   = shift;
  my $writer = shift;

  $writer->startTag ('subjectIdentity');
  $self->resourceRef->xml ($writer) if $self->resourceRef;
  foreach my $s (@{$self->references}) {
    $s->xml ($writer);
  }
  $writer->endTag ('subjectIdentity');
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
