package XTM::PSI;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

@ISA = qw(Exporter AutoLoader);
@EXPORT = qw(  );
@EXPORT_OK = qw( );
$VERSION = '0.02';


=pod

=head1 NAME

XTM::PSI - Topic Map management, published subject identifiers

=head1 SYNOPSIS

  use XTM::PSI;
  print keys %xtm;
  print keys %priv;

=head1 DESCRIPTION

This package contains a hash with some PSIs. See 

  http://www.topicmaps.org/xtm/1.0/psi1.xtm

for a moving target.

=cut

use vars qw(%xtm %priv);
%xtm = (
	universal_scope => 'http://www.topicmaps.org/xtm/1.0/#psi-universal-scope',
	topic           => 'http://www.topicmaps.org/xtm/1.0/#psi-topic',
	association     => 'http://www.topicmaps.org/xtm/1.0/#psi-association',
	occurrence      => 'http://www.topicmaps.org/xtm/1.0/#psi-occurrence'
       );

%priv = (
	 map            => 'urn:x-tm-map',
	 desc           => 'urn:x-tm-description',
	 server         => 'urn:x-tm-server',
	 knowledge      => 'urn:x-tm-knowledge',
	 continuation   => 'urn:x-tm-continuation',
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
