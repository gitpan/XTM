package XTM::Path::CParser;
use Parse::RecDescent;

{ my $ERRORS;


package Parse::RecDescent::namespace000001;
use strict;
use vars qw($skip $AUTOLOAD  );
$skip = '\s*';


{
local $SIG{__WARN__} = sub {0};
# PRETEND TO BE IN Parse::RecDescent NAMESPACE
*Parse::RecDescent::namespace000001::AUTOLOAD	= sub
{
	no strict 'refs';
	$AUTOLOAD =~ s/^Parse::RecDescent::namespace000001/Parse::RecDescent/;
	goto &{$AUTOLOAD};
}
}

push @Parse::RecDescent::namespace000001::ISA, 'Parse::RecDescent';
# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::simple_expr
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"simple_expr"};
	
	Parse::RecDescent::_trace(q{Trying rule: [simple_expr]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{simple_expr})
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
		
		Parse::RecDescent::_trace(q{Trying production: [path op_value]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{simple_expr})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{simple_expr});
		%item = (__RULE__ => q{simple_expr});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [path]},
				  Parse::RecDescent::_tracefirst($text),
				  q{simple_expr})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::path($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [path]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{simple_expr})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [path]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{simple_expr})
						if defined $::RD_TRACE;
		$item{q{path}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying repeated subrule: [op_value]},
				  Parse::RecDescent::_tracefirst($text),
				  q{simple_expr})
					if defined $::RD_TRACE;
		$expectation->is(q{op_value})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::op_value, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [op_value]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{simple_expr})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [op_value]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{simple_expr})
						if defined $::RD_TRACE;
		$item{q{op_value}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{simple_expr})
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			   $return = [ $item{path} ];
			   if ($item{op_value} && $item{op_value}->[0]) {
			     push @$return, @{$item{op_value}->[0]};
			   }
			 };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [path op_value]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{simple_expr})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{simple_expr})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{simple_expr})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{simple_expr});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{simple_expr})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::_alternation_1_of_production_1_of_rule_XTM_attribute
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"_alternation_1_of_production_1_of_rule_XTM_attribute"};
	
	Parse::RecDescent::_trace(q{Trying rule: [_alternation_1_of_production_1_of_rule_XTM_attribute]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{_alternation_1_of_production_1_of_rule_XTM_attribute})
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
		
		Parse::RecDescent::_trace(q{Trying production: ['href']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_attribute})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_attribute});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_attribute});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['href']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_attribute})
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\Ahref//)
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['href']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_attribute})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['id']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_attribute})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_attribute});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_attribute});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['id']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_attribute})
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\Aid//)
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['id']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_attribute})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{_alternation_1_of_production_1_of_rule_XTM_attribute})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{_alternation_1_of_production_1_of_rule_XTM_attribute})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{_alternation_1_of_production_1_of_rule_XTM_attribute});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{_alternation_1_of_production_1_of_rule_XTM_attribute})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::path
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"path"};
	
	Parse::RecDescent::_trace(q{Trying rule: [path]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{path})
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
		
		Parse::RecDescent::_trace(q{Trying production: [step]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{path})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{path});
		%item = (__RULE__ => q{path});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying repeated subrule: [step]},
				  Parse::RecDescent::_tracefirst($text),
				  q{path})
					if defined $::RD_TRACE;
		$expectation->is(q{})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::step, 1, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [step]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{path})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [step]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{path})
						if defined $::RD_TRACE;
		$item{q{step}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{path})
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			  $return = $item{step};
			 };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [step]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{path})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{path})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{path})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{path});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{path})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::path_startrule
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"path_startrule"};
	
	Parse::RecDescent::_trace(q{Trying rule: [path_startrule]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{path_startrule})
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
		
		Parse::RecDescent::_trace(q{Trying production: [path]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{path_startrule})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{path_startrule});
		%item = (__RULE__ => q{path_startrule});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [path]},
				  Parse::RecDescent::_tracefirst($text),
				  q{path_startrule})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::path($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [path]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{path_startrule})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [path]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{path_startrule})
						if defined $::RD_TRACE;
		$item{q{path}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [path]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{path_startrule})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [<error...>]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{path_startrule})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		
		my $_savetext;
		@item = (q{path_startrule});
		%item = (__RULE__ => q{path_startrule});
		my $repcount = 0;


		

		Parse::RecDescent::_trace(q{Trying directive: [<error...>]},
					Parse::RecDescent::_tracefirst($text),
					  q{path_startrule})
						if defined $::RD_TRACE; 
		$_tok = do { if (1) { do {push @{$thisparser->{errors}}, [qq{ Invalid xxx syntax near "$text"},$thisline];} unless  $_noactions; undef } else {0} };
		if (defined($_tok))
		{
			Parse::RecDescent::_trace(q{>>Matched directive<< (return value: [}
						. $_tok . q{])},
						Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		}
		else
		{
			Parse::RecDescent::_trace(q{<<Didn't match directive>>},
						Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		}
		
		last unless defined $_tok;
		push @item, $item{__DIRECTIVE1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [<error...>]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{path_startrule})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{path_startrule})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{path_startrule})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{path_startrule});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{path_startrule})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::op_value
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"op_value"};
	
	Parse::RecDescent::_trace(q{Trying rule: [op_value]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{op_value})
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
		
		Parse::RecDescent::_trace(q{Trying production: [compare_op value]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{op_value})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{op_value});
		%item = (__RULE__ => q{op_value});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [compare_op]},
				  Parse::RecDescent::_tracefirst($text),
				  q{op_value})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::compare_op($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [compare_op]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{op_value})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [compare_op]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{op_value})
						if defined $::RD_TRACE;
		$item{q{compare_op}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying subrule: [value]},
				  Parse::RecDescent::_tracefirst($text),
				  q{op_value})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{value})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::value($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [value]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{op_value})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [value]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{op_value})
						if defined $::RD_TRACE;
		$item{q{value}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{op_value})
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			   my %OPS = (
				      '=' => 'eq',
				      '!=' => 'ne',
				      '<' => '<',
				      '>' => '>',
				      '<=' => '<=',
				      '>=' => '>=',
				     );
			   my $op = $OPS{$item{compare_op}};

			   $return = [ $op, $item{value} ];
			 };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [compare_op value]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{op_value})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{op_value})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{op_value})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{op_value});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{op_value})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::predicate
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"predicate"};
	
	Parse::RecDescent::_trace(q{Trying rule: [predicate]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{predicate})
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
		
		Parse::RecDescent::_trace(q{Trying production: ['[' expr ']']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{predicate})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{predicate});
		%item = (__RULE__ => q{predicate});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['[']},
					  Parse::RecDescent::_tracefirst($text),
					  q{predicate})
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
		

		Parse::RecDescent::_trace(q{Trying subrule: [expr]},
				  Parse::RecDescent::_tracefirst($text),
				  q{predicate})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{expr})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::expr($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [expr]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{predicate})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [expr]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{predicate})
						if defined $::RD_TRACE;
		$item{q{expr}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying terminal: [']']},
					  Parse::RecDescent::_tracefirst($text),
					  q{predicate})
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
					  q{predicate})
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			   $return = $item{expr};
			 };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['[' expr ']']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{predicate})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{predicate})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{predicate})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{predicate});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{predicate})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::relative_path
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"relative_path"};
	
	Parse::RecDescent::_trace(q{Trying rule: [relative_path]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{relative_path})
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
		
		Parse::RecDescent::_trace(q{Trying production: [XTM_thing predicate]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{relative_path})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{relative_path});
		%item = (__RULE__ => q{relative_path});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [XTM_thing]},
				  Parse::RecDescent::_tracefirst($text),
				  q{relative_path})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::XTM_thing($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [XTM_thing]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{relative_path})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [XTM_thing]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{relative_path})
						if defined $::RD_TRACE;
		$item{q{XTM_thing}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying repeated subrule: [predicate]},
				  Parse::RecDescent::_tracefirst($text),
				  q{relative_path})
					if defined $::RD_TRACE;
		$expectation->is(q{predicate})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::predicate, 0, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [predicate]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{relative_path})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [predicate]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{relative_path})
						if defined $::RD_TRACE;
		$item{q{predicate}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{relative_path})
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			   $return = { %{$item{'XTM_thing'}},
				       predicates => []};
			   foreach (@{$item{predicate}}) {
			     push @{$return->{predicates}}, $_;
			   }

			 };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [XTM_thing predicate]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{relative_path})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{relative_path})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{relative_path})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{relative_path});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{relative_path})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::_alternation_1_of_production_1_of_rule_XTM_thing
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"_alternation_1_of_production_1_of_rule_XTM_thing"};
	
	Parse::RecDescent::_trace(q{Trying rule: [_alternation_1_of_production_1_of_rule_XTM_thing]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{_alternation_1_of_production_1_of_rule_XTM_thing})
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
		
		Parse::RecDescent::_trace(q{Trying production: [XTM_element]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_thing})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_thing});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_thing});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [XTM_element]},
				  Parse::RecDescent::_tracefirst($text),
				  q{_alternation_1_of_production_1_of_rule_XTM_thing})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::XTM_element($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [XTM_element]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{_alternation_1_of_production_1_of_rule_XTM_thing})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [XTM_element]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_thing})
						if defined $::RD_TRACE;
		$item{q{XTM_element}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [XTM_element]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_thing})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [XTM_attribute]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_thing})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_thing});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_thing});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [XTM_attribute]},
				  Parse::RecDescent::_tracefirst($text),
				  q{_alternation_1_of_production_1_of_rule_XTM_thing})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::XTM_attribute($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [XTM_attribute]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{_alternation_1_of_production_1_of_rule_XTM_thing})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [XTM_attribute]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_thing})
						if defined $::RD_TRACE;
		$item{q{XTM_attribute}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [XTM_attribute]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_thing})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [XTM_data]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_thing})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[2];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_thing});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_thing});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [XTM_data]},
				  Parse::RecDescent::_tracefirst($text),
				  q{_alternation_1_of_production_1_of_rule_XTM_thing})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::XTM_data($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [XTM_data]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{_alternation_1_of_production_1_of_rule_XTM_thing})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [XTM_data]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_thing})
						if defined $::RD_TRACE;
		$item{q{XTM_data}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [XTM_data]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_thing})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{_alternation_1_of_production_1_of_rule_XTM_thing})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{_alternation_1_of_production_1_of_rule_XTM_thing})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{_alternation_1_of_production_1_of_rule_XTM_thing});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{_alternation_1_of_production_1_of_rule_XTM_thing})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::path_string
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"path_string"};
	
	Parse::RecDescent::_trace(q{Trying rule: [path_string]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{path_string})
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
					  q{path_string})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{path_string});
		%item = (__RULE__ => q{path_string});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['"']},
					  Parse::RecDescent::_tracefirst($text),
					  q{path_string})
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
					  q{path_string})
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
					  q{path_string})
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
					  q{path_string})
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			  $return = $item[2];
			 };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['"' /[^\\"]*/ '"']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{path_string})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{path_string})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{path_string})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{path_string});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{path_string})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::XTM_data
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"XTM_data"};
	
	Parse::RecDescent::_trace(q{Trying rule: [XTM_data]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{XTM_data})
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
		
		Parse::RecDescent::_trace(q{Trying production: ['text()']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{XTM_data})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{XTM_data});
		%item = (__RULE__ => q{XTM_data});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['text()']},
					  Parse::RecDescent::_tracefirst($text),
					  q{XTM_data})
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\Atext\(\)//)
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
		

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{XTM_data})
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			  $return = { 'data' => 1 };
			  };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['text()']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{XTM_data})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{XTM_data})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{XTM_data})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{XTM_data});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{XTM_data})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::descendant
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"descendant"};
	
	Parse::RecDescent::_trace(q{Trying rule: [descendant]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{descendant})
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
		
		Parse::RecDescent::_trace(q{Trying production: ['.//']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{descendant})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{descendant});
		%item = (__RULE__ => q{descendant});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['.//']},
					  Parse::RecDescent::_tracefirst($text),
					  q{descendant})
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\.\/\///)
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['.//']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{descendant})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['//']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{descendant})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{descendant});
		%item = (__RULE__ => q{descendant});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['//']},
					  Parse::RecDescent::_tracefirst($text),
					  q{descendant})
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\/\///)
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['//']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{descendant})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{descendant})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{descendant})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{descendant});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{descendant})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::XTM_thing
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"XTM_thing"};
	
	Parse::RecDescent::_trace(q{Trying rule: [XTM_thing]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{XTM_thing})
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
		
		Parse::RecDescent::_trace(q{Trying production: [XTM_element, or XTM_attribute, or XTM_data]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{XTM_thing})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{XTM_thing});
		%item = (__RULE__ => q{XTM_thing});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [_alternation_1_of_production_1_of_rule_XTM_thing]},
				  Parse::RecDescent::_tracefirst($text),
				  q{XTM_thing})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::_alternation_1_of_production_1_of_rule_XTM_thing($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [_alternation_1_of_production_1_of_rule_XTM_thing]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{XTM_thing})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [_alternation_1_of_production_1_of_rule_XTM_thing]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{XTM_thing})
						if defined $::RD_TRACE;
		$item{q{_alternation_1_of_production_1_of_rule_XTM_thing}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [XTM_element, or XTM_attribute, or XTM_data]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{XTM_thing})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{XTM_thing})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{XTM_thing})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{XTM_thing});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{XTM_thing})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::step
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"step"};
	
	Parse::RecDescent::_trace(q{Trying rule: [step]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{step})
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
		
		Parse::RecDescent::_trace(q{Trying production: [axis relative_path]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{step})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{step});
		%item = (__RULE__ => q{step});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying repeated subrule: [axis]},
				  Parse::RecDescent::_tracefirst($text),
				  q{step})
					if defined $::RD_TRACE;
		$expectation->is(q{})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::axis, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [axis]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{step})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [axis]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{step})
						if defined $::RD_TRACE;
		$item{q{axis}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying subrule: [relative_path]},
				  Parse::RecDescent::_tracefirst($text),
				  q{step})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{relative_path})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::relative_path($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [relative_path]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{step})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [relative_path]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{step})
						if defined $::RD_TRACE;
		$item{q{relative_path}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [axis relative_path]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{step})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{step})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{step})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{step});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{step})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::variable
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"variable"};
	
	Parse::RecDescent::_trace(q{Trying rule: [variable]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{variable})
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
		
		Parse::RecDescent::_trace(q{Trying production: [/\\?\\w+/]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{variable})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{variable});
		%item = (__RULE__ => q{variable});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: [/\\?\\w+/]}, Parse::RecDescent::_tracefirst($text),
					  q{variable})
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:\?\w+)//)
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
		

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{variable})
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			  $item[1] =~ /\?(.+)/;
			  $return = { variable => $1 };
			 };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [/\\?\\w+/]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{variable})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{variable})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{variable})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{variable});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{variable})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::value
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"value"};
	
	Parse::RecDescent::_trace(q{Trying rule: [value]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{value})
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
		
		Parse::RecDescent::_trace(q{Trying production: [path_numeric]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{value})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{value});
		%item = (__RULE__ => q{value});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [path_numeric]},
				  Parse::RecDescent::_tracefirst($text),
				  q{value})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::path_numeric($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [path_numeric]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{value})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [path_numeric]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{value})
						if defined $::RD_TRACE;
		$item{q{path_numeric}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [path_numeric]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{value})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [path_string]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{value})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{value});
		%item = (__RULE__ => q{value});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [path_string]},
				  Parse::RecDescent::_tracefirst($text),
				  q{value})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::path_string($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [path_string]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{value})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [path_string]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{value})
						if defined $::RD_TRACE;
		$item{q{path_string}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [path_string]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{value})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [variable]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{value})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[2];
		$text = $_[1];
		my $_savetext;
		@item = (q{value});
		%item = (__RULE__ => q{value});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [variable]},
				  Parse::RecDescent::_tracefirst($text),
				  q{value})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::variable($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [variable]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{value})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [variable]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{value})
						if defined $::RD_TRACE;
		$item{q{variable}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [variable]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{value})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{value})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{value})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{value});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{value})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::child
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"child"};
	
	Parse::RecDescent::_trace(q{Trying rule: [child]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{child})
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
		
		Parse::RecDescent::_trace(q{Trying production: ['./']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{child})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{child});
		%item = (__RULE__ => q{child});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['./']},
					  Parse::RecDescent::_tracefirst($text),
					  q{child})
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\.\///)
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['./']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{child})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['/']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{child})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{child});
		%item = (__RULE__ => q{child});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['/']},
					  Parse::RecDescent::_tracefirst($text),
					  q{child})
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['/']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{child})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{child})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{child})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{child});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{child})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::XTM_element
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"XTM_element"};
	
	Parse::RecDescent::_trace(q{Trying rule: [XTM_element]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{XTM_element})
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
		
		Parse::RecDescent::_trace(q{Trying production: ['topicRef', or 'topic', or 'baseNameString', or 'baseName', or 'occurrence', or 'resourceRef', or 'resourceData', or 'instanceOf', or 'subjectIndicatorRef', or 'subjectIdentity', or 'scope', or 'association', or 'member', or 'roleSpec']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{XTM_element})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{XTM_element});
		%item = (__RULE__ => q{XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [_alternation_1_of_production_1_of_rule_XTM_element]},
				  Parse::RecDescent::_tracefirst($text),
				  q{XTM_element})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::_alternation_1_of_production_1_of_rule_XTM_element($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [_alternation_1_of_production_1_of_rule_XTM_element]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{XTM_element})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [_alternation_1_of_production_1_of_rule_XTM_element]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{XTM_element})
						if defined $::RD_TRACE;
		$item{q{_alternation_1_of_production_1_of_rule_XTM_element}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{XTM_element})
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			  $return = { 'element' => $item[1] };
			  };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['topicRef', or 'topic', or 'baseNameString', or 'baseName', or 'occurrence', or 'resourceRef', or 'resourceData', or 'instanceOf', or 'subjectIndicatorRef', or 'subjectIdentity', or 'scope', or 'association', or 'member', or 'roleSpec']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{XTM_element})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{XTM_element})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{XTM_element})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{XTM_element});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{XTM_element})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::_alternation_1_of_production_1_of_rule_XTM_element
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"_alternation_1_of_production_1_of_rule_XTM_element"};
	
	Parse::RecDescent::_trace(q{Trying rule: [_alternation_1_of_production_1_of_rule_XTM_element]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{_alternation_1_of_production_1_of_rule_XTM_element})
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
		
		Parse::RecDescent::_trace(q{Trying production: ['topicRef']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_element});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['topicRef']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\AtopicRef//)
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['topicRef']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['topic']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_element});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['topic']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\Atopic//)
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['topic']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['baseNameString']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[2];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_element});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['baseNameString']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\AbaseNameString//)
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['baseNameString']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['baseName']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[3];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_element});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['baseName']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\AbaseName//)
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['baseName']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['occurrence']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[4];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_element});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['occurrence']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\Aoccurrence//)
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['occurrence']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['resourceRef']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[5];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_element});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['resourceRef']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\AresourceRef//)
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['resourceRef']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['resourceData']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[6];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_element});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['resourceData']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\AresourceData//)
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['resourceData']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['instanceOf']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[7];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_element});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['instanceOf']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\AinstanceOf//)
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['instanceOf']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['subjectIndicatorRef']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[8];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_element});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['subjectIndicatorRef']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\AsubjectIndicatorRef//)
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['subjectIndicatorRef']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['subjectIdentity']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[9];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_element});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['subjectIdentity']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\AsubjectIdentity//)
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['subjectIdentity']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['scope']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[10];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_element});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['scope']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\Ascope//)
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['scope']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['association']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[11];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_element});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['association']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\Aassociation//)
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['association']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['member']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[12];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_element});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['member']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\Amember//)
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['member']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['roleSpec']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[13];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_element});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['roleSpec']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\AroleSpec//)
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['roleSpec']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{_alternation_1_of_production_1_of_rule_XTM_element})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{_alternation_1_of_production_1_of_rule_XTM_element})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{_alternation_1_of_production_1_of_rule_XTM_element});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{_alternation_1_of_production_1_of_rule_XTM_element})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::XTM_attribute
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"XTM_attribute"};
	
	Parse::RecDescent::_trace(q{Trying rule: [XTM_attribute]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{XTM_attribute})
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
		
		Parse::RecDescent::_trace(q{Trying production: ['@' 'href', or 'id']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{XTM_attribute})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{XTM_attribute});
		%item = (__RULE__ => q{XTM_attribute});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['@']},
					  Parse::RecDescent::_tracefirst($text),
					  q{XTM_attribute})
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
		

		Parse::RecDescent::_trace(q{Trying subrule: [_alternation_1_of_production_1_of_rule_XTM_attribute]},
				  Parse::RecDescent::_tracefirst($text),
				  q{XTM_attribute})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{'href', or 'id'})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::_alternation_1_of_production_1_of_rule_XTM_attribute($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [_alternation_1_of_production_1_of_rule_XTM_attribute]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{XTM_attribute})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [_alternation_1_of_production_1_of_rule_XTM_attribute]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{XTM_attribute})
						if defined $::RD_TRACE;
		$item{q{_alternation_1_of_production_1_of_rule_XTM_attribute}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{XTM_attribute})
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			  $return = { 'attribute' => $item[2] };
			  };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['@' 'href', or 'id']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{XTM_attribute})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{XTM_attribute})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{XTM_attribute})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{XTM_attribute});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{XTM_attribute})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::path_numeric
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"path_numeric"};
	
	Parse::RecDescent::_trace(q{Trying rule: [path_numeric]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{path_numeric})
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
		
		Parse::RecDescent::_trace(q{Trying production: [/[\\+\\-\\d\\.]+/]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{path_numeric})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{path_numeric});
		%item = (__RULE__ => q{path_numeric});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: [/[\\+\\-\\d\\.]+/]}, Parse::RecDescent::_tracefirst($text),
					  q{path_numeric})
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:[\+\-\d\.]+)//)
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
		


		Parse::RecDescent::_trace(q{>>Matched production: [/[\\+\\-\\d\\.]+/]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{path_numeric})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{path_numeric})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{path_numeric})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{path_numeric});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{path_numeric})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::expr
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"expr"};
	
	Parse::RecDescent::_trace(q{Trying rule: [expr]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{expr})
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
		
		Parse::RecDescent::_trace(q{Trying production: [simple_expr]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{expr})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{expr});
		%item = (__RULE__ => q{expr});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [simple_expr]},
				  Parse::RecDescent::_tracefirst($text),
				  q{expr})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::simple_expr($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [simple_expr]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{expr})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [simple_expr]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{expr})
						if defined $::RD_TRACE;
		$item{q{simple_expr}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [simple_expr]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{expr})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{expr})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{expr})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{expr});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{expr})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::compare_op
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"compare_op"};
	
	Parse::RecDescent::_trace(q{Trying rule: [compare_op]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{compare_op})
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
		
		Parse::RecDescent::_trace(q{Trying production: ['=']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{compare_op})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{compare_op});
		%item = (__RULE__ => q{compare_op});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['=']},
					  Parse::RecDescent::_tracefirst($text),
					  q{compare_op})
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['=']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{compare_op})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['!=']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{compare_op})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{compare_op});
		%item = (__RULE__ => q{compare_op});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['!=']},
					  Parse::RecDescent::_tracefirst($text),
					  q{compare_op})
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\!\=//)
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['!=']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{compare_op})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['<']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{compare_op})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[2];
		$text = $_[1];
		my $_savetext;
		@item = (q{compare_op});
		%item = (__RULE__ => q{compare_op});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['<']},
					  Parse::RecDescent::_tracefirst($text),
					  q{compare_op})
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\<//)
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['<']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{compare_op})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['>']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{compare_op})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[3];
		$text = $_[1];
		my $_savetext;
		@item = (q{compare_op});
		%item = (__RULE__ => q{compare_op});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['>']},
					  Parse::RecDescent::_tracefirst($text),
					  q{compare_op})
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\>//)
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['>']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{compare_op})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['<=']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{compare_op})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[4];
		$text = $_[1];
		my $_savetext;
		@item = (q{compare_op});
		%item = (__RULE__ => q{compare_op});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['<=']},
					  Parse::RecDescent::_tracefirst($text),
					  q{compare_op})
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\<\=//)
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['<=']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{compare_op})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['>=']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{compare_op})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[5];
		$text = $_[1];
		my $_savetext;
		@item = (q{compare_op});
		%item = (__RULE__ => q{compare_op});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['>=']},
					  Parse::RecDescent::_tracefirst($text),
					  q{compare_op})
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A\>\=//)
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['>=']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{compare_op})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{compare_op})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{compare_op})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{compare_op});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{compare_op})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::axis
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"axis"};
	
	Parse::RecDescent::_trace(q{Trying rule: [axis]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{axis})
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
		
		Parse::RecDescent::_trace(q{Trying production: [descendant]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{axis})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{axis});
		%item = (__RULE__ => q{axis});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [descendant]},
				  Parse::RecDescent::_tracefirst($text),
				  q{axis})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::descendant($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [descendant]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{axis})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [descendant]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{axis})
						if defined $::RD_TRACE;
		$item{q{descendant}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [descendant]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{axis})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [child]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{axis})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{axis});
		%item = (__RULE__ => q{axis});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [child]},
				  Parse::RecDescent::_tracefirst($text),
				  q{axis})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::child($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [child]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{axis})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [child]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{axis})
						if defined $::RD_TRACE;
		$item{q{child}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [child]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{axis})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{axis})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{axis})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{axis});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{axis})
	}
	$_[1] = $text;
	return $return;
}
}
package XTM::Path::CParser; sub new { my $self = bless( {
                 '_AUTOTREE' => undef,
                 'rules' => {
                              'simple_expr' => bless( {
                                                        'impcount' => 0,
                                                        'line' => '64',
                                                        'prods' => [
                                                                     bless( {
                                                                              'dircount' => 0,
                                                                              'uncommit' => undef,
                                                                              'patcount' => 0,
                                                                              'strcount' => 0,
                                                                              'number' => 0,
                                                                              'error' => undef,
                                                                              'line' => undef,
                                                                              'items' => [
                                                                                           bless( {
                                                                                                    'line' => '64',
                                                                                                    'subrule' => 'path',
                                                                                                    'argcode' => undef,
                                                                                                    'implicit' => undef,
                                                                                                    'matchrule' => 0,
                                                                                                    'lookahead' => 0
                                                                                                  }, 'Parse::RecDescent::Subrule' ),
                                                                                           bless( {
                                                                                                    'min' => 0,
                                                                                                    'argcode' => undef,
                                                                                                    'matchrule' => 0,
                                                                                                    'lookahead' => 0,
                                                                                                    'subrule' => 'op_value',
                                                                                                    'line' => '64',
                                                                                                    'expected' => undef,
                                                                                                    'max' => 1,
                                                                                                    'repspec' => '?'
                                                                                                  }, 'Parse::RecDescent::Repetition' ),
                                                                                           bless( {
                                                                                                    'line' => '65',
                                                                                                    'code' => '{
			   $return = [ $item{path} ];
			   if ($item{op_value} && $item{op_value}->[0]) {
			     push @$return, @{$item{op_value}->[0]};
			   }
			 }',
                                                                                                    'hashname' => '__ACTION1__',
                                                                                                    'lookahead' => 0
                                                                                                  }, 'Parse::RecDescent::Action' )
                                                                                         ],
                                                                              'actcount' => 1
                                                                            }, 'Parse::RecDescent::Production' )
                                                                   ],
                                                        'calls' => [
                                                                     'path',
                                                                     'op_value'
                                                                   ],
                                                        'opcount' => 0,
                                                        'changed' => 0,
                                                        'vars' => '',
                                                        'name' => 'simple_expr'
                                                      }, 'Parse::RecDescent::Rule' ),
                              '_alternation_1_of_production_1_of_rule_XTM_attribute' => bless( {
                                                                                                 'impcount' => 0,
                                                                                                 'line' => '103',
                                                                                                 'prods' => [
                                                                                                              bless( {
                                                                                                                       'dircount' => 0,
                                                                                                                       'uncommit' => undef,
                                                                                                                       'patcount' => 0,
                                                                                                                       'strcount' => 1,
                                                                                                                       'number' => 0,
                                                                                                                       'error' => undef,
                                                                                                                       'line' => undef,
                                                                                                                       'items' => [
                                                                                                                                    bless( {
                                                                                                                                             'description' => '\'href\'',
                                                                                                                                             'line' => '103',
                                                                                                                                             'pattern' => 'href',
                                                                                                                                             'hashname' => '__STRING1__',
                                                                                                                                             'lookahead' => 0
                                                                                                                                           }, 'Parse::RecDescent::Literal' )
                                                                                                                                  ],
                                                                                                                       'actcount' => 0
                                                                                                                     }, 'Parse::RecDescent::Production' ),
                                                                                                              bless( {
                                                                                                                       'dircount' => 0,
                                                                                                                       'uncommit' => undef,
                                                                                                                       'patcount' => 0,
                                                                                                                       'strcount' => 1,
                                                                                                                       'number' => 1,
                                                                                                                       'error' => undef,
                                                                                                                       'line' => '103',
                                                                                                                       'items' => [
                                                                                                                                    bless( {
                                                                                                                                             'description' => '\'id\'',
                                                                                                                                             'line' => '103',
                                                                                                                                             'pattern' => 'id',
                                                                                                                                             'hashname' => '__STRING1__',
                                                                                                                                             'lookahead' => 0
                                                                                                                                           }, 'Parse::RecDescent::Literal' )
                                                                                                                                  ],
                                                                                                                       'actcount' => 0
                                                                                                                     }, 'Parse::RecDescent::Production' )
                                                                                                            ],
                                                                                                 'calls' => [],
                                                                                                 'opcount' => 0,
                                                                                                 'changed' => 0,
                                                                                                 'vars' => '',
                                                                                                 'name' => '_alternation_1_of_production_1_of_rule_XTM_attribute'
                                                                                               }, 'Parse::RecDescent::Rule' ),
                              'path' => bless( {
                                                 'impcount' => 0,
                                                 'line' => '4',
                                                 'prods' => [
                                                              bless( {
                                                                       'dircount' => 0,
                                                                       'uncommit' => undef,
                                                                       'patcount' => 0,
                                                                       'strcount' => 0,
                                                                       'number' => 0,
                                                                       'error' => undef,
                                                                       'line' => undef,
                                                                       'items' => [
                                                                                    bless( {
                                                                                             'min' => 1,
                                                                                             'argcode' => undef,
                                                                                             'matchrule' => 0,
                                                                                             'lookahead' => 0,
                                                                                             'subrule' => 'step',
                                                                                             'line' => '4',
                                                                                             'expected' => undef,
                                                                                             'max' => 100000000,
                                                                                             'repspec' => 's'
                                                                                           }, 'Parse::RecDescent::Repetition' ),
                                                                                    bless( {
                                                                                             'line' => '5',
                                                                                             'code' => '{
			  $return = $item{step};
			 }',
                                                                                             'hashname' => '__ACTION1__',
                                                                                             'lookahead' => 0
                                                                                           }, 'Parse::RecDescent::Action' )
                                                                                  ],
                                                                       'actcount' => 1
                                                                     }, 'Parse::RecDescent::Production' )
                                                            ],
                                                 'calls' => [
                                                              'step'
                                                            ],
                                                 'opcount' => 0,
                                                 'changed' => 0,
                                                 'vars' => '',
                                                 'name' => 'path'
                                               }, 'Parse::RecDescent::Rule' ),
                              'path_startrule' => bless( {
                                                           'impcount' => 0,
                                                           'line' => '1',
                                                           'prods' => [
                                                                        bless( {
                                                                                 'dircount' => 0,
                                                                                 'uncommit' => undef,
                                                                                 'patcount' => 0,
                                                                                 'strcount' => 0,
                                                                                 'number' => 0,
                                                                                 'error' => undef,
                                                                                 'line' => undef,
                                                                                 'items' => [
                                                                                              bless( {
                                                                                                       'line' => '2',
                                                                                                       'subrule' => 'path',
                                                                                                       'argcode' => undef,
                                                                                                       'implicit' => undef,
                                                                                                       'matchrule' => 0,
                                                                                                       'lookahead' => 0
                                                                                                     }, 'Parse::RecDescent::Subrule' )
                                                                                            ],
                                                                                 'actcount' => 0
                                                                               }, 'Parse::RecDescent::Production' ),
                                                                        bless( {
                                                                                 'dircount' => 1,
                                                                                 'uncommit' => 0,
                                                                                 'patcount' => 0,
                                                                                 'strcount' => 0,
                                                                                 'number' => 1,
                                                                                 'error' => 1,
                                                                                 'line' => '2',
                                                                                 'items' => [
                                                                                              bless( {
                                                                                                       'line' => '2',
                                                                                                       'commitonly' => '',
                                                                                                       'hashname' => '__DIRECTIVE1__',
                                                                                                       'lookahead' => 0,
                                                                                                       'msg' => ' Invalid xxx syntax near "$text"'
                                                                                                     }, 'Parse::RecDescent::Error' )
                                                                                            ],
                                                                                 'actcount' => 0
                                                                               }, 'Parse::RecDescent::Production' )
                                                                      ],
                                                           'calls' => [
                                                                        'path'
                                                                      ],
                                                           'opcount' => 0,
                                                           'changed' => 0,
                                                           'vars' => '',
                                                           'name' => 'path_startrule'
                                                         }, 'Parse::RecDescent::Rule' ),
                              'op_value' => bless( {
                                                     'impcount' => 0,
                                                     'line' => '72',
                                                     'prods' => [
                                                                  bless( {
                                                                           'dircount' => 0,
                                                                           'uncommit' => undef,
                                                                           'patcount' => 0,
                                                                           'strcount' => 0,
                                                                           'number' => 0,
                                                                           'error' => undef,
                                                                           'line' => undef,
                                                                           'items' => [
                                                                                        bless( {
                                                                                                 'line' => '72',
                                                                                                 'subrule' => 'compare_op',
                                                                                                 'argcode' => undef,
                                                                                                 'implicit' => undef,
                                                                                                 'matchrule' => 0,
                                                                                                 'lookahead' => 0
                                                                                               }, 'Parse::RecDescent::Subrule' ),
                                                                                        bless( {
                                                                                                 'line' => '72',
                                                                                                 'subrule' => 'value',
                                                                                                 'argcode' => undef,
                                                                                                 'implicit' => undef,
                                                                                                 'matchrule' => 0,
                                                                                                 'lookahead' => 0
                                                                                               }, 'Parse::RecDescent::Subrule' ),
                                                                                        bless( {
                                                                                                 'line' => '73',
                                                                                                 'code' => '{
			   my %OPS = (
				      \'=\' => \'eq\',
				      \'!=\' => \'ne\',
				      \'<\' => \'<\',
				      \'>\' => \'>\',
				      \'<=\' => \'<=\',
				      \'>=\' => \'>=\',
				     );
			   my $op = $OPS{$item{compare_op}};

			   $return = [ $op, $item{value} ];
			 }',
                                                                                                 'hashname' => '__ACTION1__',
                                                                                                 'lookahead' => 0
                                                                                               }, 'Parse::RecDescent::Action' )
                                                                                      ],
                                                                           'actcount' => 1
                                                                         }, 'Parse::RecDescent::Production' )
                                                                ],
                                                     'calls' => [
                                                                  'compare_op',
                                                                  'value'
                                                                ],
                                                     'opcount' => 0,
                                                     'changed' => 0,
                                                     'vars' => '',
                                                     'name' => 'op_value'
                                                   }, 'Parse::RecDescent::Rule' ),
                              'predicate' => bless( {
                                                      'impcount' => 0,
                                                      'line' => '57',
                                                      'prods' => [
                                                                   bless( {
                                                                            'dircount' => 0,
                                                                            'uncommit' => undef,
                                                                            'patcount' => 0,
                                                                            'strcount' => 2,
                                                                            'number' => 0,
                                                                            'error' => undef,
                                                                            'line' => undef,
                                                                            'items' => [
                                                                                         bless( {
                                                                                                  'description' => '\'[\'',
                                                                                                  'line' => '57',
                                                                                                  'pattern' => '[',
                                                                                                  'hashname' => '__STRING1__',
                                                                                                  'lookahead' => 0
                                                                                                }, 'Parse::RecDescent::Literal' ),
                                                                                         bless( {
                                                                                                  'line' => '57',
                                                                                                  'subrule' => 'expr',
                                                                                                  'argcode' => undef,
                                                                                                  'implicit' => undef,
                                                                                                  'matchrule' => 0,
                                                                                                  'lookahead' => 0
                                                                                                }, 'Parse::RecDescent::Subrule' ),
                                                                                         bless( {
                                                                                                  'description' => '\']\'',
                                                                                                  'line' => '57',
                                                                                                  'pattern' => ']',
                                                                                                  'hashname' => '__STRING2__',
                                                                                                  'lookahead' => 0
                                                                                                }, 'Parse::RecDescent::Literal' ),
                                                                                         bless( {
                                                                                                  'line' => '58',
                                                                                                  'code' => '{
			   $return = $item{expr};
			 }',
                                                                                                  'hashname' => '__ACTION1__',
                                                                                                  'lookahead' => 0
                                                                                                }, 'Parse::RecDescent::Action' )
                                                                                       ],
                                                                            'actcount' => 1
                                                                          }, 'Parse::RecDescent::Production' )
                                                                 ],
                                                      'calls' => [
                                                                   'expr'
                                                                 ],
                                                      'opcount' => 0,
                                                      'changed' => 0,
                                                      'vars' => '',
                                                      'name' => 'predicate'
                                                    }, 'Parse::RecDescent::Rule' ),
                              'relative_path' => bless( {
                                                          'impcount' => 0,
                                                          'line' => '17',
                                                          'prods' => [
                                                                       bless( {
                                                                                'dircount' => 0,
                                                                                'uncommit' => undef,
                                                                                'patcount' => 0,
                                                                                'strcount' => 0,
                                                                                'number' => 0,
                                                                                'error' => undef,
                                                                                'line' => undef,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'line' => '17',
                                                                                                      'subrule' => 'XTM_thing',
                                                                                                      'argcode' => undef,
                                                                                                      'implicit' => undef,
                                                                                                      'matchrule' => 0,
                                                                                                      'lookahead' => 0
                                                                                                    }, 'Parse::RecDescent::Subrule' ),
                                                                                             bless( {
                                                                                                      'min' => 0,
                                                                                                      'argcode' => undef,
                                                                                                      'matchrule' => 0,
                                                                                                      'lookahead' => 0,
                                                                                                      'subrule' => 'predicate',
                                                                                                      'line' => '17',
                                                                                                      'expected' => undef,
                                                                                                      'max' => 100000000,
                                                                                                      'repspec' => 's?'
                                                                                                    }, 'Parse::RecDescent::Repetition' ),
                                                                                             bless( {
                                                                                                      'line' => '18',
                                                                                                      'code' => '{
			   $return = { %{$item{\'XTM_thing\'}},
				       predicates => []};
			   foreach (@{$item{predicate}}) {
			     push @{$return->{predicates}}, $_;
			   }

			 }',
                                                                                                      'hashname' => '__ACTION1__',
                                                                                                      'lookahead' => 0
                                                                                                    }, 'Parse::RecDescent::Action' )
                                                                                           ],
                                                                                'actcount' => 1
                                                                              }, 'Parse::RecDescent::Production' )
                                                                     ],
                                                          'calls' => [
                                                                       'XTM_thing',
                                                                       'predicate'
                                                                     ],
                                                          'opcount' => 0,
                                                          'changed' => 0,
                                                          'vars' => '',
                                                          'name' => 'relative_path'
                                                        }, 'Parse::RecDescent::Rule' ),
                              '_alternation_1_of_production_1_of_rule_XTM_thing' => bless( {
                                                                                             'impcount' => 0,
                                                                                             'line' => '103',
                                                                                             'prods' => [
                                                                                                          bless( {
                                                                                                                   'dircount' => 0,
                                                                                                                   'uncommit' => undef,
                                                                                                                   'patcount' => 0,
                                                                                                                   'strcount' => 0,
                                                                                                                   'number' => 0,
                                                                                                                   'error' => undef,
                                                                                                                   'line' => undef,
                                                                                                                   'items' => [
                                                                                                                                bless( {
                                                                                                                                         'line' => '103',
                                                                                                                                         'subrule' => 'XTM_element',
                                                                                                                                         'argcode' => undef,
                                                                                                                                         'implicit' => undef,
                                                                                                                                         'matchrule' => 0,
                                                                                                                                         'lookahead' => 0
                                                                                                                                       }, 'Parse::RecDescent::Subrule' )
                                                                                                                              ],
                                                                                                                   'actcount' => 0
                                                                                                                 }, 'Parse::RecDescent::Production' ),
                                                                                                          bless( {
                                                                                                                   'dircount' => 0,
                                                                                                                   'uncommit' => undef,
                                                                                                                   'patcount' => 0,
                                                                                                                   'strcount' => 0,
                                                                                                                   'number' => 1,
                                                                                                                   'error' => undef,
                                                                                                                   'line' => '103',
                                                                                                                   'items' => [
                                                                                                                                bless( {
                                                                                                                                         'line' => '103',
                                                                                                                                         'subrule' => 'XTM_attribute',
                                                                                                                                         'argcode' => undef,
                                                                                                                                         'implicit' => undef,
                                                                                                                                         'matchrule' => 0,
                                                                                                                                         'lookahead' => 0
                                                                                                                                       }, 'Parse::RecDescent::Subrule' )
                                                                                                                              ],
                                                                                                                   'actcount' => 0
                                                                                                                 }, 'Parse::RecDescent::Production' ),
                                                                                                          bless( {
                                                                                                                   'dircount' => 0,
                                                                                                                   'uncommit' => undef,
                                                                                                                   'patcount' => 0,
                                                                                                                   'strcount' => 0,
                                                                                                                   'number' => 2,
                                                                                                                   'error' => undef,
                                                                                                                   'line' => '103',
                                                                                                                   'items' => [
                                                                                                                                bless( {
                                                                                                                                         'line' => '103',
                                                                                                                                         'subrule' => 'XTM_data',
                                                                                                                                         'argcode' => undef,
                                                                                                                                         'implicit' => undef,
                                                                                                                                         'matchrule' => 0,
                                                                                                                                         'lookahead' => 0
                                                                                                                                       }, 'Parse::RecDescent::Subrule' )
                                                                                                                              ],
                                                                                                                   'actcount' => 0
                                                                                                                 }, 'Parse::RecDescent::Production' )
                                                                                                        ],
                                                                                             'calls' => [
                                                                                                          'XTM_element',
                                                                                                          'XTM_attribute',
                                                                                                          'XTM_data'
                                                                                                        ],
                                                                                             'opcount' => 0,
                                                                                             'changed' => 0,
                                                                                             'vars' => '',
                                                                                             'name' => '_alternation_1_of_production_1_of_rule_XTM_thing'
                                                                                           }, 'Parse::RecDescent::Rule' ),
                              'path_string' => bless( {
                                                        'impcount' => 0,
                                                        'line' => '99',
                                                        'prods' => [
                                                                     bless( {
                                                                              'dircount' => 0,
                                                                              'uncommit' => undef,
                                                                              'patcount' => 1,
                                                                              'strcount' => 2,
                                                                              'number' => 0,
                                                                              'error' => undef,
                                                                              'line' => undef,
                                                                              'items' => [
                                                                                           bless( {
                                                                                                    'description' => '\'"\'',
                                                                                                    'line' => '99',
                                                                                                    'pattern' => '"',
                                                                                                    'hashname' => '__STRING1__',
                                                                                                    'lookahead' => 0
                                                                                                  }, 'Parse::RecDescent::Literal' ),
                                                                                           bless( {
                                                                                                    'description' => '/[^\\\\"]*/',
                                                                                                    'pattern' => '[^\\"]*',
                                                                                                    'mod' => '',
                                                                                                    'hashname' => '__PATTERN1__',
                                                                                                    'lookahead' => 0,
                                                                                                    'ldelim' => '/',
                                                                                                    'line' => '99',
                                                                                                    'rdelim' => '/'
                                                                                                  }, 'Parse::RecDescent::Token' ),
                                                                                           bless( {
                                                                                                    'description' => '\'"\'',
                                                                                                    'line' => '99',
                                                                                                    'pattern' => '"',
                                                                                                    'hashname' => '__STRING2__',
                                                                                                    'lookahead' => 0
                                                                                                  }, 'Parse::RecDescent::Literal' ),
                                                                                           bless( {
                                                                                                    'line' => '100',
                                                                                                    'code' => '{
			  $return = $item[2];
			 }',
                                                                                                    'hashname' => '__ACTION1__',
                                                                                                    'lookahead' => 0
                                                                                                  }, 'Parse::RecDescent::Action' )
                                                                                         ],
                                                                              'actcount' => 1
                                                                            }, 'Parse::RecDescent::Production' )
                                                                   ],
                                                        'calls' => [],
                                                        'opcount' => 0,
                                                        'changed' => 0,
                                                        'vars' => '',
                                                        'name' => 'path_string'
                                                      }, 'Parse::RecDescent::Rule' ),
                              'XTM_data' => bless( {
                                                     'impcount' => 0,
                                                     'line' => '29',
                                                     'prods' => [
                                                                  bless( {
                                                                           'dircount' => 0,
                                                                           'uncommit' => undef,
                                                                           'patcount' => 0,
                                                                           'strcount' => 1,
                                                                           'number' => 0,
                                                                           'error' => undef,
                                                                           'line' => undef,
                                                                           'items' => [
                                                                                        bless( {
                                                                                                 'description' => '\'text()\'',
                                                                                                 'line' => '29',
                                                                                                 'pattern' => 'text()',
                                                                                                 'hashname' => '__STRING1__',
                                                                                                 'lookahead' => 0
                                                                                               }, 'Parse::RecDescent::Literal' ),
                                                                                        bless( {
                                                                                                 'line' => '30',
                                                                                                 'code' => '{
			  $return = { \'data\' => 1 };
			  }',
                                                                                                 'hashname' => '__ACTION1__',
                                                                                                 'lookahead' => 0
                                                                                               }, 'Parse::RecDescent::Action' )
                                                                                      ],
                                                                           'actcount' => 1
                                                                         }, 'Parse::RecDescent::Production' )
                                                                ],
                                                     'calls' => [],
                                                     'opcount' => 0,
                                                     'changed' => 0,
                                                     'vars' => '',
                                                     'name' => 'XTM_data'
                                                   }, 'Parse::RecDescent::Rule' ),
                              'descendant' => bless( {
                                                       'impcount' => 0,
                                                       'line' => '15',
                                                       'prods' => [
                                                                    bless( {
                                                                             'dircount' => 0,
                                                                             'uncommit' => undef,
                                                                             'patcount' => 0,
                                                                             'strcount' => 1,
                                                                             'number' => 0,
                                                                             'error' => undef,
                                                                             'line' => undef,
                                                                             'items' => [
                                                                                          bless( {
                                                                                                   'description' => '\'.//\'',
                                                                                                   'line' => '15',
                                                                                                   'pattern' => './/',
                                                                                                   'hashname' => '__STRING1__',
                                                                                                   'lookahead' => 0
                                                                                                 }, 'Parse::RecDescent::Literal' )
                                                                                        ],
                                                                             'actcount' => 0
                                                                           }, 'Parse::RecDescent::Production' ),
                                                                    bless( {
                                                                             'dircount' => 0,
                                                                             'uncommit' => undef,
                                                                             'patcount' => 0,
                                                                             'strcount' => 1,
                                                                             'number' => 1,
                                                                             'error' => undef,
                                                                             'line' => '15',
                                                                             'items' => [
                                                                                          bless( {
                                                                                                   'description' => '\'//\'',
                                                                                                   'line' => '15',
                                                                                                   'pattern' => '//',
                                                                                                   'hashname' => '__STRING1__',
                                                                                                   'lookahead' => 0
                                                                                                 }, 'Parse::RecDescent::Literal' )
                                                                                        ],
                                                                             'actcount' => 0
                                                                           }, 'Parse::RecDescent::Production' )
                                                                  ],
                                                       'calls' => [],
                                                       'opcount' => 0,
                                                       'changed' => 0,
                                                       'vars' => '',
                                                       'name' => 'descendant'
                                                     }, 'Parse::RecDescent::Rule' ),
                              'XTM_thing' => bless( {
                                                      'impcount' => 1,
                                                      'line' => '27',
                                                      'prods' => [
                                                                   bless( {
                                                                            'dircount' => 0,
                                                                            'uncommit' => undef,
                                                                            'patcount' => 0,
                                                                            'strcount' => 0,
                                                                            'number' => 0,
                                                                            'error' => undef,
                                                                            'line' => undef,
                                                                            'items' => [
                                                                                         bless( {
                                                                                                  'line' => '27',
                                                                                                  'subrule' => '_alternation_1_of_production_1_of_rule_XTM_thing',
                                                                                                  'argcode' => undef,
                                                                                                  'implicit' => 'XTM_element, or XTM_attribute, or XTM_data',
                                                                                                  'matchrule' => 0,
                                                                                                  'lookahead' => 0
                                                                                                }, 'Parse::RecDescent::Subrule' )
                                                                                       ],
                                                                            'actcount' => 0
                                                                          }, 'Parse::RecDescent::Production' )
                                                                 ],
                                                      'calls' => [
                                                                   '_alternation_1_of_production_1_of_rule_XTM_thing'
                                                                 ],
                                                      'opcount' => 0,
                                                      'changed' => 0,
                                                      'vars' => '',
                                                      'name' => 'XTM_thing'
                                                    }, 'Parse::RecDescent::Rule' ),
                              'step' => bless( {
                                                 'impcount' => 0,
                                                 'line' => '9',
                                                 'prods' => [
                                                              bless( {
                                                                       'dircount' => 0,
                                                                       'uncommit' => undef,
                                                                       'patcount' => 0,
                                                                       'strcount' => 0,
                                                                       'number' => 0,
                                                                       'error' => undef,
                                                                       'line' => undef,
                                                                       'items' => [
                                                                                    bless( {
                                                                                             'min' => 0,
                                                                                             'argcode' => undef,
                                                                                             'matchrule' => 0,
                                                                                             'lookahead' => 0,
                                                                                             'subrule' => 'axis',
                                                                                             'line' => '9',
                                                                                             'expected' => undef,
                                                                                             'max' => 1,
                                                                                             'repspec' => '?'
                                                                                           }, 'Parse::RecDescent::Repetition' ),
                                                                                    bless( {
                                                                                             'line' => '9',
                                                                                             'subrule' => 'relative_path',
                                                                                             'argcode' => undef,
                                                                                             'implicit' => undef,
                                                                                             'matchrule' => 0,
                                                                                             'lookahead' => 0
                                                                                           }, 'Parse::RecDescent::Subrule' )
                                                                                  ],
                                                                       'actcount' => 0
                                                                     }, 'Parse::RecDescent::Production' )
                                                            ],
                                                 'calls' => [
                                                              'axis',
                                                              'relative_path'
                                                            ],
                                                 'opcount' => 0,
                                                 'changed' => 0,
                                                 'vars' => '',
                                                 'name' => 'step'
                                               }, 'Parse::RecDescent::Rule' ),
                              'variable' => bless( {
                                                     'impcount' => 0,
                                                     'line' => '91',
                                                     'prods' => [
                                                                  bless( {
                                                                           'dircount' => 0,
                                                                           'uncommit' => undef,
                                                                           'patcount' => 1,
                                                                           'strcount' => 0,
                                                                           'number' => 0,
                                                                           'error' => undef,
                                                                           'line' => undef,
                                                                           'items' => [
                                                                                        bless( {
                                                                                                 'description' => '/\\\\?\\\\w+/',
                                                                                                 'pattern' => '\\?\\w+',
                                                                                                 'mod' => '',
                                                                                                 'hashname' => '__PATTERN1__',
                                                                                                 'lookahead' => 0,
                                                                                                 'ldelim' => '/',
                                                                                                 'line' => '91',
                                                                                                 'rdelim' => '/'
                                                                                               }, 'Parse::RecDescent::Token' ),
                                                                                        bless( {
                                                                                                 'line' => '92',
                                                                                                 'code' => '{
			  $item[1] =~ /\\?(.+)/;
			  $return = { variable => $1 };
			 }',
                                                                                                 'hashname' => '__ACTION1__',
                                                                                                 'lookahead' => 0
                                                                                               }, 'Parse::RecDescent::Action' )
                                                                                      ],
                                                                           'actcount' => 1
                                                                         }, 'Parse::RecDescent::Production' )
                                                                ],
                                                     'calls' => [],
                                                     'opcount' => 0,
                                                     'changed' => 0,
                                                     'vars' => '',
                                                     'name' => 'variable'
                                                   }, 'Parse::RecDescent::Rule' ),
                              'value' => bless( {
                                                  'impcount' => 0,
                                                  'line' => '89',
                                                  'prods' => [
                                                               bless( {
                                                                        'dircount' => 0,
                                                                        'uncommit' => undef,
                                                                        'patcount' => 0,
                                                                        'strcount' => 0,
                                                                        'number' => 0,
                                                                        'error' => undef,
                                                                        'line' => undef,
                                                                        'items' => [
                                                                                     bless( {
                                                                                              'line' => '89',
                                                                                              'subrule' => 'path_numeric',
                                                                                              'argcode' => undef,
                                                                                              'implicit' => undef,
                                                                                              'matchrule' => 0,
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Subrule' )
                                                                                   ],
                                                                        'actcount' => 0
                                                                      }, 'Parse::RecDescent::Production' ),
                                                               bless( {
                                                                        'dircount' => 0,
                                                                        'uncommit' => undef,
                                                                        'patcount' => 0,
                                                                        'strcount' => 0,
                                                                        'number' => 1,
                                                                        'error' => undef,
                                                                        'line' => '89',
                                                                        'items' => [
                                                                                     bless( {
                                                                                              'line' => '89',
                                                                                              'subrule' => 'path_string',
                                                                                              'argcode' => undef,
                                                                                              'implicit' => undef,
                                                                                              'matchrule' => 0,
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Subrule' )
                                                                                   ],
                                                                        'actcount' => 0
                                                                      }, 'Parse::RecDescent::Production' ),
                                                               bless( {
                                                                        'dircount' => 0,
                                                                        'uncommit' => undef,
                                                                        'patcount' => 0,
                                                                        'strcount' => 0,
                                                                        'number' => 2,
                                                                        'error' => undef,
                                                                        'line' => '89',
                                                                        'items' => [
                                                                                     bless( {
                                                                                              'line' => '89',
                                                                                              'subrule' => 'variable',
                                                                                              'argcode' => undef,
                                                                                              'implicit' => undef,
                                                                                              'matchrule' => 0,
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Subrule' )
                                                                                   ],
                                                                        'actcount' => 0
                                                                      }, 'Parse::RecDescent::Production' )
                                                             ],
                                                  'calls' => [
                                                               'path_numeric',
                                                               'path_string',
                                                               'variable'
                                                             ],
                                                  'opcount' => 0,
                                                  'changed' => 0,
                                                  'vars' => '',
                                                  'name' => 'value'
                                                }, 'Parse::RecDescent::Rule' ),
                              'child' => bless( {
                                                  'impcount' => 0,
                                                  'line' => '13',
                                                  'prods' => [
                                                               bless( {
                                                                        'dircount' => 0,
                                                                        'uncommit' => undef,
                                                                        'patcount' => 0,
                                                                        'strcount' => 1,
                                                                        'number' => 0,
                                                                        'error' => undef,
                                                                        'line' => undef,
                                                                        'items' => [
                                                                                     bless( {
                                                                                              'description' => '\'./\'',
                                                                                              'line' => '13',
                                                                                              'pattern' => './',
                                                                                              'hashname' => '__STRING1__',
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Literal' )
                                                                                   ],
                                                                        'actcount' => 0
                                                                      }, 'Parse::RecDescent::Production' ),
                                                               bless( {
                                                                        'dircount' => 0,
                                                                        'uncommit' => undef,
                                                                        'patcount' => 0,
                                                                        'strcount' => 1,
                                                                        'number' => 1,
                                                                        'error' => undef,
                                                                        'line' => '13',
                                                                        'items' => [
                                                                                     bless( {
                                                                                              'description' => '\'/\'',
                                                                                              'line' => '13',
                                                                                              'pattern' => '/',
                                                                                              'hashname' => '__STRING1__',
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Literal' )
                                                                                   ],
                                                                        'actcount' => 0
                                                                      }, 'Parse::RecDescent::Production' )
                                                             ],
                                                  'calls' => [],
                                                  'opcount' => 0,
                                                  'changed' => 0,
                                                  'vars' => '',
                                                  'name' => 'child'
                                                }, 'Parse::RecDescent::Rule' ),
                              'XTM_element' => bless( {
                                                        'impcount' => 1,
                                                        'line' => '34',
                                                        'prods' => [
                                                                     bless( {
                                                                              'dircount' => 0,
                                                                              'uncommit' => undef,
                                                                              'patcount' => 0,
                                                                              'strcount' => 0,
                                                                              'number' => 0,
                                                                              'error' => undef,
                                                                              'line' => undef,
                                                                              'items' => [
                                                                                           bless( {
                                                                                                    'line' => '47',
                                                                                                    'subrule' => '_alternation_1_of_production_1_of_rule_XTM_element',
                                                                                                    'argcode' => undef,
                                                                                                    'implicit' => '\'topicRef\', or \'topic\', or \'baseNameString\', or \'baseName\', or \'occurrence\', or \'resourceRef\', or \'resourceData\', or \'instanceOf\', or \'subjectIndicatorRef\', or \'subjectIdentity\', or \'scope\', or \'association\', or \'member\', or \'roleSpec\'',
                                                                                                    'matchrule' => 0,
                                                                                                    'lookahead' => 0
                                                                                                  }, 'Parse::RecDescent::Subrule' ),
                                                                                           bless( {
                                                                                                    'line' => '48',
                                                                                                    'code' => '{
			  $return = { \'element\' => $item[1] };
			  }',
                                                                                                    'hashname' => '__ACTION1__',
                                                                                                    'lookahead' => 0
                                                                                                  }, 'Parse::RecDescent::Action' )
                                                                                         ],
                                                                              'actcount' => 1
                                                                            }, 'Parse::RecDescent::Production' )
                                                                   ],
                                                        'calls' => [
                                                                     '_alternation_1_of_production_1_of_rule_XTM_element'
                                                                   ],
                                                        'opcount' => 0,
                                                        'changed' => 0,
                                                        'vars' => '',
                                                        'name' => 'XTM_element'
                                                      }, 'Parse::RecDescent::Rule' ),
                              '_alternation_1_of_production_1_of_rule_XTM_element' => bless( {
                                                                                               'impcount' => 0,
                                                                                               'line' => '90',
                                                                                               'prods' => [
                                                                                                            bless( {
                                                                                                                     'dircount' => 0,
                                                                                                                     'uncommit' => undef,
                                                                                                                     'patcount' => 0,
                                                                                                                     'strcount' => 1,
                                                                                                                     'number' => 0,
                                                                                                                     'error' => undef,
                                                                                                                     'line' => undef,
                                                                                                                     'items' => [
                                                                                                                                  bless( {
                                                                                                                                           'description' => '\'topicRef\'',
                                                                                                                                           'line' => '90',
                                                                                                                                           'pattern' => 'topicRef',
                                                                                                                                           'hashname' => '__STRING1__',
                                                                                                                                           'lookahead' => 0
                                                                                                                                         }, 'Parse::RecDescent::Literal' )
                                                                                                                                ],
                                                                                                                     'actcount' => 0
                                                                                                                   }, 'Parse::RecDescent::Production' ),
                                                                                                            bless( {
                                                                                                                     'dircount' => 0,
                                                                                                                     'uncommit' => undef,
                                                                                                                     'patcount' => 0,
                                                                                                                     'strcount' => 1,
                                                                                                                     'number' => 1,
                                                                                                                     'error' => undef,
                                                                                                                     'line' => '90',
                                                                                                                     'items' => [
                                                                                                                                  bless( {
                                                                                                                                           'description' => '\'topic\'',
                                                                                                                                           'line' => '91',
                                                                                                                                           'pattern' => 'topic',
                                                                                                                                           'hashname' => '__STRING1__',
                                                                                                                                           'lookahead' => 0
                                                                                                                                         }, 'Parse::RecDescent::Literal' )
                                                                                                                                ],
                                                                                                                     'actcount' => 0
                                                                                                                   }, 'Parse::RecDescent::Production' ),
                                                                                                            bless( {
                                                                                                                     'dircount' => 0,
                                                                                                                     'uncommit' => undef,
                                                                                                                     'patcount' => 0,
                                                                                                                     'strcount' => 1,
                                                                                                                     'number' => 2,
                                                                                                                     'error' => undef,
                                                                                                                     'line' => '91',
                                                                                                                     'items' => [
                                                                                                                                  bless( {
                                                                                                                                           'description' => '\'baseNameString\'',
                                                                                                                                           'line' => '92',
                                                                                                                                           'pattern' => 'baseNameString',
                                                                                                                                           'hashname' => '__STRING1__',
                                                                                                                                           'lookahead' => 0
                                                                                                                                         }, 'Parse::RecDescent::Literal' )
                                                                                                                                ],
                                                                                                                     'actcount' => 0
                                                                                                                   }, 'Parse::RecDescent::Production' ),
                                                                                                            bless( {
                                                                                                                     'dircount' => 0,
                                                                                                                     'uncommit' => undef,
                                                                                                                     'patcount' => 0,
                                                                                                                     'strcount' => 1,
                                                                                                                     'number' => 3,
                                                                                                                     'error' => undef,
                                                                                                                     'line' => '92',
                                                                                                                     'items' => [
                                                                                                                                  bless( {
                                                                                                                                           'description' => '\'baseName\'',
                                                                                                                                           'line' => '93',
                                                                                                                                           'pattern' => 'baseName',
                                                                                                                                           'hashname' => '__STRING1__',
                                                                                                                                           'lookahead' => 0
                                                                                                                                         }, 'Parse::RecDescent::Literal' )
                                                                                                                                ],
                                                                                                                     'actcount' => 0
                                                                                                                   }, 'Parse::RecDescent::Production' ),
                                                                                                            bless( {
                                                                                                                     'dircount' => 0,
                                                                                                                     'uncommit' => undef,
                                                                                                                     'patcount' => 0,
                                                                                                                     'strcount' => 1,
                                                                                                                     'number' => 4,
                                                                                                                     'error' => undef,
                                                                                                                     'line' => '93',
                                                                                                                     'items' => [
                                                                                                                                  bless( {
                                                                                                                                           'description' => '\'occurrence\'',
                                                                                                                                           'line' => '94',
                                                                                                                                           'pattern' => 'occurrence',
                                                                                                                                           'hashname' => '__STRING1__',
                                                                                                                                           'lookahead' => 0
                                                                                                                                         }, 'Parse::RecDescent::Literal' )
                                                                                                                                ],
                                                                                                                     'actcount' => 0
                                                                                                                   }, 'Parse::RecDescent::Production' ),
                                                                                                            bless( {
                                                                                                                     'dircount' => 0,
                                                                                                                     'uncommit' => undef,
                                                                                                                     'patcount' => 0,
                                                                                                                     'strcount' => 1,
                                                                                                                     'number' => 5,
                                                                                                                     'error' => undef,
                                                                                                                     'line' => '94',
                                                                                                                     'items' => [
                                                                                                                                  bless( {
                                                                                                                                           'description' => '\'resourceRef\'',
                                                                                                                                           'line' => '95',
                                                                                                                                           'pattern' => 'resourceRef',
                                                                                                                                           'hashname' => '__STRING1__',
                                                                                                                                           'lookahead' => 0
                                                                                                                                         }, 'Parse::RecDescent::Literal' )
                                                                                                                                ],
                                                                                                                     'actcount' => 0
                                                                                                                   }, 'Parse::RecDescent::Production' ),
                                                                                                            bless( {
                                                                                                                     'dircount' => 0,
                                                                                                                     'uncommit' => undef,
                                                                                                                     'patcount' => 0,
                                                                                                                     'strcount' => 1,
                                                                                                                     'number' => 6,
                                                                                                                     'error' => undef,
                                                                                                                     'line' => '95',
                                                                                                                     'items' => [
                                                                                                                                  bless( {
                                                                                                                                           'description' => '\'resourceData\'',
                                                                                                                                           'line' => '96',
                                                                                                                                           'pattern' => 'resourceData',
                                                                                                                                           'hashname' => '__STRING1__',
                                                                                                                                           'lookahead' => 0
                                                                                                                                         }, 'Parse::RecDescent::Literal' )
                                                                                                                                ],
                                                                                                                     'actcount' => 0
                                                                                                                   }, 'Parse::RecDescent::Production' ),
                                                                                                            bless( {
                                                                                                                     'dircount' => 0,
                                                                                                                     'uncommit' => undef,
                                                                                                                     'patcount' => 0,
                                                                                                                     'strcount' => 1,
                                                                                                                     'number' => 7,
                                                                                                                     'error' => undef,
                                                                                                                     'line' => '96',
                                                                                                                     'items' => [
                                                                                                                                  bless( {
                                                                                                                                           'description' => '\'instanceOf\'',
                                                                                                                                           'line' => '97',
                                                                                                                                           'pattern' => 'instanceOf',
                                                                                                                                           'hashname' => '__STRING1__',
                                                                                                                                           'lookahead' => 0
                                                                                                                                         }, 'Parse::RecDescent::Literal' )
                                                                                                                                ],
                                                                                                                     'actcount' => 0
                                                                                                                   }, 'Parse::RecDescent::Production' ),
                                                                                                            bless( {
                                                                                                                     'dircount' => 0,
                                                                                                                     'uncommit' => undef,
                                                                                                                     'patcount' => 0,
                                                                                                                     'strcount' => 1,
                                                                                                                     'number' => 8,
                                                                                                                     'error' => undef,
                                                                                                                     'line' => '97',
                                                                                                                     'items' => [
                                                                                                                                  bless( {
                                                                                                                                           'description' => '\'subjectIndicatorRef\'',
                                                                                                                                           'line' => '98',
                                                                                                                                           'pattern' => 'subjectIndicatorRef',
                                                                                                                                           'hashname' => '__STRING1__',
                                                                                                                                           'lookahead' => 0
                                                                                                                                         }, 'Parse::RecDescent::Literal' )
                                                                                                                                ],
                                                                                                                     'actcount' => 0
                                                                                                                   }, 'Parse::RecDescent::Production' ),
                                                                                                            bless( {
                                                                                                                     'dircount' => 0,
                                                                                                                     'uncommit' => undef,
                                                                                                                     'patcount' => 0,
                                                                                                                     'strcount' => 1,
                                                                                                                     'number' => 9,
                                                                                                                     'error' => undef,
                                                                                                                     'line' => '98',
                                                                                                                     'items' => [
                                                                                                                                  bless( {
                                                                                                                                           'description' => '\'subjectIdentity\'',
                                                                                                                                           'line' => '99',
                                                                                                                                           'pattern' => 'subjectIdentity',
                                                                                                                                           'hashname' => '__STRING1__',
                                                                                                                                           'lookahead' => 0
                                                                                                                                         }, 'Parse::RecDescent::Literal' )
                                                                                                                                ],
                                                                                                                     'actcount' => 0
                                                                                                                   }, 'Parse::RecDescent::Production' ),
                                                                                                            bless( {
                                                                                                                     'dircount' => 0,
                                                                                                                     'uncommit' => undef,
                                                                                                                     'patcount' => 0,
                                                                                                                     'strcount' => 1,
                                                                                                                     'number' => 10,
                                                                                                                     'error' => undef,
                                                                                                                     'line' => '99',
                                                                                                                     'items' => [
                                                                                                                                  bless( {
                                                                                                                                           'description' => '\'scope\'',
                                                                                                                                           'line' => '100',
                                                                                                                                           'pattern' => 'scope',
                                                                                                                                           'hashname' => '__STRING1__',
                                                                                                                                           'lookahead' => 0
                                                                                                                                         }, 'Parse::RecDescent::Literal' )
                                                                                                                                ],
                                                                                                                     'actcount' => 0
                                                                                                                   }, 'Parse::RecDescent::Production' ),
                                                                                                            bless( {
                                                                                                                     'dircount' => 0,
                                                                                                                     'uncommit' => undef,
                                                                                                                     'patcount' => 0,
                                                                                                                     'strcount' => 1,
                                                                                                                     'number' => 11,
                                                                                                                     'error' => undef,
                                                                                                                     'line' => '100',
                                                                                                                     'items' => [
                                                                                                                                  bless( {
                                                                                                                                           'description' => '\'association\'',
                                                                                                                                           'line' => '101',
                                                                                                                                           'pattern' => 'association',
                                                                                                                                           'hashname' => '__STRING1__',
                                                                                                                                           'lookahead' => 0
                                                                                                                                         }, 'Parse::RecDescent::Literal' )
                                                                                                                                ],
                                                                                                                     'actcount' => 0
                                                                                                                   }, 'Parse::RecDescent::Production' ),
                                                                                                            bless( {
                                                                                                                     'dircount' => 0,
                                                                                                                     'uncommit' => undef,
                                                                                                                     'patcount' => 0,
                                                                                                                     'strcount' => 1,
                                                                                                                     'number' => 12,
                                                                                                                     'error' => undef,
                                                                                                                     'line' => '101',
                                                                                                                     'items' => [
                                                                                                                                  bless( {
                                                                                                                                           'description' => '\'member\'',
                                                                                                                                           'line' => '102',
                                                                                                                                           'pattern' => 'member',
                                                                                                                                           'hashname' => '__STRING1__',
                                                                                                                                           'lookahead' => 0
                                                                                                                                         }, 'Parse::RecDescent::Literal' )
                                                                                                                                ],
                                                                                                                     'actcount' => 0
                                                                                                                   }, 'Parse::RecDescent::Production' ),
                                                                                                            bless( {
                                                                                                                     'dircount' => 0,
                                                                                                                     'uncommit' => undef,
                                                                                                                     'patcount' => 0,
                                                                                                                     'strcount' => 1,
                                                                                                                     'number' => 13,
                                                                                                                     'error' => undef,
                                                                                                                     'line' => '102',
                                                                                                                     'items' => [
                                                                                                                                  bless( {
                                                                                                                                           'description' => '\'roleSpec\'',
                                                                                                                                           'line' => '103',
                                                                                                                                           'pattern' => 'roleSpec',
                                                                                                                                           'hashname' => '__STRING1__',
                                                                                                                                           'lookahead' => 0
                                                                                                                                         }, 'Parse::RecDescent::Literal' )
                                                                                                                                ],
                                                                                                                     'actcount' => 0
                                                                                                                   }, 'Parse::RecDescent::Production' )
                                                                                                          ],
                                                                                               'calls' => [],
                                                                                               'opcount' => 0,
                                                                                               'changed' => 0,
                                                                                               'vars' => '',
                                                                                               'name' => '_alternation_1_of_production_1_of_rule_XTM_element'
                                                                                             }, 'Parse::RecDescent::Rule' ),
                              'XTM_attribute' => bless( {
                                                          'impcount' => 1,
                                                          'line' => '52',
                                                          'prods' => [
                                                                       bless( {
                                                                                'dircount' => 0,
                                                                                'uncommit' => undef,
                                                                                'patcount' => 0,
                                                                                'strcount' => 1,
                                                                                'number' => 0,
                                                                                'error' => undef,
                                                                                'line' => undef,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'description' => '\'@\'',
                                                                                                      'line' => '52',
                                                                                                      'pattern' => '@',
                                                                                                      'hashname' => '__STRING1__',
                                                                                                      'lookahead' => 0
                                                                                                    }, 'Parse::RecDescent::Literal' ),
                                                                                             bless( {
                                                                                                      'line' => '52',
                                                                                                      'subrule' => '_alternation_1_of_production_1_of_rule_XTM_attribute',
                                                                                                      'argcode' => undef,
                                                                                                      'implicit' => '\'href\', or \'id\'',
                                                                                                      'matchrule' => 0,
                                                                                                      'lookahead' => 0
                                                                                                    }, 'Parse::RecDescent::Subrule' ),
                                                                                             bless( {
                                                                                                      'line' => '53',
                                                                                                      'code' => '{
			  $return = { \'attribute\' => $item[2] };
			  }',
                                                                                                      'hashname' => '__ACTION1__',
                                                                                                      'lookahead' => 0
                                                                                                    }, 'Parse::RecDescent::Action' )
                                                                                           ],
                                                                                'actcount' => 1
                                                                              }, 'Parse::RecDescent::Production' )
                                                                     ],
                                                          'calls' => [
                                                                       '_alternation_1_of_production_1_of_rule_XTM_attribute'
                                                                     ],
                                                          'opcount' => 0,
                                                          'changed' => 0,
                                                          'vars' => '',
                                                          'name' => 'XTM_attribute'
                                                        }, 'Parse::RecDescent::Rule' ),
                              'path_numeric' => bless( {
                                                         'impcount' => 0,
                                                         'line' => '97',
                                                         'prods' => [
                                                                      bless( {
                                                                               'dircount' => 0,
                                                                               'uncommit' => undef,
                                                                               'patcount' => 1,
                                                                               'strcount' => 0,
                                                                               'number' => 0,
                                                                               'error' => undef,
                                                                               'line' => undef,
                                                                               'items' => [
                                                                                            bless( {
                                                                                                     'description' => '/[\\\\+\\\\-\\\\d\\\\.]+/',
                                                                                                     'pattern' => '[\\+\\-\\d\\.]+',
                                                                                                     'mod' => '',
                                                                                                     'hashname' => '__PATTERN1__',
                                                                                                     'lookahead' => 0,
                                                                                                     'ldelim' => '/',
                                                                                                     'line' => '97',
                                                                                                     'rdelim' => '/'
                                                                                                   }, 'Parse::RecDescent::Token' )
                                                                                          ],
                                                                               'actcount' => 0
                                                                             }, 'Parse::RecDescent::Production' )
                                                                    ],
                                                         'calls' => [],
                                                         'opcount' => 0,
                                                         'changed' => 0,
                                                         'vars' => '',
                                                         'name' => 'path_numeric'
                                                       }, 'Parse::RecDescent::Rule' ),
                              'expr' => bless( {
                                                 'impcount' => 0,
                                                 'line' => '62',
                                                 'prods' => [
                                                              bless( {
                                                                       'dircount' => 0,
                                                                       'uncommit' => undef,
                                                                       'patcount' => 0,
                                                                       'strcount' => 0,
                                                                       'number' => 0,
                                                                       'error' => undef,
                                                                       'line' => undef,
                                                                       'items' => [
                                                                                    bless( {
                                                                                             'line' => '62',
                                                                                             'subrule' => 'simple_expr',
                                                                                             'argcode' => undef,
                                                                                             'implicit' => undef,
                                                                                             'matchrule' => 0,
                                                                                             'lookahead' => 0
                                                                                           }, 'Parse::RecDescent::Subrule' )
                                                                                  ],
                                                                       'actcount' => 0
                                                                     }, 'Parse::RecDescent::Production' )
                                                            ],
                                                 'calls' => [
                                                              'simple_expr'
                                                            ],
                                                 'opcount' => 0,
                                                 'changed' => 0,
                                                 'vars' => '',
                                                 'name' => 'expr'
                                               }, 'Parse::RecDescent::Rule' ),
                              'compare_op' => bless( {
                                                       'impcount' => 0,
                                                       'line' => '87',
                                                       'prods' => [
                                                                    bless( {
                                                                             'dircount' => 0,
                                                                             'uncommit' => undef,
                                                                             'patcount' => 0,
                                                                             'strcount' => 1,
                                                                             'number' => 0,
                                                                             'error' => undef,
                                                                             'line' => undef,
                                                                             'items' => [
                                                                                          bless( {
                                                                                                   'description' => '\'=\'',
                                                                                                   'line' => '87',
                                                                                                   'pattern' => '=',
                                                                                                   'hashname' => '__STRING1__',
                                                                                                   'lookahead' => 0
                                                                                                 }, 'Parse::RecDescent::Literal' )
                                                                                        ],
                                                                             'actcount' => 0
                                                                           }, 'Parse::RecDescent::Production' ),
                                                                    bless( {
                                                                             'dircount' => 0,
                                                                             'uncommit' => undef,
                                                                             'patcount' => 0,
                                                                             'strcount' => 1,
                                                                             'number' => 1,
                                                                             'error' => undef,
                                                                             'line' => '87',
                                                                             'items' => [
                                                                                          bless( {
                                                                                                   'description' => '\'!=\'',
                                                                                                   'line' => '87',
                                                                                                   'pattern' => '!=',
                                                                                                   'hashname' => '__STRING1__',
                                                                                                   'lookahead' => 0
                                                                                                 }, 'Parse::RecDescent::Literal' )
                                                                                        ],
                                                                             'actcount' => 0
                                                                           }, 'Parse::RecDescent::Production' ),
                                                                    bless( {
                                                                             'dircount' => 0,
                                                                             'uncommit' => undef,
                                                                             'patcount' => 0,
                                                                             'strcount' => 1,
                                                                             'number' => 2,
                                                                             'error' => undef,
                                                                             'line' => '87',
                                                                             'items' => [
                                                                                          bless( {
                                                                                                   'description' => '\'<\'',
                                                                                                   'line' => '87',
                                                                                                   'pattern' => '<',
                                                                                                   'hashname' => '__STRING1__',
                                                                                                   'lookahead' => 0
                                                                                                 }, 'Parse::RecDescent::Literal' )
                                                                                        ],
                                                                             'actcount' => 0
                                                                           }, 'Parse::RecDescent::Production' ),
                                                                    bless( {
                                                                             'dircount' => 0,
                                                                             'uncommit' => undef,
                                                                             'patcount' => 0,
                                                                             'strcount' => 1,
                                                                             'number' => 3,
                                                                             'error' => undef,
                                                                             'line' => '87',
                                                                             'items' => [
                                                                                          bless( {
                                                                                                   'description' => '\'>\'',
                                                                                                   'line' => '87',
                                                                                                   'pattern' => '>',
                                                                                                   'hashname' => '__STRING1__',
                                                                                                   'lookahead' => 0
                                                                                                 }, 'Parse::RecDescent::Literal' )
                                                                                        ],
                                                                             'actcount' => 0
                                                                           }, 'Parse::RecDescent::Production' ),
                                                                    bless( {
                                                                             'dircount' => 0,
                                                                             'uncommit' => undef,
                                                                             'patcount' => 0,
                                                                             'strcount' => 1,
                                                                             'number' => 4,
                                                                             'error' => undef,
                                                                             'line' => '87',
                                                                             'items' => [
                                                                                          bless( {
                                                                                                   'description' => '\'<=\'',
                                                                                                   'line' => '87',
                                                                                                   'pattern' => '<=',
                                                                                                   'hashname' => '__STRING1__',
                                                                                                   'lookahead' => 0
                                                                                                 }, 'Parse::RecDescent::Literal' )
                                                                                        ],
                                                                             'actcount' => 0
                                                                           }, 'Parse::RecDescent::Production' ),
                                                                    bless( {
                                                                             'dircount' => 0,
                                                                             'uncommit' => undef,
                                                                             'patcount' => 0,
                                                                             'strcount' => 1,
                                                                             'number' => 5,
                                                                             'error' => undef,
                                                                             'line' => '87',
                                                                             'items' => [
                                                                                          bless( {
                                                                                                   'description' => '\'>=\'',
                                                                                                   'line' => '87',
                                                                                                   'pattern' => '>=',
                                                                                                   'hashname' => '__STRING1__',
                                                                                                   'lookahead' => 0
                                                                                                 }, 'Parse::RecDescent::Literal' )
                                                                                        ],
                                                                             'actcount' => 0
                                                                           }, 'Parse::RecDescent::Production' )
                                                                  ],
                                                       'calls' => [],
                                                       'opcount' => 0,
                                                       'changed' => 0,
                                                       'vars' => '',
                                                       'name' => 'compare_op'
                                                     }, 'Parse::RecDescent::Rule' ),
                              'axis' => bless( {
                                                 'impcount' => 0,
                                                 'line' => '11',
                                                 'prods' => [
                                                              bless( {
                                                                       'dircount' => 0,
                                                                       'uncommit' => undef,
                                                                       'patcount' => 0,
                                                                       'strcount' => 0,
                                                                       'number' => 0,
                                                                       'error' => undef,
                                                                       'line' => undef,
                                                                       'items' => [
                                                                                    bless( {
                                                                                             'line' => '11',
                                                                                             'subrule' => 'descendant',
                                                                                             'argcode' => undef,
                                                                                             'implicit' => undef,
                                                                                             'matchrule' => 0,
                                                                                             'lookahead' => 0
                                                                                           }, 'Parse::RecDescent::Subrule' )
                                                                                  ],
                                                                       'actcount' => 0
                                                                     }, 'Parse::RecDescent::Production' ),
                                                              bless( {
                                                                       'dircount' => 0,
                                                                       'uncommit' => undef,
                                                                       'patcount' => 0,
                                                                       'strcount' => 0,
                                                                       'number' => 1,
                                                                       'error' => undef,
                                                                       'line' => '11',
                                                                       'items' => [
                                                                                    bless( {
                                                                                             'line' => '11',
                                                                                             'subrule' => 'child',
                                                                                             'argcode' => undef,
                                                                                             'implicit' => undef,
                                                                                             'matchrule' => 0,
                                                                                             'lookahead' => 0
                                                                                           }, 'Parse::RecDescent::Subrule' )
                                                                                  ],
                                                                       'actcount' => 0
                                                                     }, 'Parse::RecDescent::Production' )
                                                            ],
                                                 'calls' => [
                                                              'descendant',
                                                              'child'
                                                            ],
                                                 'opcount' => 0,
                                                 'changed' => 0,
                                                 'vars' => '',
                                                 'name' => 'axis'
                                               }, 'Parse::RecDescent::Rule' )
                            },
                 'namespace' => 'Parse::RecDescent::namespace000001',
                 '_check' => {
                               'prevline' => '',
                               'prevcolumn' => '',
                               'thiscolumn' => '',
                               'prevoffset' => '',
                               'thisoffset' => '',
                               'itempos' => ''
                             },
                 '_AUTOACTION' => undef,
                 'localvars' => '',
                 'startcode' => ''
               }, 'Parse::RecDescent' );
}