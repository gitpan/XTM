# -*-perl-*-
use strict;
use Test::More tests => 8;

use XTM;
use Data::Dumper;

require_ok ('XTM::topic');

isa_ok(new XTM::topic, 'XTM::topic');

{
  my $t = new XTM::topic;
  #print Dumper $t;
  like ($t->id, qr/t-\d+/, 'topic id generated');
  
  is ($t->id ('x123'), 'x123', 'topic id modified');
  #print Dumper $t;
}


{
  use XTM::Path;
  my $xtmp = new XTM::Path;
  my $t = $xtmp->create ('topic[baseName/baseNameString/text() = "xxx"]
                               [occurrence = "blabla"]
                               [occurrence/resourceRef/@href = "http://rumsti.com/"]');
  $t->add_defaults;
#  print Dumper $t;
  ok ($t->has_instanceOf ($XTM::PSI::xtm{topic}), 'default topic type');
  is (scalar $xtmp->find (qq{baseName[scope/topicRef/\@href = "$XTM::PSI::xtm{universal_scope}"]}, $t), 1, 'baseName scope');
  is (scalar $xtmp->find (qq{occurrence[scope/topicRef/\@href = "$XTM::PSI::xtm{universal_scope}"]}, $t), 2, 'occurrence scope');
  is (scalar $xtmp->find (qq{occurrence[instanceOf/topicRef/\@href = "$XTM::PSI::xtm{occurrence}"]}, $t), 2, 'occurrence type');
}


