# -*-perl-*-
use strict;
 
use Test::More tests => 34;

my $die_problem = 1; # XML::LibXML (or my usage of it) has a problem, mask out some tests

use XTM;
use Data::Dumper;
$Data::Dumper::Indent = 1;

require_ok( 'XTM::XML');

my $xtm = new XTM::XML (text => q|<?xml version="1.0"?><topicMap xmlns = 'http://www.topicmaps.org/xtm/1.0/'></topicMap>|);
like ( $xtm->{url}, qr/^inline/, 'creating handle');

my $tm;

#-- experimental space

#----

is (@{($tm = new XTM (tie => new XTM::XML (text => q|<?xml version="1.0"?>
<topicMap xmlns = 'http://www.topicmaps.org/xtm/1.0/'>
</topicMap>|)))->associations}, 0, 'empty map, assocs');

is (@{($tm = new XTM (tie => new XTM::XML (text => q|<?xml version="1.0"?>
<topicMap xmlns = 'http://www.topicmaps.org/xtm/1.0/'>
</topicMap>|)))->topics}, 0, 'empty map, topics');

is (@{($tm = new XTM (tie => new XTM::XML (text => q|<?xml version="1.0"?>
<topicMap id="xtm"
          xmlns       = 'http://www.topicmaps.org/xtm/1.0/'
          xmlns:xlink = 'http://www.w3.org/1999/xlink'>

<topic id="t1">
</topic>

</topicMap>|)))->topics}, 1, 'singleton map, empty topics, default namespace');

is (@{($tm = new XTM (tie => new XTM::XML (text => q|<?xml version="1.0"?>
<xx:topicMap id="xtm"
          xmlns:xx    = 'http://www.topicmaps.org/xtm/1.0/'
          xmlns:xlink = 'http://www.w3.org/1999/xlink'>

<xx:topic id="t1">
</xx:topic>
</xx:topicMap>|)))->topics}, 1, 'singleton map, empty topic, explicit namespace');

if (!$die_problem) {
eval {
  is (@{($tm = new XTM (tie => new XTM::XML (text => q|<?xml version="1.0"?>
<topic id="t1" xmlns = 'http://www.topicmaps.org/xtm/1.0/'>
</topic>
|)))->topics}, 123, 'broken map 5');
}; if ($@) {
  ok (1, "broken map 5, XTM conformance, raises exception");
  print $@;
};
}

#if (!$die_problem) {
eval {
  is (@{($tm = new XTM (tie => new XTM::XML (text => q|<?xml version="1.0"?>
<topicMap id="t1" xmlns = 'http://www.topicmaps.org/xtm/1.0/'>
</topicMap>
<topicMap id="t2" xmlns = 'http://www.topicmaps.org/xtm/1.0/'>
</topicMap>
|)))->topics}, 123, 'broken map 6');
}; if ($@) {
  ok (1, "broken map 6, XTM conformance, raises exception");
  print $@;
};
#}


if (!$die_problem) {
eval {
  is (@{($tm = new XTM (tie => new XTM::XML (text => q|<?xml version="1.0"?>
<topicMap id="xtm"
          xmlns       = 'http://www.topicmaps.org/xtm/1.0/'
          xmlns:xlink = 'http://www.w3.org/1999/xlink'>

<topic id="t1">
  <instanceOf><topicRef xlink:href="#tt1"/></instanceOf>
  <baseName>
     <baseNameString>Testus</baseNameString>
  </baseName>
</toxxxxpic>

</topicMap>|)))->topics}, 123, 'broken map 1');
}; if ($@) {
  ok (1, "broken map 1, XML conformance, raises exception");
#  print $@;
};
}

is (@{($tm = new XTM (tie => new XTM::XML (text => q|<?xml version="1.0"?>
<topicMap id="xtm"
          xmlns       = 'http://www.topicmaps.org/xtm/1.0/'
          xmlns:xlink = 'http://www.w3.org/1999/xlink'>

<topic id="t1">
  <instanceOf><topicRef xlink:href="#tt1"/></instanceOf>
  <baseName>
     <baseNameString>Testus</baseNameString>
  </baseName>
</topic>

</topicMap>|)))->topics ('baseName regexps /test/ and is-a tt1')}, 1, 'singleton map, baseName, instanceOf');

is (@{($tm = new XTM (tie => new XTM::XML (text => q|<?xml version="1.0"?>
<topicMap id="xtm"
          xmlns       = 'http://www.topicmaps.org/xtm/1.0/'
          xmlns:xlink = 'http://www.w3.org/1999/xlink'>

<topic id="t1">
  <instanceOf><topicRef xlink:href="#tt1"/></instanceOf>
  <baseName>
     <baseNameString>Testus</baseNameString>
  </baseName>
</topic>

<association>
  <instanceOf><topicRef xlink:href="#tt1"/></instanceOf>
  <member>
     <roleSpec><topicRef xlink:href="#rt1"/></roleSpec>
     <topicRef xlink:href="#t1"/>
  </member>
  <member>
     <roleSpec><topicRef xlink:href="#rt2"/></roleSpec>
     <topicRef xlink:href="#tustes"/>
  </member>
</association>

</topicMap>|)))->topics ()}, 5, 'auto complete on');

is (@{($tm = new XTM (tie => new XTM::XML (auto_complete => 0,
					   text => q|<?xml version="1.0"?>
<topicMap id="xtm"
          xmlns       = 'http://www.topicmaps.org/xtm/1.0/'
          xmlns:xlink = 'http://www.w3.org/1999/xlink'>

<topic id="t1">
  <instanceOf><topicRef xlink:href="#tt1"/></instanceOf>
  <baseName>
     <baseNameString>Testus</baseNameString>
  </baseName>
</topic>

<association>
  <instanceOf><topicRef xlink:href="#tt1"/></instanceOf>
  <member>
     <roleSpec><topicRef xlink:href="#rt1"/></roleSpec>
     <topicRef xlink:href="#t1"/>
  </member>
  <member>
     <roleSpec><topicRef xlink:href="#rt2"/></roleSpec>
     <topicRef xlink:href="#tustes"/>
  </member>
</association>

</topicMap>|)))->topics ()}, 1, 'auto complete off');




$tm = new XTM (tie => new XTM::XML (text => q|<?xml version="1.0"?>
<topicMap id="xtm"
          xmlns       = 'http://www.topicmaps.org/xtm/1.0/'
          xmlns:xlink = 'http://www.w3.org/1999/xlink'>

<topic id="testus">
  <instanceOf><topicRef xlink:href="#tt1"/></instanceOf>
  <baseName>
     <baseNameString>Testus</baseNameString>
  </baseName>
</topic>

<topic id="tustes">
  <instanceOf><topicRef xlink:href="#tt1"/></instanceOf>
  <baseName>
     <baseNameString>Tustes</baseNameString>
  </baseName>
  <baseName>
      <scope><topicRef xlink:href="http://www.topicmaps.org/xtm/language.xtm#en"/></scope>
      <baseNameString>Tustes</baseNameString>
  </baseName>
  <occurrence>
     <instanceOf><topicRef xlink:href="#ot"/></instanceOf>
     <resourceRef xlink:href="http://www.someexample.com.au/path?xxx=yyy&amp;aaa=bbb"/>
  </occurrence>
  <occurrence>
     <instanceOf><topicRef xlink:href="#ot"/></instanceOf>
     <resourceRef xlink:href="http://www.someexample.com.au/path?xxx=yyy&amp;aaa=bbb"/>
  </occurrence>
</topic>

<association>
  <instanceOf><topicRef xlink:href="#at1"/></instanceOf>
  <member>
     <roleSpec><topicRef xlink:href="#rt1"/></roleSpec>
     <topicRef xlink:href="#testus"/>
  </member>
  <member>
     <roleSpec><topicRef xlink:href="#rt2"/></roleSpec>
     <topicRef xlink:href="#tustes"/>
  </member>
</association>

</topicMap>|));

is (@{$tm->topics ('baseName regexps /test/ and is-a tt1')},      1, 'small map, baseName, instanceOf 1');
is (@{$tm->topics ('baseName regexps /tust/ and is-a tt1')},      1, 'small map, baseName, instanceOf 2');
is (@{$tm->topics ('occurrence regexps /example/')}, 1, 'small map, baseName, occurrence 1');
is (@{$tm->topics ('assocs with testus')}[0], 'tustes',              'small map, baseName, assoc 1');
is (@{$tm->topics ('assocs with tustes')}[0], 'testus',              'small map, baseName, assoc 2');

is (@{($tm = new XTM (tie => new XTM::XML (text => q|<?xml version="1.0"?>
<topicMap id="xtm"
          xmlns       = 'http://www.topicmaps.org/xtm/1.0/'
          xmlns:xlink = 'http://www.w3.org/1999/xlink'>

<topic id="t1">
</topic>

</topicMap>|)))->topics ('is-a http://www.topicmaps.org/xtm/1.0/#psi-topic')}, 1, 'singleton map, empty topics, default topic type');


if (!$die_problem) {
eval {
  is (@{($tm = new XTM (tie => new XTM::XML (text => q|<?xml version="1.0"?>
<topicMap id="xtm"
          xmlns       = 'http://www.topicmaps.org/xtm/1.0/'
          xmlns:xlink = 'http://www.w3.org/1999/xlink'>

<topic id="t1">
  <instanceOf><topicRef xlink:href="#tt1"/></instanceOf>
  <baseName>
     <resourceData>Testus</resourceData>
  </baseName>
</topic>

</topicMap>|)))->topics}, 123, 'broken map 2');
}; if ($@) {
  ok (1, "broken map 2, XTM conformance, raises exception");
#  print $@;
};
}

if (!$die_problem) {
eval {
#  print "before 4 $@";
  is (@{($tm = new XTM (tie => new XTM::XML (text => q|<?xml version="1.0"?>
<topicMap id="xtm"
          xmlns       = 'http://www.topicmaps.org/xtm/1.0/'
          xmlns:xlink = 'http://www.w3.org/1999/xlink'>

<topic id="t1">
  <instanceOf><topicRef xlink:href="#tt1"/></instanceOf>
  <baseName>
     <baseNameString>Testus</baseNameString>
     <baseNameString>Testus</baseNameString>
  </baseName>
  <occurrence>
     <instanceOf><topicRef xlink:href="#ot"/></instanceOf>
     <resourceRef xlink:href="http://example.org/"/>
  </occurrence>
</topic>

</topicMap>|)))->topics}, 0, 'broken map 4');
}; if ($@) {
  ok (1, "broken map 4, duplicate baseNameString, raises exception");
  print "after 4 $@";
};
}

$tm = new XTM (tie => new XTM::XML (url => "file:maps/test.xtm", auto_complete => 0));
is (@{$tm->topics()},                                     8, 'single map, nr topics');
is (@{$tm->topics('occurrence regexps /example/')},       3, 'single map, occurrences');
is (@{$tm->topics('text       regexps /any text/')},      1, 'single map, data');
is (@{$tm->topics('assocs with t-topic4')},               2, 'single map, assocs 1');
is (@{$tm->topics('assocs with t-topic2')},               3, 'single map, assocs 2');
is (@{$tm->topics('is-a tt-type1')},                      3, 'single map, is-a 1');
is (@{$tm->topics('is-a tt-type2')},                      1, 'single map, is-a 2');
is (@{$tm->associations()},                               4, 'single map, nr assocs');
is (@{$tm->associations('is-a at-is-associated-with')},   2, 'single map, is-a 3');


$tm = new XTM (tie => new XTM::XML (file => 'maps/test.xtm'));
is (@{$tm->topics()},                                    14, 'mergeMap, nr topics');
is (@{$tm->topics('occurrence regexps /example/')},       3, 'mergeMap, occurrences');
is (@{$tm->topics('text       regexps /any text/')},      1, 'mergeMap, data');
is (@{$tm->topics('assocs with t-topic4')},               2, 'mergeMap, assocs 1');
is (@{$tm->topics('assocs with t-topic2')},               3, 'mergeMap, assocs 2');
is (@{$tm->topics('is-a tt-type1')},                      3, 'mergeMap, is-a 1');
is (@{$tm->topics('is-a tt-type2')},                      1, 'mergeMap, is-a 2');
is (@{$tm->associations()},                               4, 'mergeMap, nr assocs');
is (@{$tm->associations('is-a at-is-associated-with')},   2, 'mergeMap, is-a 3');

__END__

exit;
use Data::Dumper;
print Dumper $tm;
exit;

exit;


# test file for Bizarre copy of HASH problem

package MyMemoryBuilder;

use base qw(XML::SAX::Base);

sub new {
  my $class  = shift;
  my $self = bless {}, $class;
  $self->{xxx} = {
		  yyy => {}, 
		 };
  return $self;
}

sub start_element {
  print "at a start element\n";
  die "A good place to die?";
}

1;

my $xml = q|<?xml version="1.0"?><topicMap></topicMap>|;

use XML::SAX::ParserFactory;

my $builder;
my $parser;

foreach (1..3) {
  eval {
    $builder = new MyMemoryBuilder ();
    $parser  = XML::SAX::ParserFactory->parser(Handler => $builder);
    print "I'm a ".ref ($parser), "\n";
    $parser->parse_string($xml);
  }; if ($@) {
    print "$@";
  };
}

exit;



exit;




__END__

