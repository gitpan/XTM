# -*-perl-*-
use strict;
use utf8;
use warnings 'all';
use Test::More tests => 40;

use XTM;
use XTM::Memory;
##use XTM::Path;

use Data::Dumper;
$Data::Dumper::Indent = 1;

require_ok( 'XTM::LTM' );

my $tm;
##my $xtmp = new XTM::Path (); # we set tm everytime new

#open (STDERR, '>/dev/null'); # do not show warnings...

$tm = new XTM (tie => new XTM::LTM ( text => q{

#MERGEMAP "maps/test.ltm" "ltm"

 [ltm]

 [rumsti]

 format-for ([ ltm ] : standard, topic-maps )

}));

#print Dumper $tm;
is (@{$tm->topics}, 10,      'mergemap: nr topics');
is (@{$tm->associations}, 2, 'mergemap: nr assocs');


die_ok (q{
format-for ([ ltm ] : standard, topic-maps )

@"abssfsdf"

}, 1, 'invalid encoding');

$tm = new XTM (tie => new XTM::LTM ( text => q{
  

@"iso8859-1"

 { ltm , test , [[Ich chan Glaas ässe, das tuet mir nöd weeh]] }

}));

like ($tm->topic ('ltm')->occurrences->[0]->resource->data, qr/\x{E4}sse/, 'encoding from iso8859-1');

$tm = new XTM (tie => new XTM::LTM ( text => q{
 { ltm , test , "http://rumsti/" }

[ ltm ]

[ hugo ]

}));

##print Dumper $tm;

is (@{$tm->topics}, 3, 'occurrence: topics auto generated, implicit merge');

$tm = new XTM (tie => new XTM::LTM ( text => q{
format-for (ltm : standard, topic-maps )

format-for (ltm, topic-maps) / scopeX
}));

is (@{$tm->associations}, 2, 'assocs: generation');
is (@{$tm->topics}, 5, 'assocs: topic auto generated');


$tm = new XTM (tie => new XTM::LTM ( text => q{
format-for (ltm : standard, topic-maps : concept )

format-for (xtm : standard, topic-maps : concept ) / scopeX

}));

##print Dumper $tm;

is (@{$tm->associations}, 2, 'assocs: generation');
is (@{$tm->topics}, 7, 'assocs: topics auto generated');
is (@{$tm->topics('assocs with topic-maps')}, 2, 'assocs: connected');


$tm = new XTM (tie => new XTM::LTM ( text => q{
format-for (ltm : standard, topic-maps : concept )

format-for (xtm : standard, topic-maps : concept ) / scopeX

[ xtm ]

[ hugo ]

}));

##print Dumper $tm;

is (@{$tm->associations}, 2, 'assocs: generation');
is (@{$tm->topics}, 8, 'assocs: topics auto generated, implicit merge');

sub die_ok {
  eval {
    is($tm = new XTM (tie => new XTM::LTM (text => $_[0])), $_[1], $_[2]);
    fail ($_[2].": did not die -> not good");
  }; if ($@) {
#    warn "died because of $@\n";
    pass ($_[2].": died -> good!");
  }
}

# test comment
$tm = new XTM (tie => new XTM::LTM ( text => q{
  [ ltm ]
  [ rumsti ]
}));
is (@{$tm->topics()},                              2, 'topics without comment');

$tm = new XTM (tie => new XTM::LTM ( text => q{
  [ ltm ]
/*  [ rumsti ] */
}));
is (@{$tm->topics()},                              1, 'topics with comment 2');

$tm = new XTM (tie => new XTM::LTM ( text => q{
/*  [ ltm ]
/*  [ rumsti ] */
}));
is (@{$tm->topics()},                              0, 'topics with comment 2');

die_ok (q{
/*  [ ltm ]
  [ rumsti */ ] */ 
}, 1, 'invalid comment nesting');


die_ok (q{
format-for ([ ltm ] : standard, topic-maps )

xxxx

{ ltm , test , "http://rumsti/" }
}, 1, 'unknown keyword');

die_ok (q{
format-for ([ ltm ] : standard, topic-maps 
}, 1, 'missing terminator 1');

die_ok (q{
[ ltm : format <= "The linear topic map notation" @ "http://something1/" @ "http://something2/" ]
}, 1, 'invalid terminator 1');

die_ok ('
{ ltm , test , "http://rumsti/" '
, 1, 'missing terminator 2');

die_ok ('
{ ltm , test , "http://rumsti/" } abc'
, 1, 'additional nonparsable text');


#die_ok ('
#format-for (ltm, topic-maps) / scopeX scopeY'
#, 1, 'multiple scopes NOT supported');



$tm = new XTM (tie => new XTM::LTM ( text => q{
format-for ([ ltm ] : standard, topic-maps )

{ ltm , test , "http://rumsti/" }
}));

is (@{$tm->topics}, 5, 'assoc: inline topic');
is (@{$tm->topics ('occurrence regexps /rumsti/')}, 1, 'assoc: occurrence honored');
#print Dumper $tm;


$tm = new XTM (tie => new XTM::LTM ( text => q{
format-for (ltm : standard, topic-maps )

format-for (ltm, topic-maps) / scopeX

[ ltm ]

}));

is (@{$tm->associations}, 2, 'assocs: generation');
is (@{$tm->topics}, 5, 'assocs: auto generated topic');


$tm = new XTM (tie => new XTM::LTM ( text => q{
  [ ltm ]
  { ltm , test , [[http://rumsti/
ramsti romsti ]] }
}));
is (@{$tm->topics('occurrence regexps /rumsti/')}, 1, 'occurrence with topic');
is (@{$tm->topics('occurrence regexps /romsti/')}, 1, 'occurrence with topic, multiline');

#print Dumper $tm;

$tm = new XTM (tie => new XTM::LTM ( text => q{
  [ ltm ]
  { ltm , test , "http://rumsti/" }
}));
is (@{$tm->topics('occurrence regexps /rumsti/')}, 1, 'occurrence with topic');
is (@{$tm->topics()},                              2, 'occurrence with topic, 2');

#print Dumper $tm;

$tm = new XTM (tie => new XTM::LTM ( text => q{
  { ltm , test ,  "http://rumsti/" }
  { ltm , test2 , "http://ramsti/" }
  { ltm2, test ,  "http://rumsti/" }
}));
is (@{$tm->topics('occurrence regexps /rumsti/')}, 2, 'occurrence wo topic');


$tm = new XTM (tie => new XTM::LTM ( text => q{
[ ltm : format = "The linear topic map notation" @ "http://something1/" @ "http://something2/" ]
}));
is (@{$tm->topics('indicates regexps /something1/')}, 1, 'subject indication1');
is (@{$tm->topics('indicates regexps /something2/')}, 1, 'subject indication2');

$tm = new XTM (tie => new XTM::LTM ( text => q{
[ ltm : format = "The linear topic map notation" % "http://something/" ]
}));
is (@{$tm->topics('reifies regexps /something/')}, 1, 'subject reification');



#__END__

$tm = new XTM (tie => new XTM::LTM ( text => q{
[ ltm : format = "The linear topic map notation"  ]
}));
is (@{$tm->topics('baseName regexps /linear/')}, 1, 'basename wo scope');

$tm = new XTM (tie => new XTM::LTM ( text => q{
[ ltm : format = "The linear topic map notation / scope1"  ]
}));
is (@{$tm->topics('baseName regexps /linear/')}, 1, 'basename with scope');


#__END__



# with types
my @types = qw(format1 format2 format3);
$tm = new XTM (tie => new XTM::LTM ( text => q{
[ ltm : }.join (" ", @types).q{  ]
}));
is (@{$tm->topics()}, 4, 'topic with types');
foreach my $t (@types) {
  is (@{$tm->topics("is-a $t")}, 1, "finding $t");
}

