# -*-perl-*-
use strict;
use Test::More tests => 171;

use XTM;
use Data::Dumper;

require_ok ('XTM::Path');

isa_ok(new XTM::Path, 'XTM::Path');

use XTM;
use XTM::AsTMa;
my $tm = new XTM (tie => new XTM::AsTMa (auto_complete => 0,
					 text          => '
aaa (bbbbb cccc dddd)
bn: AAA
bn @ english: BBBB
oc: http://rumsti
in: blabla
in @ english:123 456

xxx (zzz)
bn: XXX
bn @ english: YYYY
oc: http://ramsti

(uuuu)
 bbbbb: aaa
 zzz:   xxx
'));

eval {
  my $xtmp = new XTM::Path (); # no default
  $xtmp->find ('anything');    # no default, either
};
ok ($@ =~ /no context/, 'die ok, no default');


my $xtmp = new XTM::Path (default => $tm);


my @caputtos = (
                'baseNameString[text() != "xxxx"]', # wrong op
                'baseName[text() = "xxxx"]',        # ambiguous
                 'association[member[roleSpec/@href = "xxxx"]]', # ambiguous
                );
foreach my $p (@caputtos) {
  eval {
     my $o = $xtmp->create ($p);
  };
  ok ($@, "error in $p detected ($@)");
}


my %directs = (
               'baseNameString[text() = "xxxx"]' => 'text()',
               );

foreach my $p (keys %directs) {
  my $o = $xtmp->create ($p);
#  use Data::Dumper;
#  warn Dumper $o;
  my @r = $xtmp->find ($directs{$p}, $o);
  is (scalar @r, 1, "direct: $p found again: ". $directs{$p});
}


my %indirects = (
               'topic[baseNameString = "xxxx"]' => 'baseName[text() = "xxxx"]',
               );

foreach my $p (keys %indirects) {
  my $o = $xtmp->create ($p);
#  use Data::Dumper;
#  warn Dumper $o;
  my @r = $xtmp->find ($indirects{$p}, $o);
  is (scalar @r, 1, "indirect: $p found again: ". $indirects{$p});
}

my %pseudos = (
               'baseNameString[text() = "xxxx"]'                       => 'text()',
               'baseName/baseNameString[text() = "xxxx"]'              => 'text()',
               'baseName[baseNameString/text() = "xxxx"]'              => 'text()',
               'topic[baseName/baseNameString/text() = "xxx"]'         => 'baseNameString[text() = "xxx"]',
               'association[member[roleSpec/topicRef/@href = "xxxx"]]' => 'member',
               'topicRef[@href = "xxxx"]'                              => '@href',
               'association[member
                              [roleSpec/topicRef/@href = "#role1"]
                              [topicRef/@href = "#player1"]]
                           [member
                              [roleSpec/topicRef/@href = "#role2"]
                              [topicRef/@href = "#player2"]]' => 'member[roleSpec/@href = "#role2"]',
               );

foreach my $p (keys %pseudos) {
  my $o = $xtmp->create ($p);
#  use Data::Dumper;
#  warn Dumper $o;
  my @r = $xtmp->find ($pseudos{$p}, $o);
  is (scalar @r, 1, "pseudos: $p found again: ". $pseudos{$p});
}

foreach my $e (qw(topic association baseName)) {
  is (ref($xtmp->create ($e)), "XTM::$e", "get context free $e");
}


my @paths = (
             [ qw(topic baseNameString) ],
             [ qw(topic baseName baseNameString) ],
             [ qw(topic instanceOf topicRef) ],
             [ qw(topic instanceOf subjectIndicatorRef) ],
             [ qw(association member roleSpec topicRef) ],
             [ qw(member topicRef) ],
             [ qw(topic occurrence resourceData) ],
             [ qw(topic occurrence resourceRef) ],
             );

foreach my $p (@paths) {
  for (my $i = 0; $i <= $#$p; $i++) {
    my $s = join ("/", @{$p}[0..$i]);
    my $o = $xtmp->create ($s);
#    warn "returned: ". Dumper $o;
    is (ref ($o), "XTM::".@{$p}[0], "$s context sensitive");
    $s = join ("/", @{$p}[1..$i]);
    next unless $s;
    my @r = $xtmp->find ($s, $o);
    is (scalar @r, 1, "$s found one again");
  }
}



my @problems = (
                [ qw(topic xxx) ],  # syntactically wrong
                [ qw(topic member) ],
                [ qw(association member baseName) ],
                );

foreach my $p (@problems) {
  my $s = join ("/", @{$p});
  eval {
     my $o = $xtmp->create ($s);
  }; chomp $@;
  ok ($@, "error in $s detected ($@)");
}


#__END__

my @r;

@r = $xtmp->find ('/topic/@href');
#print map { (ref($_) ? ref($_) : $_)."\n" } @r;
for my $x ('#bbbbb', '#cccc', '#dddd', 'http://rumsti', '#zzz', 'http://ramsti') {
  ok (grep ($_ eq $x, @r), "attribute test: $x");
}

@r = $xtmp->find ('/topic/topicRef/@href');
#print map { (ref($_) ? ref($_) : $_)."\n" } @r;
for my $x ('#bbbbb', '#cccc', '#dddd', '#zzz') {
  ok (grep ($_ eq $x, @r), "attribute test: $x");
}

@r = $xtmp->find ('/topic/resourceRef/@href');
#print map { (ref($_) ? ref($_) : $_)."\n" } @r;
for my $x ( 'http://rumsti', 'http://ramsti') {
  ok (grep ($_ eq $x, @r), "attribute test: $x");
}

# number/type tests
my %tests = (
	     '/topic' => [ 2, 'XTM::topic' ],
	     '/topic/baseName' => [ 4, 'XTM::baseName' ],
	     '/topic/baseName/baseNameString' => [ 4, 'XTM::baseNameString' ],
	     '/topic/baseName/baseNameString/text()' => [ 4, '' ],
	     '/baseName' => [ 4, 'XTM::baseName' ],
	     '/baseName/baseNameString' => [ 4, 'XTM::baseNameString' ],
	     '/baseName/baseNameString/text()' => [ 4, '' ],
	     '/text()' => [ 6, '' ],
	     '/topic/text()' => [ 6, '' ],
	     '/topic[@id = "aaa"]' => [ 1, 'XTM::topic' ],
	     '/topic[@id != "aaa"]' => [ 1, 'XTM::topic' ],
	     '/topic[@id]' => [ 2, 'XTM::topic' ],
	     '/topic[@href]' => [ 2, 'XTM::topic' ],
	     '/topic/@href' => [ 14, undef ],
	     '/topic[@id = "xxx"]/@href' => [ 5, undef ],
	     '/topic[baseName/baseNameString = "AAA"]' => [ 1, 'XTM::topic' ],
	     '/topic[baseName = "AAA"]' => [ 1, 'XTM::topic' ],
	     '/topic[@id = "aaa"][@href = "xxx"]' => [ 0, 'XTM::topic' ],
	     '/topic[@id = "aaa"][@href = "http://rumsti"]' => [ 1, 'XTM::topic' ],
	     '/association' => [ 1, 'XTM::association' ],
	    );

foreach my $t (keys %tests) {
  my @r = $xtmp->find ($t);
  is (scalar @r, $tests{$t}->[0], "number test '$t'");
#print map { (ref($_) ? ref($_) : $_)."\n" } @r;
  foreach my $r (@r) {
    is (ref ($r), $tests{$t}->[1], "type test '$t'") if defined $tests{$t}->[1];
  }
}

# text() tests
@r = $xtmp->find ('/baseName/baseNameString/text()');
for my $x (qw(AAA BBBB XXX YYYY)) {
  ok (grep ($_ eq $x, @r), "text test: $x");
}


# attribute tests
@r = $xtmp->find ('/topic/@id');
for my $x (qw(aaa xxx)) {
  ok (grep ($_ eq $x, @r), "attribute test: $x");
}

foreach my $p (('/text()', '/topic/text()')) {
  @r = $xtmp->find ($p);
#  print Dumper \@r;
#  print map { (ref($_) ? ref($_) : $_)."\n" } @r;
  for my $x (('AAA', 'BBBB', 'blabla', '123 456', 'XXX', 'YYYY')) {
     ok (grep ($_ eq $x, @r), "text() test: $x, $p");
  }
}



# check good paths
my %good = (
	    'topic' => 'single element',
	    'topic/baseName' => 'two elements',
	    'topic/baseName/baseNameString' => 'three elements',
	    'topic/@id' => 'with attribute in path',
	    'topic[@id = "xxx"]' => 'with attribute in predicate',
	    'association[.//member/resourceRef//@href]' => 'path in path',
	    'topic[@id = "xxx"]/baseName' => 'element, predicate, element',
	    'topic[occurrence/scope = "#something"]', 'element predicate',
	   );
while (my ($p,$e) = each %good) {
  eval {
    $xtmp->find ($p);
    };
  unlike ($@, qr/invalid syntax/i, "ok, $e");
}

# check broken paths
my %broken = (
	      'xxxx'   => 'no element',
	      'topic[]' => 'empty predicate',
	      'baseName///baseNameString' => 'invalid axis',
	      '../baseNameString' => 'invalid axis 2',
	      '[topic]' => 'missing element',
	      'topic[@id == "xxx"]' => 'invalid operator',
	  );

# we do not need messages here
$::RD_ERRORS = undef;
$::RD_WARN = undef;

while (my ($p,$e) = each %broken) {
  eval {
    $xtmp->find ($p);
    };
  like ($@, qr/invalid syntax/i, "die ok, $e");
}


# check syntactically correct

#is (scalar $xtmp->find ('topic[@id == "aaa"]'), 1, 'topic[@id == "aaa"]') ;
