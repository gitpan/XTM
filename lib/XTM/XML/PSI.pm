package XTM::XML::PSI;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

@ISA = qw(Exporter AutoLoader);
@EXPORT = qw(  );
@EXPORT_OK = qw( );
$VERSION = '0.01';


=pod

=head1 NAME

XTM::XML::PSI - Topic Map management, published subject identifiers

=head1 SYNOPSIS

  use XTM::XML::PSI;
  print $psi{'universal_scope'};

=head1 DESCRIPTION

This package contains a hash with some PSIs. See 

  http://www.topicmaps.org/xtm/1.0/psi1.xtm

for an everchanging list.

=cut

use vars ('%psi');
%psi = (
	universal_scope => 'http://www.topicmaps.org/xtm/1.0/#psi-universal-scope',
	topic           => 'http://www.topicmaps.org/xtm/1.0/#psi-topic',
	association     => 'http://www.topicmaps.org/xtm/1.0/#psi-association',
	occurrence      => 'http://www.topicmaps.org/xtm/1.0/#psi-occurrence'
       );

=pod

=head1 SEE ALSO

L<XTM>

=head1 AUTHOR INFORMATION

Copyright 2001, Robert Barta <rho@telecoma.net>, All rights reserved.
 
This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.

=cut

1;

__END__
