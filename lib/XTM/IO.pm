package XTM::IO;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

@ISA = qw(Exporter AutoLoader);
@EXPORT = qw( );
$VERSION = '0.02';

=pod

=head1 NAME

XTM::IO - Topic Map management, abstract class for input/output

=head1 SYNOPSIS

  # this class will never be directly used

=head1 DESCRIPTION

This is the abstract class defining how an IO package should behave and may
thus be inherited by classes which implement external formats (L<XTM::AsTMa>,
L<XTM::XML>).

=head1 INTERFACE

=head2 Constructor

The constructor should expect a hash as parameter containing at least the following fields:

=over

=item I<auto_complete> (default: 1)
    If C<auto_complete> is set, the loading mechanism is directed to automatically generate
    all topics which are referenced in a map but which are not explicitely defined. It is
    up to the implementation how these topics are created and which characteristics they have.

=back

=cut

sub new {
  die "XTM::IO: constructor not defined"
}

=pod

=head2 Methods

The methods C<sync_in>, C<sync_out> and C<last_mod> implement the methods from
the abstract class L<XTM::IO>

=over

=item C<last_mod>

returns the UNIX time when the resource has been modified last. C<undef> is
returned if the result cannot be determined.


=cut

sub last_mod {
  die "XTM::IO: Do not call this abstract method.";
}

=pod

=item C<sync_in>

actually loads an XTM resource and returns a L<XTM::Memory> object.


=cut

sub sync_in {
  die "XTM::IO: Do not call this abstract method.";
}

=pod

=item C<sync_out>

is supposed to save the L<XTM::Memory> content onto the resource.

=cut

sub sync_out {
  die "XTM::IO: Do not call this abstract method.";
}

=pod

=back

=head1 SEE ALSO

L<XTM>

=head1 AUTHOR INFORMATION

Copyright 2002, Robert Barta <rho@telecoma.net>, All rights reserved.

This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.
http://www.perl.com/perl/misc/Artistic.html

=cut

1;

__END__
