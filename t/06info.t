# -*-perl-*-
use strict;
use Test::More;
BEGIN { plan tests => 19 }
 
use XTM;
use XTM::XML;
use Data::Dumper;
 
my $tm = new XTM (tie => new XTM::XML (url => "file:maps/test.xtm",
				       auto_complete => 0));

my @all = ('informational', 'warnings', 'errors', 'statistics');
foreach (@all) {
  # do I get what I want
  eval {
    ok ($tm->info (  $_  )->{$_});
  }; if ($@) {
    ok (0);
  }
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

is (grep (/^t-topic6$/, @{$info->{warnings}->{no_baseName}}), 1, 'no baseName');
is (grep (/^t-topic6$/, @{$info->{warnings}->{not_used}}),    1, 'not used');

is (grep (/^scope-dope$/, @{$info->{errors}->{undefined_topics}}), 1, 'undefined topics');

#print Dumper $info;
#exit;

# check clustering
my $clusters = $tm->clusters();
#print "clusters:\n", Dumper $clusters;
ok (keys %$clusters == 2);

# check some statistics

ok ($info->{statistics}->{nr_topics_defined}   == @{$tm->topics()});
ok ($info->{statistics}->{nr_assocs}   == @{$tm->associations()});
ok ($info->{statistics}->{nr_clusters} == keys %$clusters);
ok ($info->{statistics}->{mean_topics_per_cluster} == 1.0 * $info->{statistics}->{nr_topics_mentioned} / keys %$clusters);

#print Dumper $info;

