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
	      'PREREQ_PM'     => { 'Data::Dumper'         => 2.101,
				   'File::Slurp'          => 96.042202,
				   'XML::Writer'          => 0.4,
				   'Data::Dumper'         => 2.101,
				   'XML::SAX'             => 0.03,
				   'XML::LibXML'          => 1.31,
				   'File::stat'           => 0,
				   'IO::File'             => 1.06021,
				   'Pod::Usage'           => 1.14,
				   'LWP::Simple'          => 1.33,

				 },
	      'NORECURS'       => 1,
	     );



