# -*-perl-*-
use strict;
use warnings;
use Test::More tests => 52; #qw(no_plan);

use XTM;
use XTM::AsTMa;
use Data::Dumper;
$Data::Dumper::Indent = 1;

#-- check various flavours of merging for the number of resulting topics -----------------

my $t0815 = '
t0815 (rumsti ramsti) reifies http://www.0815.com/
bn: something completely different
bn: first version of 0815
oc @ scope1 (type1): http://www.rumsti.com/
oc @ scope2 (type2): http://www.romsti.com/
sin: http://IamIdonquichote.com/
sin: http://IamIdonquichote.com2/
';

my $t0815a = '
t0815 (ramsti remsti)
bn: second version of 0815
oc @ scope2 (type2): http://www.ramsti.com/
';

my $t0816 = '
t0816 reifies http://www.0815.com/
bn: something different
';

my $t0817 = '
t0817
bn : something completely different
bn @ xxx yyy: and yet another one
sin: t0816
oc @ scope2 (type2): http://www.romsti.com/
sin: http://IamIdonquichote.com/
';

my $t0818 = '
t0818 (rumsti ramsti)
bn : something completely different
sin: t0817
sin: t0820
oc @ scope1 (type1): http://www.rumsti.com/
sin: http://IamIdonquichote.com2/
';

my $t0819 = '
t0819
bn: another name for Don Quichote
sin: http://IamIdonquichote.com/
';

my $t0820 = '
t0820 (ramsti romsti)
bn @ zzz : something completely different
oc @ scope2 (type2): http://www.romsti.com/
sin: http://IamIdonquichote.com2/
';

my $t0821 = '
t0821
bn @ xxx yyy: and yet another one
bn @ zzz : something completely different
';

my $t0822 = '
t0822
bn @ xxx zzz : something completely different
';

my $t0823 = '
t0816 reifies http://www.0816.com/
bn: something different
';

{
  my $astma = join ("", (map { eval "\$$_" } qw(t0823 t0816)));
  eval {
    my $tm = new XTM (consistency => { merge => [ 'Id_based_Merging', 'Topic_Naming_Constraint' ] },
		      tie => new XTM::AsTMa (auto_complete => 0,
					     text => $astma));
  };
  like ($@, qr/incompatible/i, 'detected duplicate resourceRef');
}



my %tests = (
# TNC Based merging
	     'TNC: all 4 merged' => {
				merging => [ 'Id_based_Merging', 'Topic_Naming_Constraint' ],
		       topics => [ qw (t0815 t0817 t0820 t0821) ],
		       result => 1,
		      },
	     'TNC: only 2 merged' => {
				merging => [ 'Id_based_Merging', 'Topic_Naming_Constraint' ],
		       topics => [ qw (t0815 t0817 t0820) ],
		       result => 2,
		      },
	     'TNC: none merged 1 (scope mismatch)' => {
				merging => [ 'Id_based_Merging', 'Topic_Naming_Constraint' ],
		       topics => [ qw (t0815 t0820) ],
		       result => 2,
		      },
	     'TNC: none merged 2 (scope mismatch)' => {
				merging => [ 'Id_based_Merging', 'Topic_Naming_Constraint' ],
		       topics => [ qw (t0821 t0822) ],
		       result => 2,
		      },
# Subject Based
	     'Subj: resourceRef identical' => {
				merging => [ 'Id_based_Merging', 'Subject_based_Merging' ],
		       topics => [ qw (t0815 t0816) ],
		       result => 1,
		      },
	     'Subj: sharing a subjectIndicator' => {
				merging => [ 'Id_based_Merging', 'Subject_based_Merging' ],
		       topics => [ qw (t0815 t0819) ],
		       result => 1,
		      },
	     'Subj: backward topicRef' => {
				merging => [ 'Id_based_Merging', 'Subject_based_Merging' ],
		       topics => [ qw (t0816 t0817) ],
		       result => 1,
		      },
	     'Subj: forward topicRef' => {
				merging => [ 'Id_based_Merging', 'Subject_based_Merging' ],
		       topics => [ qw (t0817 t0816) ],
		       result => 1,
		      },
	     'Subj: backward forward topicRef' => {
				merging => [ 'Id_based_Merging', 'Subject_based_Merging' ],
		       topics => [ qw (t0817 t0816 t0818) ],
		       result => 1,
		      },
	     'Subj: forward backward forward topicRef' => {
				merging => [ 'Id_based_Merging', 'Subject_based_Merging' ],
		       topics => [ qw (t0820 t0817 t0816 t0818) ],
		       result => 1,
		      },
# Id Based
	     'id: all merged' => {
				merging => [ 'Id_based_Merging' ],
		       topics => [ qw (t0815 t0815a) ],
		       result => 1,
		      },
	     'id: none merged' => {
				merging => [ 'Id_based_Merging' ],
		       topics => [ qw (t0815 t0817) ],
		       result => 2,
		      },
	    );

foreach my $t (sort keys %tests) {
  my $astma = join ("", (map { eval "\$$_" } @{$tests{$t}->{topics}}));
  my $tm = new XTM (consistency => { merge => $tests{$t}->{merging} },
		    tie => new XTM::AsTMa (auto_complete => 0,
					   text => $astma));
  is (@{$tm->topics()}, $tests{$t}->{result}, $t);
#print Dumper $tm;
}

#__END__

#-- check setting of consistency ---------------------------------------------------------
{
  my $tm;

  $tm = new XTM (consistency => { merge => [ 'Topic_Naming_Constraint' ] });
  is ($tm->consistency->{merge}->[0], 'Topic_Naming_Constraint', 'setting consistency levels');
  is (scalar @{$tm->consistency->{merge}}, 1,                    'setting consistency levels');
  
  foreach my $c (qw(duplicate_suppression follow_maps)) {
    foreach my $d (@{$XTM::default_consistency->{$c}}) {
      ok (grep ($_ eq $d, @{$tm->consistency->{$c}}), "checking $c $d");
    }
  }
  
  $tm = new XTM (consistency => { merge                 => [ 'all' ],
				  duplicate_suppression => [ 'all' ],
				  follow_maps           => [ 'all' ] });
  foreach my $c (keys %$XTM::max_consistency) {
    foreach my $d (@{$XTM::max_consistency->{$c}}) {
      ok (grep ($_ eq $d, @{$tm->consistency->{$c}}), "checking $c $d");
    }
  }
}
#-- check result details of merging ------------------------------------------------
{
  my @topics = qw (t0820 t0817 t0816 t0818);
  my $astma = join ("", (map { eval "\$$_" } @topics));
  my $tm = new XTM (consistency => { merge => [ 'all' ]},
		    tie => new XTM::AsTMa (auto_complete => 0,
					   text => $astma));
  
  is (@{$tm->topics()},                    1, 'merge all topics');
  foreach (@topics) {
    is (@{$tm->topics("id regexps /$_/")}, 1, "find $_");
  }
  cmp_ok ($tm->topic ($topics[0]), '==', $tm->topic ($topics[-1]), 'same topic references');

  foreach my $t (@topics) {
    my $a = eval "\$$t";
    while ($a =~ s/bn.*?:\s*(.+?)\n//s) {
      my $bn = $1;
      is (scalar @{$tm->topics ("baseName regexps /$bn/")}, 1, "merged baseName '$bn'");
    }
  }


  my $t = $tm->topic ($topics[0]);
#print Dumper $t;
  ok (defined $t, 'topic id is still t0820');

  is (scalar @{$t->occurrences}, 3, 'eliminated occurrences');
  is (scalar @{$t->baseNames},   4, 'eliminated baseNames');
  is (scalar @{$t->instanceOfs}, 4, 'eliminated instanceOfs');
  is (scalar @{$t->subjectIdentity->references}, 2, 'eliminated subjectIndicators');

  is ($t->subjectIdentity->resourceRef->href, 'http://www.0815.com/', 'merged resourceRef');
  is (scalar @{$t->subjectIdentity->references}, 2, 'merged subjectIndicators');

  foreach my $y (qw(rumsti romsti)) {
    ok ($t->has_instanceOf ($y), "merged instanceOfs $y");
  }
  foreach (qw(rumsti romsti)) {
    is (scalar @{$tm->topics ("occurrence regexps /$_/")}, 1, "merged occurrence $_");
  }
}



{ # test for Jan
  my $tm = new XTM (consistency => { merge => [ 'Subject_based_Merging' ] });

  use XTM::Path;
  my $xtmp = new XTM::Path;

  my $t1 = $xtmp->create ('topic[baseNameString = "rumsti"]');
  $t1->add_defaults;
  $tm->add ($t1);
  my $t2 = $xtmp->create ('topic[baseNameString = "rumsti"]');
  $t2->add_defaults;
  $tm->add ($t2);
  is (@{$tm->topics}, 2, 'same name, no TNC, no merge');
#  print Dumper $tm;
}

#__END__


__END__


