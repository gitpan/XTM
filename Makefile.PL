use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
	      'AUTHOR'        => 'rho@telecoma.net',
	      'ABSTRACT_FROM' => 'lib/XTM/base.pm',
	      'NAME'	      => 'XTM',
	      'VERSION_FROM'  => 'lib/XTM/base.pm', # finds $VERSION
	      'EXE_FILES'     => [ 'bin/xtm.pl', 'bin/astma2xtm.pl', 'bin/prettifyxtm.pl' ],
	      'depend' =>
	      {'cparser' => 'lib/XTM/AsTMa/CParser.pm'},
	      'NOECHO'        => '@',
	      'PREREQ_PM'     => { 
				  'Data::Dumper' => 2.102,
				  'Text::Iconv' => 1.2,
				  'IO::File' => 1.08,
				  'File::stat' => 0,
				  'Getopt::Long' => 2.25,
				  'IO::String' => 1.01,
				  'LWP::Simple' => 1.35,
				  'Parse::RecDescent' => 1.80,
				  'Pod::Usage' => 1.14,
				  'Term::ReadLine' => 0,
				  'Test' => 1.15,
				  'Test::More' => 0.40,
				  'URI' => 1.18,
				  'URI::file' => 0,
				  'XML::SAX::ParserFactory' => 1.01,
				  'XML::Twig' => 3.01,
				  'XML::Writer' => 0.4,
				 },
	      'NORECURS'       => 1,
	     );

package MY;

sub depend {
    return <<MAKE

cparser: lib/XTM/AsTMa/CParser.pm lib/XTM/Path/CParser.pm lib/XTM/LTM/CParser.pm

lib/XTM/AsTMa/CParser.pm: lib/XTM/AsTMa/Parser.pm
	perl -Ilib -MXTM::AsTMa::Parser -e 'print \$\$XTM::AsTMa::Parser::astma_grammar' > /tmp/grammar
	perl -MParse::RecDescent - /tmp/grammar XTM::AsTMa::CParser
	mv CParser.pm lib/XTM/AsTMa/

lib/XTM/LTM/CParser.pm: lib/XTM/LTM/Parser.pm
	perl -Ilib -MXTM::LTM::Parser -e 'print \$\$XTM::LTM::Parser::ltm_grammar' > /tmp/grammar
	perl -MParse::RecDescent - /tmp/grammar XTM::LTM::CParser
	mv CParser.pm lib/XTM/LTM/

lib/XTM/Path/CParser.pm: lib/XTM/Path.pm
	perl -Ilib -MXTM::Path -e 'print \$\$XTM::Path::xtmpath_grammar' > /tmp/grammar
	perl -MParse::RecDescent - /tmp/grammar XTM::Path::CParser
	mv CParser.pm lib/XTM/Path/

MAKE
}
