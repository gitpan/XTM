# -*-perl-*-
use strict;
use Test;
BEGIN { plan tests => 9 }
 
use XTM;
use XTM::XML;
use Data::Dumper;
 
my $tm = new XTM (tie => new XTM::XML (url => "file:maps/test.xtm"));
#my $tm = new XTM (tie => new XTM::XML (url => "file:maps/root.xtm"));

#print Dumper $tm;

ok (@{$tm->topics()},       8);
ok (@{$tm->topics('occurrence regexps /example/')},       3);
ok (@{$tm->topics('text       regexps /any text/')},      1);
ok (@{$tm->topics('assocs with t-topic4')},               2);
ok (@{$tm->topics('assocs with t-topic2')},               3);
ok (@{$tm->topics('is-a tt-type1')},                      3);
ok (@{$tm->topics('is-a tt-type2')},                      1);
ok (@{$tm->associations()},                               4);
ok (@{$tm->associations('is-a at-is-associated-with')},   2);


# testing corrupt XTM
# testing TNC
