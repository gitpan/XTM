package XTM::LTM::CParser;
use Parse::RecDescent;

{ my $ERRORS;


package Parse::RecDescent::XTM::LTM::CParser;
use strict;
use vars qw($skip $AUTOLOAD  );
$skip = '\s*';


{
local $SIG{__WARN__} = sub {0};
# PRETEND TO BE IN Parse::RecDescent NAMESPACE
*Parse::RecDescent::XTM::LTM::CParser::AUTOLOAD	= sub
{
	no strict 'refs';
	$AUTOLOAD =~ s/^Parse::RecDescent::XTM::LTM::CParser/Parse::RecDescent/;
	goto &{$AUTOLOAD};
}
}

push @Parse::RecDescent::XTM::LTM::CParser::ISA, 'Parse::RecDescent';
# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::occtopic
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"occtopic"};
	
	Parse::RecDescent::_trace(q{Trying rule: [occtopic]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{occtopic},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [name]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{occtopic},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{occtopic});
		%item = (__RULE__ => q{occtopic});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [name]},
				  Parse::RecDescent::_tracefirst($text),
				  q{occtopic},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::name($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [name]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{occtopic},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [name]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{occtopic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{name}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [name]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{occtopic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{occtopic},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{occtopic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{occtopic},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{occtopic},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::string
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"string"};
	
	Parse::RecDescent::_trace(q{Trying rule: [string]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{string},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['"' /[^\\"]*/ '"']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{string},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{string});
		%item = (__RULE__ => q{string});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['"']},
					  Parse::RecDescent::_tracefirst($text),
					  q{string},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\"//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying terminal: [/[^\\"]*/]}, Parse::RecDescent::_tracefirst($text),
					  q{string},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{/[^\\"]*/})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:[^\"]*)//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;

			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;
		push @item, $item{__PATTERN1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying terminal: ['"']},
					  Parse::RecDescent::_tracefirst($text),
					  q{string},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{'"'})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\"//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING2__}=$&;
		

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{string},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = $item[2]; };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['"' /[^\\"]*/ '"']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{string},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{string},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{string},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{string},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{string},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::tm_format
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"tm_format"};
	
	Parse::RecDescent::_trace(q{Trying rule: [tm_format]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{tm_format},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [string]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{tm_format},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{tm_format});
		%item = (__RULE__ => q{tm_format});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [string]},
				  Parse::RecDescent::_tracefirst($text),
				  q{tm_format},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::string($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [string]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{tm_format},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [string]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{tm_format},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{string}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [string]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{tm_format},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{tm_format},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{tm_format},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{tm_format},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{tm_format},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::topicmapid_directive
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"topicmapid_directive"};
	
	Parse::RecDescent::_trace(q{Trying rule: [topicmapid_directive]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{topicmapid_directive},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['#TOPICMAP' name]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{topicmapid_directive},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{topicmapid_directive});
		%item = (__RULE__ => q{topicmapid_directive});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['#TOPICMAP']},
					  Parse::RecDescent::_tracefirst($text),
					  q{topicmapid_directive},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\#TOPICMAP//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying subrule: [name]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topicmapid_directive},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{name})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::name($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [name]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topicmapid_directive},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [name]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topicmapid_directive},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{name}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{topicmapid_directive},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			warn "XTM::LTM::Parser: TOPICMAP directive ignored";
		      };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['#TOPICMAP' name]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{topicmapid_directive},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{topicmapid_directive},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{topicmapid_directive},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{topicmapid_directive},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{topicmapid_directive},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::assocroles
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"assocroles"};
	
	Parse::RecDescent::_trace(q{Trying rule: [assocroles]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{assocroles},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [<leftop: assocrole /,/ assocrole>]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{assocroles},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{assocroles});
		%item = (__RULE__ => q{assocroles});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying operator: [<leftop: assocrole /,/ assocrole>]},
				  Parse::RecDescent::_tracefirst($text),
				  q{assocroles},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{})->at($text);

		$_tok = undef;
		OPLOOP: while (1)
		{
		  $repcount = 0;
		  my  @item;
		  
		  # MATCH LEFTARG
		  
		Parse::RecDescent::_trace(q{Trying subrule: [assocrole]},
				  Parse::RecDescent::_tracefirst($text),
				  q{assocroles},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{assocrole})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::assocrole($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [assocrole]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{assocroles},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [assocrole]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{assocroles},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{assocrole}} = $_tok;
		push @item, $_tok;
		
		}


		  $repcount++;

		  my $savetext = $text;
		  my $backtrack;

		  # MATCH (OP RIGHTARG)(s)
		  while ($repcount < 100000000)
		  {
			$backtrack = 0;
			
		Parse::RecDescent::_trace(q{Trying terminal: [/,/]}, Parse::RecDescent::_tracefirst($text),
					  q{assocroles},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{/,/})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:,)//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;

			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;
		push @item, $item{__PATTERN1__}=$&;
		

			pop @item;
			if (defined $1) {push @item, $item{'assocrole(s)'}=$1; $backtrack=1;}
			
		Parse::RecDescent::_trace(q{Trying subrule: [assocrole]},
				  Parse::RecDescent::_tracefirst($text),
				  q{assocroles},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{assocrole})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::assocrole($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [assocrole]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{assocroles},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [assocrole]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{assocroles},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{assocrole}} = $_tok;
		push @item, $_tok;
		
		}

			$savetext = $text;
			$repcount++;
		  }
		  $text = $savetext;
		  pop @item if $backtrack;

		  unless (@item) { undef $_tok; last }
		  $_tok = [ @item ];
		  last;
		} 

		unless ($repcount>=1)
		{
			Parse::RecDescent::_trace(q{<<Didn't match operator: [<leftop: assocrole /,/ assocrole>]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{assocroles},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched operator: [<leftop: assocrole /,/ assocrole>]<< (return value: [}
					  . qq{@{$_tok||[]}} . q{]},
					  Parse::RecDescent::_tracefirst($text),
					  q{assocroles},
					  $tracelevel)
						if defined $::RD_TRACE;

		push @item, $item{'assocrole(s)'}=$_tok||[];



		Parse::RecDescent::_trace(q{>>Matched production: [<leftop: assocrole /,/ assocrole>]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{assocroles},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{assocroles},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{assocroles},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{assocroles},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{assocroles},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::startrule
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"startrule"};
	
	Parse::RecDescent::_trace(q{Trying rule: [startrule]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{startrule},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [topicmap]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{startrule},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{startrule});
		%item = (__RULE__ => q{startrule});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [topicmap]},
				  Parse::RecDescent::_tracefirst($text),
				  q{startrule},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::topicmap($thisparser,$text,$repeating,$_noactions,sub { return [tm => $arg[0]] })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [topicmap]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{startrule},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [topicmap]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{startrule},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{topicmap}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [topicmap]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{startrule},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{startrule},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{startrule},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{startrule},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{startrule},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::scope
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"scope"};
	
	Parse::RecDescent::_trace(q{Trying rule: [scope]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{scope},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['/' name]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{scope},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{scope});
		%item = (__RULE__ => q{scope});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['/']},
					  Parse::RecDescent::_tracefirst($text),
					  q{scope},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\///)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying repeated subrule: [name]},
				  Parse::RecDescent::_tracefirst($text),
				  q{scope},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{name})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::LTM::CParser::name, 1, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [name]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{scope},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [name]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{scope},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{name(s)}} = $_tok;
		push @item, $_tok;
		



		Parse::RecDescent::_trace(q{>>Matched production: ['/' name]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{scope},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{scope},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{scope},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{scope},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{scope},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::topicmap
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"topicmap"};
	
	Parse::RecDescent::_trace(q{Trying rule: [topicmap]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{topicmap},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [encoding directive component]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{topicmap},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{topicmap});
		%item = (__RULE__ => q{topicmap});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying repeated subrule: [encoding]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topicmap},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::LTM::CParser::encoding, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [encoding]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topicmap},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [encoding]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topicmap},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{encoding(?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying repeated subrule: [directive]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topicmap},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{directive})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::LTM::CParser::directive, 0, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [directive]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topicmap},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [directive]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topicmap},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{directive(s?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying repeated subrule: [component]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topicmap},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{component})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::LTM::CParser::component, 1, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [component]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topicmap},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [component]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topicmap},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{component(s)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{topicmap},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			my $tm = $arg{tm};
			my @mentioned;

			foreach my $d (@{$item{'directive(s?)'}}) { # walk over directives, some contain components
			  push @{$item{'component(s)'}}, $d->{components} if ($d->{components});
			}

			foreach my $cs (@{$item{'component(s)'}}) {
			  foreach my $c (@{$cs}) {
			    if (ref($c) eq 'XTM::topic') {
			      $tm->add ($c);
			      push @mentioned, @{$c->connected};
			    } elsif (ref ($c) eq 'XTM::association') {
			      $tm->add ($c);
			      push @mentioned, @{$c->connected};
			    } elsif (ref($c) eq 'HASH') {     # is an occurrence with a topic
			      my $t;
			      eval {                          # try to find this topic
				$t = $tm->topic ($c->{topic});
			      }; if ($@) {                    # we have an occurrence but no topic
				$t = new XTM::topic (id => $c->{topic});
				$tm->add_topic ($t);
			      };
			      $t->add__s ($c->{occurrence});
			      push @mentioned, @{$t->connected};
			    } else {
			      die "XTM::LTM::Parser: Unexpected component '".ref($c)."'";
			    }
			  }
			}
			foreach my $href (@mentioned) {
#			  warn "testing:".$href;
			  use URI;
			  my $u = new URI ($href);
			  next if $u->scheme; # external
			  my $tid = $u->fragment;
			  next if $tm->is_topic ($tid);
			  $tm->add_topic (new XTM::topic (id => $tid));
			}

		      };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [encoding directive component]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{topicmap},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{topicmap},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{topicmap},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{topicmap},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{topicmap},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::encoding
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"encoding"};
	
	Parse::RecDescent::_trace(q{Trying rule: [encoding]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{encoding},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['@' string]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{encoding},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{encoding});
		%item = (__RULE__ => q{encoding});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['@']},
					  Parse::RecDescent::_tracefirst($text),
					  q{encoding},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\@//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying subrule: [string]},
				  Parse::RecDescent::_tracefirst($text),
				  q{encoding},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{string})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::string($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [string]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{encoding},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [string]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{encoding},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{string}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: ['@' string]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{encoding},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{encoding},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{encoding},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{encoding},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{encoding},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::topic
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"topic"};
	
	Parse::RecDescent::_trace(q{Trying rule: [topic]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{topic},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['[' name types topname subject indicator ']']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{topic},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{topic});
		%item = (__RULE__ => q{topic});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['[']},
					  Parse::RecDescent::_tracefirst($text),
					  q{topic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\[//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying subrule: [name]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{name})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::name($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [name]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [name]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{name}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying repeated subrule: [types]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{types})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::LTM::CParser::types, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [types]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [types]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{types(?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying repeated subrule: [topname]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{topname})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::LTM::CParser::topname, 0, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [topname]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [topname]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{topname(s?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying repeated subrule: [subject]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{subject})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::LTM::CParser::subject, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [subject]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [subject]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{subject(?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying repeated subrule: [indicator]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{indicator})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::LTM::CParser::indicator, 0, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [indicator]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [indicator]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{indicator(s?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying terminal: [']']},
					  Parse::RecDescent::_tracefirst($text),
					  q{topic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{']'})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\]//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING2__}=$&;
		

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{topic},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
		       my @components; # here I collect all which I generate here

		       my $t = new XTM::topic (id => $item{name});

		       if (ref($item{'types(?)'})) {
			 foreach (@{$item{'types(?)'}->[0]}) {
			   $t->add__s (new XTM::instanceOf ( reference => new XTM::topicRef (href => "#$_")));
			 }
		       };
		       $t->add__s (new XTM::instanceOf ( reference => new XTM::topicRef (href => $XTM::PSI::xtm{topic})))
		          unless $t->instanceOfs && @{$t->instanceOfs};

		       if (ref($item{'topname(s?)'})) {
			 foreach my $bn (@{$item{'topname(s?)'}}) {
			   my $b = new XTM::baseName ();
			   $b->add_baseNameString (new XTM::baseNameString (string => $bn->{basename}));
			   $b->add_scope          (new XTM::scope());
			   if (ref ($bn->{scope}) && @{$bn->{scope}}) { # list of scopes defined
			     foreach my $s (@{$bn->{scope}}) {
			       $b->scope->add_reference_s (new XTM::topicRef (href => $s));
			     }
			   } else { # default
			     $b->scope->add_reference_s (new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) );
			   }
			   $t->add__s ($b);
			 }
		       }


		       #use Data::Dumper;
		       #print Dumper $item{'subject(?)'};

		       my $s = new XTM::subjectIdentity (); # maybe we need it
		       if (ref ($item{'subject(?)'}) && @{$item{'subject(?)'}}) {
			 $s->add_ ( $item{'subject(?)'}->[0]);
		       }

		       if (ref($item{'indicator(s?)'})) {
			 foreach my $sin (@{$item{'indicator(s?)'}}) {
			   $s->add_reference_s ($sin);
			 }
		       }
		       $t->add_subjectIdentity ($s) if $s->references || $s->resourceRef; # only add it if we found at least one reference

#		       use Data::Dumper;
#		       print Dumper $t;

		       push @components, $t;
		       $return = \@components;
		      };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['[' name types topname subject indicator ']']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{topic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{topic},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{topic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{topic},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{topic},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::sortname
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"sortname"};
	
	Parse::RecDescent::_trace(q{Trying rule: [sortname]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{sortname},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [string]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{sortname},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{sortname});
		%item = (__RULE__ => q{sortname});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [string]},
				  Parse::RecDescent::_tracefirst($text),
				  q{sortname},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::string($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [string]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{sortname},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [string]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{sortname},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{string}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [string]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{sortname},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{sortname},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{sortname},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{sortname},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{sortname},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::occtype
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"occtype"};
	
	Parse::RecDescent::_trace(q{Trying rule: [occtype]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{occtype},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [name]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{occtype},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{occtype});
		%item = (__RULE__ => q{occtype});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [name]},
				  Parse::RecDescent::_tracefirst($text),
				  q{occtype},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::name($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [name]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{occtype},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [name]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{occtype},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{name}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [name]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{occtype},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{occtype},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{occtype},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{occtype},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{occtype},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::subject
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"subject"};
	
	Parse::RecDescent::_trace(q{Trying rule: [subject]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{subject},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['%' uri]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{subject},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{subject});
		%item = (__RULE__ => q{subject});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['%']},
					  Parse::RecDescent::_tracefirst($text),
					  q{subject},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\%//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying subrule: [uri]},
				  Parse::RecDescent::_tracefirst($text),
				  q{subject},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{uri})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::uri($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [uri]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{subject},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [uri]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{subject},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{uri}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{subject},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			$return = new XTM::resourceRef (href => $item{uri});
		      };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['%' uri]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{subject},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{subject},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{subject},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{subject},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{subject},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::name
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"name"};
	
	Parse::RecDescent::_trace(q{Trying rule: [name]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{name},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [/^\\w[-\\w]*/]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{name},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{name});
		%item = (__RULE__ => q{name});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: [/^\\w[-\\w]*/]}, Parse::RecDescent::_tracefirst($text),
					  q{name},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:^\w[-\w]*)//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;

			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;
		push @item, $item{__PATTERN1__}=$&;
		


		Parse::RecDescent::_trace(q{>>Matched production: [/^\\w[-\\w]*/]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{name},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{name},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{name},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{name},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{name},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::tau_expr
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"tau_expr"};
	
	Parse::RecDescent::_trace(q{Trying rule: [tau_expr]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{tau_expr},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [string]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{tau_expr},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{tau_expr});
		%item = (__RULE__ => q{tau_expr});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [string]},
				  Parse::RecDescent::_tracefirst($text),
				  q{tau_expr},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::string($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [string]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{tau_expr},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [string]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{tau_expr},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{string}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [string]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{tau_expr},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{tau_expr},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{tau_expr},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{tau_expr},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{tau_expr},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::data
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"data"};
	
	Parse::RecDescent::_trace(q{Trying rule: [data]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{data},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['[[' /.*(?=\\]\\])/sx ']]']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{data},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{data});
		%item = (__RULE__ => q{data});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['[[']},
					  Parse::RecDescent::_tracefirst($text),
					  q{data},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\[\[//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying terminal: [/.*(?=\\]\\])/sx]}, Parse::RecDescent::_tracefirst($text),
					  q{data},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{/.*(?=\\]\\])/sx})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:.*(?=\]\]))//sx)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;

			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;
		push @item, $item{__PATTERN1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying terminal: [']]']},
					  Parse::RecDescent::_tracefirst($text),
					  q{data},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{']]'})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\]\]//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING2__}=$&;
		

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{data},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = $item[2]; };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['[[' /.*(?=\\]\\])/sx ']]']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{data},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{data},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{data},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{data},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{data},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::uri
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"uri"};
	
	Parse::RecDescent::_trace(q{Trying rule: [uri]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{uri},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [string]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{uri},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{uri});
		%item = (__RULE__ => q{uri});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [string]},
				  Parse::RecDescent::_tracefirst($text),
				  q{uri},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::string($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [string]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{uri},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [string]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{uri},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{string}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [string]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{uri},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{uri},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{uri},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{uri},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{uri},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::type
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"type"};
	
	Parse::RecDescent::_trace(q{Trying rule: [type]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{type},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [':' name]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{type},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{type});
		%item = (__RULE__ => q{type});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: [':']},
					  Parse::RecDescent::_tracefirst($text),
					  q{type},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\://)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying subrule: [name]},
				  Parse::RecDescent::_tracefirst($text),
				  q{type},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{name})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::name($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [name]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{type},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [name]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{type},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{name}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [':' name]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{type},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{type},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{type},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{type},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{type},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::baseuri_directive
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"baseuri_directive"};
	
	Parse::RecDescent::_trace(q{Trying rule: [baseuri_directive]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{baseuri_directive},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['#BASEURI' uri]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{baseuri_directive},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{baseuri_directive});
		%item = (__RULE__ => q{baseuri_directive});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['#BASEURI']},
					  Parse::RecDescent::_tracefirst($text),
					  q{baseuri_directive},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\#BASEURI//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying subrule: [uri]},
				  Parse::RecDescent::_tracefirst($text),
				  q{baseuri_directive},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{uri})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::uri($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [uri]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{baseuri_directive},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [uri]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{baseuri_directive},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{uri}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: ['#BASEURI' uri]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{baseuri_directive},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{baseuri_directive},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{baseuri_directive},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{baseuri_directive},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{baseuri_directive},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::types
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"types"};
	
	Parse::RecDescent::_trace(q{Trying rule: [types]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{types},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [':' name]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{types},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{types});
		%item = (__RULE__ => q{types});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: [':']},
					  Parse::RecDescent::_tracefirst($text),
					  q{types},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\://)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying repeated subrule: [name]},
				  Parse::RecDescent::_tracefirst($text),
				  q{types},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{name})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::LTM::CParser::name, 1, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [name]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{types},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [name]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{types},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{name(s)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{types},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = $item[2]; };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [':' name]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{types},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{types},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{types},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{types},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{types},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::topname
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"topname"};
	
	Parse::RecDescent::_trace(q{Trying rule: [topname]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{topname},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['=' basename scope]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{topname},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{topname});
		%item = (__RULE__ => q{topname});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['=']},
					  Parse::RecDescent::_tracefirst($text),
					  q{topname},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\=//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying subrule: [basename]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topname},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{basename})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::basename($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [basename]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topname},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [basename]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topname},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{basename}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying repeated subrule: [scope]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topname},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{scope})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::LTM::CParser::scope, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [scope]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topname},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [scope]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topname},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{scope(?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{topname},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			$return = { basename => $item[2],
				    scope    => $item[3] };
		      };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['=' basename scope]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{topname},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{topname},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{topname},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{topname},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{topname},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::occur
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"occur"};
	
	Parse::RecDescent::_trace(q{Trying rule: [occur]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{occur},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['\{' occtopic ',' occtype ',' resource '\}' scope]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{occur},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{occur});
		%item = (__RULE__ => q{occur});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['\{']},
					  Parse::RecDescent::_tracefirst($text),
					  q{occur},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\{//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying subrule: [occtopic]},
				  Parse::RecDescent::_tracefirst($text),
				  q{occur},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{occtopic})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::occtopic($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [occtopic]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{occur},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [occtopic]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{occur},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{occtopic}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying terminal: [',']},
					  Parse::RecDescent::_tracefirst($text),
					  q{occur},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{','})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\,//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING2__}=$&;
		

		Parse::RecDescent::_trace(q{Trying subrule: [occtype]},
				  Parse::RecDescent::_tracefirst($text),
				  q{occur},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{occtype})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::occtype($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [occtype]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{occur},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [occtype]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{occur},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{occtype}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying terminal: [',']},
					  Parse::RecDescent::_tracefirst($text),
					  q{occur},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{','})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\,//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING3__}=$&;
		

		Parse::RecDescent::_trace(q{Trying subrule: [resource]},
				  Parse::RecDescent::_tracefirst($text),
				  q{occur},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{resource})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::resource($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [resource]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{occur},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [resource]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{occur},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{resource}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying terminal: ['\}']},
					  Parse::RecDescent::_tracefirst($text),
					  q{occur},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{'\}'})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\}//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING4__}=$&;
		

		Parse::RecDescent::_trace(q{Trying repeated subrule: [scope]},
				  Parse::RecDescent::_tracefirst($text),
				  q{occur},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{scope})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::LTM::CParser::scope, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [scope]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{occur},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [scope]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{occur},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{scope(?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{occur},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			my $o = new XTM::occurrence ();
			$o->add_resource ($item{resource});
			$o->add_scope    (new XTM::scope());
			foreach (@{$item{'scope(?)'}->[0]}) {
			  $o->scope->add_reference_s (new XTM::topicRef (href => "#$_"));
			}
			$o->scope->add_reference_s (new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) ) 
			  unless $o->scope->references;
			$o->add_instanceOf (new XTM::instanceOf ( reference => new XTM::topicRef (href => "#$item{occtype}")));

			$return = [ { topic      => $item{occtopic},
				      occurrence => $o, } ];

			#use Data::Dumper;
			#print "in occur: ", Dumper $return;
		      };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['\{' occtopic ',' occtype ',' resource '\}' scope]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{occur},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{occur},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{occur},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{occur},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{occur},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::_alternation_1_of_production_1_of_rule_assocrole
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"_alternation_1_of_production_1_of_rule_assocrole"};
	
	Parse::RecDescent::_trace(q{Trying rule: [_alternation_1_of_production_1_of_rule_assocrole]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{_alternation_1_of_production_1_of_rule_assocrole},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [topic]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_assocrole},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_assocrole});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_assocrole});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [topic]},
				  Parse::RecDescent::_tracefirst($text),
				  q{_alternation_1_of_production_1_of_rule_assocrole},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::topic($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [topic]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{_alternation_1_of_production_1_of_rule_assocrole},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [topic]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_assocrole},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{topic}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [topic]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_assocrole},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [name]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_assocrole},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_assocrole});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_assocrole});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [name]},
				  Parse::RecDescent::_tracefirst($text),
				  q{_alternation_1_of_production_1_of_rule_assocrole},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::name($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [name]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{_alternation_1_of_production_1_of_rule_assocrole},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [name]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_assocrole},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{name}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [name]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_assocrole},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{_alternation_1_of_production_1_of_rule_assocrole},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{_alternation_1_of_production_1_of_rule_assocrole},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{_alternation_1_of_production_1_of_rule_assocrole},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{_alternation_1_of_production_1_of_rule_assocrole},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::assocrole
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"assocrole"};
	
	Parse::RecDescent::_trace(q{Trying rule: [assocrole]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{assocrole},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [topic, or name type]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{assocrole},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{assocrole});
		%item = (__RULE__ => q{assocrole});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [_alternation_1_of_production_1_of_rule_assocrole]},
				  Parse::RecDescent::_tracefirst($text),
				  q{assocrole},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::_alternation_1_of_production_1_of_rule_assocrole($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [_alternation_1_of_production_1_of_rule_assocrole]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{assocrole},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [_alternation_1_of_production_1_of_rule_assocrole]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{assocrole},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{_alternation_1_of_production_1_of_rule_assocrole}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying repeated subrule: [type]},
				  Parse::RecDescent::_tracefirst($text),
				  q{assocrole},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{type})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::LTM::CParser::type, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [type]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{assocrole},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [type]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{assocrole},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{type(?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{assocrole},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			my $m = new XTM::member ();

#warn "type is ". Dumper $item{'type(?)'};
			if (scalar @{$item{'type(?)'}}) {
			  my $t = new XTM::topicRef (href => "#" . $item{'type(?)'}->[0]);
			  my $r = new XTM::roleSpec ();
			  $r->add_reference ($t);
			  $m->add_roleSpec ($r);
			}

#warn "item1 is ".$item[1];
			if (ref ($item[1]) eq 'ARRAY') { # @components came back
			   # the deal is that there is ONLY one topic in this list
			   my $t = $item[1]->[0]; # we have the topic
			   $m->add_reference_s (new XTM::topicRef (href => '#'.$t->id));
			   $return = { member => $m, topic => $t };
			} elsif (!ref ($item[1])) {      # scalar => string
			    $m->add_reference_s (new XTM::topicRef (href => "#$item[1]"));
  			    $return = $m;
			} else {
			  die "XTM::LTM::Parser: internal consistency violation";
			}
		      };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [topic, or name type]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{assocrole},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{assocrole},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{assocrole},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{assocrole},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{assocrole},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::dispname
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"dispname"};
	
	Parse::RecDescent::_trace(q{Trying rule: [dispname]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{dispname},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [string]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{dispname},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{dispname});
		%item = (__RULE__ => q{dispname});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [string]},
				  Parse::RecDescent::_tracefirst($text),
				  q{dispname},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::string($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [string]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{dispname},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [string]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{dispname},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{string}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [string]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{dispname},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{dispname},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{dispname},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{dispname},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{dispname},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::mergemap_directive
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"mergemap_directive"};
	
	Parse::RecDescent::_trace(q{Trying rule: [mergemap_directive]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{mergemap_directive},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['#MERGEMAP' tau_expr tm_format]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{mergemap_directive},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{mergemap_directive});
		%item = (__RULE__ => q{mergemap_directive});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['#MERGEMAP']},
					  Parse::RecDescent::_tracefirst($text),
					  q{mergemap_directive},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\#MERGEMAP//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying subrule: [tau_expr]},
				  Parse::RecDescent::_tracefirst($text),
				  q{mergemap_directive},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{tau_expr})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::tau_expr($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [tau_expr]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{mergemap_directive},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [tau_expr]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{mergemap_directive},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{tau_expr}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying repeated subrule: [tm_format]},
				  Parse::RecDescent::_tracefirst($text),
				  q{mergemap_directive},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{tm_format})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::LTM::CParser::tm_format, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [tm_format]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{mergemap_directive},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [tm_format]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{mergemap_directive},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{tm_format(?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{mergemap_directive},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
#			warn "MERGEMAP: $item{tau_expr}, format $item{'tm_format(?)'}";
#			use Data::Dumper;
#			print Dumper $item{'tm_format(?)'};

			my $tm2; # will hold the new map
			if (scalar @{$item{'tm_format(?)'}}) {
			  my $format = $item{'tm_format(?)'}->[0];
			  use URI;
			  my $uri    = new URI ($item{tau_expr});
			  $uri->scheme ('file') unless $uri->scheme; # default is 'file:'

			  if ($format =~ /ltm/i) {
			    $tm2 = new XTM (tie => new XTM::LTM   (url => $uri->as_string));
			  } elsif ($format =~ /astma/i) {
			    $tm2 = new XTM (tie => new XTM::AsTMa (url => $uri->as_string));
			  } elsif ($format =~ /xtm/i) {
			    $tm2 = new XTM (tie => new XTM::XML   (url => $uri->as_string));
			  } else {
			    die "XTM::LTM::Parser: Format '$format' not implemented";
			  }
			} else {
			  $tm2 = new XTM (tie => new XTM::Virtual (expr => $item{tau_expr}));
			}
			my @components;
			push @components, map {$tm2->topic($_)}       @{$tm2->topics};
			push @components, map {$tm2->association($_)} @{$tm2->associations};
			$return = { components => \@components };
		      };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['#MERGEMAP' tau_expr tm_format]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{mergemap_directive},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{mergemap_directive},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{mergemap_directive},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{mergemap_directive},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{mergemap_directive},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::assoc
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"assoc"};
	
	Parse::RecDescent::_trace(q{Trying rule: [assoc]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{assoc},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [name '(' assocroles ')' scope]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{assoc},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{assoc});
		%item = (__RULE__ => q{assoc});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [name]},
				  Parse::RecDescent::_tracefirst($text),
				  q{assoc},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::name($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [name]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{assoc},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [name]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{assoc},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{name}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying terminal: ['(']},
					  Parse::RecDescent::_tracefirst($text),
					  q{assoc},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{'('})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\(//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying subrule: [assocroles]},
				  Parse::RecDescent::_tracefirst($text),
				  q{assoc},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{assocroles})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::assocroles($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [assocroles]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{assoc},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [assocroles]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{assoc},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{assocroles}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying terminal: [')']},
					  Parse::RecDescent::_tracefirst($text),
					  q{assoc},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{')'})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\)//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING2__}=$&;
		

		Parse::RecDescent::_trace(q{Trying repeated subrule: [scope]},
				  Parse::RecDescent::_tracefirst($text),
				  q{assoc},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{scope})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::LTM::CParser::scope, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [scope]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{assoc},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [scope]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{assoc},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{scope(?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{assoc},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			my @components; # here I collect all which I generate here
			my $a = new XTM::association;

#			  use Data::Dumper;
#			  warn "scope : ".Dumper $item{'scope(?)'};

			my $s = new XTM::scope;
			foreach my $scope (@{$item{'scope(?)'}} ? @{$item{'scope(?)'}->[0]}: ()) {
			  $s->add_reference_s (new XTM::topicRef (href => "#$scope"));
			}
			unless ($s->references) {
			  $s->add_reference_s (new XTM::topicRef (href =>  $XTM::PSI::xtm{universal_scope}));
			}
			$a->add ($s);

                        $a->add_instanceOf (new XTM::instanceOf (reference => new XTM::topicRef (href => "#$item{name}")));

#			warn "assocrole is : ".Dumper $item{assocroles};
 			foreach (@{$item{assocroles}}) {
			  if (ref ($_) eq 'XTM::member') {
			    $a->add__s ($_);
			  } elsif (ref ($_) eq 'HASH') {
			    $a->add__s ($_->{member});
			    push @components, $_->{topic};
			  }
		        }


			push @components, $a;
			$return = \@components;
		      };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [name '(' assocroles ')' scope]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{assoc},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{assoc},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{assoc},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{assoc},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{assoc},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::basename
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"basename"};
	
	Parse::RecDescent::_trace(q{Trying rule: [basename]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{basename},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [string]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{basename},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{basename});
		%item = (__RULE__ => q{basename});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [string]},
				  Parse::RecDescent::_tracefirst($text),
				  q{basename},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::string($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [string]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{basename},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [string]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{basename},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{string}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [string]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{basename},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{basename},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{basename},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{basename},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{basename},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::resource
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"resource"};
	
	Parse::RecDescent::_trace(q{Trying rule: [resource]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{resource},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [uri]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{resource},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{resource});
		%item = (__RULE__ => q{resource});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [uri]},
				  Parse::RecDescent::_tracefirst($text),
				  q{resource},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::uri($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [uri]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{resource},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [uri]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{resource},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{uri}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{resource},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			$return = new XTM::resourceRef (href => $item{uri});
		      };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [uri]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{resource},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [data]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{resource},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{resource});
		%item = (__RULE__ => q{resource});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [data]},
				  Parse::RecDescent::_tracefirst($text),
				  q{resource},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::data($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [data]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{resource},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [data]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{resource},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{data}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{resource},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			$return = new XTM::resourceData (data => $item{data});
		      };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [data]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{resource},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{resource},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{resource},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{resource},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{resource},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::component
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"component"};
	
	Parse::RecDescent::_trace(q{Trying rule: [component]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{component},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [topic]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{component},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{component});
		%item = (__RULE__ => q{component});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [topic]},
				  Parse::RecDescent::_tracefirst($text),
				  q{component},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::topic($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [topic]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{component},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [topic]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{component},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{topic}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [topic]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{component},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [assoc]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{component},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{component});
		%item = (__RULE__ => q{component});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [assoc]},
				  Parse::RecDescent::_tracefirst($text),
				  q{component},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::assoc($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [assoc]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{component},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [assoc]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{component},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{assoc}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [assoc]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{component},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [occur]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{component},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[2];
		$text = $_[1];
		my $_savetext;
		@item = (q{component});
		%item = (__RULE__ => q{component});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [occur]},
				  Parse::RecDescent::_tracefirst($text),
				  q{component},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::occur($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [occur]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{component},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [occur]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{component},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{occur}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [occur]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{component},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{component},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{component},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{component},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{component},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::comment
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"comment"};
	
	Parse::RecDescent::_trace(q{Trying rule: [comment]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{comment},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['/*' /.+/ '*/']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{comment},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{comment});
		%item = (__RULE__ => q{comment});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['/*']},
					  Parse::RecDescent::_tracefirst($text),
					  q{comment},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\/\*//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying terminal: [/.+/]}, Parse::RecDescent::_tracefirst($text),
					  q{comment},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{/.+/})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:.+)//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;

			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;
		push @item, $item{__PATTERN1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying terminal: ['*/']},
					  Parse::RecDescent::_tracefirst($text),
					  q{comment},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{'*/'})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\*\///)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING2__}=$&;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['/*' /.+/ '*/']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{comment},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{comment},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{comment},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{comment},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{comment},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::indicator
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"indicator"};
	
	Parse::RecDescent::_trace(q{Trying rule: [indicator]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{indicator},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['@' uri]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{indicator},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{indicator});
		%item = (__RULE__ => q{indicator});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['@']},
					  Parse::RecDescent::_tracefirst($text),
					  q{indicator},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\@//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(qq{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying subrule: [uri]},
				  Parse::RecDescent::_tracefirst($text),
				  q{indicator},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{uri})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::uri($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [uri]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{indicator},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [uri]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{indicator},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{uri}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{indicator},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			use URI;
			my $u = URI->new ($item{uri});
			$return = ref ($u) eq 'URI::_generic' ? 
			  new XTM::topicRef (href => $item{uri}) :
			    new XTM::subjectIndicatorRef (href => $item{uri});
		      };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['@' uri]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{indicator},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{indicator},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{indicator},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{indicator},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{indicator},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::LTM::CParser::directive
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"directive"};
	
	Parse::RecDescent::_trace(q{Trying rule: [directive]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{directive},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [topicmapid_directive]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{directive},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{directive});
		%item = (__RULE__ => q{directive});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [topicmapid_directive]},
				  Parse::RecDescent::_tracefirst($text),
				  q{directive},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::topicmapid_directive($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [topicmapid_directive]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{directive},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [topicmapid_directive]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{directive},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{topicmapid_directive}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [topicmapid_directive]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{directive},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [mergemap_directive]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{directive},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{directive});
		%item = (__RULE__ => q{directive});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [mergemap_directive]},
				  Parse::RecDescent::_tracefirst($text),
				  q{directive},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::mergemap_directive($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [mergemap_directive]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{directive},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [mergemap_directive]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{directive},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{mergemap_directive}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [mergemap_directive]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{directive},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [baseuri_directive]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{directive},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[2];
		$text = $_[1];
		my $_savetext;
		@item = (q{directive});
		%item = (__RULE__ => q{directive});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [baseuri_directive]},
				  Parse::RecDescent::_tracefirst($text),
				  q{directive},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::LTM::CParser::baseuri_directive($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [baseuri_directive]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{directive},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [baseuri_directive]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{directive},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{baseuri_directive}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [baseuri_directive]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{directive},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{directive},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{directive},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{directive},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{directive},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}
}
package XTM::LTM::CParser; sub new { my $self = bless( {
                 '_AUTOTREE' => undef,
                 'localvars' => '',
                 'startcode' => '',
                 '_check' => {
                               'thisoffset' => '',
                               'itempos' => '',
                               'prevoffset' => '',
                               'prevline' => '',
                               'prevcolumn' => '',
                               'thiscolumn' => ''
                             },
                 'namespace' => 'Parse::RecDescent::XTM::LTM::CParser',
                 '_AUTOACTION' => undef,
                 'rules' => {
                              'occtopic' => bless( {
                                                     'impcount' => 0,
                                                     'calls' => [
                                                                  'name'
                                                                ],
                                                     'changed' => 0,
                                                     'opcount' => 0,
                                                     'prods' => [
                                                                  bless( {
                                                                           'number' => '0',
                                                                           'strcount' => 0,
                                                                           'dircount' => 0,
                                                                           'uncommit' => undef,
                                                                           'error' => undef,
                                                                           'patcount' => 0,
                                                                           'actcount' => 0,
                                                                           'items' => [
                                                                                        bless( {
                                                                                                 'subrule' => 'name',
                                                                                                 'matchrule' => 0,
                                                                                                 'implicit' => undef,
                                                                                                 'argcode' => undef,
                                                                                                 'lookahead' => 0,
                                                                                                 'line' => 267
                                                                                               }, 'Parse::RecDescent::Subrule' )
                                                                                      ],
                                                                           'line' => undef
                                                                         }, 'Parse::RecDescent::Production' )
                                                                ],
                                                     'name' => 'occtopic',
                                                     'vars' => '',
                                                     'line' => 267
                                                   }, 'Parse::RecDescent::Rule' ),
                              'string' => bless( {
                                                   'impcount' => 0,
                                                   'calls' => [],
                                                   'changed' => 0,
                                                   'opcount' => 0,
                                                   'prods' => [
                                                                bless( {
                                                                         'number' => '0',
                                                                         'strcount' => 2,
                                                                         'dircount' => 0,
                                                                         'uncommit' => undef,
                                                                         'error' => undef,
                                                                         'patcount' => 1,
                                                                         'actcount' => 1,
                                                                         'items' => [
                                                                                      bless( {
                                                                                               'pattern' => '"',
                                                                                               'hashname' => '__STRING1__',
                                                                                               'description' => '\'"\'',
                                                                                               'lookahead' => 0,
                                                                                               'line' => 285
                                                                                             }, 'Parse::RecDescent::Literal' ),
                                                                                      bless( {
                                                                                               'pattern' => '[^\\"]*',
                                                                                               'hashname' => '__PATTERN1__',
                                                                                               'description' => '/[^\\\\"]*/',
                                                                                               'lookahead' => 0,
                                                                                               'rdelim' => '/',
                                                                                               'line' => 285,
                                                                                               'mod' => '',
                                                                                               'ldelim' => '/'
                                                                                             }, 'Parse::RecDescent::Token' ),
                                                                                      bless( {
                                                                                               'pattern' => '"',
                                                                                               'hashname' => '__STRING2__',
                                                                                               'description' => '\'"\'',
                                                                                               'lookahead' => 0,
                                                                                               'line' => 285
                                                                                             }, 'Parse::RecDescent::Literal' ),
                                                                                      bless( {
                                                                                               'hashname' => '__ACTION1__',
                                                                                               'lookahead' => 0,
                                                                                               'line' => 285,
                                                                                               'code' => '{ $return = $item[2]; }'
                                                                                             }, 'Parse::RecDescent::Action' )
                                                                                    ],
                                                                         'line' => undef
                                                                       }, 'Parse::RecDescent::Production' )
                                                              ],
                                                   'name' => 'string',
                                                   'vars' => '',
                                                   'line' => 285
                                                 }, 'Parse::RecDescent::Rule' ),
                              'tm_format' => bless( {
                                                      'impcount' => 0,
                                                      'calls' => [
                                                                   'string'
                                                                 ],
                                                      'changed' => 0,
                                                      'opcount' => 0,
                                                      'prods' => [
                                                                   bless( {
                                                                            'number' => '0',
                                                                            'strcount' => 0,
                                                                            'dircount' => 0,
                                                                            'uncommit' => undef,
                                                                            'error' => undef,
                                                                            'patcount' => 0,
                                                                            'actcount' => 0,
                                                                            'items' => [
                                                                                         bless( {
                                                                                                  'subrule' => 'string',
                                                                                                  'matchrule' => 0,
                                                                                                  'implicit' => undef,
                                                                                                  'argcode' => undef,
                                                                                                  'lookahead' => 0,
                                                                                                  'line' => 96
                                                                                                }, 'Parse::RecDescent::Subrule' )
                                                                                       ],
                                                                            'line' => undef
                                                                          }, 'Parse::RecDescent::Production' )
                                                                 ],
                                                      'name' => 'tm_format',
                                                      'vars' => '',
                                                      'line' => 96
                                                    }, 'Parse::RecDescent::Rule' ),
                              'topicmapid_directive' => bless( {
                                                                 'impcount' => 0,
                                                                 'calls' => [
                                                                              'name'
                                                                            ],
                                                                 'changed' => 0,
                                                                 'opcount' => 0,
                                                                 'prods' => [
                                                                              bless( {
                                                                                       'number' => '0',
                                                                                       'strcount' => 1,
                                                                                       'dircount' => 0,
                                                                                       'uncommit' => undef,
                                                                                       'error' => undef,
                                                                                       'patcount' => 0,
                                                                                       'actcount' => 1,
                                                                                       'items' => [
                                                                                                    bless( {
                                                                                                             'pattern' => '#TOPICMAP',
                                                                                                             'hashname' => '__STRING1__',
                                                                                                             'description' => '\'#TOPICMAP\'',
                                                                                                             'lookahead' => 0,
                                                                                                             'line' => 58
                                                                                                           }, 'Parse::RecDescent::Literal' ),
                                                                                                    bless( {
                                                                                                             'subrule' => 'name',
                                                                                                             'matchrule' => 0,
                                                                                                             'implicit' => undef,
                                                                                                             'argcode' => undef,
                                                                                                             'lookahead' => 0,
                                                                                                             'line' => 58
                                                                                                           }, 'Parse::RecDescent::Subrule' ),
                                                                                                    bless( {
                                                                                                             'hashname' => '__ACTION1__',
                                                                                                             'lookahead' => 0,
                                                                                                             'line' => 59,
                                                                                                             'code' => '{
			warn "XTM::LTM::Parser: TOPICMAP directive ignored";
		      }'
                                                                                                           }, 'Parse::RecDescent::Action' )
                                                                                                  ],
                                                                                       'line' => undef
                                                                                     }, 'Parse::RecDescent::Production' )
                                                                            ],
                                                                 'name' => 'topicmapid_directive',
                                                                 'vars' => '',
                                                                 'line' => 58
                                                               }, 'Parse::RecDescent::Rule' ),
                              'assocroles' => bless( {
                                                       'impcount' => 0,
                                                       'calls' => [
                                                                    'assocrole'
                                                                  ],
                                                       'changed' => 0,
                                                       'opcount' => 0,
                                                       'prods' => [
                                                                    bless( {
                                                                             'number' => '0',
                                                                             'strcount' => 0,
                                                                             'dircount' => 1,
                                                                             'uncommit' => undef,
                                                                             'error' => undef,
                                                                             'patcount' => 1,
                                                                             'actcount' => 0,
                                                                             'op' => [],
                                                                             'items' => [
                                                                                          bless( {
                                                                                                   'expected' => '<leftop: assocrole /,/ assocrole>',
                                                                                                   'min' => 1,
                                                                                                   'name' => '\'assocrole(s)\'',
                                                                                                   'max' => 100000000,
                                                                                                   'leftarg' => bless( {
                                                                                                                         'subrule' => 'assocrole',
                                                                                                                         'matchrule' => 0,
                                                                                                                         'implicit' => undef,
                                                                                                                         'argcode' => undef,
                                                                                                                         'lookahead' => 0,
                                                                                                                         'line' => 218
                                                                                                                       }, 'Parse::RecDescent::Subrule' ),
                                                                                                   'rightarg' => bless( {
                                                                                                                          'subrule' => 'assocrole',
                                                                                                                          'matchrule' => 0,
                                                                                                                          'implicit' => undef,
                                                                                                                          'argcode' => undef,
                                                                                                                          'lookahead' => 0,
                                                                                                                          'line' => 218
                                                                                                                        }, 'Parse::RecDescent::Subrule' ),
                                                                                                   'hashname' => '__DIRECTIVE1__',
                                                                                                   'type' => 'leftop',
                                                                                                   'op' => bless( {
                                                                                                                    'pattern' => ',',
                                                                                                                    'hashname' => '__PATTERN1__',
                                                                                                                    'description' => '/,/',
                                                                                                                    'lookahead' => 0,
                                                                                                                    'rdelim' => '/',
                                                                                                                    'line' => 218,
                                                                                                                    'mod' => '',
                                                                                                                    'ldelim' => '/'
                                                                                                                  }, 'Parse::RecDescent::Token' )
                                                                                                 }, 'Parse::RecDescent::Operator' )
                                                                                        ],
                                                                             'line' => undef
                                                                           }, 'Parse::RecDescent::Production' )
                                                                  ],
                                                       'name' => 'assocroles',
                                                       'vars' => '',
                                                       'line' => 218
                                                     }, 'Parse::RecDescent::Rule' ),
                              'startrule' => bless( {
                                                      'impcount' => 0,
                                                      'calls' => [
                                                                   'topicmap'
                                                                 ],
                                                      'changed' => 0,
                                                      'opcount' => 0,
                                                      'prods' => [
                                                                   bless( {
                                                                            'number' => '0',
                                                                            'strcount' => 0,
                                                                            'dircount' => 0,
                                                                            'uncommit' => undef,
                                                                            'error' => undef,
                                                                            'patcount' => 0,
                                                                            'actcount' => 0,
                                                                            'items' => [
                                                                                         bless( {
                                                                                                  'subrule' => 'topicmap',
                                                                                                  'matchrule' => 0,
                                                                                                  'implicit' => undef,
                                                                                                  'argcode' => '[tm => $arg[0]]',
                                                                                                  'lookahead' => 0,
                                                                                                  'line' => 3
                                                                                                }, 'Parse::RecDescent::Subrule' )
                                                                                       ],
                                                                            'line' => undef
                                                                          }, 'Parse::RecDescent::Production' )
                                                                 ],
                                                      'name' => 'startrule',
                                                      'vars' => '',
                                                      'line' => 1
                                                    }, 'Parse::RecDescent::Rule' ),
                              'scope' => bless( {
                                                  'impcount' => 0,
                                                  'calls' => [
                                                               'name'
                                                             ],
                                                  'changed' => 0,
                                                  'opcount' => 0,
                                                  'prods' => [
                                                               bless( {
                                                                        'number' => '0',
                                                                        'strcount' => 1,
                                                                        'dircount' => 0,
                                                                        'uncommit' => undef,
                                                                        'error' => undef,
                                                                        'patcount' => 0,
                                                                        'actcount' => 0,
                                                                        'items' => [
                                                                                     bless( {
                                                                                              'pattern' => '/',
                                                                                              'hashname' => '__STRING1__',
                                                                                              'description' => '\'/\'',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 182
                                                                                            }, 'Parse::RecDescent::Literal' ),
                                                                                     bless( {
                                                                                              'subrule' => 'name',
                                                                                              'expected' => undef,
                                                                                              'min' => 1,
                                                                                              'argcode' => undef,
                                                                                              'max' => 100000000,
                                                                                              'matchrule' => 0,
                                                                                              'repspec' => 's',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 182
                                                                                            }, 'Parse::RecDescent::Repetition' )
                                                                                   ],
                                                                        'line' => undef
                                                                      }, 'Parse::RecDescent::Production' )
                                                             ],
                                                  'name' => 'scope',
                                                  'vars' => '',
                                                  'line' => 182
                                                }, 'Parse::RecDescent::Rule' ),
                              'topicmap' => bless( {
                                                     'impcount' => 0,
                                                     'calls' => [
                                                                  'encoding',
                                                                  'directive',
                                                                  'component'
                                                                ],
                                                     'changed' => 0,
                                                     'opcount' => 0,
                                                     'prods' => [
                                                                  bless( {
                                                                           'number' => '0',
                                                                           'strcount' => 0,
                                                                           'dircount' => 0,
                                                                           'uncommit' => undef,
                                                                           'error' => undef,
                                                                           'patcount' => 0,
                                                                           'actcount' => 1,
                                                                           'items' => [
                                                                                        bless( {
                                                                                                 'subrule' => 'encoding',
                                                                                                 'expected' => undef,
                                                                                                 'min' => 0,
                                                                                                 'argcode' => undef,
                                                                                                 'max' => 1,
                                                                                                 'matchrule' => 0,
                                                                                                 'repspec' => '?',
                                                                                                 'lookahead' => 0,
                                                                                                 'line' => 5
                                                                                               }, 'Parse::RecDescent::Repetition' ),
                                                                                        bless( {
                                                                                                 'subrule' => 'directive',
                                                                                                 'expected' => undef,
                                                                                                 'min' => 0,
                                                                                                 'argcode' => undef,
                                                                                                 'max' => 100000000,
                                                                                                 'matchrule' => 0,
                                                                                                 'repspec' => 's?',
                                                                                                 'lookahead' => 0,
                                                                                                 'line' => 5
                                                                                               }, 'Parse::RecDescent::Repetition' ),
                                                                                        bless( {
                                                                                                 'subrule' => 'component',
                                                                                                 'expected' => undef,
                                                                                                 'min' => 1,
                                                                                                 'argcode' => undef,
                                                                                                 'max' => 100000000,
                                                                                                 'matchrule' => 0,
                                                                                                 'repspec' => 's',
                                                                                                 'lookahead' => 0,
                                                                                                 'line' => 5
                                                                                               }, 'Parse::RecDescent::Repetition' ),
                                                                                        bless( {
                                                                                                 'hashname' => '__ACTION1__',
                                                                                                 'lookahead' => 0,
                                                                                                 'line' => 6,
                                                                                                 'code' => '{
			my $tm = $arg{tm};
			my @mentioned;

			foreach my $d (@{$item{\'directive(s?)\'}}) { # walk over directives, some contain components
			  push @{$item{\'component(s)\'}}, $d->{components} if ($d->{components});
			}

			foreach my $cs (@{$item{\'component(s)\'}}) {
			  foreach my $c (@{$cs}) {
			    if (ref($c) eq \'XTM::topic\') {
			      $tm->add ($c);
			      push @mentioned, @{$c->connected};
			    } elsif (ref ($c) eq \'XTM::association\') {
			      $tm->add ($c);
			      push @mentioned, @{$c->connected};
			    } elsif (ref($c) eq \'HASH\') {     # is an occurrence with a topic
			      my $t;
			      eval {                          # try to find this topic
				$t = $tm->topic ($c->{topic});
			      }; if ($@) {                    # we have an occurrence but no topic
				$t = new XTM::topic (id => $c->{topic});
				$tm->add_topic ($t);
			      };
			      $t->add__s ($c->{occurrence});
			      push @mentioned, @{$t->connected};
			    } else {
			      die "XTM::LTM::Parser: Unexpected component \'".ref($c)."\'";
			    }
			  }
			}
			foreach my $href (@mentioned) {
#			  warn "testing:".$href;
			  use URI;
			  my $u = new URI ($href);
			  next if $u->scheme; # external
			  my $tid = $u->fragment;
			  next if $tm->is_topic ($tid);
			  $tm->add_topic (new XTM::topic (id => $tid));
			}

		      }'
                                                                                               }, 'Parse::RecDescent::Action' )
                                                                                      ],
                                                                           'line' => undef
                                                                         }, 'Parse::RecDescent::Production' )
                                                                ],
                                                     'name' => 'topicmap',
                                                     'vars' => '',
                                                     'line' => 5
                                                   }, 'Parse::RecDescent::Rule' ),
                              'encoding' => bless( {
                                                     'impcount' => 0,
                                                     'calls' => [
                                                                  'string'
                                                                ],
                                                     'changed' => 0,
                                                     'opcount' => 0,
                                                     'prods' => [
                                                                  bless( {
                                                                           'number' => '0',
                                                                           'strcount' => 1,
                                                                           'dircount' => 0,
                                                                           'uncommit' => undef,
                                                                           'error' => undef,
                                                                           'patcount' => 0,
                                                                           'actcount' => 0,
                                                                           'items' => [
                                                                                        bless( {
                                                                                                 'pattern' => '@',
                                                                                                 'hashname' => '__STRING1__',
                                                                                                 'description' => '\'@\'',
                                                                                                 'lookahead' => 0,
                                                                                                 'line' => 51
                                                                                               }, 'Parse::RecDescent::Literal' ),
                                                                                        bless( {
                                                                                                 'subrule' => 'string',
                                                                                                 'matchrule' => 0,
                                                                                                 'implicit' => undef,
                                                                                                 'argcode' => undef,
                                                                                                 'lookahead' => 0,
                                                                                                 'line' => 51
                                                                                               }, 'Parse::RecDescent::Subrule' )
                                                                                      ],
                                                                           'line' => undef
                                                                         }, 'Parse::RecDescent::Production' )
                                                                ],
                                                     'name' => 'encoding',
                                                     'vars' => '',
                                                     'line' => 51
                                                   }, 'Parse::RecDescent::Rule' ),
                              'topic' => bless( {
                                                  'impcount' => 0,
                                                  'calls' => [
                                                               'name',
                                                               'types',
                                                               'topname',
                                                               'subject',
                                                               'indicator'
                                                             ],
                                                  'changed' => 0,
                                                  'opcount' => 0,
                                                  'prods' => [
                                                               bless( {
                                                                        'number' => '0',
                                                                        'strcount' => 2,
                                                                        'dircount' => 0,
                                                                        'uncommit' => undef,
                                                                        'error' => undef,
                                                                        'patcount' => 0,
                                                                        'actcount' => 1,
                                                                        'items' => [
                                                                                     bless( {
                                                                                              'pattern' => '[',
                                                                                              'hashname' => '__STRING1__',
                                                                                              'description' => '\'[\'',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 101
                                                                                            }, 'Parse::RecDescent::Literal' ),
                                                                                     bless( {
                                                                                              'subrule' => 'name',
                                                                                              'matchrule' => 0,
                                                                                              'implicit' => undef,
                                                                                              'argcode' => undef,
                                                                                              'lookahead' => 0,
                                                                                              'line' => 101
                                                                                            }, 'Parse::RecDescent::Subrule' ),
                                                                                     bless( {
                                                                                              'subrule' => 'types',
                                                                                              'expected' => undef,
                                                                                              'min' => 0,
                                                                                              'argcode' => undef,
                                                                                              'max' => 1,
                                                                                              'matchrule' => 0,
                                                                                              'repspec' => '?',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 101
                                                                                            }, 'Parse::RecDescent::Repetition' ),
                                                                                     bless( {
                                                                                              'subrule' => 'topname',
                                                                                              'expected' => undef,
                                                                                              'min' => 0,
                                                                                              'argcode' => undef,
                                                                                              'max' => 100000000,
                                                                                              'matchrule' => 0,
                                                                                              'repspec' => 's?',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 101
                                                                                            }, 'Parse::RecDescent::Repetition' ),
                                                                                     bless( {
                                                                                              'subrule' => 'subject',
                                                                                              'expected' => undef,
                                                                                              'min' => 0,
                                                                                              'argcode' => undef,
                                                                                              'max' => 1,
                                                                                              'matchrule' => 0,
                                                                                              'repspec' => '?',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 101
                                                                                            }, 'Parse::RecDescent::Repetition' ),
                                                                                     bless( {
                                                                                              'subrule' => 'indicator',
                                                                                              'expected' => undef,
                                                                                              'min' => 0,
                                                                                              'argcode' => undef,
                                                                                              'max' => 100000000,
                                                                                              'matchrule' => 0,
                                                                                              'repspec' => 's?',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 101
                                                                                            }, 'Parse::RecDescent::Repetition' ),
                                                                                     bless( {
                                                                                              'pattern' => ']',
                                                                                              'hashname' => '__STRING2__',
                                                                                              'description' => '\']\'',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 101
                                                                                            }, 'Parse::RecDescent::Literal' ),
                                                                                     bless( {
                                                                                              'hashname' => '__ACTION1__',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 102,
                                                                                              'code' => '{
		       my @components; # here I collect all which I generate here

		       my $t = new XTM::topic (id => $item{name});

		       if (ref($item{\'types(?)\'})) {
			 foreach (@{$item{\'types(?)\'}->[0]}) {
			   $t->add__s (new XTM::instanceOf ( reference => new XTM::topicRef (href => "#$_")));
			 }
		       };
		       $t->add__s (new XTM::instanceOf ( reference => new XTM::topicRef (href => $XTM::PSI::xtm{topic})))
		          unless $t->instanceOfs && @{$t->instanceOfs};

		       if (ref($item{\'topname(s?)\'})) {
			 foreach my $bn (@{$item{\'topname(s?)\'}}) {
			   my $b = new XTM::baseName ();
			   $b->add_baseNameString (new XTM::baseNameString (string => $bn->{basename}));
			   $b->add_scope          (new XTM::scope());
			   if (ref ($bn->{scope}) && @{$bn->{scope}}) { # list of scopes defined
			     foreach my $s (@{$bn->{scope}}) {
			       $b->scope->add_reference_s (new XTM::topicRef (href => $s));
			     }
			   } else { # default
			     $b->scope->add_reference_s (new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) );
			   }
			   $t->add__s ($b);
			 }
		       }


		       #use Data::Dumper;
		       #print Dumper $item{\'subject(?)\'};

		       my $s = new XTM::subjectIdentity (); # maybe we need it
		       if (ref ($item{\'subject(?)\'}) && @{$item{\'subject(?)\'}}) {
			 $s->add_ ( $item{\'subject(?)\'}->[0]);
		       }

		       if (ref($item{\'indicator(s?)\'})) {
			 foreach my $sin (@{$item{\'indicator(s?)\'}}) {
			   $s->add_reference_s ($sin);
			 }
		       }
		       $t->add_subjectIdentity ($s) if $s->references || $s->resourceRef; # only add it if we found at least one reference

#		       use Data::Dumper;
#		       print Dumper $t;

		       push @components, $t;
		       $return = \\@components;
		      }'
                                                                                            }, 'Parse::RecDescent::Action' )
                                                                                   ],
                                                                        'line' => undef
                                                                      }, 'Parse::RecDescent::Production' )
                                                             ],
                                                  'name' => 'topic',
                                                  'vars' => '',
                                                  'line' => 101
                                                }, 'Parse::RecDescent::Rule' ),
                              'sortname' => bless( {
                                                     'impcount' => 0,
                                                     'calls' => [
                                                                  'string'
                                                                ],
                                                     'changed' => 0,
                                                     'opcount' => 0,
                                                     'prods' => [
                                                                  bless( {
                                                                           'number' => '0',
                                                                           'strcount' => 0,
                                                                           'dircount' => 0,
                                                                           'uncommit' => undef,
                                                                           'error' => undef,
                                                                           'patcount' => 0,
                                                                           'actcount' => 0,
                                                                           'items' => [
                                                                                        bless( {
                                                                                                 'subrule' => 'string',
                                                                                                 'matchrule' => 0,
                                                                                                 'implicit' => undef,
                                                                                                 'argcode' => undef,
                                                                                                 'lookahead' => 0,
                                                                                                 'line' => 178
                                                                                               }, 'Parse::RecDescent::Subrule' )
                                                                                      ],
                                                                           'line' => undef
                                                                         }, 'Parse::RecDescent::Production' )
                                                                ],
                                                     'name' => 'sortname',
                                                     'vars' => '',
                                                     'line' => 178
                                                   }, 'Parse::RecDescent::Rule' ),
                              'occtype' => bless( {
                                                    'impcount' => 0,
                                                    'calls' => [
                                                                 'name'
                                                               ],
                                                    'changed' => 0,
                                                    'opcount' => 0,
                                                    'prods' => [
                                                                 bless( {
                                                                          'number' => '0',
                                                                          'strcount' => 0,
                                                                          'dircount' => 0,
                                                                          'uncommit' => undef,
                                                                          'error' => undef,
                                                                          'patcount' => 0,
                                                                          'actcount' => 0,
                                                                          'items' => [
                                                                                       bless( {
                                                                                                'subrule' => 'name',
                                                                                                'matchrule' => 0,
                                                                                                'implicit' => undef,
                                                                                                'argcode' => undef,
                                                                                                'lookahead' => 0,
                                                                                                'line' => 268
                                                                                              }, 'Parse::RecDescent::Subrule' )
                                                                                     ],
                                                                          'line' => undef
                                                                        }, 'Parse::RecDescent::Production' )
                                                               ],
                                                    'name' => 'occtype',
                                                    'vars' => '',
                                                    'line' => 268
                                                  }, 'Parse::RecDescent::Rule' ),
                              'subject' => bless( {
                                                    'impcount' => 0,
                                                    'calls' => [
                                                                 'uri'
                                                               ],
                                                    'changed' => 0,
                                                    'opcount' => 0,
                                                    'prods' => [
                                                                 bless( {
                                                                          'number' => '0',
                                                                          'strcount' => 1,
                                                                          'dircount' => 0,
                                                                          'uncommit' => undef,
                                                                          'error' => undef,
                                                                          'patcount' => 0,
                                                                          'actcount' => 1,
                                                                          'items' => [
                                                                                       bless( {
                                                                                                'pattern' => '%',
                                                                                                'hashname' => '__STRING1__',
                                                                                                'description' => '\'%\'',
                                                                                                'lookahead' => 0,
                                                                                                'line' => 156
                                                                                              }, 'Parse::RecDescent::Literal' ),
                                                                                       bless( {
                                                                                                'subrule' => 'uri',
                                                                                                'matchrule' => 0,
                                                                                                'implicit' => undef,
                                                                                                'argcode' => undef,
                                                                                                'lookahead' => 0,
                                                                                                'line' => 156
                                                                                              }, 'Parse::RecDescent::Subrule' ),
                                                                                       bless( {
                                                                                                'hashname' => '__ACTION1__',
                                                                                                'lookahead' => 0,
                                                                                                'line' => 157,
                                                                                                'code' => '{
			$return = new XTM::resourceRef (href => $item{uri});
		      }'
                                                                                              }, 'Parse::RecDescent::Action' )
                                                                                     ],
                                                                          'line' => undef
                                                                        }, 'Parse::RecDescent::Production' )
                                                               ],
                                                    'name' => 'subject',
                                                    'vars' => '',
                                                    'line' => 156
                                                  }, 'Parse::RecDescent::Rule' ),
                              'name' => bless( {
                                                 'impcount' => 0,
                                                 'calls' => [],
                                                 'changed' => 0,
                                                 'opcount' => 0,
                                                 'prods' => [
                                                              bless( {
                                                                       'number' => '0',
                                                                       'strcount' => 0,
                                                                       'dircount' => 0,
                                                                       'uncommit' => undef,
                                                                       'error' => undef,
                                                                       'patcount' => 1,
                                                                       'actcount' => 0,
                                                                       'items' => [
                                                                                    bless( {
                                                                                             'pattern' => '^\\w[-\\w]*',
                                                                                             'hashname' => '__PATTERN1__',
                                                                                             'description' => '/^\\\\w[-\\\\w]*/',
                                                                                             'lookahead' => 0,
                                                                                             'rdelim' => '/',
                                                                                             'line' => 287,
                                                                                             'mod' => '',
                                                                                             'ldelim' => '/'
                                                                                           }, 'Parse::RecDescent::Token' )
                                                                                  ],
                                                                       'line' => undef
                                                                     }, 'Parse::RecDescent::Production' )
                                                            ],
                                                 'name' => 'name',
                                                 'vars' => '',
                                                 'line' => 287
                                               }, 'Parse::RecDescent::Rule' ),
                              'tau_expr' => bless( {
                                                     'impcount' => 0,
                                                     'calls' => [
                                                                  'string'
                                                                ],
                                                     'changed' => 0,
                                                     'opcount' => 0,
                                                     'prods' => [
                                                                  bless( {
                                                                           'number' => '0',
                                                                           'strcount' => 0,
                                                                           'dircount' => 0,
                                                                           'uncommit' => undef,
                                                                           'error' => undef,
                                                                           'patcount' => 0,
                                                                           'actcount' => 0,
                                                                           'items' => [
                                                                                        bless( {
                                                                                                 'subrule' => 'string',
                                                                                                 'matchrule' => 0,
                                                                                                 'implicit' => undef,
                                                                                                 'argcode' => undef,
                                                                                                 'lookahead' => 0,
                                                                                                 'line' => 94
                                                                                               }, 'Parse::RecDescent::Subrule' )
                                                                                      ],
                                                                           'line' => undef
                                                                         }, 'Parse::RecDescent::Production' )
                                                                ],
                                                     'name' => 'tau_expr',
                                                     'vars' => '',
                                                     'line' => 94
                                                   }, 'Parse::RecDescent::Rule' ),
                              'data' => bless( {
                                                 'impcount' => 0,
                                                 'calls' => [],
                                                 'changed' => 0,
                                                 'opcount' => 0,
                                                 'prods' => [
                                                              bless( {
                                                                       'number' => '0',
                                                                       'strcount' => 2,
                                                                       'dircount' => 0,
                                                                       'uncommit' => undef,
                                                                       'error' => undef,
                                                                       'patcount' => 1,
                                                                       'actcount' => 1,
                                                                       'items' => [
                                                                                    bless( {
                                                                                             'pattern' => '[[',
                                                                                             'hashname' => '__STRING1__',
                                                                                             'description' => '\'[[\'',
                                                                                             'lookahead' => 0,
                                                                                             'line' => 279
                                                                                           }, 'Parse::RecDescent::Literal' ),
                                                                                    bless( {
                                                                                             'pattern' => '.*(?=\\]\\])',
                                                                                             'hashname' => '__PATTERN1__',
                                                                                             'description' => '/.*(?=\\\\]\\\\])/sx',
                                                                                             'lookahead' => 0,
                                                                                             'rdelim' => '/',
                                                                                             'line' => 279,
                                                                                             'mod' => 'sx',
                                                                                             'ldelim' => '/'
                                                                                           }, 'Parse::RecDescent::Token' ),
                                                                                    bless( {
                                                                                             'pattern' => ']]',
                                                                                             'hashname' => '__STRING2__',
                                                                                             'description' => '\']]\'',
                                                                                             'lookahead' => 0,
                                                                                             'line' => 279
                                                                                           }, 'Parse::RecDescent::Literal' ),
                                                                                    bless( {
                                                                                             'hashname' => '__ACTION1__',
                                                                                             'lookahead' => 0,
                                                                                             'line' => 279,
                                                                                             'code' => '{ $return = $item[2]; }'
                                                                                           }, 'Parse::RecDescent::Action' )
                                                                                  ],
                                                                       'line' => undef
                                                                     }, 'Parse::RecDescent::Production' )
                                                            ],
                                                 'name' => 'data',
                                                 'vars' => '',
                                                 'line' => 279
                                               }, 'Parse::RecDescent::Rule' ),
                              'uri' => bless( {
                                                'impcount' => 0,
                                                'calls' => [
                                                             'string'
                                                           ],
                                                'changed' => 0,
                                                'opcount' => 0,
                                                'prods' => [
                                                             bless( {
                                                                      'number' => '0',
                                                                      'strcount' => 0,
                                                                      'dircount' => 0,
                                                                      'uncommit' => undef,
                                                                      'error' => undef,
                                                                      'patcount' => 0,
                                                                      'actcount' => 0,
                                                                      'items' => [
                                                                                   bless( {
                                                                                            'subrule' => 'string',
                                                                                            'matchrule' => 0,
                                                                                            'implicit' => undef,
                                                                                            'argcode' => undef,
                                                                                            'lookahead' => 0,
                                                                                            'line' => 281
                                                                                          }, 'Parse::RecDescent::Subrule' )
                                                                                 ],
                                                                      'line' => undef
                                                                    }, 'Parse::RecDescent::Production' )
                                                           ],
                                                'name' => 'uri',
                                                'vars' => '',
                                                'line' => 281
                                              }, 'Parse::RecDescent::Rule' ),
                              'type' => bless( {
                                                 'impcount' => 0,
                                                 'calls' => [
                                                              'name'
                                                            ],
                                                 'changed' => 0,
                                                 'opcount' => 0,
                                                 'prods' => [
                                                              bless( {
                                                                       'number' => '0',
                                                                       'strcount' => 1,
                                                                       'dircount' => 0,
                                                                       'uncommit' => undef,
                                                                       'error' => undef,
                                                                       'patcount' => 0,
                                                                       'actcount' => 0,
                                                                       'items' => [
                                                                                    bless( {
                                                                                             'pattern' => ':',
                                                                                             'hashname' => '__STRING1__',
                                                                                             'description' => '\':\'',
                                                                                             'lookahead' => 0,
                                                                                             'line' => 246
                                                                                           }, 'Parse::RecDescent::Literal' ),
                                                                                    bless( {
                                                                                             'subrule' => 'name',
                                                                                             'matchrule' => 0,
                                                                                             'implicit' => undef,
                                                                                             'argcode' => undef,
                                                                                             'lookahead' => 0,
                                                                                             'line' => 246
                                                                                           }, 'Parse::RecDescent::Subrule' )
                                                                                  ],
                                                                       'line' => undef
                                                                     }, 'Parse::RecDescent::Production' )
                                                            ],
                                                 'name' => 'type',
                                                 'vars' => '',
                                                 'line' => 246
                                               }, 'Parse::RecDescent::Rule' ),
                              'baseuri_directive' => bless( {
                                                              'impcount' => 0,
                                                              'calls' => [
                                                                           'uri'
                                                                         ],
                                                              'changed' => 0,
                                                              'opcount' => 0,
                                                              'prods' => [
                                                                           bless( {
                                                                                    'number' => '0',
                                                                                    'strcount' => 1,
                                                                                    'dircount' => 0,
                                                                                    'uncommit' => undef,
                                                                                    'error' => undef,
                                                                                    'patcount' => 0,
                                                                                    'actcount' => 0,
                                                                                    'items' => [
                                                                                                 bless( {
                                                                                                          'pattern' => '#BASEURI',
                                                                                                          'hashname' => '__STRING1__',
                                                                                                          'description' => '\'#BASEURI\'',
                                                                                                          'lookahead' => 0,
                                                                                                          'line' => 98
                                                                                                        }, 'Parse::RecDescent::Literal' ),
                                                                                                 bless( {
                                                                                                          'subrule' => 'uri',
                                                                                                          'matchrule' => 0,
                                                                                                          'implicit' => undef,
                                                                                                          'argcode' => undef,
                                                                                                          'lookahead' => 0,
                                                                                                          'line' => 98
                                                                                                        }, 'Parse::RecDescent::Subrule' )
                                                                                               ],
                                                                                    'line' => undef
                                                                                  }, 'Parse::RecDescent::Production' )
                                                                         ],
                                                              'name' => 'baseuri_directive',
                                                              'vars' => '',
                                                              'line' => 98
                                                            }, 'Parse::RecDescent::Rule' ),
                              'types' => bless( {
                                                  'impcount' => 0,
                                                  'calls' => [
                                                               'name'
                                                             ],
                                                  'changed' => 0,
                                                  'opcount' => 0,
                                                  'prods' => [
                                                               bless( {
                                                                        'number' => '0',
                                                                        'strcount' => 1,
                                                                        'dircount' => 0,
                                                                        'uncommit' => undef,
                                                                        'error' => undef,
                                                                        'patcount' => 0,
                                                                        'actcount' => 1,
                                                                        'items' => [
                                                                                     bless( {
                                                                                              'pattern' => ':',
                                                                                              'hashname' => '__STRING1__',
                                                                                              'description' => '\':\'',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 154
                                                                                            }, 'Parse::RecDescent::Literal' ),
                                                                                     bless( {
                                                                                              'subrule' => 'name',
                                                                                              'expected' => undef,
                                                                                              'min' => 1,
                                                                                              'argcode' => undef,
                                                                                              'max' => 100000000,
                                                                                              'matchrule' => 0,
                                                                                              'repspec' => 's',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 154
                                                                                            }, 'Parse::RecDescent::Repetition' ),
                                                                                     bless( {
                                                                                              'hashname' => '__ACTION1__',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 154,
                                                                                              'code' => '{ $return = $item[2]; }'
                                                                                            }, 'Parse::RecDescent::Action' )
                                                                                   ],
                                                                        'line' => undef
                                                                      }, 'Parse::RecDescent::Production' )
                                                             ],
                                                  'name' => 'types',
                                                  'vars' => '',
                                                  'line' => 154
                                                }, 'Parse::RecDescent::Rule' ),
                              'topname' => bless( {
                                                    'impcount' => 0,
                                                    'calls' => [
                                                                 'basename',
                                                                 'scope'
                                                               ],
                                                    'changed' => 0,
                                                    'opcount' => 0,
                                                    'prods' => [
                                                                 bless( {
                                                                          'number' => '0',
                                                                          'strcount' => 1,
                                                                          'dircount' => 0,
                                                                          'uncommit' => undef,
                                                                          'error' => undef,
                                                                          'patcount' => 0,
                                                                          'actcount' => 1,
                                                                          'items' => [
                                                                                       bless( {
                                                                                                'pattern' => '=',
                                                                                                'hashname' => '__STRING1__',
                                                                                                'description' => '\'=\'',
                                                                                                'lookahead' => 0,
                                                                                                'line' => 170
                                                                                              }, 'Parse::RecDescent::Literal' ),
                                                                                       bless( {
                                                                                                'subrule' => 'basename',
                                                                                                'matchrule' => 0,
                                                                                                'implicit' => undef,
                                                                                                'argcode' => undef,
                                                                                                'lookahead' => 0,
                                                                                                'line' => 170
                                                                                              }, 'Parse::RecDescent::Subrule' ),
                                                                                       bless( {
                                                                                                'subrule' => 'scope',
                                                                                                'expected' => undef,
                                                                                                'min' => 0,
                                                                                                'argcode' => undef,
                                                                                                'max' => 1,
                                                                                                'matchrule' => 0,
                                                                                                'repspec' => '?',
                                                                                                'lookahead' => 0,
                                                                                                'line' => 170
                                                                                              }, 'Parse::RecDescent::Repetition' ),
                                                                                       bless( {
                                                                                                'hashname' => '__ACTION1__',
                                                                                                'lookahead' => 0,
                                                                                                'line' => 171,
                                                                                                'code' => '{
			$return = { basename => $item[2],
				    scope    => $item[3] };
		      }'
                                                                                              }, 'Parse::RecDescent::Action' )
                                                                                     ],
                                                                          'line' => undef
                                                                        }, 'Parse::RecDescent::Production' )
                                                               ],
                                                    'name' => 'topname',
                                                    'vars' => '',
                                                    'line' => 170
                                                  }, 'Parse::RecDescent::Rule' ),
                              'occur' => bless( {
                                                  'impcount' => 0,
                                                  'calls' => [
                                                               'occtopic',
                                                               'occtype',
                                                               'resource',
                                                               'scope'
                                                             ],
                                                  'changed' => 0,
                                                  'opcount' => 0,
                                                  'prods' => [
                                                               bless( {
                                                                        'number' => '0',
                                                                        'strcount' => 4,
                                                                        'dircount' => 0,
                                                                        'uncommit' => undef,
                                                                        'error' => undef,
                                                                        'patcount' => 0,
                                                                        'actcount' => 1,
                                                                        'items' => [
                                                                                     bless( {
                                                                                              'pattern' => '{',
                                                                                              'hashname' => '__STRING1__',
                                                                                              'description' => '\'\\{\'',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 248
                                                                                            }, 'Parse::RecDescent::Literal' ),
                                                                                     bless( {
                                                                                              'subrule' => 'occtopic',
                                                                                              'matchrule' => 0,
                                                                                              'implicit' => undef,
                                                                                              'argcode' => undef,
                                                                                              'lookahead' => 0,
                                                                                              'line' => 248
                                                                                            }, 'Parse::RecDescent::Subrule' ),
                                                                                     bless( {
                                                                                              'pattern' => ',',
                                                                                              'hashname' => '__STRING2__',
                                                                                              'description' => '\',\'',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 248
                                                                                            }, 'Parse::RecDescent::Literal' ),
                                                                                     bless( {
                                                                                              'subrule' => 'occtype',
                                                                                              'matchrule' => 0,
                                                                                              'implicit' => undef,
                                                                                              'argcode' => undef,
                                                                                              'lookahead' => 0,
                                                                                              'line' => 248
                                                                                            }, 'Parse::RecDescent::Subrule' ),
                                                                                     bless( {
                                                                                              'pattern' => ',',
                                                                                              'hashname' => '__STRING3__',
                                                                                              'description' => '\',\'',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 248
                                                                                            }, 'Parse::RecDescent::Literal' ),
                                                                                     bless( {
                                                                                              'subrule' => 'resource',
                                                                                              'matchrule' => 0,
                                                                                              'implicit' => undef,
                                                                                              'argcode' => undef,
                                                                                              'lookahead' => 0,
                                                                                              'line' => 248
                                                                                            }, 'Parse::RecDescent::Subrule' ),
                                                                                     bless( {
                                                                                              'pattern' => '}',
                                                                                              'hashname' => '__STRING4__',
                                                                                              'description' => '\'\\}\'',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 248
                                                                                            }, 'Parse::RecDescent::Literal' ),
                                                                                     bless( {
                                                                                              'subrule' => 'scope',
                                                                                              'expected' => undef,
                                                                                              'min' => 0,
                                                                                              'argcode' => undef,
                                                                                              'max' => 1,
                                                                                              'matchrule' => 0,
                                                                                              'repspec' => '?',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 248
                                                                                            }, 'Parse::RecDescent::Repetition' ),
                                                                                     bless( {
                                                                                              'hashname' => '__ACTION1__',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 249,
                                                                                              'code' => '{
			my $o = new XTM::occurrence ();
			$o->add_resource ($item{resource});
			$o->add_scope    (new XTM::scope());
			foreach (@{$item{\'scope(?)\'}->[0]}) {
			  $o->scope->add_reference_s (new XTM::topicRef (href => "#$_"));
			}
			$o->scope->add_reference_s (new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) ) 
			  unless $o->scope->references;
			$o->add_instanceOf (new XTM::instanceOf ( reference => new XTM::topicRef (href => "#$item{occtype}")));

			$return = [ { topic      => $item{occtopic},
				      occurrence => $o, } ];

			#use Data::Dumper;
			#print "in occur: ", Dumper $return;
		      }'
                                                                                            }, 'Parse::RecDescent::Action' )
                                                                                   ],
                                                                        'line' => undef
                                                                      }, 'Parse::RecDescent::Production' )
                                                             ],
                                                  'name' => 'occur',
                                                  'vars' => '',
                                                  'line' => 248
                                                }, 'Parse::RecDescent::Rule' ),
                              '_alternation_1_of_production_1_of_rule_assocrole' => bless( {
                                                                                             'impcount' => 0,
                                                                                             'calls' => [
                                                                                                          'topic',
                                                                                                          'name'
                                                                                                        ],
                                                                                             'changed' => 0,
                                                                                             'opcount' => 0,
                                                                                             'prods' => [
                                                                                                          bless( {
                                                                                                                   'number' => '0',
                                                                                                                   'strcount' => 0,
                                                                                                                   'dircount' => 0,
                                                                                                                   'uncommit' => undef,
                                                                                                                   'error' => undef,
                                                                                                                   'patcount' => 0,
                                                                                                                   'actcount' => 0,
                                                                                                                   'items' => [
                                                                                                                                bless( {
                                                                                                                                         'subrule' => 'topic',
                                                                                                                                         'matchrule' => 0,
                                                                                                                                         'implicit' => undef,
                                                                                                                                         'argcode' => undef,
                                                                                                                                         'lookahead' => 0,
                                                                                                                                         'line' => 289
                                                                                                                                       }, 'Parse::RecDescent::Subrule' )
                                                                                                                              ],
                                                                                                                   'line' => undef
                                                                                                                 }, 'Parse::RecDescent::Production' ),
                                                                                                          bless( {
                                                                                                                   'number' => '1',
                                                                                                                   'strcount' => 0,
                                                                                                                   'dircount' => 0,
                                                                                                                   'uncommit' => undef,
                                                                                                                   'error' => undef,
                                                                                                                   'patcount' => 0,
                                                                                                                   'actcount' => 0,
                                                                                                                   'items' => [
                                                                                                                                bless( {
                                                                                                                                         'subrule' => 'name',
                                                                                                                                         'matchrule' => 0,
                                                                                                                                         'implicit' => undef,
                                                                                                                                         'argcode' => undef,
                                                                                                                                         'lookahead' => 0,
                                                                                                                                         'line' => 289
                                                                                                                                       }, 'Parse::RecDescent::Subrule' )
                                                                                                                              ],
                                                                                                                   'line' => 289
                                                                                                                 }, 'Parse::RecDescent::Production' )
                                                                                                        ],
                                                                                             'name' => '_alternation_1_of_production_1_of_rule_assocrole',
                                                                                             'vars' => '',
                                                                                             'line' => 289
                                                                                           }, 'Parse::RecDescent::Rule' ),
                              'assocrole' => bless( {
                                                      'impcount' => 1,
                                                      'calls' => [
                                                                   '_alternation_1_of_production_1_of_rule_assocrole',
                                                                   'type'
                                                                 ],
                                                      'changed' => 0,
                                                      'opcount' => 0,
                                                      'prods' => [
                                                                   bless( {
                                                                            'number' => '0',
                                                                            'strcount' => 0,
                                                                            'dircount' => 0,
                                                                            'uncommit' => undef,
                                                                            'error' => undef,
                                                                            'patcount' => 0,
                                                                            'actcount' => 1,
                                                                            'items' => [
                                                                                         bless( {
                                                                                                  'subrule' => '_alternation_1_of_production_1_of_rule_assocrole',
                                                                                                  'matchrule' => 0,
                                                                                                  'implicit' => 'topic, or name',
                                                                                                  'argcode' => undef,
                                                                                                  'lookahead' => 0,
                                                                                                  'line' => 220
                                                                                                }, 'Parse::RecDescent::Subrule' ),
                                                                                         bless( {
                                                                                                  'subrule' => 'type',
                                                                                                  'expected' => undef,
                                                                                                  'min' => 0,
                                                                                                  'argcode' => undef,
                                                                                                  'max' => 1,
                                                                                                  'matchrule' => 0,
                                                                                                  'repspec' => '?',
                                                                                                  'lookahead' => 0,
                                                                                                  'line' => 220
                                                                                                }, 'Parse::RecDescent::Repetition' ),
                                                                                         bless( {
                                                                                                  'hashname' => '__ACTION1__',
                                                                                                  'lookahead' => 0,
                                                                                                  'line' => 221,
                                                                                                  'code' => '{
			my $m = new XTM::member ();

#warn "type is ". Dumper $item{\'type(?)\'};
			if (scalar @{$item{\'type(?)\'}}) {
			  my $t = new XTM::topicRef (href => "#" . $item{\'type(?)\'}->[0]);
			  my $r = new XTM::roleSpec ();
			  $r->add_reference ($t);
			  $m->add_roleSpec ($r);
			}

#warn "item1 is ".$item[1];
			if (ref ($item[1]) eq \'ARRAY\') { # @components came back
			   # the deal is that there is ONLY one topic in this list
			   my $t = $item[1]->[0]; # we have the topic
			   $m->add_reference_s (new XTM::topicRef (href => \'#\'.$t->id));
			   $return = { member => $m, topic => $t };
			} elsif (!ref ($item[1])) {      # scalar => string
			    $m->add_reference_s (new XTM::topicRef (href => "#$item[1]"));
  			    $return = $m;
			} else {
			  die "XTM::LTM::Parser: internal consistency violation";
			}
		      }'
                                                                                                }, 'Parse::RecDescent::Action' )
                                                                                       ],
                                                                            'line' => undef
                                                                          }, 'Parse::RecDescent::Production' )
                                                                 ],
                                                      'name' => 'assocrole',
                                                      'vars' => '',
                                                      'line' => 220
                                                    }, 'Parse::RecDescent::Rule' ),
                              'dispname' => bless( {
                                                     'impcount' => 0,
                                                     'calls' => [
                                                                  'string'
                                                                ],
                                                     'changed' => 0,
                                                     'opcount' => 0,
                                                     'prods' => [
                                                                  bless( {
                                                                           'number' => '0',
                                                                           'strcount' => 0,
                                                                           'dircount' => 0,
                                                                           'uncommit' => undef,
                                                                           'error' => undef,
                                                                           'patcount' => 0,
                                                                           'actcount' => 0,
                                                                           'items' => [
                                                                                        bless( {
                                                                                                 'subrule' => 'string',
                                                                                                 'matchrule' => 0,
                                                                                                 'implicit' => undef,
                                                                                                 'argcode' => undef,
                                                                                                 'lookahead' => 0,
                                                                                                 'line' => 180
                                                                                               }, 'Parse::RecDescent::Subrule' )
                                                                                      ],
                                                                           'line' => undef
                                                                         }, 'Parse::RecDescent::Production' )
                                                                ],
                                                     'name' => 'dispname',
                                                     'vars' => '',
                                                     'line' => 180
                                                   }, 'Parse::RecDescent::Rule' ),
                              'mergemap_directive' => bless( {
                                                               'impcount' => 0,
                                                               'calls' => [
                                                                            'tau_expr',
                                                                            'tm_format'
                                                                          ],
                                                               'changed' => 0,
                                                               'opcount' => 0,
                                                               'prods' => [
                                                                            bless( {
                                                                                     'number' => '0',
                                                                                     'strcount' => 1,
                                                                                     'dircount' => 0,
                                                                                     'uncommit' => undef,
                                                                                     'error' => undef,
                                                                                     'patcount' => 0,
                                                                                     'actcount' => 1,
                                                                                     'items' => [
                                                                                                  bless( {
                                                                                                           'pattern' => '#MERGEMAP',
                                                                                                           'hashname' => '__STRING1__',
                                                                                                           'description' => '\'#MERGEMAP\'',
                                                                                                           'lookahead' => 0,
                                                                                                           'line' => 63
                                                                                                         }, 'Parse::RecDescent::Literal' ),
                                                                                                  bless( {
                                                                                                           'subrule' => 'tau_expr',
                                                                                                           'matchrule' => 0,
                                                                                                           'implicit' => undef,
                                                                                                           'argcode' => undef,
                                                                                                           'lookahead' => 0,
                                                                                                           'line' => 63
                                                                                                         }, 'Parse::RecDescent::Subrule' ),
                                                                                                  bless( {
                                                                                                           'subrule' => 'tm_format',
                                                                                                           'expected' => undef,
                                                                                                           'min' => 0,
                                                                                                           'argcode' => undef,
                                                                                                           'max' => 1,
                                                                                                           'matchrule' => 0,
                                                                                                           'repspec' => '?',
                                                                                                           'lookahead' => 0,
                                                                                                           'line' => 63
                                                                                                         }, 'Parse::RecDescent::Repetition' ),
                                                                                                  bless( {
                                                                                                           'hashname' => '__ACTION1__',
                                                                                                           'lookahead' => 0,
                                                                                                           'line' => 64,
                                                                                                           'code' => '{
#			warn "MERGEMAP: $item{tau_expr}, format $item{\'tm_format(?)\'}";
#			use Data::Dumper;
#			print Dumper $item{\'tm_format(?)\'};

			my $tm2; # will hold the new map
			if (scalar @{$item{\'tm_format(?)\'}}) {
			  my $format = $item{\'tm_format(?)\'}->[0];
			  use URI;
			  my $uri    = new URI ($item{tau_expr});
			  $uri->scheme (\'file\') unless $uri->scheme; # default is \'file:\'

			  if ($format =~ /ltm/i) {
			    $tm2 = new XTM (tie => new XTM::LTM   (url => $uri->as_string));
			  } elsif ($format =~ /astma/i) {
			    $tm2 = new XTM (tie => new XTM::AsTMa (url => $uri->as_string));
			  } elsif ($format =~ /xtm/i) {
			    $tm2 = new XTM (tie => new XTM::XML   (url => $uri->as_string));
			  } else {
			    die "XTM::LTM::Parser: Format \'$format\' not implemented";
			  }
			} else {
			  $tm2 = new XTM (tie => new XTM::Virtual (expr => $item{tau_expr}));
			}
			my @components;
			push @components, map {$tm2->topic($_)}       @{$tm2->topics};
			push @components, map {$tm2->association($_)} @{$tm2->associations};
			$return = { components => \\@components };
		      }'
                                                                                                         }, 'Parse::RecDescent::Action' )
                                                                                                ],
                                                                                     'line' => undef
                                                                                   }, 'Parse::RecDescent::Production' )
                                                                          ],
                                                               'name' => 'mergemap_directive',
                                                               'vars' => '',
                                                               'line' => 63
                                                             }, 'Parse::RecDescent::Rule' ),
                              'assoc' => bless( {
                                                  'impcount' => 0,
                                                  'calls' => [
                                                               'name',
                                                               'assocroles',
                                                               'scope'
                                                             ],
                                                  'changed' => 0,
                                                  'opcount' => 0,
                                                  'prods' => [
                                                               bless( {
                                                                        'number' => '0',
                                                                        'strcount' => 2,
                                                                        'dircount' => 0,
                                                                        'uncommit' => undef,
                                                                        'error' => undef,
                                                                        'patcount' => 0,
                                                                        'actcount' => 1,
                                                                        'items' => [
                                                                                     bless( {
                                                                                              'subrule' => 'name',
                                                                                              'matchrule' => 0,
                                                                                              'implicit' => undef,
                                                                                              'argcode' => undef,
                                                                                              'lookahead' => 0,
                                                                                              'line' => 184
                                                                                            }, 'Parse::RecDescent::Subrule' ),
                                                                                     bless( {
                                                                                              'pattern' => '(',
                                                                                              'hashname' => '__STRING1__',
                                                                                              'description' => '\'(\'',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 184
                                                                                            }, 'Parse::RecDescent::Literal' ),
                                                                                     bless( {
                                                                                              'subrule' => 'assocroles',
                                                                                              'matchrule' => 0,
                                                                                              'implicit' => undef,
                                                                                              'argcode' => undef,
                                                                                              'lookahead' => 0,
                                                                                              'line' => 184
                                                                                            }, 'Parse::RecDescent::Subrule' ),
                                                                                     bless( {
                                                                                              'pattern' => ')',
                                                                                              'hashname' => '__STRING2__',
                                                                                              'description' => '\')\'',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 184
                                                                                            }, 'Parse::RecDescent::Literal' ),
                                                                                     bless( {
                                                                                              'subrule' => 'scope',
                                                                                              'expected' => undef,
                                                                                              'min' => 0,
                                                                                              'argcode' => undef,
                                                                                              'max' => 1,
                                                                                              'matchrule' => 0,
                                                                                              'repspec' => '?',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 184
                                                                                            }, 'Parse::RecDescent::Repetition' ),
                                                                                     bless( {
                                                                                              'hashname' => '__ACTION1__',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 185,
                                                                                              'code' => '{
			my @components; # here I collect all which I generate here
			my $a = new XTM::association;

#			  use Data::Dumper;
#			  warn "scope : ".Dumper $item{\'scope(?)\'};

			my $s = new XTM::scope;
			foreach my $scope (@{$item{\'scope(?)\'}} ? @{$item{\'scope(?)\'}->[0]}: ()) {
			  $s->add_reference_s (new XTM::topicRef (href => "#$scope"));
			}
			unless ($s->references) {
			  $s->add_reference_s (new XTM::topicRef (href =>  $XTM::PSI::xtm{universal_scope}));
			}
			$a->add ($s);

                        $a->add_instanceOf (new XTM::instanceOf (reference => new XTM::topicRef (href => "#$item{name}")));

#			warn "assocrole is : ".Dumper $item{assocroles};
 			foreach (@{$item{assocroles}}) {
			  if (ref ($_) eq \'XTM::member\') {
			    $a->add__s ($_);
			  } elsif (ref ($_) eq \'HASH\') {
			    $a->add__s ($_->{member});
			    push @components, $_->{topic};
			  }
		        }


			push @components, $a;
			$return = \\@components;
		      }'
                                                                                            }, 'Parse::RecDescent::Action' )
                                                                                   ],
                                                                        'line' => undef
                                                                      }, 'Parse::RecDescent::Production' )
                                                             ],
                                                  'name' => 'assoc',
                                                  'vars' => '',
                                                  'line' => 184
                                                }, 'Parse::RecDescent::Rule' ),
                              'basename' => bless( {
                                                     'impcount' => 0,
                                                     'calls' => [
                                                                  'string'
                                                                ],
                                                     'changed' => 0,
                                                     'opcount' => 0,
                                                     'prods' => [
                                                                  bless( {
                                                                           'number' => '0',
                                                                           'strcount' => 0,
                                                                           'dircount' => 0,
                                                                           'uncommit' => undef,
                                                                           'error' => undef,
                                                                           'patcount' => 0,
                                                                           'actcount' => 0,
                                                                           'items' => [
                                                                                        bless( {
                                                                                                 'subrule' => 'string',
                                                                                                 'matchrule' => 0,
                                                                                                 'implicit' => undef,
                                                                                                 'argcode' => undef,
                                                                                                 'lookahead' => 0,
                                                                                                 'line' => 176
                                                                                               }, 'Parse::RecDescent::Subrule' )
                                                                                      ],
                                                                           'line' => undef
                                                                         }, 'Parse::RecDescent::Production' )
                                                                ],
                                                     'name' => 'basename',
                                                     'vars' => '',
                                                     'line' => 176
                                                   }, 'Parse::RecDescent::Rule' ),
                              'resource' => bless( {
                                                     'impcount' => 0,
                                                     'calls' => [
                                                                  'uri',
                                                                  'data'
                                                                ],
                                                     'changed' => 0,
                                                     'opcount' => 0,
                                                     'prods' => [
                                                                  bless( {
                                                                           'number' => '0',
                                                                           'strcount' => 0,
                                                                           'dircount' => 0,
                                                                           'uncommit' => undef,
                                                                           'error' => undef,
                                                                           'patcount' => 0,
                                                                           'actcount' => 1,
                                                                           'items' => [
                                                                                        bless( {
                                                                                                 'subrule' => 'uri',
                                                                                                 'matchrule' => 0,
                                                                                                 'implicit' => undef,
                                                                                                 'argcode' => undef,
                                                                                                 'lookahead' => 0,
                                                                                                 'line' => 270
                                                                                               }, 'Parse::RecDescent::Subrule' ),
                                                                                        bless( {
                                                                                                 'hashname' => '__ACTION1__',
                                                                                                 'lookahead' => 0,
                                                                                                 'line' => 271,
                                                                                                 'code' => '{
			$return = new XTM::resourceRef (href => $item{uri});
		      }'
                                                                                               }, 'Parse::RecDescent::Action' )
                                                                                      ],
                                                                           'line' => undef
                                                                         }, 'Parse::RecDescent::Production' ),
                                                                  bless( {
                                                                           'number' => '1',
                                                                           'strcount' => 0,
                                                                           'dircount' => 0,
                                                                           'uncommit' => undef,
                                                                           'error' => undef,
                                                                           'patcount' => 0,
                                                                           'actcount' => 1,
                                                                           'items' => [
                                                                                        bless( {
                                                                                                 'subrule' => 'data',
                                                                                                 'matchrule' => 0,
                                                                                                 'implicit' => undef,
                                                                                                 'argcode' => undef,
                                                                                                 'lookahead' => 0,
                                                                                                 'line' => 274
                                                                                               }, 'Parse::RecDescent::Subrule' ),
                                                                                        bless( {
                                                                                                 'hashname' => '__ACTION1__',
                                                                                                 'lookahead' => 0,
                                                                                                 'line' => 275,
                                                                                                 'code' => '{
			$return = new XTM::resourceData (data => $item{data});
		      }'
                                                                                               }, 'Parse::RecDescent::Action' )
                                                                                      ],
                                                                           'line' => 274
                                                                         }, 'Parse::RecDescent::Production' )
                                                                ],
                                                     'name' => 'resource',
                                                     'vars' => '',
                                                     'line' => 270
                                                   }, 'Parse::RecDescent::Rule' ),
                              'component' => bless( {
                                                      'impcount' => 0,
                                                      'calls' => [
                                                                   'topic',
                                                                   'assoc',
                                                                   'occur'
                                                                 ],
                                                      'changed' => 0,
                                                      'opcount' => 0,
                                                      'prods' => [
                                                                   bless( {
                                                                            'number' => '0',
                                                                            'strcount' => 0,
                                                                            'dircount' => 0,
                                                                            'uncommit' => undef,
                                                                            'error' => undef,
                                                                            'patcount' => 0,
                                                                            'actcount' => 0,
                                                                            'items' => [
                                                                                         bless( {
                                                                                                  'subrule' => 'topic',
                                                                                                  'matchrule' => 0,
                                                                                                  'implicit' => undef,
                                                                                                  'argcode' => undef,
                                                                                                  'lookahead' => 0,
                                                                                                  'line' => 49
                                                                                                }, 'Parse::RecDescent::Subrule' )
                                                                                       ],
                                                                            'line' => undef
                                                                          }, 'Parse::RecDescent::Production' ),
                                                                   bless( {
                                                                            'number' => '1',
                                                                            'strcount' => 0,
                                                                            'dircount' => 0,
                                                                            'uncommit' => undef,
                                                                            'error' => undef,
                                                                            'patcount' => 0,
                                                                            'actcount' => 0,
                                                                            'items' => [
                                                                                         bless( {
                                                                                                  'subrule' => 'assoc',
                                                                                                  'matchrule' => 0,
                                                                                                  'implicit' => undef,
                                                                                                  'argcode' => undef,
                                                                                                  'lookahead' => 0,
                                                                                                  'line' => 49
                                                                                                }, 'Parse::RecDescent::Subrule' )
                                                                                       ],
                                                                            'line' => 49
                                                                          }, 'Parse::RecDescent::Production' ),
                                                                   bless( {
                                                                            'number' => '2',
                                                                            'strcount' => 0,
                                                                            'dircount' => 0,
                                                                            'uncommit' => undef,
                                                                            'error' => undef,
                                                                            'patcount' => 0,
                                                                            'actcount' => 0,
                                                                            'items' => [
                                                                                         bless( {
                                                                                                  'subrule' => 'occur',
                                                                                                  'matchrule' => 0,
                                                                                                  'implicit' => undef,
                                                                                                  'argcode' => undef,
                                                                                                  'lookahead' => 0,
                                                                                                  'line' => 49
                                                                                                }, 'Parse::RecDescent::Subrule' )
                                                                                       ],
                                                                            'line' => 49
                                                                          }, 'Parse::RecDescent::Production' )
                                                                 ],
                                                      'name' => 'component',
                                                      'vars' => '',
                                                      'line' => 49
                                                    }, 'Parse::RecDescent::Rule' ),
                              'comment' => bless( {
                                                    'impcount' => 0,
                                                    'calls' => [],
                                                    'changed' => 0,
                                                    'opcount' => 0,
                                                    'prods' => [
                                                                 bless( {
                                                                          'number' => '0',
                                                                          'strcount' => 2,
                                                                          'dircount' => 0,
                                                                          'uncommit' => undef,
                                                                          'error' => undef,
                                                                          'patcount' => 1,
                                                                          'actcount' => 0,
                                                                          'items' => [
                                                                                       bless( {
                                                                                                'pattern' => '/*',
                                                                                                'hashname' => '__STRING1__',
                                                                                                'description' => '\'/*\'',
                                                                                                'lookahead' => 0,
                                                                                                'line' => 283
                                                                                              }, 'Parse::RecDescent::Literal' ),
                                                                                       bless( {
                                                                                                'pattern' => '.+',
                                                                                                'hashname' => '__PATTERN1__',
                                                                                                'description' => '/.+/',
                                                                                                'lookahead' => 0,
                                                                                                'rdelim' => '/',
                                                                                                'line' => 283,
                                                                                                'mod' => '',
                                                                                                'ldelim' => '/'
                                                                                              }, 'Parse::RecDescent::Token' ),
                                                                                       bless( {
                                                                                                'pattern' => '*/',
                                                                                                'hashname' => '__STRING2__',
                                                                                                'description' => '\'*/\'',
                                                                                                'lookahead' => 0,
                                                                                                'line' => 283
                                                                                              }, 'Parse::RecDescent::Literal' )
                                                                                     ],
                                                                          'line' => undef
                                                                        }, 'Parse::RecDescent::Production' )
                                                               ],
                                                    'name' => 'comment',
                                                    'vars' => '',
                                                    'line' => 283
                                                  }, 'Parse::RecDescent::Rule' ),
                              'indicator' => bless( {
                                                      'impcount' => 0,
                                                      'calls' => [
                                                                   'uri'
                                                                 ],
                                                      'changed' => 0,
                                                      'opcount' => 0,
                                                      'prods' => [
                                                                   bless( {
                                                                            'number' => '0',
                                                                            'strcount' => 1,
                                                                            'dircount' => 0,
                                                                            'uncommit' => undef,
                                                                            'error' => undef,
                                                                            'patcount' => 0,
                                                                            'actcount' => 1,
                                                                            'items' => [
                                                                                         bless( {
                                                                                                  'pattern' => '@',
                                                                                                  'hashname' => '__STRING1__',
                                                                                                  'description' => '\'@\'',
                                                                                                  'lookahead' => 0,
                                                                                                  'line' => 161
                                                                                                }, 'Parse::RecDescent::Literal' ),
                                                                                         bless( {
                                                                                                  'subrule' => 'uri',
                                                                                                  'matchrule' => 0,
                                                                                                  'implicit' => undef,
                                                                                                  'argcode' => undef,
                                                                                                  'lookahead' => 0,
                                                                                                  'line' => 161
                                                                                                }, 'Parse::RecDescent::Subrule' ),
                                                                                         bless( {
                                                                                                  'hashname' => '__ACTION1__',
                                                                                                  'lookahead' => 0,
                                                                                                  'line' => 162,
                                                                                                  'code' => '{
			use URI;
			my $u = URI->new ($item{uri});
			$return = ref ($u) eq \'URI::_generic\' ? 
			  new XTM::topicRef (href => $item{uri}) :
			    new XTM::subjectIndicatorRef (href => $item{uri});
		      }'
                                                                                                }, 'Parse::RecDescent::Action' )
                                                                                       ],
                                                                            'line' => undef
                                                                          }, 'Parse::RecDescent::Production' )
                                                                 ],
                                                      'name' => 'indicator',
                                                      'vars' => '',
                                                      'line' => 161
                                                    }, 'Parse::RecDescent::Rule' ),
                              'directive' => bless( {
                                                      'impcount' => 0,
                                                      'calls' => [
                                                                   'topicmapid_directive',
                                                                   'mergemap_directive',
                                                                   'baseuri_directive'
                                                                 ],
                                                      'changed' => 0,
                                                      'opcount' => 0,
                                                      'prods' => [
                                                                   bless( {
                                                                            'number' => '0',
                                                                            'strcount' => 0,
                                                                            'dircount' => 0,
                                                                            'uncommit' => undef,
                                                                            'error' => undef,
                                                                            'patcount' => 0,
                                                                            'actcount' => 0,
                                                                            'items' => [
                                                                                         bless( {
                                                                                                  'subrule' => 'topicmapid_directive',
                                                                                                  'matchrule' => 0,
                                                                                                  'implicit' => undef,
                                                                                                  'argcode' => undef,
                                                                                                  'lookahead' => 0,
                                                                                                  'line' => 54
                                                                                                }, 'Parse::RecDescent::Subrule' )
                                                                                       ],
                                                                            'line' => undef
                                                                          }, 'Parse::RecDescent::Production' ),
                                                                   bless( {
                                                                            'number' => '1',
                                                                            'strcount' => 0,
                                                                            'dircount' => 0,
                                                                            'uncommit' => undef,
                                                                            'error' => undef,
                                                                            'patcount' => 0,
                                                                            'actcount' => 0,
                                                                            'items' => [
                                                                                         bless( {
                                                                                                  'subrule' => 'mergemap_directive',
                                                                                                  'matchrule' => 0,
                                                                                                  'implicit' => undef,
                                                                                                  'argcode' => undef,
                                                                                                  'lookahead' => 0,
                                                                                                  'line' => 55
                                                                                                }, 'Parse::RecDescent::Subrule' )
                                                                                       ],
                                                                            'line' => 54
                                                                          }, 'Parse::RecDescent::Production' ),
                                                                   bless( {
                                                                            'number' => '2',
                                                                            'strcount' => 0,
                                                                            'dircount' => 0,
                                                                            'uncommit' => undef,
                                                                            'error' => undef,
                                                                            'patcount' => 0,
                                                                            'actcount' => 0,
                                                                            'items' => [
                                                                                         bless( {
                                                                                                  'subrule' => 'baseuri_directive',
                                                                                                  'matchrule' => 0,
                                                                                                  'implicit' => undef,
                                                                                                  'argcode' => undef,
                                                                                                  'lookahead' => 0,
                                                                                                  'line' => 56
                                                                                                }, 'Parse::RecDescent::Subrule' )
                                                                                       ],
                                                                            'line' => 55
                                                                          }, 'Parse::RecDescent::Production' )
                                                                 ],
                                                      'name' => 'directive',
                                                      'vars' => '',
                                                      'line' => 52
                                                    }, 'Parse::RecDescent::Rule' )
                            }
               }, 'Parse::RecDescent' );
}