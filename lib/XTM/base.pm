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

=head1 PACKAGES

Following packages come with this distribution:

      XTM                          this package, toplevel wrapper for (non-threaded) maps
      XTM::Memory                  in-memory representation of a map

      XTM::XML::PSI                PSI definitions
      XTM::XML                     XML parser
      XTM::XML::Latin1Parser       
      XTM::XML::UTF8
      XTM::XML::Grove2TM

      XTM::Log                     logging facility will be used by others

      XTM::generic                 accessor functions for all below
      XTM::topic                   implementation of the 'topic' class
      XTM::association             implementation of the 'association' class

      XTM::topicRef                generic class definition
      XTM::baseName                generic class definition
      XTM::scope                   generic class definition
      XTM::resourceRef             generic class definition
      XTM::instanceOf              generic class definition
      XTM::subjectIdentity         generic class definition
      XTM::subjectIndicatorRef     generic class definition
      XTM::variant                 generic class definition
      XTM::variantName             generic class definition
      XTM::parameters              generic class definition
      XTM::roleSpec                generic class definition
      XTM::member                  generic class definition
      XTM::mergeMap                generic class definition
      XTM::resourceData            generic class definition
      XTM::baseNameString          generic class definition
      XTM::occurrence              generic class definition

=head1 AUTHOR INFORMATION

Copyright 2001, Robert Barta <rho@telecoma.net>, All rights reserved.
 
This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.

=cut


1;

__END__
