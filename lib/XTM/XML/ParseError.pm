package XTM::XML::ParseError;

use base qw(XML::SAX::Exception);

sub new {
  my $class = shift;
  my $message = shift;
  return  bless {
		 Message => $message,
		 Exception => undef,
		}, $class;
}

1;
