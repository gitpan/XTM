# -*-perl-*-
use strict;

use Test::More tests => 38;

use XTM;
use XTM::Memory;
use Data::Dumper;
$Data::Dumper::Indent = 1;

my $tm;

open (STDERR, '>/dev/null'); # do not show warnings...

sub die_ok {
  eval {
    is($tm = new XTM (tie => new XTM::AsTMa (text => $_[0])), $_[1], $_[2]);
    fail ($_[2].": did not die -> not good");
  }; if ($@) {
    pass ($_[2].": died -> good!");
  }
}


require_ok( 'XTM::AsTMa' );






die_ok ('ttt (bbb)
in: 
', 1, 'empty in');

die_ok ('(aaa)
aaa :
', 1, 'empty role');


#-----------------------------------------------------------------------
$tm = new XTM (tie => new XTM::AsTMa (text => '
rrr : ttt
qqq : sss
'));
is (scalar @{$tm->topics}, 0, 'duplicate encodings');

#-----------------------------------------------------------------------
$tm = new XTM (tie => new XTM::AsTMa (text => '
test
in: bookstore/(book|image)
'));
is (scalar @{$tm->topics}, 1, 'XPath expression in in (had problems in the past)');

#-----------------------------------------------------------------------
$tm = new XTM (tie => new XTM::AsTMa (text => '
# comment1
myname: encoding
# comment2

aaa
'));
is ($tm->id, 'myname', 'test id');

#-----------------------------------------------------------------------
$tm = new XTM (tie => new XTM::AsTMa (text => '
topic1
   
topic2
'));
is (@{$tm->topics()}, 2, 'empty line contains blanks');

#-----------------------------------------------------------------------
$tm = new XTM (tie => new XTM::AsTMa (text => '
# comment1

aaa (bbbbb cccc dddd)

#comment2
tid:ccc (bbb)
bn @ english: BBBB
#comment3
#comment4
ddd (xxxx)

#comment5'));
is (@{$tm->topics()},                               9, 'test comment');

#-----------------------------------------------------------------------
$tm = new XTM (tie => new XTM::AsTMa (text => '
aaa (bbbbb cccc dddd)
bn: AAA
in: blabla \
     blobloblo \
     xxxxxxxx

'));
is (@{$tm->topics()},                              4, 'test line wrap 1');
is (@{$tm->topics ('occurrence regexps /blabla/')},1, 'test line wrap 2');
is (@{$tm->topics ('occurrence regexps /bloblo/')},1, 'test line wrap 3');
is (@{$tm->topics ('occurrence regexps /xxxxxx/')},1, 'test line wrap 4');

#-----------------------------------------------------------------------
# test topic (bn, oc, in, scope)
$tm = new XTM (tie => new XTM::AsTMa (text => '
aaa (bbbbb cccc dddd)
bn: AAA
bn @ english: BBBB
oc: http://rumsti
in: blabla
in @ english:123 456'));
is (@{$tm->topics()},                               5, 'test topic 1');
is (@{$tm->topics ('id regexps /^aaa$/')},          1, 'test topic 2');
is (@{$tm->topics ('baseName regexps /aaa/')},      1, 'test topic 3');
is (@{$tm->topics ('baseName regexps /aaa/ and
                    baseName regexps /bbb/')},      1, 'test topic 4');
is (@{$tm->topics ('occurrence regexps /rumsti/')}, 1, 'test topic 5');
is (@{$tm->topics ('occurrence regexps /bla/')},    1, 'test topic 6');
is (@{$tm->topics ('occurrence regexps /123 456/')},1, 'test topic 7');
is (@{$tm->associations()},                         0, 'test topic 8');

#-----------------------------------------------------------------------
# test topic (comment inline)
$tm = new XTM (tie => new XTM::AsTMa (text => '
aaa
bn: AAA  # comment
bn: AAA# no-comment
oc: http://rumsti#no-comment'));
is (@{$tm->topics ('baseName regexps /AAA$/')},          1, 'test comment in baseName');
is (@{$tm->topics ('baseName regexps /comment$/')},      1, 'test comment in baseName 2');
is (@{$tm->topics ('occurrence regexps /rumsti/')},      1, 'test comment in occurrence');
is (@{$tm->topics ('occurrence regexps /^comment/')},    0, 'test comment in occurrence 2');

#-----------------------------------------------------------------------
# test topic (scope)
$tm = new XTM (tie => new XTM::AsTMa (text => '
aaa (bbbbb cccc dddd)
bn: AAA
bn @ english: BBBB
oc: http://rumsti
oc @ russisch: http://rumsti
in: blabla
in @ english:123 456'));
is (@{$tm->topics('id regexps /^aaa$/')},           1, 'test topic, scoped');
# more here

#-----------------------------------------------------------------------
$tm = new XTM (tie => new XTM::AsTMa (text => '
aaa (bbbbb cccc dddd)
bn: AAA
bn @english : BBBB
oc ( schiach ) : http://schiach
oc  : http://unschiach
in ( lustig ) : lustig
in  : unlustig
'));
is (@{$tm->topics('id regexps /^aaa$/')},           1, 'test oc, in type');
# more here
# my $aaa = $tm->topic ('aaa');
# test hier erfinden

$tm = new XTM (tie => new XTM::AsTMa (text => '
aaa-bbb (bbbbb cccc dddd)
'));
is (@{$tm->topics('baseName regexps /aaa bbb/')}, 1, 'test default bn');
#print Dumper $tm;


die_ok ("
(xxx zzz)
member : aaa
", 1, "test assoc double type raise error");

die_ok ("
(xxx)
", 1, "test assoc no member raise error");

die_ok ("
(xxx)
role : aaa
role2 : 
", 1, "test assoc missing player raises error");

is (@{($tm = new XTM (tie => new XTM::AsTMa (text => "
(xxx)
member : aaa1
")))->associations()},1, "test assoc single member");

is (@{($tm = new XTM (tie => new XTM::AsTMa (text => "
(xxx)
member2 : aaa2 bbb2
")))->associations()},1, "test assoc single member 2");

is (@{($tm = new XTM (tie => new XTM::AsTMa (text => "
(xxx)
member : aaa bbb
member2 : aaa2 bbb2
")))->associations()},1, "test assoc multiple member 1");

is (@{($tm = new XTM (tie => new XTM::AsTMa (text => "
(kernel-patch-provides-feature)
  feature:  reiserfs
  platform: sparc
  patch:    suse-reiserfs-patch-2.4.x
")))->associations()},1, "test assoc multiple member 2");

is (@{($tm = new XTM (tie => new XTM::AsTMa (text => "
@ scopy (kernel-patch-provides-feature)
  feature:  reiserfs
  platform: sparc
  patch:    suse-reiserfs-patch-2.4.x
")))->associations()},1, "test assoc multiple member 2, scoped");

is (@{($tm = new XTM (tie => new XTM::AsTMa (text => "
(kernel-patch-provides-feature)
  feature:  reiserfs
  platform: sparc
  patch:    suse-reiserfs-patch-2.4.x
")))->topics()},7, "test assoc auto complete 1");

is (@{($tm = new XTM (tie => new XTM::AsTMa (text => "
(kernel-patch-provides-feature)
  feature:  reiserfs
  platform: sparc
  patch:    suse-reiserfs-patch-2.4.x

(kernel-patch-provides-feature)
  feature:  freeswan
  platform: sparc
  patch:    freeswan-patch-2.4.x
")))->topics()}, 9, "test assoc auto complete 2");

is (@{($tm = new XTM (tie => new XTM::AsTMa (auto_complete => 0, text => "
(kernel-patch-provides-feature)
  feature:  reiserfs
  platform: sparc
  patch:    suse-reiserfs-patch-2.4.x

(kernel-patch-provides-feature)
  feature:  freeswan
  platform: sparc
  patch:    freeswan-patch-2.4.x
")))->topics()}, 0, "test assoc without auto complete");


#print Dumper $tm;
#exit;

#print Dumper $tm->topics ('id regexps /aa/');

#print Dumper $aaa;
__END__

my $tm = new XTM (tie => new XTM::AsTMa (url => "file:maps/test3.atm"));

__END__

#print join (',', @{$tm->topics()});
#exit;

ok (@{$tm->topics()},       15);
ok (@{$tm->topics('occurrence regexps /example/')},       2);
ok (@{$tm->topics('text       regexps /any text/')},      1);
ok (@{$tm->topics('assocs with t-topic4')},               2);
ok (@{$tm->topics('assocs with t-topic2')},               2);
ok (@{$tm->topics('is-a tt-type1')},                      3);
ok (@{$tm->topics('is-a tt-type2')},                      1);
ok (@{$tm->associations()},                               4);
ok (@{$tm->associations('is-a at-is-associated-with')},   4);

# testing corrupt XTM
# testing TNC
