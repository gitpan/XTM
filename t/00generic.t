# -*-perl-*-
use strict;
use Test::More tests => 12;
 

{
  use XTM;
  use XTM::baseName;
  
  # any generic child will do
  my $b = new XTM::baseName;
  
  $b->add_rumsti (42);
  is ($b->rumsti, 42, 'generic value');
  $b->add_ramsti_s (13);
  $b->add_ramsti_s (26);
  is ($b->ramsti_s, 2, 'generic values');
}

{
  use XTM::baseName;
  my $b = new XTM::baseName;
  use XTM::baseNameString;
  my $bs = new XTM::baseNameString;

  $b->add ($bs);
  is (ref ($b->baseNameString), 'XTM::baseNameString', 'single/single add');
}

foreach my $ty (qw(resourceRef topicRef subjectIndicatorRef)) {
  eval "use XTM::$ty";
 
  my $rr;
  eval "\$rr = new XTM::$ty (href => 'xxxx')";
  is ($rr->href, 'xxxx', "href read $ty");

  $rr->href ('zzzz');
  is ($rr->href, 'zzzz', "href read/write");
}

{
  my $s = new XTM::scope;

  $s->add (
	   new XTM::topicRef (href => '#aaaaa'),
	   new XTM::subjectIndicatorRef (href => '#sssss'),
	   new XTM::resourceRef (href => '#rrrrrrr'));

  is (@{$s->references}, 3, 'references');
#  use Data::Dumper;
#  print Dumper $s;
}

{
  use XTM::occurrence;
  my $o = new XTM::occurrence;
  use XTM::resourceData;
  my $rd = new XTM::resourceData (data => "xxxx");
  
  $o->add ($rd);
  is (ref ($o->resource), 'XTM::resourceData', 'resourceData');
  
  use XTM::resourceRef;
  my $rr = new XTM::resourceRef ();
  
  $o->add ($rr);
  is (ref ($o->resource), 'XTM::resourceRef', 'resourceRef');
  
}

__END__

my $t = new XTM::topic (id => 'xxx');
foreach (1..3) {
  $t->add ($b, $b);
}
is (@{$t->baseNames}, 6, 'test multiple/multiple add');
foreach (@{$t->baseNames}) {
  is (ref ($_->baseNameString), 'XTM::baseNameString', 'test multiple add inner');
}


__END__
