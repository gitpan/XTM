# -*-perl-*-
use strict;
use Test;
BEGIN { plan tests => 9 }
 
use XTM;
use XTM::ATM;
use Data::Dumper;
 
my $tm = new XTM (tie => new XTM::ATM (url => "file:maps/test.atm"));
#my $tm = new XTM (tie => new XTM::XML (url => "file:maps/root.xtm"));

#print Dumper $tm;

ok (@{$tm->topics()},       13);
ok (@{$tm->topics('occurrence regexps /example/')},       2);
ok (@{$tm->topics('text       regexps /any text/')},      1);
ok (@{$tm->topics('assocs with t-topic4')},               2);
ok (@{$tm->topics('assocs with t-topic2')},               2);
ok (@{$tm->topics('is-a tt-type1')},                      3);
ok (@{$tm->topics('is-a tt-type2')},                      1);
ok (@{$tm->associations()},                               3);
ok (@{$tm->associations('is-a at-is-associated-with')},   3);


# testing corrupt XTM
# testing TNC
