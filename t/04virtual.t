# -*-perl-*-
use strict;
use Test;
BEGIN { plan tests => 9 }
 
use XTM;
use XTM::Virtual;
use XTM::Log;
$XTM::Log::loglevel = 1;

# loading ok
ok(1);

use Data::Dumper;
##$XTM::Virtual::urlbase = "file:maps/root.xtm";
$XTM::Virtual::tmbase  = "tm://test/";

my $root = new XTM (tie => new XTM::Virtual (expr => "file:maps/root.xtm", key => "_peers"));
ok(1);
my $tm   = new XTM (tie => new XTM::Virtual (expr => "tm://test/"));
ok(1);
my $test = new XTM (tie => new XTM::Virtual (expr => "tm://test/m-test2"));
ok(1);
my $a = new XTM (tie => new XTM::Virtual (expr => "tm://test/m-test2 [] tm://test/m-test"));
my $b = new XTM (tie => new XTM::Virtual (expr => "tm://test/m-test [] tm://test/m-test2"));

foreach my $t (@{$a->topics}) {
  ok ($b->is_topic ($t));
}

__END__

#print Dumper $tm;

ok (@{$tm->topics()},       7);
ok (@{$tm->topics('occurrence regexps /example/')},       2);
ok (@{$tm->topics('text       regexps /any text/')},      1);
ok (@{$tm->topics('assocs with t-topic4')},               2);
ok (@{$tm->topics('assocs with t-topic2')},               3);
ok (@{$tm->topics('is-a tt-type1')},                      3);
ok (@{$tm->topics('is-a tt-type2')},                      1);
ok (@{$tm->associations()},                               4);
ok (@{$tm->associations('is-a at-is-associated-with')},   2);


# testing corrupt XTM
# testing TNC
