# -*-perl-*-
use strict;
use Test;
BEGIN { plan tests => 2 }
 
use XTM;
use XTM::baseName;

# any generic child will do
my $b = new XTM::baseName;

$b->add_rumsti (42);
ok ($b->rumsti, 42);
$b->add_ramsti_s (13);
$b->add_ramsti_s (26);
ok ($b->ramsti_s, 2);

__END__
