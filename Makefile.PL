use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
	      'AUTHOR'        => 'rho@telecoma.net',
	      'ABSTRACT_FROM' => 'lib/XTM.pm',
	      'NAME'	      => 'XTM',
	      'VERSION_FROM'  => 'lib/XTM.pm', # finds $VERSION
	      'INSTALLBIN'    => '/usr/local/topicmaps/bin',
	      'EXE_FILES'     => [ 'bin/xtm.pl' ],
	      'NOECHO'        => '@',
	      'PREREQ_PM'     => { 'Data::Dumper'         => 2.101,
				   'File::Slurp'          => 96.042202,
				   'XML::Grove'           => 0,
				   'XML::Parser::PerlSAX' => 0.07,
				   'Data::Dumper'         => 2.101,
				   'Data::Grove::Visitor' => 0.07,
				   'File::stat'           => 0,
				   'IO::File'             => 1.06021,
				   'Pod::Usage'           => 1.14,
				   'LWP::Simple'          => 1.33,
				 }
	     );



