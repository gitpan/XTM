# -*-perl-*-
use strict;
use Test;
BEGIN { plan tests => 13 }
 
use XTM;
use XTM::XML;
use Data::Dumper;
 
my $tm = new XTM (tie => new XTM::XML (url => "file:maps/test.xtm"));

my @all = ('informational', 'warnings', 'errors');
foreach (@all) {
  # do I get what I want
  ok ($tm->info (  $_  )->{$_});
}
# do I not get what I not want
ok (!($tm->info ( 'warnings' )->{informational}));

# do I get nothing?
ok (!($tm->info()));

# do I get everything?
my $info = $tm->info (@all);
ok ($info->{informational} && $info->{warnings} && $info->{errors});

# check some information here
ok ($info->{informational}->{tieref} eq 'XTM::XML');
ok ($info->{informational}->{last_mod} == $info->{informational}->{last_syncin});
ok ($info->{informational}->{nr_topics} == @{$tm->topics()});
ok ($info->{informational}->{nr_assocs} == @{$tm->associations()});

ok (grep (/^t-topic6$/, @{$info->{warnings}->{no_baseName}}));
ok (grep (/^t-topic6$/, @{$info->{warnings}->{not_used}}));

ok (grep (/^scope-dope$/, @{$info->{errors}->{undefined_topics}}));

##print Dumper $info;

