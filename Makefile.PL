use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
	      'AUTHOR'        => 'rho@telecoma.net',
	      'ABSTRACT_FROM' => 'lib/XTM/base.pm',
	      'NAME'	      => 'XTM',
	      'VERSION_FROM'  => 'lib/XTM/base.pm', # finds $VERSION
	      'INSTALLBIN'    => '/usr/local/topicmaps/bin',
	      'EXE_FILES'     => [ 'bin/xtm.pl', 'bin/astma2xtm.pl', 'bin/prettifyxtm.pl' ],
	      'NOECHO'        => '@',
	      'PREREQ_PM'     => { 
				  'XML::SAX'             => 0.03,
				  'XML::LibXML'          => 1.31,
				  'File::stat'           => 0,
				  'IO::File'             => 1.06021,
				  'LWP::Simple'          => 1.33,
				  'Data::Dumper'         => 2.102,
				  'File::Slurp'          => 2001.1103,
				  'Getopt::Long'         => 2.25,
				  'IO::String'           => 1.01,
				  'Parse::RecDescent'    => 1.80,
				  'Pod::Usage'           => 1.14,
				  'Term::ReadLine'       => 0,
				  'URI::file'            => 0,
				  'URI'                  => 1.18,
				  'XML::SAX::ParserFactory'    => 1.00,
				  'XML::Twig'            => 3.01,
				  'XML::Writer'          => 0.4,
				 },
	      'NORECURS'       => 1,
	     );



