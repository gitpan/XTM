package XTM::base;

=pod

=head1 NAME

XTM::base - Topic Map, base distribution

=head1 SYNOPSIS

  use XTM;
  $tm = new XTM; # creating an empty map

  # reading a topic map description from an XML file
  use XTM::XML;
  $tm = new XTM (tie => new XTM::XML (file => 'mymap.tm'));

  # application specific persistent medium
  $tm = new XTM (tie => new XTM::Application::MineMineMine);

=head1 DESCRIPTION

Topic Maps are a means for layering multidimensional topic spaces on top of
information assets. The standard covers concepts like topics,
associations, scopes and occurrences. Topic Maps are
expected to have a major impact on future information systems and compete
with RDF in the semantic web arena.

See http://www.topicmaps.org/xtm/1.0/ for more information.

Topic maps can be loaded from an XML based resource (local or remote
via an URL) as prescribed by the XTM standard. There is also a way
to tie a map to any persistent medium. The latter is especially interesting
when running this module along with a (web) server.

=head1 PROGRAMS

Following programs come with this distribution:

=over 4

=item L<xtm>.pl

A simple text interface to load & query topic maps locally.

=back

=head1 PACKAGES

Following packages come with this distribution:

=over 4

=item L<XTM>

toplevel wrapper for (non-threaded) maps

=item L<XTM::Memory>

in-memory representation of a map

=item L<XTM::PSI>

PSI definitions

=item L<XTM::XML>

XML parser

=item L<XTM::XML::Latin1Parser>

=item L<XTM::XML::UTF8>

=item L<XTM::XML::Grove2TM>

=item L<XTM::Log>

logging facility will be used by others

=item L<XTM::generic>

accessor functions for all below

=item L<XTM::topic>

implementation of the 'topic' class

=item L<XTM::association>

implementation of the 'association' class

=item L<XTM::topicRef>

generic class definition

=item L<XTM::baseName>

generic class definition

=item L<XTM::scope>

generic class definition

=item L<XTM::resourceRef>

generic class definition

=item L<XTM::instanceOf>

generic class definition

=item L<XTM::subjectIdentity>

generic class definition

=item L<XTM::subjectIndicatorRef>

generic class definition

=item L<XTM::variant>

generic class definition

=item L<XTM::variantName>

generic class definition

=item L<XTM::parameters>

generic class definition

=item L<XTM::roleSpec>

generic class definition

=item L<XTM::member>

generic class definition

=item L<XTM::mergeMap>

generic class definition

=item L<XTM::resourceData>

generic class definition

=item L<XTM::baseNameString>

generic class definition

=item L<XTM::occurrence>

generic class definition

=back

=head1 AUTHOR INFORMATION

Copyright 2001, Robert Barta <rho@telecoma.net>, All rights reserved.
 
This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.

=cut


1;

__END__