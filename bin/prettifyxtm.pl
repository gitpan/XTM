#!/usr/bin/perl

use strict;
use vars qw($VERSION);

$VERSION = "0.1";


=pod

=head1 NAME

prettifyxtm.pl - formatter for XTM

=head1 SYNOPSIS

  cat map.xtm | prettifyxtm.pl > map2.xtm

=head1 DESCRIPTION

This filter consumes on STDIN a topic map written in XTM syntax and
indents some tags before it writes the same content onto STDOUT.

Type 'help' within this shell to get an overview over available
switches.

=head1 OPTIONS

Following command line switches are understood by the program:

=over

=item B<help> 

...does hopefully what you would expect.

=item B<about> (default: no) 

The program will print out some information about the software itself, (version) and 
will terminate thereafter.

=cut

my $about = 0;

=back

=head1 XTM (XML Topic Maps), the Notation

Please refer to the online documentation

   http://www.topicmaps.org/xtm/


=head1 AUTHOR INFORMATION

Copyright 2002, Robert Barta <rho@telecoma.net>, All rights reserved.

This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.
http://www.perl.com/perl/misc/Artistic.html

=cut

use Getopt::Long;
use Pod::Usage;
use Data::Dumper;


my $help;
if (!GetOptions ('help|?|man'          => \$help,
		 'about!'              => \$about,
		) || $help) {
  pod2usage(-exitstatus => 0, -verbose => 2);
}

if ($about) {
  use XTM;
  print STDOUT "XTM Formatter ($VERSION)
";
  exit;
}

use XML::Twig;
my $t = new XML::Twig;

undef $/;
$t->parse( <> );
$t->set_pretty_print( 'indented' );
$t->print;
print "\n";

__END__
