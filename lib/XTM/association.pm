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
$VERSION = '0.02';

my $assoc_cntr = 0;

sub new {
  my $class = shift;
  my %pars  = @_;
  elog ($class, 5, "new");

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

=head1 SEE ALSO

L<XTM>

=head1 AUTHOR INFORMATION

Copyright 2001, Robert Barta <rho@telecoma.net>, All rights reserved.
 
This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.

=cut

1;

__END__
