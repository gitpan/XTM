# -*-perl-*-
use strict;

use Data::Dumper;
use Test::More tests => 59;
 
require_ok( 'XTM::Memory');


{
  use XTM::AsTMa;

  my $tm = new XTM (tie => new XTM::AsTMa (auto_complete => 0, text => '

aaa (bbb ccc)

bbb (ccc ddd)

ccc (eee)

ddd (eee)

'));

  my $tree = $tm->induced_assoc_tree (topic      => 'aaa',
				      assoc_type => $XTM::PSI::xtm{'class-instance'},
				      a_role     => $XTM::PSI::xtm{'instance'},
				      depth      => undef);
#  print Dumper $tree;

  is ($tree->{tid}, 'aaa', 'found root');
  is ($tree->{children}->[0]->{tid}, 'bbb', 'bbb');
  is ($tree->{children}->[1], $tree->{children}->[0]->{children}->[0], 'ccc clone');

  is ($tree->{children}->[0]->{children}->[0]->{tid}, 'ccc', 'ccc');
}

##__END__

{
  use XTM::AsTMa;

  my $tm = new XTM (tie => new XTM::AsTMa (auto_complete => 0, text => '

aaa (bbb)

bbb (ccc ddd)


xxx (aaa)

yyy (xxx zzz)

vvv (xxx)

uuu (yyy)

'));

  my @uptests = ([ 'aaa', 4, undef ],
		 [ 'xxx', 3, undef ],
		 [ 'yyy', 1, undef ],
		 [ 'aaa', 1, 1 ],
		 [ 'aaa', 3, 2 ],
		 [ 'aaa', 4, 100 ],
		 [ 'xxx', 3, undef ],
		 [ 'yyy', 1, undef ],
	      );

  foreach my $test (@uptests) {
    is ( scalar @{$tm->induced_assoc_tree (topic      => $test->[0],
					   assoc_type => $XTM::PSI::xtm{'class-instance'},
					   a_role     => $XTM::PSI::xtm{'class'},
					   $test->[2] ? ( depth      => $test->[2]) : ())
		            ->{'children*'}},
	 $test->[1],
	 "children of $test->[0] : $test->[1] (depth $test->[2])");
  }


  my @downtests = (
		   [ 'aaa', 3, undef ],
		   [ 'aaa', 1, 1 ],
		   [ 'bbb', 2, 1 ],
		   [ 'ccc', 0, undef ],
		  );
  foreach my $test (@downtests) {
    is ( scalar @{$tm->induced_assoc_tree (topic      => $test->[0],
					   assoc_type => $XTM::PSI::xtm{'class-instance'},
					   a_role     => $XTM::PSI::xtm{'instance'},
					   $test->[2] ? ( depth      => $test->[2]) : ())
		            ->{'children*'}},
	 $test->[1],
	 "children of $test->[0] : $test->[1] (depth $test->[2])");
  }

}


##__END__

my $tm = new XTM::Memory;

is (@{$tm->topics()},       0, 'tabula rasa'); # do not want any topic here
ok (! $tm->is_topic('123'),    'no topic 123');


my $t1 = new XTM::topic (id => '123');
$tm->add ($t1);
is (@{$tm->topics()},       1, 'have one'); # now we want one
is (@{$tm->topics( 'id regexps /^123$/' )}, 1, 'and the one we had added');
is (@{$tm->topics( 'id regexps /^124$/' )}, 0, 'but no other');

my $t2 = new XTM::topic (id => '124');
$tm->add ($t1, $t2);
is (@{$tm->topics()},       2, 'we have 2'); # now we want two
is (@{$tm->topics( 'id regexps /^123$/' )}, 1, 'found 123');
is (@{$tm->topics( 'id regexps /^124$/' )}, 1, 'found 124');

my $t3 = new XTM::topic (id => '125');
$tm->add ($t3, $t2);
is (@{$tm->topics( 'id regexps /^12/' )}, 3, 'one more');

foreach my $id ( @{$tm->topics ()}) {
  ok ($tm->is_topic($id));
}

ok ($tm->topic ('123'), 'got topic handle');
is ((eval { $tm->topic ('asksdfasdlkj'); }, $@ ? 0 : 1), 0, 'raised exception');

is (@{$tm->associations()}, 0, 'still no assocs');

my $a1 = new XTM::association (id => '999');
my $a2 = new XTM::association (id => '998');
my $a3 = new XTM::association ();
$tm->add ($a1);
is (@{$tm->topics('id regexps /^12/')}, 3, 'found added topics');
is (@{$tm->associations()}, 1,             'found added assoc');
$tm->add ($a2, $a3);
is (@{$tm->associations()}, 3,             'found more assocs');
is (@{$tm->associations('id regexps /^99/')}, 2, 'found specific assocs');

foreach my $id ( @{$tm->associations ()}) {
  ok ($tm->is_association($id));
}

ok ($tm->association ('999'));
is ((eval { $tm->association ('asksdfasdlkj'); }, $@ ? 0 : 1), 0, 'unknown raised exception');

# adding a map
my $tm2 = new XTM::Memory;
$tm2->add (new XTM::topic       (id => '222'));
$tm2->add (new XTM::association (id => '888'));

$tm->add ($tm2);
is (@{$tm->topics()}, 4, 'got all topics');
is (@{$tm->associations()}, 4, 'got all assocs');

# removing
foreach my $id ( @{$tm->topics()} ) {
  my $doomed = $tm->remove ($id);
  ok ($doomed->[0]->id eq $id);
  ok (!$tm->is_topic($id));
}

foreach my $id ( @{$tm->associations ()}) {
  my $doomed = $tm->remove ($id);
  ok ($doomed->[0]->id eq $id);
  ok (!$tm->is_association($id));
}


__END__



exit;

print Dumper $tm;



