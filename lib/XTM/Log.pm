package XTM::Log;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

@ISA = qw(Exporter AutoLoader);
@EXPORT = qw();
@EXPORT_OK = qw( flog elog);
$VERSION = '0.02';

use vars qw($logfile $loglevel);

=pod

=head1 NAME

XTM::Log - Topic Map Logger

=head1 SYNOPSIS

  use XTM::Log;

=head1 DESCRIPTION

This package provides some logging facilities for the XTM::* packages. Basically,
it provides STDERR and file based logging.

=head1 INTERFACE

=head2 Global Variables

Following variables can be set to control the behavior of this package:

=over

=item C<logfile> (xtmd.log)

=cut

$logfile  = 'xtmd.log';

=pod

=item C<loglevel> (1)

=cut

$loglevel = 1;

=pod

=back

=head1 Methods

=over

=item I<flog>

provides some basic file logging facilities. Please refer to the global variables for configuration.
It logs messages to the current C<logfile> whenever called
and the passed loglevel is at least the minimum (as configured via the global variable C<loglevel>).
Parameters are:

=over

=item C<entity>

Here you can provide some descriptive text of the module logging.

=item C<loglevel>

current loglevel

=back

Any additional parameters are copied (for SCALARs) or output via Data::Dumper::Dumper.

Example:

   flog ('MyProgram', 4, 'Logging a line', $line, \%context);

=cut

use POSIX qw(strftime);
use IO::File;

sub flog {
  my $entity = shift;
  my $level  = shift || 1;
  my @msgs   = @_;
  unless ($level > $loglevel) {
    my $fh = new IO::File ">>$logfile" || warn "XTM::Log: Cannot open logfile '$logfile' in flog";
    print $fh (strftime "%Y %a %b %e %H:%M:%S", localtime)." - $entity($level): ".
		(@msgs ? join (" ", @msgs) : "Here!!").
		"\n";
  }
}

=pod

=item I<elog>

provides some basic STDERR logging facilities. Otherwise see C<flog>.

Example:

   elog ('MyProgram', 4, 'Logging a line', $line, \%context);

=cut

use Data::Dumper;

sub elog {
  my $entity = shift;
  my $level  = shift || 1;

  return if $level > $loglevel;

  my $m;
  foreach my $v (@_) {
    if (!ref($v)) {
      $m .= $v;
    } else {
      $m .= Dumper $v;
    }
  }
  print STDERR (strftime "%Y %a %b %e %H:%M:%S", localtime)." - $entity($level): ".    ($m ? $m : "Here!!").  "\n";
}


=pod

=back

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
