# -*-perl-*-
use strict;
use Test;
BEGIN { plan tests => 43 }
 
use XTM::Memory;
use Data::Dumper;
ok (1);  

my $tm = new XTM::Memory;

ok (@{$tm->topics()},       0); # do not want any topic here
ok (!$tm->is_topic('123'));


my $t1 = new XTM::topic (id => '123');
$tm->add ($t1);
ok (@{$tm->topics()},       1); # now we want one
ok (@{$tm->topics( 'id regexps /^123$/' )}, 1);
ok (@{$tm->topics( 'id regexps /^124$/' )}, 0);

my $t2 = new XTM::topic (id => '124');
$tm->add ($t1, $t2);
ok (@{$tm->topics()},       2); # now we want two
ok (@{$tm->topics( 'id regexps /^123$/' )}, 1);
ok (@{$tm->topics( 'id regexps /^124$/' )}, 1);

my $t3 = new XTM::topic (id => '125');
$tm->add ($t3, $t2);
ok (@{$tm->topics( 'id regexps /^12/' )}, 3);

foreach my $id ( @{$tm->topics ()}) {
  ok ($tm->is_topic($id));
}

ok ($tm->topic ('123'));
ok ((eval { $tm->topic ('asksdfasdlkj'); }, $@ ? 0 : 1), 0);

ok (@{$tm->associations()}, 0);

my $a1 = new XTM::association (id => '999');
my $a2 = new XTM::association (id => '998');
my $a3 = new XTM::association ();
$tm->add ($a1);
ok (@{$tm->topics('id regexps /^12/')}, 3);
ok (@{$tm->associations()}, 1);
$tm->add ($a2, $a3);
ok (@{$tm->associations()}, 3);
ok (@{$tm->associations('id regexps /^99/')}, 2);

foreach my $id ( @{$tm->associations ()}) {
  ok ($tm->is_association($id));
}

ok ($tm->association ('999'));
ok ((eval { $tm->association ('asksdfasdlkj'); }, $@ ? 0 : 1), 0);

# adding a map
my $tm2 = new XTM::Memory;
$tm2->add (new XTM::topic       (id => '222'));
$tm2->add (new XTM::association (id => '888'));

$tm->add ($tm2);
ok (@{$tm->topics()}, 4);
ok (@{$tm->associations()}, 4);

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



