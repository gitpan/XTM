# -*-perl-*-
use strict;
use warnings 'all';
use Test::More tests => 58;

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
    warn "died because of $@\n";
    pass ($_[2].": died -> good!");
  }
}

require_ok( 'XTM::AsTMa' );

$tm = new XTM (tie => new XTM::AsTMa (auto_complete => 0, text => "
topic
in: Ich chan Glaas ässe, das tuet mir nöd weeh

"));
is (@{$tm->topics('occurrence regexps /\x{E4}sse/')}, 1, 'no encoding');


$tm = new XTM (tie => new XTM::AsTMa (auto_complete => 0, text => "
%encoding iso8859-1

topic
in: Ich chan Glaas ässe, das tuet mir nöd weeh

"));
is (@{$tm->topics('occurrence regexps /\x{C3}\x{A4}sse/')}, 1, 'single encoding');

$tm = new XTM (tie => new XTM::AsTMa (auto_complete => 0, text => "
%encoding iso8859-1

topic
in: Ich chan Glaas ässe, das tuet mir nöd weeh

%encoding iso8859-2

topic2
in: Mohu jíst sklo, neublí?í mi

"));
is (@{$tm->topics('occurrence regexps /\x{C3}\x{A4}sse/')}, 1, 'double encoding1');
is (@{$tm->topics('occurrence regexps /Mohu/')},        1, 'double encoding2');
is (@{$tm->topics('occurrence regexps /\x{C3}\x{AD}st/')},  1, 'double encoding3');


$tm = new XTM (tie => new XTM::AsTMa (auto_complete => 0, text => "
aaa (xxx)
"));
is (@{$tm->topics()}, 1, 'auto compl off, no directive');

$tm = new XTM (tie => new XTM::AsTMa (auto_complete => 1, text => "
aaa (xxx)
"));
is (@{$tm->topics()}, 2, 'auto compl on, no directive');

$tm = new XTM (tie => new XTM::AsTMa (auto_complete => 0, text => "
%auto_complete on

aaa (xxx)
"));
is (@{$tm->topics()}, 2, 'auto compl off, but directive');

$tm = new XTM (tie => new XTM::AsTMa (auto_complete => 1, text => "
%auto_complete on

aaa (xxx)
"));
is (@{$tm->topics()}, 2, 'auto compl on, and directive');

$tm = new XTM (tie => new XTM::AsTMa (auto_complete => 0, text => "
aaa (xxx) reifies http://aaa.com/ is-reified-by ooo is-reified-by ppp
"));


is (@{$tm->topics('reifies regexps /aaa.com/')}, 1, "test topic with reification");
is (@{$tm->topics('reifies regexps /aaa/')}, 2, "test topic with back reification");
is (@{$tm->topics('baseName regexps /ooo/')}, 1, "test topic with back reification");
is (@{$tm->topics('baseName regexps /ppp/')}, 1, "test topic with back reification");


$tm = new XTM (tie => new XTM::AsTMa (auto_complete => 0, text => "
(aaa) is-reified-by ooo is-reified-by ppp
 xxx: yyy
 zzz: uuu
"));


is (@{$tm->topics('reifies regexps /a-000/')}, 1, "test assoc with reifications");


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
aaa (bbbbb)
bn: AAA
in:         blabla  
'));
is (@{$tm->topics ('occurrence regexps /  blabla  /')},0, 'test blanks in resourceData 1');
is (@{$tm->topics ('occurrence regexps /blabla/')},    1, 'test blanks in resourceData 2');


#-----------------------------------------------------------------------
$tm = new XTM (tie => new XTM::AsTMa (text => '
aaa (bbbbb cccc dddd)
bn: AAA
in:  blabla \
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

die_ok ("
(xxx)

rumsti

", 1, "test assoc missing member raises error");

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

is (@{($tm = new XTM (tie => new XTM::AsTMa (auto_complete => 0, text => "
aaa (xxxx) reifies http://www.remsti.com/
 bn: rumsti
 sin: http://ramsti.com/
 sin: http://romsti.com/

bbb (xxxx) reifies http://www.remsti.com/
 bn: ramsti
")))->topics('reifies regexps /remsti/')}, 1, "test topic with reification");

is (@{($tm = new XTM (tie => new XTM::AsTMa (auto_complete => 0, text => "
aaa (xxxx)
 bn: rumsti
 sin: http://ramsti.com/
 sin: http://romsti.com/

bbb (xxxx)
 bn: ramsti
")))->topics('indicates regexps /ramsti/')}, 1, "test topic with subjectIndicator");

# test directives

is (@{($tm = new XTM (tie => new XTM::AsTMa (auto_complete => 0, text => "
aaa (xxxx)
 bn: rumsti
 sin: http://ramsti.com/
 sin: http://romsti.com/

%cancel

bbb (xxxx)
 bn: ramsti
")))->topics()}, 1, "test %cancel");

is (@{($tm = new XTM (tie => new XTM::AsTMa (auto_complete => 0, text => "
aaa (xxxx)
 bn: rumsti
 sin: http://ramsti.com/
 sin: http://romsti.com/

%log xxx

bbb (xxxx)
 bn: ramsti
")))->topics()}, 2, "test %log");

# check here doc
$tm = new XTM (tie => new XTM::AsTMa (url => "file:maps/heredoc.atm"));

like (${@{$tm->topic('testtopic')->occurrences}}[0]->resource->data, qr/\n/, 'heredoc newlines');
like (${@{$tm->topic('testtopic')->occurrences}}[0]->resource->data, qr/\t/, 'heredoc spaces');

unlike (${@{$tm->topic('othertopic')->occurrences}}[1]->resource->data, qr/[\n\\]/, 'line continuation');





