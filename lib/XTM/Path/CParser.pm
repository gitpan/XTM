package XTM::Path::CParser;
use Parse::RecDescent;

{ my $ERRORS;


package Parse::RecDescent::XTM::Path::CParser;
use strict;
use vars qw($skip $AUTOLOAD  );
$skip = '\s*';


{
local $SIG{__WARN__} = sub {0};
# PRETEND TO BE IN Parse::RecDescent NAMESPACE
*Parse::RecDescent::XTM::Path::CParser::AUTOLOAD	= sub
{
	no strict 'refs';
	$AUTOLOAD =~ s/^Parse::RecDescent::XTM::Path::CParser/Parse::RecDescent/;
	goto &{$AUTOLOAD};
}
}

push @Parse::RecDescent::XTM::Path::CParser::ISA, 'Parse::RecDescent';
# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::Path::CParser::variable
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"variable"};
	
	Parse::RecDescent::_trace(q{Trying rule: [variable]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{variable},
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
		
		Parse::RecDescent::_trace(q{Trying production: [/\\?\\w+/]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{variable},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{variable});
		%item = (__RULE__ => q{variable});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: [/\\?\\w+/]}, Parse::RecDescent::_tracefirst($text),
					  q{variable},
					  $tracelevel)
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
					  q{variable},
					  $tracelevel)
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
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [/\\?\\w+/]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{variable},
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
					 q{variable},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{variable},
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
					  q{variable},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{variable},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::Path::CParser::relative_path
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"relative_path"};
	
	Parse::RecDescent::_trace(q{Trying rule: [relative_path]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{relative_path},
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
		
		Parse::RecDescent::_trace(q{Trying production: [XTM_thing predicate]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{relative_path},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{relative_path});
		%item = (__RULE__ => q{relative_path});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [XTM_thing]},
				  Parse::RecDescent::_tracefirst($text),
				  q{relative_path},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::Path::CParser::XTM_thing($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [XTM_thing]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{relative_path},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [XTM_thing]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{relative_path},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{XTM_thing}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying repeated subrule: [predicate]},
				  Parse::RecDescent::_tracefirst($text),
				  q{relative_path},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{predicate})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::Path::CParser::predicate, 0, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [predicate]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{relative_path},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [predicate]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{relative_path},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{predicate(s?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{relative_path},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			   $return = { %{$item{'XTM_thing'}},
				       predicates => []};
			   foreach (@{$item{'predicate(s?)'}}) {
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
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [XTM_thing predicate]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{relative_path},
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
					 q{relative_path},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{relative_path},
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
					  q{relative_path},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{relative_path},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::Path::CParser::op_value
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"op_value"};
	
	Parse::RecDescent::_trace(q{Trying rule: [op_value]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{op_value},
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
		
		Parse::RecDescent::_trace(q{Trying production: [compare_op value]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{op_value},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{op_value});
		%item = (__RULE__ => q{op_value});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [compare_op]},
				  Parse::RecDescent::_tracefirst($text),
				  q{op_value},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::Path::CParser::compare_op($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [compare_op]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{op_value},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [compare_op]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{op_value},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{compare_op}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying subrule: [value]},
				  Parse::RecDescent::_tracefirst($text),
				  q{op_value},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{value})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::Path::CParser::value($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [value]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{op_value},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [value]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{op_value},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{value}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{op_value},
					  $tracelevel)
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
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [compare_op value]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{op_value},
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
					 q{op_value},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{op_value},
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
					  q{op_value},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{op_value},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::Path::CParser::descendant
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"descendant"};
	
	Parse::RecDescent::_trace(q{Trying rule: [descendant]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{descendant},
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
		
		Parse::RecDescent::_trace(q{Trying production: ['.//']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{descendant},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{descendant});
		%item = (__RULE__ => q{descendant});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['.//']},
					  Parse::RecDescent::_tracefirst($text),
					  q{descendant},
					  $tracelevel)
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
					  q{descendant},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['//']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{descendant},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{descendant});
		%item = (__RULE__ => q{descendant});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['//']},
					  Parse::RecDescent::_tracefirst($text),
					  q{descendant},
					  $tracelevel)
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
					  q{descendant},
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
					 q{descendant},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{descendant},
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
					  q{descendant},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{descendant},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::Path::CParser::axis
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"axis"};
	
	Parse::RecDescent::_trace(q{Trying rule: [axis]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{axis},
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
		
		Parse::RecDescent::_trace(q{Trying production: [descendant]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{axis},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{axis});
		%item = (__RULE__ => q{axis});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [descendant]},
				  Parse::RecDescent::_tracefirst($text),
				  q{axis},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::Path::CParser::descendant($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [descendant]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{axis},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [descendant]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{axis},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{descendant}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [descendant]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{axis},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [child]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{axis},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{axis});
		%item = (__RULE__ => q{axis});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [child]},
				  Parse::RecDescent::_tracefirst($text),
				  q{axis},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::Path::CParser::child($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [child]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{axis},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [child]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{axis},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{child}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [child]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{axis},
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
					 q{axis},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{axis},
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
					  q{axis},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{axis},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::Path::CParser::compare_op
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"compare_op"};
	
	Parse::RecDescent::_trace(q{Trying rule: [compare_op]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{compare_op},
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
		
		Parse::RecDescent::_trace(q{Trying production: ['=']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{compare_op},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{compare_op});
		%item = (__RULE__ => q{compare_op});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['=']},
					  Parse::RecDescent::_tracefirst($text),
					  q{compare_op},
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['=']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{compare_op},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['!=']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{compare_op},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{compare_op});
		%item = (__RULE__ => q{compare_op});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['!=']},
					  Parse::RecDescent::_tracefirst($text),
					  q{compare_op},
					  $tracelevel)
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
					  q{compare_op},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['<']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{compare_op},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[2];
		$text = $_[1];
		my $_savetext;
		@item = (q{compare_op});
		%item = (__RULE__ => q{compare_op});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['<']},
					  Parse::RecDescent::_tracefirst($text),
					  q{compare_op},
					  $tracelevel)
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
					  q{compare_op},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['>']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{compare_op},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[3];
		$text = $_[1];
		my $_savetext;
		@item = (q{compare_op});
		%item = (__RULE__ => q{compare_op});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['>']},
					  Parse::RecDescent::_tracefirst($text),
					  q{compare_op},
					  $tracelevel)
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
					  q{compare_op},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['<=']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{compare_op},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[4];
		$text = $_[1];
		my $_savetext;
		@item = (q{compare_op});
		%item = (__RULE__ => q{compare_op});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['<=']},
					  Parse::RecDescent::_tracefirst($text),
					  q{compare_op},
					  $tracelevel)
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
					  q{compare_op},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['>=']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{compare_op},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[5];
		$text = $_[1];
		my $_savetext;
		@item = (q{compare_op});
		%item = (__RULE__ => q{compare_op});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['>=']},
					  Parse::RecDescent::_tracefirst($text),
					  q{compare_op},
					  $tracelevel)
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
					  q{compare_op},
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
					 q{compare_op},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{compare_op},
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
					  q{compare_op},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{compare_op},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::Path::CParser::step
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"step"};
	
	Parse::RecDescent::_trace(q{Trying rule: [step]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{step},
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
		
		Parse::RecDescent::_trace(q{Trying production: [axis relative_path]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{step},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{step});
		%item = (__RULE__ => q{step});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying repeated subrule: [axis]},
				  Parse::RecDescent::_tracefirst($text),
				  q{step},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::Path::CParser::axis, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [axis]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{step},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [axis]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{step},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{axis(?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying subrule: [relative_path]},
				  Parse::RecDescent::_tracefirst($text),
				  q{step},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{relative_path})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::Path::CParser::relative_path($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [relative_path]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{step},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [relative_path]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{step},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{relative_path}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [axis relative_path]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{step},
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
					 q{step},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{step},
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
					  q{step},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{step},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::Path::CParser::expr
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"expr"};
	
	Parse::RecDescent::_trace(q{Trying rule: [expr]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{expr},
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
		
		Parse::RecDescent::_trace(q{Trying production: [simple_expr]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{expr},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{expr});
		%item = (__RULE__ => q{expr});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [simple_expr]},
				  Parse::RecDescent::_tracefirst($text),
				  q{expr},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::Path::CParser::simple_expr($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [simple_expr]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{expr},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [simple_expr]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{expr},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{simple_expr}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [simple_expr]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{expr},
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
					 q{expr},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{expr},
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
					  q{expr},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{expr},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::Path::CParser::predicate
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"predicate"};
	
	Parse::RecDescent::_trace(q{Trying rule: [predicate]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{predicate},
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
		
		Parse::RecDescent::_trace(q{Trying production: ['[' expr ']']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{predicate},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{predicate});
		%item = (__RULE__ => q{predicate});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['[']},
					  Parse::RecDescent::_tracefirst($text),
					  q{predicate},
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
		

		Parse::RecDescent::_trace(q{Trying subrule: [expr]},
				  Parse::RecDescent::_tracefirst($text),
				  q{predicate},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{expr})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::Path::CParser::expr($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [expr]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{predicate},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [expr]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{predicate},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{expr}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying terminal: [']']},
					  Parse::RecDescent::_tracefirst($text),
					  q{predicate},
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
					  q{predicate},
					  $tracelevel)
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
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['[' expr ']']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{predicate},
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
					 q{predicate},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{predicate},
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
					  q{predicate},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{predicate},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::Path::CParser::path_string
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"path_string"};
	
	Parse::RecDescent::_trace(q{Trying rule: [path_string]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{path_string},
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
					  q{path_string},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{path_string});
		%item = (__RULE__ => q{path_string});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['"']},
					  Parse::RecDescent::_tracefirst($text),
					  q{path_string},
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
					  q{path_string},
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
					  q{path_string},
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
					  q{path_string},
					  $tracelevel)
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
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['"' /[^\\"]*/ '"']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{path_string},
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
					 q{path_string},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{path_string},
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
					  q{path_string},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{path_string},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::Path::CParser::_alternation_1_of_production_1_of_rule_XTM_element
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"_alternation_1_of_production_1_of_rule_XTM_element"};
	
	Parse::RecDescent::_trace(q{Trying rule: [_alternation_1_of_production_1_of_rule_XTM_element]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{_alternation_1_of_production_1_of_rule_XTM_element},
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
		
		Parse::RecDescent::_trace(q{Trying production: ['topicRef']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_element});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['topicRef']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
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
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['topic']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_element});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['topic']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
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
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['baseNameString']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[2];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_element});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['baseNameString']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
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
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['baseName']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[3];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_element});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['baseName']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
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
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['occurrence']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[4];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_element});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['occurrence']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
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
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['resourceRef']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[5];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_element});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['resourceRef']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
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
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['resourceData']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[6];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_element});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['resourceData']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
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
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['instanceOf']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[7];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_element});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['instanceOf']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
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
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['subjectIndicatorRef']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[8];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_element});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['subjectIndicatorRef']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
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
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['subjectIdentity']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[9];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_element});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['subjectIdentity']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
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
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['scope']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[10];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_element});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['scope']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
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
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['association']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[11];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_element});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['association']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
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
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['member']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[12];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_element});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['member']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
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
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['roleSpec']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[13];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_element});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['roleSpec']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
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
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
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
					 q{_alternation_1_of_production_1_of_rule_XTM_element},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
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
					  q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{_alternation_1_of_production_1_of_rule_XTM_element},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::Path::CParser::path_numeric
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"path_numeric"};
	
	Parse::RecDescent::_trace(q{Trying rule: [path_numeric]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{path_numeric},
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
		
		Parse::RecDescent::_trace(q{Trying production: [/[\\+\\-\\d\\.]+/]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{path_numeric},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{path_numeric});
		%item = (__RULE__ => q{path_numeric});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: [/[\\+\\-\\d\\.]+/]}, Parse::RecDescent::_tracefirst($text),
					  q{path_numeric},
					  $tracelevel)
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
					  q{path_numeric},
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
					 q{path_numeric},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{path_numeric},
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
					  q{path_numeric},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{path_numeric},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::Path::CParser::XTM_attribute
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"XTM_attribute"};
	
	Parse::RecDescent::_trace(q{Trying rule: [XTM_attribute]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{XTM_attribute},
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
		
		Parse::RecDescent::_trace(q{Trying production: ['@' 'href', or 'id']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{XTM_attribute},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{XTM_attribute});
		%item = (__RULE__ => q{XTM_attribute});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['@']},
					  Parse::RecDescent::_tracefirst($text),
					  q{XTM_attribute},
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
		

		Parse::RecDescent::_trace(q{Trying subrule: [_alternation_1_of_production_1_of_rule_XTM_attribute]},
				  Parse::RecDescent::_tracefirst($text),
				  q{XTM_attribute},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{'href', or 'id'})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::Path::CParser::_alternation_1_of_production_1_of_rule_XTM_attribute($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [_alternation_1_of_production_1_of_rule_XTM_attribute]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{XTM_attribute},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [_alternation_1_of_production_1_of_rule_XTM_attribute]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{XTM_attribute},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{_alternation_1_of_production_1_of_rule_XTM_attribute}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{XTM_attribute},
					  $tracelevel)
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
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['@' 'href', or 'id']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{XTM_attribute},
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
					 q{XTM_attribute},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{XTM_attribute},
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
					  q{XTM_attribute},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{XTM_attribute},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::Path::CParser::path_startrule
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"path_startrule"};
	
	Parse::RecDescent::_trace(q{Trying rule: [path_startrule]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{path_startrule},
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
		
		Parse::RecDescent::_trace(q{Trying production: [path]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{path_startrule},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{path_startrule});
		%item = (__RULE__ => q{path_startrule});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [path]},
				  Parse::RecDescent::_tracefirst($text),
				  q{path_startrule},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::Path::CParser::path($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [path]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{path_startrule},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [path]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{path_startrule},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{path}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [path]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{path_startrule},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [<error...>]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{path_startrule},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		
		my $_savetext;
		@item = (q{path_startrule});
		%item = (__RULE__ => q{path_startrule});
		my $repcount = 0;


		

		Parse::RecDescent::_trace(q{Trying directive: [<error...>]},
					Parse::RecDescent::_tracefirst($text),
					  q{path_startrule},
					  $tracelevel)
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
					  q{path_startrule},
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
					 q{path_startrule},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{path_startrule},
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
					  q{path_startrule},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{path_startrule},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::Path::CParser::XTM_thing
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"XTM_thing"};
	
	Parse::RecDescent::_trace(q{Trying rule: [XTM_thing]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{XTM_thing},
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
		
		Parse::RecDescent::_trace(q{Trying production: [XTM_element, or XTM_attribute, or XTM_data]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{XTM_thing},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{XTM_thing});
		%item = (__RULE__ => q{XTM_thing});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [_alternation_1_of_production_1_of_rule_XTM_thing]},
				  Parse::RecDescent::_tracefirst($text),
				  q{XTM_thing},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::Path::CParser::_alternation_1_of_production_1_of_rule_XTM_thing($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [_alternation_1_of_production_1_of_rule_XTM_thing]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{XTM_thing},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [_alternation_1_of_production_1_of_rule_XTM_thing]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{XTM_thing},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{_alternation_1_of_production_1_of_rule_XTM_thing}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [XTM_element, or XTM_attribute, or XTM_data]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{XTM_thing},
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
					 q{XTM_thing},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{XTM_thing},
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
					  q{XTM_thing},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{XTM_thing},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::Path::CParser::simple_expr
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"simple_expr"};
	
	Parse::RecDescent::_trace(q{Trying rule: [simple_expr]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{simple_expr},
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
		
		Parse::RecDescent::_trace(q{Trying production: [path op_value]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{simple_expr},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{simple_expr});
		%item = (__RULE__ => q{simple_expr});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [path]},
				  Parse::RecDescent::_tracefirst($text),
				  q{simple_expr},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::Path::CParser::path($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [path]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{simple_expr},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [path]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{simple_expr},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{path}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying repeated subrule: [op_value]},
				  Parse::RecDescent::_tracefirst($text),
				  q{simple_expr},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{op_value})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::Path::CParser::op_value, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [op_value]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{simple_expr},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [op_value]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{simple_expr},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{op_value(?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{simple_expr},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			   $return = [ $item{path} ];
			   if ($item{'op_value(?)'} && $item{'op_value(?)'}->[0]) {
			     push @$return, @{$item{'op_value(?)'}->[0]};
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
		


		Parse::RecDescent::_trace(q{>>Matched production: [path op_value]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{simple_expr},
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
					 q{simple_expr},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{simple_expr},
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
					  q{simple_expr},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{simple_expr},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::Path::CParser::value
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"value"};
	
	Parse::RecDescent::_trace(q{Trying rule: [value]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{value},
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
		
		Parse::RecDescent::_trace(q{Trying production: [path_numeric]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{value},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{value});
		%item = (__RULE__ => q{value});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [path_numeric]},
				  Parse::RecDescent::_tracefirst($text),
				  q{value},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::Path::CParser::path_numeric($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [path_numeric]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{value},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [path_numeric]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{value},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{path_numeric}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [path_numeric]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{value},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [path_string]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{value},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{value});
		%item = (__RULE__ => q{value});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [path_string]},
				  Parse::RecDescent::_tracefirst($text),
				  q{value},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::Path::CParser::path_string($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [path_string]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{value},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [path_string]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{value},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{path_string}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [path_string]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{value},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [variable]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{value},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[2];
		$text = $_[1];
		my $_savetext;
		@item = (q{value});
		%item = (__RULE__ => q{value});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [variable]},
				  Parse::RecDescent::_tracefirst($text),
				  q{value},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::Path::CParser::variable($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [variable]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{value},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [variable]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{value},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{variable}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [variable]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{value},
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
					 q{value},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{value},
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
					  q{value},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{value},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::Path::CParser::_alternation_1_of_production_1_of_rule_XTM_thing
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"_alternation_1_of_production_1_of_rule_XTM_thing"};
	
	Parse::RecDescent::_trace(q{Trying rule: [_alternation_1_of_production_1_of_rule_XTM_thing]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{_alternation_1_of_production_1_of_rule_XTM_thing},
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
		
		Parse::RecDescent::_trace(q{Trying production: [XTM_element]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_thing},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_thing});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_thing});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [XTM_element]},
				  Parse::RecDescent::_tracefirst($text),
				  q{_alternation_1_of_production_1_of_rule_XTM_thing},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::Path::CParser::XTM_element($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [XTM_element]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{_alternation_1_of_production_1_of_rule_XTM_thing},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [XTM_element]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_thing},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{XTM_element}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [XTM_element]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_thing},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [XTM_attribute]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_thing},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_thing});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_thing});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [XTM_attribute]},
				  Parse::RecDescent::_tracefirst($text),
				  q{_alternation_1_of_production_1_of_rule_XTM_thing},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::Path::CParser::XTM_attribute($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [XTM_attribute]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{_alternation_1_of_production_1_of_rule_XTM_thing},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [XTM_attribute]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_thing},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{XTM_attribute}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [XTM_attribute]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_thing},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [XTM_data]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_thing},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[2];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_thing});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_thing});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [XTM_data]},
				  Parse::RecDescent::_tracefirst($text),
				  q{_alternation_1_of_production_1_of_rule_XTM_thing},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::Path::CParser::XTM_data($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [XTM_data]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{_alternation_1_of_production_1_of_rule_XTM_thing},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [XTM_data]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_thing},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{XTM_data}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [XTM_data]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_thing},
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
					 q{_alternation_1_of_production_1_of_rule_XTM_thing},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{_alternation_1_of_production_1_of_rule_XTM_thing},
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
					  q{_alternation_1_of_production_1_of_rule_XTM_thing},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{_alternation_1_of_production_1_of_rule_XTM_thing},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::Path::CParser::XTM_element
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"XTM_element"};
	
	Parse::RecDescent::_trace(q{Trying rule: [XTM_element]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{XTM_element},
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
		
		Parse::RecDescent::_trace(q{Trying production: ['topicRef', or 'topic', or 'baseNameString', or 'baseName', or 'occurrence', or 'resourceRef', or 'resourceData', or 'instanceOf', or 'subjectIndicatorRef', or 'subjectIdentity', or 'scope', or 'association', or 'member', or 'roleSpec']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{XTM_element});
		%item = (__RULE__ => q{XTM_element});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [_alternation_1_of_production_1_of_rule_XTM_element]},
				  Parse::RecDescent::_tracefirst($text),
				  q{XTM_element},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::Path::CParser::_alternation_1_of_production_1_of_rule_XTM_element($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [_alternation_1_of_production_1_of_rule_XTM_element]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{XTM_element},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [_alternation_1_of_production_1_of_rule_XTM_element]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{XTM_element},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{_alternation_1_of_production_1_of_rule_XTM_element}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{XTM_element},
					  $tracelevel)
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
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['topicRef', or 'topic', or 'baseNameString', or 'baseName', or 'occurrence', or 'resourceRef', or 'resourceData', or 'instanceOf', or 'subjectIndicatorRef', or 'subjectIdentity', or 'scope', or 'association', or 'member', or 'roleSpec']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{XTM_element},
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
					 q{XTM_element},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{XTM_element},
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
					  q{XTM_element},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{XTM_element},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::Path::CParser::path
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"path"};
	
	Parse::RecDescent::_trace(q{Trying rule: [path]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{path},
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
		
		Parse::RecDescent::_trace(q{Trying production: [step]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{path},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{path});
		%item = (__RULE__ => q{path});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying repeated subrule: [step]},
				  Parse::RecDescent::_tracefirst($text),
				  q{path},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::Path::CParser::step, 1, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [step]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{path},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [step]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{path},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{step(s)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{path},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			  $return = $item{'step(s)'};
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
		


		Parse::RecDescent::_trace(q{>>Matched production: [step]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{path},
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
					 q{path},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{path},
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
					  q{path},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{path},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::Path::CParser::child
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"child"};
	
	Parse::RecDescent::_trace(q{Trying rule: [child]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{child},
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
		
		Parse::RecDescent::_trace(q{Trying production: ['./']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{child},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{child});
		%item = (__RULE__ => q{child});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['./']},
					  Parse::RecDescent::_tracefirst($text),
					  q{child},
					  $tracelevel)
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
					  q{child},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['/']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{child},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{child});
		%item = (__RULE__ => q{child});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['/']},
					  Parse::RecDescent::_tracefirst($text),
					  q{child},
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['/']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{child},
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
					 q{child},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{child},
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
					  q{child},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{child},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::Path::CParser::_alternation_1_of_production_1_of_rule_XTM_attribute
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"_alternation_1_of_production_1_of_rule_XTM_attribute"};
	
	Parse::RecDescent::_trace(q{Trying rule: [_alternation_1_of_production_1_of_rule_XTM_attribute]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{_alternation_1_of_production_1_of_rule_XTM_attribute},
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
		
		Parse::RecDescent::_trace(q{Trying production: ['href']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_attribute},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_attribute});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_attribute});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['href']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_attribute},
					  $tracelevel)
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
					  q{_alternation_1_of_production_1_of_rule_XTM_attribute},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['id']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_XTM_attribute},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_XTM_attribute});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_XTM_attribute});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['id']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_XTM_attribute},
					  $tracelevel)
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
					  q{_alternation_1_of_production_1_of_rule_XTM_attribute},
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
					 q{_alternation_1_of_production_1_of_rule_XTM_attribute},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{_alternation_1_of_production_1_of_rule_XTM_attribute},
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
					  q{_alternation_1_of_production_1_of_rule_XTM_attribute},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{_alternation_1_of_production_1_of_rule_XTM_attribute},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::Path::CParser::XTM_data
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"XTM_data"};
	
	Parse::RecDescent::_trace(q{Trying rule: [XTM_data]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{XTM_data},
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
		
		Parse::RecDescent::_trace(q{Trying production: ['text()']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{XTM_data},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{XTM_data});
		%item = (__RULE__ => q{XTM_data});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['text()']},
					  Parse::RecDescent::_tracefirst($text),
					  q{XTM_data},
					  $tracelevel)
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
					  q{XTM_data},
					  $tracelevel)
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
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['text()']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{XTM_data},
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
					 q{XTM_data},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{XTM_data},
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
					  q{XTM_data},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{XTM_data},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}
}
package XTM::Path::CParser; sub new { my $self = bless( {
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
                 'namespace' => 'Parse::RecDescent::XTM::Path::CParser',
                 '_AUTOACTION' => undef,
                 'rules' => {
                              'variable' => bless( {
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
                                                                           'actcount' => 1,
                                                                           'items' => [
                                                                                        bless( {
                                                                                                 'pattern' => '\\?\\w+',
                                                                                                 'hashname' => '__PATTERN1__',
                                                                                                 'description' => '/\\\\?\\\\w+/',
                                                                                                 'lookahead' => 0,
                                                                                                 'rdelim' => '/',
                                                                                                 'line' => 91,
                                                                                                 'mod' => '',
                                                                                                 'ldelim' => '/'
                                                                                               }, 'Parse::RecDescent::Token' ),
                                                                                        bless( {
                                                                                                 'hashname' => '__ACTION1__',
                                                                                                 'lookahead' => 0,
                                                                                                 'line' => 92,
                                                                                                 'code' => '{
			  $item[1] =~ /\\?(.+)/;
			  $return = { variable => $1 };
			 }'
                                                                                               }, 'Parse::RecDescent::Action' )
                                                                                      ],
                                                                           'line' => undef
                                                                         }, 'Parse::RecDescent::Production' )
                                                                ],
                                                     'name' => 'variable',
                                                     'vars' => '',
                                                     'line' => 91
                                                   }, 'Parse::RecDescent::Rule' ),
                              'relative_path' => bless( {
                                                          'impcount' => 0,
                                                          'calls' => [
                                                                       'XTM_thing',
                                                                       'predicate'
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
                                                                                                      'subrule' => 'XTM_thing',
                                                                                                      'matchrule' => 0,
                                                                                                      'implicit' => undef,
                                                                                                      'argcode' => undef,
                                                                                                      'lookahead' => 0,
                                                                                                      'line' => 17
                                                                                                    }, 'Parse::RecDescent::Subrule' ),
                                                                                             bless( {
                                                                                                      'subrule' => 'predicate',
                                                                                                      'expected' => undef,
                                                                                                      'min' => 0,
                                                                                                      'argcode' => undef,
                                                                                                      'max' => 100000000,
                                                                                                      'matchrule' => 0,
                                                                                                      'repspec' => 's?',
                                                                                                      'lookahead' => 0,
                                                                                                      'line' => 17
                                                                                                    }, 'Parse::RecDescent::Repetition' ),
                                                                                             bless( {
                                                                                                      'hashname' => '__ACTION1__',
                                                                                                      'lookahead' => 0,
                                                                                                      'line' => 18,
                                                                                                      'code' => '{
			   $return = { %{$item{\'XTM_thing\'}},
				       predicates => []};
			   foreach (@{$item{\'predicate(s?)\'}}) {
			     push @{$return->{predicates}}, $_;
			   }

			 }'
                                                                                                    }, 'Parse::RecDescent::Action' )
                                                                                           ],
                                                                                'line' => undef
                                                                              }, 'Parse::RecDescent::Production' )
                                                                     ],
                                                          'name' => 'relative_path',
                                                          'vars' => '',
                                                          'line' => 17
                                                        }, 'Parse::RecDescent::Rule' ),
                              'op_value' => bless( {
                                                     'impcount' => 0,
                                                     'calls' => [
                                                                  'compare_op',
                                                                  'value'
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
                                                                                                 'subrule' => 'compare_op',
                                                                                                 'matchrule' => 0,
                                                                                                 'implicit' => undef,
                                                                                                 'argcode' => undef,
                                                                                                 'lookahead' => 0,
                                                                                                 'line' => 72
                                                                                               }, 'Parse::RecDescent::Subrule' ),
                                                                                        bless( {
                                                                                                 'subrule' => 'value',
                                                                                                 'matchrule' => 0,
                                                                                                 'implicit' => undef,
                                                                                                 'argcode' => undef,
                                                                                                 'lookahead' => 0,
                                                                                                 'line' => 72
                                                                                               }, 'Parse::RecDescent::Subrule' ),
                                                                                        bless( {
                                                                                                 'hashname' => '__ACTION1__',
                                                                                                 'lookahead' => 0,
                                                                                                 'line' => 73,
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
			 }'
                                                                                               }, 'Parse::RecDescent::Action' )
                                                                                      ],
                                                                           'line' => undef
                                                                         }, 'Parse::RecDescent::Production' )
                                                                ],
                                                     'name' => 'op_value',
                                                     'vars' => '',
                                                     'line' => 72
                                                   }, 'Parse::RecDescent::Rule' ),
                              'descendant' => bless( {
                                                       'impcount' => 0,
                                                       'calls' => [],
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
                                                                                                   'pattern' => './/',
                                                                                                   'hashname' => '__STRING1__',
                                                                                                   'description' => '\'.//\'',
                                                                                                   'lookahead' => 0,
                                                                                                   'line' => 15
                                                                                                 }, 'Parse::RecDescent::Literal' )
                                                                                        ],
                                                                             'line' => undef
                                                                           }, 'Parse::RecDescent::Production' ),
                                                                    bless( {
                                                                             'number' => '1',
                                                                             'strcount' => 1,
                                                                             'dircount' => 0,
                                                                             'uncommit' => undef,
                                                                             'error' => undef,
                                                                             'patcount' => 0,
                                                                             'actcount' => 0,
                                                                             'items' => [
                                                                                          bless( {
                                                                                                   'pattern' => '//',
                                                                                                   'hashname' => '__STRING1__',
                                                                                                   'description' => '\'//\'',
                                                                                                   'lookahead' => 0,
                                                                                                   'line' => 15
                                                                                                 }, 'Parse::RecDescent::Literal' )
                                                                                        ],
                                                                             'line' => 15
                                                                           }, 'Parse::RecDescent::Production' )
                                                                  ],
                                                       'name' => 'descendant',
                                                       'vars' => '',
                                                       'line' => 15
                                                     }, 'Parse::RecDescent::Rule' ),
                              'axis' => bless( {
                                                 'impcount' => 0,
                                                 'calls' => [
                                                              'descendant',
                                                              'child'
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
                                                                                             'subrule' => 'descendant',
                                                                                             'matchrule' => 0,
                                                                                             'implicit' => undef,
                                                                                             'argcode' => undef,
                                                                                             'lookahead' => 0,
                                                                                             'line' => 11
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
                                                                                             'subrule' => 'child',
                                                                                             'matchrule' => 0,
                                                                                             'implicit' => undef,
                                                                                             'argcode' => undef,
                                                                                             'lookahead' => 0,
                                                                                             'line' => 11
                                                                                           }, 'Parse::RecDescent::Subrule' )
                                                                                  ],
                                                                       'line' => 11
                                                                     }, 'Parse::RecDescent::Production' )
                                                            ],
                                                 'name' => 'axis',
                                                 'vars' => '',
                                                 'line' => 11
                                               }, 'Parse::RecDescent::Rule' ),
                              'compare_op' => bless( {
                                                       'impcount' => 0,
                                                       'calls' => [],
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
                                                                                                   'pattern' => '=',
                                                                                                   'hashname' => '__STRING1__',
                                                                                                   'description' => '\'=\'',
                                                                                                   'lookahead' => 0,
                                                                                                   'line' => 87
                                                                                                 }, 'Parse::RecDescent::Literal' )
                                                                                        ],
                                                                             'line' => undef
                                                                           }, 'Parse::RecDescent::Production' ),
                                                                    bless( {
                                                                             'number' => '1',
                                                                             'strcount' => 1,
                                                                             'dircount' => 0,
                                                                             'uncommit' => undef,
                                                                             'error' => undef,
                                                                             'patcount' => 0,
                                                                             'actcount' => 0,
                                                                             'items' => [
                                                                                          bless( {
                                                                                                   'pattern' => '!=',
                                                                                                   'hashname' => '__STRING1__',
                                                                                                   'description' => '\'!=\'',
                                                                                                   'lookahead' => 0,
                                                                                                   'line' => 87
                                                                                                 }, 'Parse::RecDescent::Literal' )
                                                                                        ],
                                                                             'line' => 87
                                                                           }, 'Parse::RecDescent::Production' ),
                                                                    bless( {
                                                                             'number' => '2',
                                                                             'strcount' => 1,
                                                                             'dircount' => 0,
                                                                             'uncommit' => undef,
                                                                             'error' => undef,
                                                                             'patcount' => 0,
                                                                             'actcount' => 0,
                                                                             'items' => [
                                                                                          bless( {
                                                                                                   'pattern' => '<',
                                                                                                   'hashname' => '__STRING1__',
                                                                                                   'description' => '\'<\'',
                                                                                                   'lookahead' => 0,
                                                                                                   'line' => 87
                                                                                                 }, 'Parse::RecDescent::Literal' )
                                                                                        ],
                                                                             'line' => 87
                                                                           }, 'Parse::RecDescent::Production' ),
                                                                    bless( {
                                                                             'number' => '3',
                                                                             'strcount' => 1,
                                                                             'dircount' => 0,
                                                                             'uncommit' => undef,
                                                                             'error' => undef,
                                                                             'patcount' => 0,
                                                                             'actcount' => 0,
                                                                             'items' => [
                                                                                          bless( {
                                                                                                   'pattern' => '>',
                                                                                                   'hashname' => '__STRING1__',
                                                                                                   'description' => '\'>\'',
                                                                                                   'lookahead' => 0,
                                                                                                   'line' => 87
                                                                                                 }, 'Parse::RecDescent::Literal' )
                                                                                        ],
                                                                             'line' => 87
                                                                           }, 'Parse::RecDescent::Production' ),
                                                                    bless( {
                                                                             'number' => '4',
                                                                             'strcount' => 1,
                                                                             'dircount' => 0,
                                                                             'uncommit' => undef,
                                                                             'error' => undef,
                                                                             'patcount' => 0,
                                                                             'actcount' => 0,
                                                                             'items' => [
                                                                                          bless( {
                                                                                                   'pattern' => '<=',
                                                                                                   'hashname' => '__STRING1__',
                                                                                                   'description' => '\'<=\'',
                                                                                                   'lookahead' => 0,
                                                                                                   'line' => 87
                                                                                                 }, 'Parse::RecDescent::Literal' )
                                                                                        ],
                                                                             'line' => 87
                                                                           }, 'Parse::RecDescent::Production' ),
                                                                    bless( {
                                                                             'number' => '5',
                                                                             'strcount' => 1,
                                                                             'dircount' => 0,
                                                                             'uncommit' => undef,
                                                                             'error' => undef,
                                                                             'patcount' => 0,
                                                                             'actcount' => 0,
                                                                             'items' => [
                                                                                          bless( {
                                                                                                   'pattern' => '>=',
                                                                                                   'hashname' => '__STRING1__',
                                                                                                   'description' => '\'>=\'',
                                                                                                   'lookahead' => 0,
                                                                                                   'line' => 87
                                                                                                 }, 'Parse::RecDescent::Literal' )
                                                                                        ],
                                                                             'line' => 87
                                                                           }, 'Parse::RecDescent::Production' )
                                                                  ],
                                                       'name' => 'compare_op',
                                                       'vars' => '',
                                                       'line' => 87
                                                     }, 'Parse::RecDescent::Rule' ),
                              'step' => bless( {
                                                 'impcount' => 0,
                                                 'calls' => [
                                                              'axis',
                                                              'relative_path'
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
                                                                                             'subrule' => 'axis',
                                                                                             'expected' => undef,
                                                                                             'min' => 0,
                                                                                             'argcode' => undef,
                                                                                             'max' => 1,
                                                                                             'matchrule' => 0,
                                                                                             'repspec' => '?',
                                                                                             'lookahead' => 0,
                                                                                             'line' => 9
                                                                                           }, 'Parse::RecDescent::Repetition' ),
                                                                                    bless( {
                                                                                             'subrule' => 'relative_path',
                                                                                             'matchrule' => 0,
                                                                                             'implicit' => undef,
                                                                                             'argcode' => undef,
                                                                                             'lookahead' => 0,
                                                                                             'line' => 9
                                                                                           }, 'Parse::RecDescent::Subrule' )
                                                                                  ],
                                                                       'line' => undef
                                                                     }, 'Parse::RecDescent::Production' )
                                                            ],
                                                 'name' => 'step',
                                                 'vars' => '',
                                                 'line' => 9
                                               }, 'Parse::RecDescent::Rule' ),
                              'expr' => bless( {
                                                 'impcount' => 0,
                                                 'calls' => [
                                                              'simple_expr'
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
                                                                                             'subrule' => 'simple_expr',
                                                                                             'matchrule' => 0,
                                                                                             'implicit' => undef,
                                                                                             'argcode' => undef,
                                                                                             'lookahead' => 0,
                                                                                             'line' => 62
                                                                                           }, 'Parse::RecDescent::Subrule' )
                                                                                  ],
                                                                       'line' => undef
                                                                     }, 'Parse::RecDescent::Production' )
                                                            ],
                                                 'name' => 'expr',
                                                 'vars' => '',
                                                 'line' => 62
                                               }, 'Parse::RecDescent::Rule' ),
                              'predicate' => bless( {
                                                      'impcount' => 0,
                                                      'calls' => [
                                                                   'expr'
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
                                                                                                  'line' => 57
                                                                                                }, 'Parse::RecDescent::Literal' ),
                                                                                         bless( {
                                                                                                  'subrule' => 'expr',
                                                                                                  'matchrule' => 0,
                                                                                                  'implicit' => undef,
                                                                                                  'argcode' => undef,
                                                                                                  'lookahead' => 0,
                                                                                                  'line' => 57
                                                                                                }, 'Parse::RecDescent::Subrule' ),
                                                                                         bless( {
                                                                                                  'pattern' => ']',
                                                                                                  'hashname' => '__STRING2__',
                                                                                                  'description' => '\']\'',
                                                                                                  'lookahead' => 0,
                                                                                                  'line' => 57
                                                                                                }, 'Parse::RecDescent::Literal' ),
                                                                                         bless( {
                                                                                                  'hashname' => '__ACTION1__',
                                                                                                  'lookahead' => 0,
                                                                                                  'line' => 58,
                                                                                                  'code' => '{
			   $return = $item{expr};
			 }'
                                                                                                }, 'Parse::RecDescent::Action' )
                                                                                       ],
                                                                            'line' => undef
                                                                          }, 'Parse::RecDescent::Production' )
                                                                 ],
                                                      'name' => 'predicate',
                                                      'vars' => '',
                                                      'line' => 57
                                                    }, 'Parse::RecDescent::Rule' ),
                              'path_string' => bless( {
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
                                                                                                    'line' => 99
                                                                                                  }, 'Parse::RecDescent::Literal' ),
                                                                                           bless( {
                                                                                                    'pattern' => '[^\\"]*',
                                                                                                    'hashname' => '__PATTERN1__',
                                                                                                    'description' => '/[^\\\\"]*/',
                                                                                                    'lookahead' => 0,
                                                                                                    'rdelim' => '/',
                                                                                                    'line' => 99,
                                                                                                    'mod' => '',
                                                                                                    'ldelim' => '/'
                                                                                                  }, 'Parse::RecDescent::Token' ),
                                                                                           bless( {
                                                                                                    'pattern' => '"',
                                                                                                    'hashname' => '__STRING2__',
                                                                                                    'description' => '\'"\'',
                                                                                                    'lookahead' => 0,
                                                                                                    'line' => 99
                                                                                                  }, 'Parse::RecDescent::Literal' ),
                                                                                           bless( {
                                                                                                    'hashname' => '__ACTION1__',
                                                                                                    'lookahead' => 0,
                                                                                                    'line' => 100,
                                                                                                    'code' => '{
			  $return = $item[2];
			 }'
                                                                                                  }, 'Parse::RecDescent::Action' )
                                                                                         ],
                                                                              'line' => undef
                                                                            }, 'Parse::RecDescent::Production' )
                                                                   ],
                                                        'name' => 'path_string',
                                                        'vars' => '',
                                                        'line' => 99
                                                      }, 'Parse::RecDescent::Rule' ),
                              '_alternation_1_of_production_1_of_rule_XTM_element' => bless( {
                                                                                               'impcount' => 0,
                                                                                               'calls' => [],
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
                                                                                                                                           'pattern' => 'topicRef',
                                                                                                                                           'hashname' => '__STRING1__',
                                                                                                                                           'description' => '\'topicRef\'',
                                                                                                                                           'lookahead' => 0,
                                                                                                                                           'line' => 90
                                                                                                                                         }, 'Parse::RecDescent::Literal' )
                                                                                                                                ],
                                                                                                                     'line' => undef
                                                                                                                   }, 'Parse::RecDescent::Production' ),
                                                                                                            bless( {
                                                                                                                     'number' => '1',
                                                                                                                     'strcount' => 1,
                                                                                                                     'dircount' => 0,
                                                                                                                     'uncommit' => undef,
                                                                                                                     'error' => undef,
                                                                                                                     'patcount' => 0,
                                                                                                                     'actcount' => 0,
                                                                                                                     'items' => [
                                                                                                                                  bless( {
                                                                                                                                           'pattern' => 'topic',
                                                                                                                                           'hashname' => '__STRING1__',
                                                                                                                                           'description' => '\'topic\'',
                                                                                                                                           'lookahead' => 0,
                                                                                                                                           'line' => 91
                                                                                                                                         }, 'Parse::RecDescent::Literal' )
                                                                                                                                ],
                                                                                                                     'line' => 90
                                                                                                                   }, 'Parse::RecDescent::Production' ),
                                                                                                            bless( {
                                                                                                                     'number' => '2',
                                                                                                                     'strcount' => 1,
                                                                                                                     'dircount' => 0,
                                                                                                                     'uncommit' => undef,
                                                                                                                     'error' => undef,
                                                                                                                     'patcount' => 0,
                                                                                                                     'actcount' => 0,
                                                                                                                     'items' => [
                                                                                                                                  bless( {
                                                                                                                                           'pattern' => 'baseNameString',
                                                                                                                                           'hashname' => '__STRING1__',
                                                                                                                                           'description' => '\'baseNameString\'',
                                                                                                                                           'lookahead' => 0,
                                                                                                                                           'line' => 92
                                                                                                                                         }, 'Parse::RecDescent::Literal' )
                                                                                                                                ],
                                                                                                                     'line' => 91
                                                                                                                   }, 'Parse::RecDescent::Production' ),
                                                                                                            bless( {
                                                                                                                     'number' => '3',
                                                                                                                     'strcount' => 1,
                                                                                                                     'dircount' => 0,
                                                                                                                     'uncommit' => undef,
                                                                                                                     'error' => undef,
                                                                                                                     'patcount' => 0,
                                                                                                                     'actcount' => 0,
                                                                                                                     'items' => [
                                                                                                                                  bless( {
                                                                                                                                           'pattern' => 'baseName',
                                                                                                                                           'hashname' => '__STRING1__',
                                                                                                                                           'description' => '\'baseName\'',
                                                                                                                                           'lookahead' => 0,
                                                                                                                                           'line' => 93
                                                                                                                                         }, 'Parse::RecDescent::Literal' )
                                                                                                                                ],
                                                                                                                     'line' => 92
                                                                                                                   }, 'Parse::RecDescent::Production' ),
                                                                                                            bless( {
                                                                                                                     'number' => '4',
                                                                                                                     'strcount' => 1,
                                                                                                                     'dircount' => 0,
                                                                                                                     'uncommit' => undef,
                                                                                                                     'error' => undef,
                                                                                                                     'patcount' => 0,
                                                                                                                     'actcount' => 0,
                                                                                                                     'items' => [
                                                                                                                                  bless( {
                                                                                                                                           'pattern' => 'occurrence',
                                                                                                                                           'hashname' => '__STRING1__',
                                                                                                                                           'description' => '\'occurrence\'',
                                                                                                                                           'lookahead' => 0,
                                                                                                                                           'line' => 94
                                                                                                                                         }, 'Parse::RecDescent::Literal' )
                                                                                                                                ],
                                                                                                                     'line' => 93
                                                                                                                   }, 'Parse::RecDescent::Production' ),
                                                                                                            bless( {
                                                                                                                     'number' => '5',
                                                                                                                     'strcount' => 1,
                                                                                                                     'dircount' => 0,
                                                                                                                     'uncommit' => undef,
                                                                                                                     'error' => undef,
                                                                                                                     'patcount' => 0,
                                                                                                                     'actcount' => 0,
                                                                                                                     'items' => [
                                                                                                                                  bless( {
                                                                                                                                           'pattern' => 'resourceRef',
                                                                                                                                           'hashname' => '__STRING1__',
                                                                                                                                           'description' => '\'resourceRef\'',
                                                                                                                                           'lookahead' => 0,
                                                                                                                                           'line' => 95
                                                                                                                                         }, 'Parse::RecDescent::Literal' )
                                                                                                                                ],
                                                                                                                     'line' => 94
                                                                                                                   }, 'Parse::RecDescent::Production' ),
                                                                                                            bless( {
                                                                                                                     'number' => '6',
                                                                                                                     'strcount' => 1,
                                                                                                                     'dircount' => 0,
                                                                                                                     'uncommit' => undef,
                                                                                                                     'error' => undef,
                                                                                                                     'patcount' => 0,
                                                                                                                     'actcount' => 0,
                                                                                                                     'items' => [
                                                                                                                                  bless( {
                                                                                                                                           'pattern' => 'resourceData',
                                                                                                                                           'hashname' => '__STRING1__',
                                                                                                                                           'description' => '\'resourceData\'',
                                                                                                                                           'lookahead' => 0,
                                                                                                                                           'line' => 96
                                                                                                                                         }, 'Parse::RecDescent::Literal' )
                                                                                                                                ],
                                                                                                                     'line' => 95
                                                                                                                   }, 'Parse::RecDescent::Production' ),
                                                                                                            bless( {
                                                                                                                     'number' => '7',
                                                                                                                     'strcount' => 1,
                                                                                                                     'dircount' => 0,
                                                                                                                     'uncommit' => undef,
                                                                                                                     'error' => undef,
                                                                                                                     'patcount' => 0,
                                                                                                                     'actcount' => 0,
                                                                                                                     'items' => [
                                                                                                                                  bless( {
                                                                                                                                           'pattern' => 'instanceOf',
                                                                                                                                           'hashname' => '__STRING1__',
                                                                                                                                           'description' => '\'instanceOf\'',
                                                                                                                                           'lookahead' => 0,
                                                                                                                                           'line' => 97
                                                                                                                                         }, 'Parse::RecDescent::Literal' )
                                                                                                                                ],
                                                                                                                     'line' => 96
                                                                                                                   }, 'Parse::RecDescent::Production' ),
                                                                                                            bless( {
                                                                                                                     'number' => '8',
                                                                                                                     'strcount' => 1,
                                                                                                                     'dircount' => 0,
                                                                                                                     'uncommit' => undef,
                                                                                                                     'error' => undef,
                                                                                                                     'patcount' => 0,
                                                                                                                     'actcount' => 0,
                                                                                                                     'items' => [
                                                                                                                                  bless( {
                                                                                                                                           'pattern' => 'subjectIndicatorRef',
                                                                                                                                           'hashname' => '__STRING1__',
                                                                                                                                           'description' => '\'subjectIndicatorRef\'',
                                                                                                                                           'lookahead' => 0,
                                                                                                                                           'line' => 98
                                                                                                                                         }, 'Parse::RecDescent::Literal' )
                                                                                                                                ],
                                                                                                                     'line' => 97
                                                                                                                   }, 'Parse::RecDescent::Production' ),
                                                                                                            bless( {
                                                                                                                     'number' => '9',
                                                                                                                     'strcount' => 1,
                                                                                                                     'dircount' => 0,
                                                                                                                     'uncommit' => undef,
                                                                                                                     'error' => undef,
                                                                                                                     'patcount' => 0,
                                                                                                                     'actcount' => 0,
                                                                                                                     'items' => [
                                                                                                                                  bless( {
                                                                                                                                           'pattern' => 'subjectIdentity',
                                                                                                                                           'hashname' => '__STRING1__',
                                                                                                                                           'description' => '\'subjectIdentity\'',
                                                                                                                                           'lookahead' => 0,
                                                                                                                                           'line' => 99
                                                                                                                                         }, 'Parse::RecDescent::Literal' )
                                                                                                                                ],
                                                                                                                     'line' => 98
                                                                                                                   }, 'Parse::RecDescent::Production' ),
                                                                                                            bless( {
                                                                                                                     'number' => '10',
                                                                                                                     'strcount' => 1,
                                                                                                                     'dircount' => 0,
                                                                                                                     'uncommit' => undef,
                                                                                                                     'error' => undef,
                                                                                                                     'patcount' => 0,
                                                                                                                     'actcount' => 0,
                                                                                                                     'items' => [
                                                                                                                                  bless( {
                                                                                                                                           'pattern' => 'scope',
                                                                                                                                           'hashname' => '__STRING1__',
                                                                                                                                           'description' => '\'scope\'',
                                                                                                                                           'lookahead' => 0,
                                                                                                                                           'line' => 100
                                                                                                                                         }, 'Parse::RecDescent::Literal' )
                                                                                                                                ],
                                                                                                                     'line' => 99
                                                                                                                   }, 'Parse::RecDescent::Production' ),
                                                                                                            bless( {
                                                                                                                     'number' => '11',
                                                                                                                     'strcount' => 1,
                                                                                                                     'dircount' => 0,
                                                                                                                     'uncommit' => undef,
                                                                                                                     'error' => undef,
                                                                                                                     'patcount' => 0,
                                                                                                                     'actcount' => 0,
                                                                                                                     'items' => [
                                                                                                                                  bless( {
                                                                                                                                           'pattern' => 'association',
                                                                                                                                           'hashname' => '__STRING1__',
                                                                                                                                           'description' => '\'association\'',
                                                                                                                                           'lookahead' => 0,
                                                                                                                                           'line' => 101
                                                                                                                                         }, 'Parse::RecDescent::Literal' )
                                                                                                                                ],
                                                                                                                     'line' => 100
                                                                                                                   }, 'Parse::RecDescent::Production' ),
                                                                                                            bless( {
                                                                                                                     'number' => '12',
                                                                                                                     'strcount' => 1,
                                                                                                                     'dircount' => 0,
                                                                                                                     'uncommit' => undef,
                                                                                                                     'error' => undef,
                                                                                                                     'patcount' => 0,
                                                                                                                     'actcount' => 0,
                                                                                                                     'items' => [
                                                                                                                                  bless( {
                                                                                                                                           'pattern' => 'member',
                                                                                                                                           'hashname' => '__STRING1__',
                                                                                                                                           'description' => '\'member\'',
                                                                                                                                           'lookahead' => 0,
                                                                                                                                           'line' => 102
                                                                                                                                         }, 'Parse::RecDescent::Literal' )
                                                                                                                                ],
                                                                                                                     'line' => 101
                                                                                                                   }, 'Parse::RecDescent::Production' ),
                                                                                                            bless( {
                                                                                                                     'number' => '13',
                                                                                                                     'strcount' => 1,
                                                                                                                     'dircount' => 0,
                                                                                                                     'uncommit' => undef,
                                                                                                                     'error' => undef,
                                                                                                                     'patcount' => 0,
                                                                                                                     'actcount' => 0,
                                                                                                                     'items' => [
                                                                                                                                  bless( {
                                                                                                                                           'pattern' => 'roleSpec',
                                                                                                                                           'hashname' => '__STRING1__',
                                                                                                                                           'description' => '\'roleSpec\'',
                                                                                                                                           'lookahead' => 0,
                                                                                                                                           'line' => 103
                                                                                                                                         }, 'Parse::RecDescent::Literal' )
                                                                                                                                ],
                                                                                                                     'line' => 102
                                                                                                                   }, 'Parse::RecDescent::Production' )
                                                                                                          ],
                                                                                               'name' => '_alternation_1_of_production_1_of_rule_XTM_element',
                                                                                               'vars' => '',
                                                                                               'line' => 90
                                                                                             }, 'Parse::RecDescent::Rule' ),
                              'path_numeric' => bless( {
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
                                                                                                     'pattern' => '[\\+\\-\\d\\.]+',
                                                                                                     'hashname' => '__PATTERN1__',
                                                                                                     'description' => '/[\\\\+\\\\-\\\\d\\\\.]+/',
                                                                                                     'lookahead' => 0,
                                                                                                     'rdelim' => '/',
                                                                                                     'line' => 97,
                                                                                                     'mod' => '',
                                                                                                     'ldelim' => '/'
                                                                                                   }, 'Parse::RecDescent::Token' )
                                                                                          ],
                                                                               'line' => undef
                                                                             }, 'Parse::RecDescent::Production' )
                                                                    ],
                                                         'name' => 'path_numeric',
                                                         'vars' => '',
                                                         'line' => 97
                                                       }, 'Parse::RecDescent::Rule' ),
                              'XTM_attribute' => bless( {
                                                          'impcount' => 1,
                                                          'calls' => [
                                                                       '_alternation_1_of_production_1_of_rule_XTM_attribute'
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
                                                                                                      'line' => 52
                                                                                                    }, 'Parse::RecDescent::Literal' ),
                                                                                             bless( {
                                                                                                      'subrule' => '_alternation_1_of_production_1_of_rule_XTM_attribute',
                                                                                                      'matchrule' => 0,
                                                                                                      'implicit' => '\'href\', or \'id\'',
                                                                                                      'argcode' => undef,
                                                                                                      'lookahead' => 0,
                                                                                                      'line' => 52
                                                                                                    }, 'Parse::RecDescent::Subrule' ),
                                                                                             bless( {
                                                                                                      'hashname' => '__ACTION1__',
                                                                                                      'lookahead' => 0,
                                                                                                      'line' => 53,
                                                                                                      'code' => '{
			  $return = { \'attribute\' => $item[2] };
			  }'
                                                                                                    }, 'Parse::RecDescent::Action' )
                                                                                           ],
                                                                                'line' => undef
                                                                              }, 'Parse::RecDescent::Production' )
                                                                     ],
                                                          'name' => 'XTM_attribute',
                                                          'vars' => '',
                                                          'line' => 52
                                                        }, 'Parse::RecDescent::Rule' ),
                              'path_startrule' => bless( {
                                                           'impcount' => 0,
                                                           'calls' => [
                                                                        'path'
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
                                                                                                       'subrule' => 'path',
                                                                                                       'matchrule' => 0,
                                                                                                       'implicit' => undef,
                                                                                                       'argcode' => undef,
                                                                                                       'lookahead' => 0,
                                                                                                       'line' => 2
                                                                                                     }, 'Parse::RecDescent::Subrule' )
                                                                                            ],
                                                                                 'line' => undef
                                                                               }, 'Parse::RecDescent::Production' ),
                                                                        bless( {
                                                                                 'number' => '1',
                                                                                 'strcount' => 0,
                                                                                 'dircount' => 1,
                                                                                 'uncommit' => 0,
                                                                                 'error' => 1,
                                                                                 'patcount' => 0,
                                                                                 'actcount' => 0,
                                                                                 'items' => [
                                                                                              bless( {
                                                                                                       'msg' => ' Invalid xxx syntax near "$text"',
                                                                                                       'hashname' => '__DIRECTIVE1__',
                                                                                                       'commitonly' => '',
                                                                                                       'lookahead' => 0,
                                                                                                       'line' => 2
                                                                                                     }, 'Parse::RecDescent::Error' )
                                                                                            ],
                                                                                 'line' => 2
                                                                               }, 'Parse::RecDescent::Production' )
                                                                      ],
                                                           'name' => 'path_startrule',
                                                           'vars' => '',
                                                           'line' => 1
                                                         }, 'Parse::RecDescent::Rule' ),
                              'XTM_thing' => bless( {
                                                      'impcount' => 1,
                                                      'calls' => [
                                                                   '_alternation_1_of_production_1_of_rule_XTM_thing'
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
                                                                                                  'subrule' => '_alternation_1_of_production_1_of_rule_XTM_thing',
                                                                                                  'matchrule' => 0,
                                                                                                  'implicit' => 'XTM_element, or XTM_attribute, or XTM_data',
                                                                                                  'argcode' => undef,
                                                                                                  'lookahead' => 0,
                                                                                                  'line' => 27
                                                                                                }, 'Parse::RecDescent::Subrule' )
                                                                                       ],
                                                                            'line' => undef
                                                                          }, 'Parse::RecDescent::Production' )
                                                                 ],
                                                      'name' => 'XTM_thing',
                                                      'vars' => '',
                                                      'line' => 27
                                                    }, 'Parse::RecDescent::Rule' ),
                              'simple_expr' => bless( {
                                                        'impcount' => 0,
                                                        'calls' => [
                                                                     'path',
                                                                     'op_value'
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
                                                                                                    'subrule' => 'path',
                                                                                                    'matchrule' => 0,
                                                                                                    'implicit' => undef,
                                                                                                    'argcode' => undef,
                                                                                                    'lookahead' => 0,
                                                                                                    'line' => 64
                                                                                                  }, 'Parse::RecDescent::Subrule' ),
                                                                                           bless( {
                                                                                                    'subrule' => 'op_value',
                                                                                                    'expected' => undef,
                                                                                                    'min' => 0,
                                                                                                    'argcode' => undef,
                                                                                                    'max' => 1,
                                                                                                    'matchrule' => 0,
                                                                                                    'repspec' => '?',
                                                                                                    'lookahead' => 0,
                                                                                                    'line' => 64
                                                                                                  }, 'Parse::RecDescent::Repetition' ),
                                                                                           bless( {
                                                                                                    'hashname' => '__ACTION1__',
                                                                                                    'lookahead' => 0,
                                                                                                    'line' => 65,
                                                                                                    'code' => '{
			   $return = [ $item{path} ];
			   if ($item{\'op_value(?)\'} && $item{\'op_value(?)\'}->[0]) {
			     push @$return, @{$item{\'op_value(?)\'}->[0]};
			   }
			 }'
                                                                                                  }, 'Parse::RecDescent::Action' )
                                                                                         ],
                                                                              'line' => undef
                                                                            }, 'Parse::RecDescent::Production' )
                                                                   ],
                                                        'name' => 'simple_expr',
                                                        'vars' => '',
                                                        'line' => 64
                                                      }, 'Parse::RecDescent::Rule' ),
                              'value' => bless( {
                                                  'impcount' => 0,
                                                  'calls' => [
                                                               'path_numeric',
                                                               'path_string',
                                                               'variable'
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
                                                                                              'subrule' => 'path_numeric',
                                                                                              'matchrule' => 0,
                                                                                              'implicit' => undef,
                                                                                              'argcode' => undef,
                                                                                              'lookahead' => 0,
                                                                                              'line' => 89
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
                                                                                              'subrule' => 'path_string',
                                                                                              'matchrule' => 0,
                                                                                              'implicit' => undef,
                                                                                              'argcode' => undef,
                                                                                              'lookahead' => 0,
                                                                                              'line' => 89
                                                                                            }, 'Parse::RecDescent::Subrule' )
                                                                                   ],
                                                                        'line' => 89
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
                                                                                              'subrule' => 'variable',
                                                                                              'matchrule' => 0,
                                                                                              'implicit' => undef,
                                                                                              'argcode' => undef,
                                                                                              'lookahead' => 0,
                                                                                              'line' => 89
                                                                                            }, 'Parse::RecDescent::Subrule' )
                                                                                   ],
                                                                        'line' => 89
                                                                      }, 'Parse::RecDescent::Production' )
                                                             ],
                                                  'name' => 'value',
                                                  'vars' => '',
                                                  'line' => 89
                                                }, 'Parse::RecDescent::Rule' ),
                              '_alternation_1_of_production_1_of_rule_XTM_thing' => bless( {
                                                                                             'impcount' => 0,
                                                                                             'calls' => [
                                                                                                          'XTM_element',
                                                                                                          'XTM_attribute',
                                                                                                          'XTM_data'
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
                                                                                                                                         'subrule' => 'XTM_element',
                                                                                                                                         'matchrule' => 0,
                                                                                                                                         'implicit' => undef,
                                                                                                                                         'argcode' => undef,
                                                                                                                                         'lookahead' => 0,
                                                                                                                                         'line' => 103
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
                                                                                                                                         'subrule' => 'XTM_attribute',
                                                                                                                                         'matchrule' => 0,
                                                                                                                                         'implicit' => undef,
                                                                                                                                         'argcode' => undef,
                                                                                                                                         'lookahead' => 0,
                                                                                                                                         'line' => 103
                                                                                                                                       }, 'Parse::RecDescent::Subrule' )
                                                                                                                              ],
                                                                                                                   'line' => 103
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
                                                                                                                                         'subrule' => 'XTM_data',
                                                                                                                                         'matchrule' => 0,
                                                                                                                                         'implicit' => undef,
                                                                                                                                         'argcode' => undef,
                                                                                                                                         'lookahead' => 0,
                                                                                                                                         'line' => 103
                                                                                                                                       }, 'Parse::RecDescent::Subrule' )
                                                                                                                              ],
                                                                                                                   'line' => 103
                                                                                                                 }, 'Parse::RecDescent::Production' )
                                                                                                        ],
                                                                                             'name' => '_alternation_1_of_production_1_of_rule_XTM_thing',
                                                                                             'vars' => '',
                                                                                             'line' => 103
                                                                                           }, 'Parse::RecDescent::Rule' ),
                              'XTM_element' => bless( {
                                                        'impcount' => 1,
                                                        'calls' => [
                                                                     '_alternation_1_of_production_1_of_rule_XTM_element'
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
                                                                                                    'subrule' => '_alternation_1_of_production_1_of_rule_XTM_element',
                                                                                                    'matchrule' => 0,
                                                                                                    'implicit' => '\'topicRef\', or \'topic\', or \'baseNameString\', or \'baseName\', or \'occurrence\', or \'resourceRef\', or \'resourceData\', or \'instanceOf\', or \'subjectIndicatorRef\', or \'subjectIdentity\', or \'scope\', or \'association\', or \'member\', or \'roleSpec\'',
                                                                                                    'argcode' => undef,
                                                                                                    'lookahead' => 0,
                                                                                                    'line' => 47
                                                                                                  }, 'Parse::RecDescent::Subrule' ),
                                                                                           bless( {
                                                                                                    'hashname' => '__ACTION1__',
                                                                                                    'lookahead' => 0,
                                                                                                    'line' => 48,
                                                                                                    'code' => '{
			  $return = { \'element\' => $item[1] };
			  }'
                                                                                                  }, 'Parse::RecDescent::Action' )
                                                                                         ],
                                                                              'line' => undef
                                                                            }, 'Parse::RecDescent::Production' )
                                                                   ],
                                                        'name' => 'XTM_element',
                                                        'vars' => '',
                                                        'line' => 34
                                                      }, 'Parse::RecDescent::Rule' ),
                              'path' => bless( {
                                                 'impcount' => 0,
                                                 'calls' => [
                                                              'step'
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
                                                                                             'subrule' => 'step',
                                                                                             'expected' => undef,
                                                                                             'min' => 1,
                                                                                             'argcode' => undef,
                                                                                             'max' => 100000000,
                                                                                             'matchrule' => 0,
                                                                                             'repspec' => 's',
                                                                                             'lookahead' => 0,
                                                                                             'line' => 4
                                                                                           }, 'Parse::RecDescent::Repetition' ),
                                                                                    bless( {
                                                                                             'hashname' => '__ACTION1__',
                                                                                             'lookahead' => 0,
                                                                                             'line' => 5,
                                                                                             'code' => '{
			  $return = $item{\'step(s)\'};
			 }'
                                                                                           }, 'Parse::RecDescent::Action' )
                                                                                  ],
                                                                       'line' => undef
                                                                     }, 'Parse::RecDescent::Production' )
                                                            ],
                                                 'name' => 'path',
                                                 'vars' => '',
                                                 'line' => 4
                                               }, 'Parse::RecDescent::Rule' ),
                              'child' => bless( {
                                                  'impcount' => 0,
                                                  'calls' => [],
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
                                                                                              'pattern' => './',
                                                                                              'hashname' => '__STRING1__',
                                                                                              'description' => '\'./\'',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 13
                                                                                            }, 'Parse::RecDescent::Literal' )
                                                                                   ],
                                                                        'line' => undef
                                                                      }, 'Parse::RecDescent::Production' ),
                                                               bless( {
                                                                        'number' => '1',
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
                                                                                              'line' => 13
                                                                                            }, 'Parse::RecDescent::Literal' )
                                                                                   ],
                                                                        'line' => 13
                                                                      }, 'Parse::RecDescent::Production' )
                                                             ],
                                                  'name' => 'child',
                                                  'vars' => '',
                                                  'line' => 13
                                                }, 'Parse::RecDescent::Rule' ),
                              '_alternation_1_of_production_1_of_rule_XTM_attribute' => bless( {
                                                                                                 'impcount' => 0,
                                                                                                 'calls' => [],
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
                                                                                                                                             'pattern' => 'href',
                                                                                                                                             'hashname' => '__STRING1__',
                                                                                                                                             'description' => '\'href\'',
                                                                                                                                             'lookahead' => 0,
                                                                                                                                             'line' => 103
                                                                                                                                           }, 'Parse::RecDescent::Literal' )
                                                                                                                                  ],
                                                                                                                       'line' => undef
                                                                                                                     }, 'Parse::RecDescent::Production' ),
                                                                                                              bless( {
                                                                                                                       'number' => '1',
                                                                                                                       'strcount' => 1,
                                                                                                                       'dircount' => 0,
                                                                                                                       'uncommit' => undef,
                                                                                                                       'error' => undef,
                                                                                                                       'patcount' => 0,
                                                                                                                       'actcount' => 0,
                                                                                                                       'items' => [
                                                                                                                                    bless( {
                                                                                                                                             'pattern' => 'id',
                                                                                                                                             'hashname' => '__STRING1__',
                                                                                                                                             'description' => '\'id\'',
                                                                                                                                             'lookahead' => 0,
                                                                                                                                             'line' => 103
                                                                                                                                           }, 'Parse::RecDescent::Literal' )
                                                                                                                                  ],
                                                                                                                       'line' => 103
                                                                                                                     }, 'Parse::RecDescent::Production' )
                                                                                                            ],
                                                                                                 'name' => '_alternation_1_of_production_1_of_rule_XTM_attribute',
                                                                                                 'vars' => '',
                                                                                                 'line' => 103
                                                                                               }, 'Parse::RecDescent::Rule' ),
                              'XTM_data' => bless( {
                                                     'impcount' => 0,
                                                     'calls' => [],
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
                                                                                                 'pattern' => 'text()',
                                                                                                 'hashname' => '__STRING1__',
                                                                                                 'description' => '\'text()\'',
                                                                                                 'lookahead' => 0,
                                                                                                 'line' => 29
                                                                                               }, 'Parse::RecDescent::Literal' ),
                                                                                        bless( {
                                                                                                 'hashname' => '__ACTION1__',
                                                                                                 'lookahead' => 0,
                                                                                                 'line' => 30,
                                                                                                 'code' => '{
			  $return = { \'data\' => 1 };
			  }'
                                                                                               }, 'Parse::RecDescent::Action' )
                                                                                      ],
                                                                           'line' => undef
                                                                         }, 'Parse::RecDescent::Production' )
                                                                ],
                                                     'name' => 'XTM_data',
                                                     'vars' => '',
                                                     'line' => 29
                                                   }, 'Parse::RecDescent::Rule' )
                            }
               }, 'Parse::RecDescent' );
}