package XTM::XML::Latin1Parser;

use XML::Grove;
use XML::Grove::Builder;

use vars qw(@ISA);
@ISA = ('XML::Grove::Builder');

use XTM::XML::UTF8;

sub characters {
    my $self = shift;
    XTM::XML::UTF8::utf82iso ($_[0]->{Data});
    push @{ $self->{cur_list} }, new XML::Grove::Characters (@_);
}

=pod

=head1 NAME

XTM::XML::Latin1Parser - XTM generic XML first pass parser.

=head1 SYNOPSIS

# Just here to silence pod2man. This is very much an internal package

=head1 DESCRIPTION

none.

=head1 AUTHOR INFORMATION

Copyright 2001, Robert Barta <rho@telecoma.net>, All rights reserved.
 
This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.

=cut

1;
