# -*-perl-*-
use strict;
use Test::More tests => 7;

use XTM;
use Data::Dumper;

require_ok ('XTM::association');

isa_ok(new XTM::association, 'XTM::association');

{
  my $a = new XTM::association;
  #print Dumper $;
  like ($a->id, qr/a-\d+/, 'assoc id generated');
}


use XTM::Path;
my $xtmp = new XTM::Path;

my %instance_tests = ('association[member
                              [roleSpec/topicRef/@href = "#bbbbb"]
                              [topicRef/@href = "#aaa"]]
                           [member
                              [roleSpec/topicRef/@href = "#xxxx"]
                              [topicRef/@href = "#nnnn"]]
                           [instanceOf/topicRef/@href = "#ramsti"]' => '#ramsti',
		      'association[member
                              [roleSpec/topicRef/@href = "#bbbbb"]
                              [topicRef/@href = "#aaa"]]
                           [member
                              [roleSpec/topicRef/@href = "#xxxx"]
                              [topicRef/@href = "#nnnn"]]' => $XTM::PSI::xtm{association},
		  );
foreach my $p (keys %instance_tests) {
  my $a = $xtmp->create ($p);
  $a->add_defaults;
#  print Dumper $a;
  is ($a->instanceOf->reference->href, $instance_tests{$p}, 'testing instance default' );
#  ok ( ($XTM::PSI::xtm{topic}), 'default topic type');
#  is (scalar $xtmp->find (qq{baseName[scope/topicRef/\@href = "$XTM::PSI::xtm{universal_scope}"]}, $t), 1, 'baseName scope');
#  is (scalar $xtmp->find (qq{occurrence[scope/topicRef/\@href = "$XTM::PSI::xtm{universal_scope}"]}, $t), 2, 'occurrence scope');
#  is (scalar $xtmp->find (qq{occurrence[instanceOf/topicRef/\@href = "$XTM::PSI::xtm{occurrence}"]}, $t), 2, 'occurrence type');
}


my %scope_tests = ('association[member
                              [roleSpec/topicRef/@href = "#bbbbb"]
                              [topicRef/@href = "#aaa"]]
                           [member
                              [roleSpec/topicRef/@href = "#xxxx"]
                              [topicRef/@href = "#nnnn"]]
                           [scope/topicRef/@href = "#ramsti"]' => '#ramsti',
		   'association[member
                              [roleSpec/topicRef/@href = "#bbbbb"]
                              [topicRef/@href = "#aaa"]]
                           [member
                              [roleSpec/topicRef/@href = "#xxxx"]
                              [topicRef/@href = "#nnnn"]]' => $XTM::PSI::xtm{universal_scope},
		  );
foreach my $p (keys %scope_tests) {
  my $a = $xtmp->create ($p);
  $a->add_defaults;
#  print Dumper $a;
  is ($a->scope->references->[0]->href, $scope_tests{$p}, 'testing scope default' );
}


