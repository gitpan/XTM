# -*-perl-*-
use strict;
use Test;
BEGIN { plan tests => 3 }
 
use XTM;
use XTM::Log (qw(elog flog));

$XTM::Log::loglevel = 5;

my $s = { a => 'b', c => 'd' };

my $logfile = "/tmp/xtm$$.log";
open (STDERR, ">$logfile");
elog ('Log Test', 5, "hi", $s);
close STDERR;

use File::Slurp;
ok (grep (/test/i,      read_file($logfile)));
ok (grep (/hi/,         read_file($logfile)));
ok (grep (/'c' => 'd'/, read_file($logfile)));

unlink "/tmp/xtm$$.log";
