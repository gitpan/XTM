package XTM::LTM::CParser;
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
sub Parse::RecDescent::namespace000001::resource
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"resource"};
	
	Parse::RecDescent::_trace(q{Trying rule: [resource]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{resource})
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
					  q{resource})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{resource});
		%item = (__RULE__ => q{resource});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [uri]},
				  Parse::RecDescent::_tracefirst($text),
				  q{resource})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::uri($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [uri]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{resource})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [uri]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{resource})
						if defined $::RD_TRACE;
		$item{q{uri}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{resource})
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
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [uri]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{resource})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [data]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{resource})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{resource});
		%item = (__RULE__ => q{resource});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [data]},
				  Parse::RecDescent::_tracefirst($text),
				  q{resource})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::data($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [data]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{resource})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [data]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{resource})
						if defined $::RD_TRACE;
		$item{q{data}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{resource})
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
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [data]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{resource})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{resource})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{resource})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{resource});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{resource})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::assocroles
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"assocroles"};
	
	Parse::RecDescent::_trace(q{Trying rule: [assocroles]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{assocroles})
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
					  q{assocroles})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{assocroles});
		%item = (__RULE__ => q{assocroles});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying operator: [<leftop: assocrole /,/ assocrole>]},
				  Parse::RecDescent::_tracefirst($text),
				  q{assocroles})
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
				  q{assocroles})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{assocrole})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::assocrole($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [assocrole]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{assocroles})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [assocrole]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{assocroles})
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
					  q{assocroles})
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
			if (defined $1) {push @item, $item{__DIRECTIVE1__}=$1; $backtrack=1;}
			
		Parse::RecDescent::_trace(q{Trying subrule: [assocrole]},
				  Parse::RecDescent::_tracefirst($text),
				  q{assocroles})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{assocrole})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::assocrole($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [assocrole]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{assocroles})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [assocrole]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{assocroles})
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
						  q{assocroles})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched operator: [<leftop: assocrole /,/ assocrole>]<< (return value: [}
					  . qq{@{$_tok||[]}} . q{]},
					  Parse::RecDescent::_tracefirst($text),
					  q{assocroles})
						if defined $::RD_TRACE;

		push @item, $item{__DIRECTIVE1__}=$_tok||[];



		Parse::RecDescent::_trace(q{>>Matched production: [<leftop: assocrole /,/ assocrole>]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{assocroles})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{assocroles})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{assocroles})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{assocroles});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{assocroles})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::occtype
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"occtype"};
	
	Parse::RecDescent::_trace(q{Trying rule: [occtype]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{occtype})
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
					  q{occtype})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{occtype});
		%item = (__RULE__ => q{occtype});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [name]},
				  Parse::RecDescent::_tracefirst($text),
				  q{occtype})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::name($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [name]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{occtype})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [name]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{occtype})
						if defined $::RD_TRACE;
		$item{q{name}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [name]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{occtype})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{occtype})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{occtype})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{occtype});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{occtype})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::baseuri_directive
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"baseuri_directive"};
	
	Parse::RecDescent::_trace(q{Trying rule: [baseuri_directive]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{baseuri_directive})
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
					  q{baseuri_directive})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{baseuri_directive});
		%item = (__RULE__ => q{baseuri_directive});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['#BASEURI']},
					  Parse::RecDescent::_tracefirst($text),
					  q{baseuri_directive})
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
				  q{baseuri_directive})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{uri})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::uri($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [uri]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{baseuri_directive})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [uri]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{baseuri_directive})
						if defined $::RD_TRACE;
		$item{q{uri}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: ['#BASEURI' uri]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{baseuri_directive})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{baseuri_directive})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{baseuri_directive})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{baseuri_directive});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{baseuri_directive})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::startrule
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"startrule"};
	
	Parse::RecDescent::_trace(q{Trying rule: [startrule]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{startrule})
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
					  q{startrule})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{startrule});
		%item = (__RULE__ => q{startrule});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [topicmap]},
				  Parse::RecDescent::_tracefirst($text),
				  q{startrule})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::topicmap($thisparser,$text,$repeating,$_noactions,sub { return [tm => $arg[0]] })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [topicmap]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{startrule})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [topicmap]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{startrule})
						if defined $::RD_TRACE;
		$item{q{topicmap}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [topicmap]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{startrule})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{startrule})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{startrule})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{startrule});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{startrule})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::sortname
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"sortname"};
	
	Parse::RecDescent::_trace(q{Trying rule: [sortname]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{sortname})
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
					  q{sortname})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{sortname});
		%item = (__RULE__ => q{sortname});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [string]},
				  Parse::RecDescent::_tracefirst($text),
				  q{sortname})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::string($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [string]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{sortname})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [string]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{sortname})
						if defined $::RD_TRACE;
		$item{q{string}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [string]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{sortname})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{sortname})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{sortname})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{sortname});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{sortname})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::types
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"types"};
	
	Parse::RecDescent::_trace(q{Trying rule: [types]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{types})
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
					  q{types})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{types});
		%item = (__RULE__ => q{types});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: [':']},
					  Parse::RecDescent::_tracefirst($text),
					  q{types})
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
				  q{types})
					if defined $::RD_TRACE;
		$expectation->is(q{name})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::name, 1, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [name]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{types})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [name]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{types})
						if defined $::RD_TRACE;
		$item{q{name}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{types})
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = $item[2]; };
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
		


		Parse::RecDescent::_trace(q{>>Matched production: [':' name]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{types})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{types})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{types})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{types});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{types})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::name
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"name"};
	
	Parse::RecDescent::_trace(q{Trying rule: [name]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{name})
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
					  q{name})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{name});
		%item = (__RULE__ => q{name});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: [/^\\w[-\\w]*/]}, Parse::RecDescent::_tracefirst($text),
					  q{name})
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
					  q{name})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{name})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{name})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{name});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{name})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::topname
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"topname"};
	
	Parse::RecDescent::_trace(q{Trying rule: [topname]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{topname})
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
					  q{topname})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{topname});
		%item = (__RULE__ => q{topname});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['=']},
					  Parse::RecDescent::_tracefirst($text),
					  q{topname})
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
				  q{topname})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{basename})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::basename($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [basename]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topname})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [basename]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topname})
						if defined $::RD_TRACE;
		$item{q{basename}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying repeated subrule: [scope]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topname})
					if defined $::RD_TRACE;
		$expectation->is(q{scope})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::scope, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [scope]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topname})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [scope]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topname})
						if defined $::RD_TRACE;
		$item{q{scope}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{topname})
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
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['=' basename scope]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{topname})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{topname})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{topname})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{topname});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{topname})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::tm_format
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"tm_format"};
	
	Parse::RecDescent::_trace(q{Trying rule: [tm_format]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{tm_format})
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
					  q{tm_format})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{tm_format});
		%item = (__RULE__ => q{tm_format});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [string]},
				  Parse::RecDescent::_tracefirst($text),
				  q{tm_format})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::string($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [string]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{tm_format})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [string]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{tm_format})
						if defined $::RD_TRACE;
		$item{q{string}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [string]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{tm_format})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{tm_format})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{tm_format})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{tm_format});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{tm_format})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::data
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"data"};
	
	Parse::RecDescent::_trace(q{Trying rule: [data]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{data})
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
					  q{data})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{data});
		%item = (__RULE__ => q{data});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['[[']},
					  Parse::RecDescent::_tracefirst($text),
					  q{data})
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
					  q{data})
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
					  q{data})
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
					  q{data})
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = $item[2]; };
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['[[' /.*(?=\\]\\])/sx ']]']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{data})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{data})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{data})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{data});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{data})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::tau_expr
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"tau_expr"};
	
	Parse::RecDescent::_trace(q{Trying rule: [tau_expr]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{tau_expr})
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
					  q{tau_expr})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{tau_expr});
		%item = (__RULE__ => q{tau_expr});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [string]},
				  Parse::RecDescent::_tracefirst($text),
				  q{tau_expr})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::string($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [string]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{tau_expr})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [string]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{tau_expr})
						if defined $::RD_TRACE;
		$item{q{string}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [string]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{tau_expr})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{tau_expr})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{tau_expr})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{tau_expr});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{tau_expr})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::occur
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"occur"};
	
	Parse::RecDescent::_trace(q{Trying rule: [occur]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{occur})
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
					  q{occur})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{occur});
		%item = (__RULE__ => q{occur});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['\{']},
					  Parse::RecDescent::_tracefirst($text),
					  q{occur})
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
				  q{occur})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{occtopic})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::occtopic($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [occtopic]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{occur})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [occtopic]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{occur})
						if defined $::RD_TRACE;
		$item{q{occtopic}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying terminal: [',']},
					  Parse::RecDescent::_tracefirst($text),
					  q{occur})
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
				  q{occur})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{occtype})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::occtype($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [occtype]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{occur})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [occtype]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{occur})
						if defined $::RD_TRACE;
		$item{q{occtype}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying terminal: [',']},
					  Parse::RecDescent::_tracefirst($text),
					  q{occur})
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
				  q{occur})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{resource})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::resource($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [resource]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{occur})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [resource]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{occur})
						if defined $::RD_TRACE;
		$item{q{resource}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying terminal: ['\}']},
					  Parse::RecDescent::_tracefirst($text),
					  q{occur})
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
				  q{occur})
					if defined $::RD_TRACE;
		$expectation->is(q{scope})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::scope, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [scope]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{occur})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [scope]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{occur})
						if defined $::RD_TRACE;
		$item{q{scope}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{occur})
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			my $o = new XTM::occurrence ();
			$o->add_resource ($item{resource});
			$o->add_scope    (new XTM::scope());
			foreach (@{$item{scope}->[0]}) {
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
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['\{' occtopic ',' occtype ',' resource '\}' scope]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{occur})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{occur})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{occur})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{occur});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{occur})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::scope
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"scope"};
	
	Parse::RecDescent::_trace(q{Trying rule: [scope]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{scope})
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
					  q{scope})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{scope});
		%item = (__RULE__ => q{scope});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['/']},
					  Parse::RecDescent::_tracefirst($text),
					  q{scope})
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
				  q{scope})
					if defined $::RD_TRACE;
		$expectation->is(q{name})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::name, 1, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [name]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{scope})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [name]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{scope})
						if defined $::RD_TRACE;
		$item{q{name}} = $_tok;
		push @item, $_tok;
		



		Parse::RecDescent::_trace(q{>>Matched production: ['/' name]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{scope})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{scope})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{scope})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{scope});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{scope})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::type
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"type"};
	
	Parse::RecDescent::_trace(q{Trying rule: [type]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{type})
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
					  q{type})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{type});
		%item = (__RULE__ => q{type});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: [':']},
					  Parse::RecDescent::_tracefirst($text),
					  q{type})
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
				  q{type})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{name})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::name($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [name]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{type})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [name]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{type})
						if defined $::RD_TRACE;
		$item{q{name}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [':' name]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{type})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{type})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{type})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{type});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{type})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::component
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"component"};
	
	Parse::RecDescent::_trace(q{Trying rule: [component]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{component})
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
					  q{component})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{component});
		%item = (__RULE__ => q{component});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [topic]},
				  Parse::RecDescent::_tracefirst($text),
				  q{component})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::topic($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [topic]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{component})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [topic]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{component})
						if defined $::RD_TRACE;
		$item{q{topic}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [topic]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{component})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [assoc]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{component})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{component});
		%item = (__RULE__ => q{component});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [assoc]},
				  Parse::RecDescent::_tracefirst($text),
				  q{component})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::assoc($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [assoc]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{component})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [assoc]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{component})
						if defined $::RD_TRACE;
		$item{q{assoc}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [assoc]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{component})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [occur]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{component})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[2];
		$text = $_[1];
		my $_savetext;
		@item = (q{component});
		%item = (__RULE__ => q{component});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [occur]},
				  Parse::RecDescent::_tracefirst($text),
				  q{component})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::occur($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [occur]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{component})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [occur]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{component})
						if defined $::RD_TRACE;
		$item{q{occur}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [occur]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{component})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{component})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{component})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{component});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{component})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::indicator
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"indicator"};
	
	Parse::RecDescent::_trace(q{Trying rule: [indicator]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{indicator})
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
					  q{indicator})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{indicator});
		%item = (__RULE__ => q{indicator});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['@']},
					  Parse::RecDescent::_tracefirst($text),
					  q{indicator})
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
				  q{indicator})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{uri})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::uri($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [uri]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{indicator})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [uri]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{indicator})
						if defined $::RD_TRACE;
		$item{q{uri}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{indicator})
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
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['@' uri]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{indicator})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{indicator})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{indicator})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{indicator});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{indicator})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::encoding
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"encoding"};
	
	Parse::RecDescent::_trace(q{Trying rule: [encoding]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{encoding})
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
					  q{encoding})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{encoding});
		%item = (__RULE__ => q{encoding});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['@']},
					  Parse::RecDescent::_tracefirst($text),
					  q{encoding})
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
				  q{encoding})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{string})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::string($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [string]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{encoding})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [string]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{encoding})
						if defined $::RD_TRACE;
		$item{q{string}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: ['@' string]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{encoding})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{encoding})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{encoding})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{encoding});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{encoding})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::string
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"string"};
	
	Parse::RecDescent::_trace(q{Trying rule: [string]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{string})
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
					  q{string})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{string});
		%item = (__RULE__ => q{string});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['"']},
					  Parse::RecDescent::_tracefirst($text),
					  q{string})
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
					  q{string})
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
					  q{string})
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
					  q{string})
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = $item[2]; };
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
					  q{string})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{string})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{string})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{string});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{string})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::directive
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"directive"};
	
	Parse::RecDescent::_trace(q{Trying rule: [directive]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{directive})
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
					  q{directive})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{directive});
		%item = (__RULE__ => q{directive});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [topicmapid_directive]},
				  Parse::RecDescent::_tracefirst($text),
				  q{directive})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::topicmapid_directive($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [topicmapid_directive]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{directive})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [topicmapid_directive]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{directive})
						if defined $::RD_TRACE;
		$item{q{topicmapid_directive}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [topicmapid_directive]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{directive})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [mergemap_directive]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{directive})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{directive});
		%item = (__RULE__ => q{directive});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [mergemap_directive]},
				  Parse::RecDescent::_tracefirst($text),
				  q{directive})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::mergemap_directive($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [mergemap_directive]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{directive})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [mergemap_directive]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{directive})
						if defined $::RD_TRACE;
		$item{q{mergemap_directive}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [mergemap_directive]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{directive})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [baseuri_directive]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{directive})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[2];
		$text = $_[1];
		my $_savetext;
		@item = (q{directive});
		%item = (__RULE__ => q{directive});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [baseuri_directive]},
				  Parse::RecDescent::_tracefirst($text),
				  q{directive})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::baseuri_directive($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [baseuri_directive]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{directive})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [baseuri_directive]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{directive})
						if defined $::RD_TRACE;
		$item{q{baseuri_directive}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [baseuri_directive]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{directive})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{directive})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{directive})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{directive});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{directive})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::topicmap
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"topicmap"};
	
	Parse::RecDescent::_trace(q{Trying rule: [topicmap]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{topicmap})
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
					  q{topicmap})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{topicmap});
		%item = (__RULE__ => q{topicmap});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying repeated subrule: [encoding]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topicmap})
					if defined $::RD_TRACE;
		$expectation->is(q{})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::encoding, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [encoding]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topicmap})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [encoding]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topicmap})
						if defined $::RD_TRACE;
		$item{q{encoding}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying repeated subrule: [directive]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topicmap})
					if defined $::RD_TRACE;
		$expectation->is(q{directive})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::directive, 0, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [directive]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topicmap})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [directive]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topicmap})
						if defined $::RD_TRACE;
		$item{q{directive}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying repeated subrule: [component]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topicmap})
					if defined $::RD_TRACE;
		$expectation->is(q{component})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::component, 1, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [component]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topicmap})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [component]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topicmap})
						if defined $::RD_TRACE;
		$item{q{component}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{topicmap})
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			my $tm = $arg{tm};
			my @mentioned;

			foreach my $d (@{$item{directive}}) { # walk over directives, some contain components
			  push @{$item{component}}, $d->{components} if ($d->{components});
			}

			foreach my $cs (@{$item{component}}) {
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
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [encoding directive component]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{topicmap})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{topicmap})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{topicmap})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{topicmap});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{topicmap})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::topic
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"topic"};
	
	Parse::RecDescent::_trace(q{Trying rule: [topic]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{topic})
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
					  q{topic})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{topic});
		%item = (__RULE__ => q{topic});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['[']},
					  Parse::RecDescent::_tracefirst($text),
					  q{topic})
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
				  q{topic})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{name})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::name($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [name]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [name]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic})
						if defined $::RD_TRACE;
		$item{q{name}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying repeated subrule: [types]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic})
					if defined $::RD_TRACE;
		$expectation->is(q{types})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::types, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [types]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [types]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic})
						if defined $::RD_TRACE;
		$item{q{types}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying repeated subrule: [topname]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic})
					if defined $::RD_TRACE;
		$expectation->is(q{topname})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::topname, 0, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [topname]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [topname]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic})
						if defined $::RD_TRACE;
		$item{q{topname}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying repeated subrule: [subject]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic})
					if defined $::RD_TRACE;
		$expectation->is(q{subject})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::subject, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [subject]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [subject]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic})
						if defined $::RD_TRACE;
		$item{q{subject}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying repeated subrule: [indicator]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic})
					if defined $::RD_TRACE;
		$expectation->is(q{indicator})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::indicator, 0, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [indicator]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [indicator]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic})
						if defined $::RD_TRACE;
		$item{q{indicator}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying terminal: [']']},
					  Parse::RecDescent::_tracefirst($text),
					  q{topic})
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
					  q{topic})
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
		       my @components; # here I collect all which I generate here

		       my $t = new XTM::topic (id => $item{name});

		       if (ref($item{types})) {
			 foreach (@{$item{types}->[0]}) {
			   $t->add__s (new XTM::instanceOf ( reference => new XTM::topicRef (href => "#$_")));
			 }
		       };
		       $t->add__s (new XTM::instanceOf ( reference => new XTM::topicRef (href => $XTM::PSI::xtm{topic})))
		          unless $t->instanceOfs && @{$t->instanceOfs};

		       if (ref($item{topname})) {
			 foreach my $bn (@{$item{topname}}) {
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
		       #print Dumper $item{subject};

		       my $s = new XTM::subjectIdentity (); # maybe we need it
		       if (ref ($item{subject}) && @{$item{subject}}) {
			 $s->add_ ( $item{subject}->[0]);
		       }

		       if (ref($item{indicator})) {
			 foreach my $sin (@{$item{indicator}}) {
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
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['[' name types topname subject indicator ']']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{topic})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{topic})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{topic})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{topic});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{topic})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::subject
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"subject"};
	
	Parse::RecDescent::_trace(q{Trying rule: [subject]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{subject})
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
					  q{subject})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{subject});
		%item = (__RULE__ => q{subject});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['%']},
					  Parse::RecDescent::_tracefirst($text),
					  q{subject})
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
				  q{subject})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{uri})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::uri($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [uri]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{subject})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [uri]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{subject})
						if defined $::RD_TRACE;
		$item{q{uri}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{subject})
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
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['%' uri]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{subject})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{subject})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{subject})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{subject});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{subject})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::basename
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"basename"};
	
	Parse::RecDescent::_trace(q{Trying rule: [basename]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{basename})
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
					  q{basename})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{basename});
		%item = (__RULE__ => q{basename});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [string]},
				  Parse::RecDescent::_tracefirst($text),
				  q{basename})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::string($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [string]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{basename})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [string]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{basename})
						if defined $::RD_TRACE;
		$item{q{string}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [string]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{basename})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{basename})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{basename})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{basename});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{basename})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::dispname
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"dispname"};
	
	Parse::RecDescent::_trace(q{Trying rule: [dispname]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{dispname})
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
					  q{dispname})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{dispname});
		%item = (__RULE__ => q{dispname});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [string]},
				  Parse::RecDescent::_tracefirst($text),
				  q{dispname})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::string($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [string]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{dispname})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [string]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{dispname})
						if defined $::RD_TRACE;
		$item{q{string}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [string]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{dispname})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{dispname})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{dispname})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{dispname});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{dispname})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::uri
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"uri"};
	
	Parse::RecDescent::_trace(q{Trying rule: [uri]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{uri})
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
					  q{uri})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{uri});
		%item = (__RULE__ => q{uri});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [string]},
				  Parse::RecDescent::_tracefirst($text),
				  q{uri})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::string($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [string]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{uri})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [string]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{uri})
						if defined $::RD_TRACE;
		$item{q{string}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [string]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{uri})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{uri})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{uri})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{uri});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{uri})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::_alternation_1_of_production_1_of_rule_assocrole
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"_alternation_1_of_production_1_of_rule_assocrole"};
	
	Parse::RecDescent::_trace(q{Trying rule: [_alternation_1_of_production_1_of_rule_assocrole]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{_alternation_1_of_production_1_of_rule_assocrole})
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
					  q{_alternation_1_of_production_1_of_rule_assocrole})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_assocrole});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_assocrole});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [topic]},
				  Parse::RecDescent::_tracefirst($text),
				  q{_alternation_1_of_production_1_of_rule_assocrole})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::topic($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [topic]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{_alternation_1_of_production_1_of_rule_assocrole})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [topic]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_assocrole})
						if defined $::RD_TRACE;
		$item{q{topic}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [topic]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_assocrole})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [name]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_assocrole})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_assocrole});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_assocrole});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [name]},
				  Parse::RecDescent::_tracefirst($text),
				  q{_alternation_1_of_production_1_of_rule_assocrole})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::name($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [name]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{_alternation_1_of_production_1_of_rule_assocrole})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [name]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_assocrole})
						if defined $::RD_TRACE;
		$item{q{name}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [name]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_assocrole})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{_alternation_1_of_production_1_of_rule_assocrole})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{_alternation_1_of_production_1_of_rule_assocrole})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{_alternation_1_of_production_1_of_rule_assocrole});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{_alternation_1_of_production_1_of_rule_assocrole})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::mergemap_directive
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"mergemap_directive"};
	
	Parse::RecDescent::_trace(q{Trying rule: [mergemap_directive]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{mergemap_directive})
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
					  q{mergemap_directive})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{mergemap_directive});
		%item = (__RULE__ => q{mergemap_directive});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['#MERGEMAP']},
					  Parse::RecDescent::_tracefirst($text),
					  q{mergemap_directive})
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
				  q{mergemap_directive})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{tau_expr})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::tau_expr($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [tau_expr]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{mergemap_directive})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [tau_expr]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{mergemap_directive})
						if defined $::RD_TRACE;
		$item{q{tau_expr}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying repeated subrule: [tm_format]},
				  Parse::RecDescent::_tracefirst($text),
				  q{mergemap_directive})
					if defined $::RD_TRACE;
		$expectation->is(q{tm_format})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::tm_format, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [tm_format]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{mergemap_directive})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [tm_format]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{mergemap_directive})
						if defined $::RD_TRACE;
		$item{q{tm_format}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{mergemap_directive})
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
#			warn "MERGEMAP: $item{tau_expr}, format $item{tm_format}";
#			use Data::Dumper;
#			print Dumper $item{tm_format};

			my $tm2; # will hold the new map
			if (scalar @{$item{tm_format}}) {
			  my $format = $item{tm_format}->[0];
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
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['#MERGEMAP' tau_expr tm_format]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{mergemap_directive})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{mergemap_directive})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{mergemap_directive})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{mergemap_directive});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{mergemap_directive})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::comment
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"comment"};
	
	Parse::RecDescent::_trace(q{Trying rule: [comment]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{comment})
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
					  q{comment})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{comment});
		%item = (__RULE__ => q{comment});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['/*']},
					  Parse::RecDescent::_tracefirst($text),
					  q{comment})
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
					  q{comment})
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
					  q{comment})
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
					  q{comment})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{comment})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{comment})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{comment});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{comment})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::topicmapid_directive
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"topicmapid_directive"};
	
	Parse::RecDescent::_trace(q{Trying rule: [topicmapid_directive]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{topicmapid_directive})
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
					  q{topicmapid_directive})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{topicmapid_directive});
		%item = (__RULE__ => q{topicmapid_directive});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['#TOPICMAP']},
					  Parse::RecDescent::_tracefirst($text),
					  q{topicmapid_directive})
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
				  q{topicmapid_directive})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{name})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::name($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [name]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topicmapid_directive})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [name]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topicmapid_directive})
						if defined $::RD_TRACE;
		$item{q{name}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{topicmapid_directive})
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
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['#TOPICMAP' name]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{topicmapid_directive})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{topicmapid_directive})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{topicmapid_directive})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{topicmapid_directive});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{topicmapid_directive})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::assoc
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"assoc"};
	
	Parse::RecDescent::_trace(q{Trying rule: [assoc]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{assoc})
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
					  q{assoc})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{assoc});
		%item = (__RULE__ => q{assoc});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [name]},
				  Parse::RecDescent::_tracefirst($text),
				  q{assoc})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::name($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [name]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{assoc})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [name]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{assoc})
						if defined $::RD_TRACE;
		$item{q{name}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying terminal: ['(']},
					  Parse::RecDescent::_tracefirst($text),
					  q{assoc})
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
				  q{assoc})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{assocroles})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::assocroles($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [assocroles]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{assoc})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [assocroles]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{assoc})
						if defined $::RD_TRACE;
		$item{q{assocroles}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying terminal: [')']},
					  Parse::RecDescent::_tracefirst($text),
					  q{assoc})
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
				  q{assoc})
					if defined $::RD_TRACE;
		$expectation->is(q{scope})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::scope, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [scope]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{assoc})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [scope]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{assoc})
						if defined $::RD_TRACE;
		$item{q{scope}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{assoc})
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			my @components; # here I collect all which I generate here
			my $a = new XTM::association;

#			  use Data::Dumper;
#			  warn "scope : ".Dumper $item{scope};

			my $s = new XTM::scope;
			foreach my $scope (@{$item{scope}} ? @{$item{scope}->[0]}: ()) {
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
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [name '(' assocroles ')' scope]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{assoc})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{assoc})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{assoc})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{assoc});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{assoc})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::occtopic
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"occtopic"};
	
	Parse::RecDescent::_trace(q{Trying rule: [occtopic]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{occtopic})
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
					  q{occtopic})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{occtopic});
		%item = (__RULE__ => q{occtopic});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [name]},
				  Parse::RecDescent::_tracefirst($text),
				  q{occtopic})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::name($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [name]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{occtopic})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [name]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{occtopic})
						if defined $::RD_TRACE;
		$item{q{name}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [name]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{occtopic})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{occtopic})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{occtopic})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{occtopic});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{occtopic})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::assocrole
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"assocrole"};
	
	Parse::RecDescent::_trace(q{Trying rule: [assocrole]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{assocrole})
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
					  q{assocrole})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{assocrole});
		%item = (__RULE__ => q{assocrole});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [_alternation_1_of_production_1_of_rule_assocrole]},
				  Parse::RecDescent::_tracefirst($text),
				  q{assocrole})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::_alternation_1_of_production_1_of_rule_assocrole($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [_alternation_1_of_production_1_of_rule_assocrole]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{assocrole})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [_alternation_1_of_production_1_of_rule_assocrole]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{assocrole})
						if defined $::RD_TRACE;
		$item{q{_alternation_1_of_production_1_of_rule_assocrole}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying repeated subrule: [type]},
				  Parse::RecDescent::_tracefirst($text),
				  q{assocrole})
					if defined $::RD_TRACE;
		$expectation->is(q{type})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::type, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [type]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{assocrole})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [type]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{assocrole})
						if defined $::RD_TRACE;
		$item{q{type}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{assocrole})
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			my $m = new XTM::member ();

#warn "type is ". Dumper $item{type};
			if (scalar @{$item{type}}) {
			  my $t = new XTM::topicRef (href => "#$item{type}->[0]");
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
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [topic, or name type]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{assocrole})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{assocrole})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{assocrole})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{assocrole});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{assocrole})
	}
	$_[1] = $text;
	return $return;
}
}
package XTM::LTM::CParser; sub new { my $self = bless( {
                 '_AUTOTREE' => undef,
                 'rules' => {
                              'resource' => bless( {
                                                     'impcount' => 0,
                                                     'line' => '270',
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
                                                                                                 'line' => '270',
                                                                                                 'subrule' => 'uri',
                                                                                                 'argcode' => undef,
                                                                                                 'implicit' => undef,
                                                                                                 'matchrule' => 0,
                                                                                                 'lookahead' => 0
                                                                                               }, 'Parse::RecDescent::Subrule' ),
                                                                                        bless( {
                                                                                                 'line' => '271',
                                                                                                 'code' => '{
			$return = new XTM::resourceRef (href => $item{uri});
		      }',
                                                                                                 'hashname' => '__ACTION1__',
                                                                                                 'lookahead' => 0
                                                                                               }, 'Parse::RecDescent::Action' )
                                                                                      ],
                                                                           'actcount' => 1
                                                                         }, 'Parse::RecDescent::Production' ),
                                                                  bless( {
                                                                           'dircount' => 0,
                                                                           'uncommit' => undef,
                                                                           'patcount' => 0,
                                                                           'strcount' => 0,
                                                                           'number' => 1,
                                                                           'error' => undef,
                                                                           'line' => '274',
                                                                           'items' => [
                                                                                        bless( {
                                                                                                 'line' => '274',
                                                                                                 'subrule' => 'data',
                                                                                                 'argcode' => undef,
                                                                                                 'implicit' => undef,
                                                                                                 'matchrule' => 0,
                                                                                                 'lookahead' => 0
                                                                                               }, 'Parse::RecDescent::Subrule' ),
                                                                                        bless( {
                                                                                                 'line' => '275',
                                                                                                 'code' => '{
			$return = new XTM::resourceData (data => $item{data});
		      }',
                                                                                                 'hashname' => '__ACTION1__',
                                                                                                 'lookahead' => 0
                                                                                               }, 'Parse::RecDescent::Action' )
                                                                                      ],
                                                                           'actcount' => 1
                                                                         }, 'Parse::RecDescent::Production' )
                                                                ],
                                                     'calls' => [
                                                                  'uri',
                                                                  'data'
                                                                ],
                                                     'opcount' => 0,
                                                     'changed' => 0,
                                                     'vars' => '',
                                                     'name' => 'resource'
                                                   }, 'Parse::RecDescent::Rule' ),
                              'assocroles' => bless( {
                                                       'impcount' => 0,
                                                       'line' => '218',
                                                       'prods' => [
                                                                    bless( {
                                                                             'dircount' => 1,
                                                                             'uncommit' => undef,
                                                                             'op' => [],
                                                                             'patcount' => 1,
                                                                             'strcount' => 0,
                                                                             'number' => 0,
                                                                             'error' => undef,
                                                                             'line' => undef,
                                                                             'items' => [
                                                                                          bless( {
                                                                                                   'expected' => '<leftop: assocrole /,/ assocrole>',
                                                                                                   'rightarg' => bless( {
                                                                                                                          'line' => '218',
                                                                                                                          'subrule' => 'assocrole',
                                                                                                                          'argcode' => undef,
                                                                                                                          'implicit' => undef,
                                                                                                                          'matchrule' => 0,
                                                                                                                          'lookahead' => 0
                                                                                                                        }, 'Parse::RecDescent::Subrule' ),
                                                                                                   'min' => 1,
                                                                                                   'max' => 100000000,
                                                                                                   'op' => bless( {
                                                                                                                    'description' => '/,/',
                                                                                                                    'pattern' => ',',
                                                                                                                    'mod' => '',
                                                                                                                    'hashname' => '__PATTERN1__',
                                                                                                                    'lookahead' => 0,
                                                                                                                    'ldelim' => '/',
                                                                                                                    'line' => '218',
                                                                                                                    'rdelim' => '/'
                                                                                                                  }, 'Parse::RecDescent::Token' ),
                                                                                                   'hashname' => '__DIRECTIVE1__',
                                                                                                   'leftarg' => bless( {
                                                                                                                         'line' => '218',
                                                                                                                         'subrule' => 'assocrole',
                                                                                                                         'argcode' => undef,
                                                                                                                         'implicit' => undef,
                                                                                                                         'matchrule' => 0,
                                                                                                                         'lookahead' => 0
                                                                                                                       }, 'Parse::RecDescent::Subrule' ),
                                                                                                   'type' => 'leftop'
                                                                                                 }, 'Parse::RecDescent::Operator' )
                                                                                        ],
                                                                             'actcount' => 0
                                                                           }, 'Parse::RecDescent::Production' )
                                                                  ],
                                                       'calls' => [
                                                                    'assocrole'
                                                                  ],
                                                       'opcount' => 0,
                                                       'changed' => 0,
                                                       'vars' => '',
                                                       'name' => 'assocroles'
                                                     }, 'Parse::RecDescent::Rule' ),
                              'occtype' => bless( {
                                                    'impcount' => 0,
                                                    'line' => '268',
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
                                                                                                'line' => '268',
                                                                                                'subrule' => 'name',
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
                                                                 'name'
                                                               ],
                                                    'opcount' => 0,
                                                    'changed' => 0,
                                                    'vars' => '',
                                                    'name' => 'occtype'
                                                  }, 'Parse::RecDescent::Rule' ),
                              'baseuri_directive' => bless( {
                                                              'impcount' => 0,
                                                              'line' => '98',
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
                                                                                                          'description' => '\'#BASEURI\'',
                                                                                                          'line' => '98',
                                                                                                          'pattern' => '#BASEURI',
                                                                                                          'hashname' => '__STRING1__',
                                                                                                          'lookahead' => 0
                                                                                                        }, 'Parse::RecDescent::Literal' ),
                                                                                                 bless( {
                                                                                                          'line' => '98',
                                                                                                          'subrule' => 'uri',
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
                                                                           'uri'
                                                                         ],
                                                              'opcount' => 0,
                                                              'changed' => 0,
                                                              'vars' => '',
                                                              'name' => 'baseuri_directive'
                                                            }, 'Parse::RecDescent::Rule' ),
                              'startrule' => bless( {
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
                                                                                                  'line' => '3',
                                                                                                  'subrule' => 'topicmap',
                                                                                                  'argcode' => '[tm => $arg[0]]',
                                                                                                  'implicit' => undef,
                                                                                                  'matchrule' => 0,
                                                                                                  'lookahead' => 0
                                                                                                }, 'Parse::RecDescent::Subrule' )
                                                                                       ],
                                                                            'actcount' => 0
                                                                          }, 'Parse::RecDescent::Production' )
                                                                 ],
                                                      'calls' => [
                                                                   'topicmap'
                                                                 ],
                                                      'opcount' => 0,
                                                      'changed' => 0,
                                                      'vars' => '',
                                                      'name' => 'startrule'
                                                    }, 'Parse::RecDescent::Rule' ),
                              'sortname' => bless( {
                                                     'impcount' => 0,
                                                     'line' => '178',
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
                                                                                                 'line' => '178',
                                                                                                 'subrule' => 'string',
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
                                                                  'string'
                                                                ],
                                                     'opcount' => 0,
                                                     'changed' => 0,
                                                     'vars' => '',
                                                     'name' => 'sortname'
                                                   }, 'Parse::RecDescent::Rule' ),
                              'types' => bless( {
                                                  'impcount' => 0,
                                                  'line' => '154',
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
                                                                                              'description' => '\':\'',
                                                                                              'line' => '154',
                                                                                              'pattern' => ':',
                                                                                              'hashname' => '__STRING1__',
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Literal' ),
                                                                                     bless( {
                                                                                              'min' => 1,
                                                                                              'argcode' => undef,
                                                                                              'matchrule' => 0,
                                                                                              'lookahead' => 0,
                                                                                              'subrule' => 'name',
                                                                                              'line' => '154',
                                                                                              'expected' => undef,
                                                                                              'max' => 100000000,
                                                                                              'repspec' => 's'
                                                                                            }, 'Parse::RecDescent::Repetition' ),
                                                                                     bless( {
                                                                                              'line' => '154',
                                                                                              'code' => '{ $return = $item[2]; }',
                                                                                              'hashname' => '__ACTION1__',
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Action' )
                                                                                   ],
                                                                        'actcount' => 1
                                                                      }, 'Parse::RecDescent::Production' )
                                                             ],
                                                  'calls' => [
                                                               'name'
                                                             ],
                                                  'opcount' => 0,
                                                  'changed' => 0,
                                                  'vars' => '',
                                                  'name' => 'types'
                                                }, 'Parse::RecDescent::Rule' ),
                              'name' => bless( {
                                                 'impcount' => 0,
                                                 'line' => '287',
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
                                                                                             'description' => '/^\\\\w[-\\\\w]*/',
                                                                                             'pattern' => '^\\w[-\\w]*',
                                                                                             'mod' => '',
                                                                                             'hashname' => '__PATTERN1__',
                                                                                             'lookahead' => 0,
                                                                                             'ldelim' => '/',
                                                                                             'line' => '287',
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
                                                 'name' => 'name'
                                               }, 'Parse::RecDescent::Rule' ),
                              'topname' => bless( {
                                                    'impcount' => 0,
                                                    'line' => '170',
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
                                                                                                'line' => '170',
                                                                                                'pattern' => '=',
                                                                                                'hashname' => '__STRING1__',
                                                                                                'lookahead' => 0
                                                                                              }, 'Parse::RecDescent::Literal' ),
                                                                                       bless( {
                                                                                                'line' => '170',
                                                                                                'subrule' => 'basename',
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
                                                                                                'subrule' => 'scope',
                                                                                                'line' => '170',
                                                                                                'expected' => undef,
                                                                                                'max' => 1,
                                                                                                'repspec' => '?'
                                                                                              }, 'Parse::RecDescent::Repetition' ),
                                                                                       bless( {
                                                                                                'line' => '171',
                                                                                                'code' => '{
			$return = { basename => $item[2],
				    scope    => $item[3] };
		      }',
                                                                                                'hashname' => '__ACTION1__',
                                                                                                'lookahead' => 0
                                                                                              }, 'Parse::RecDescent::Action' )
                                                                                     ],
                                                                          'actcount' => 1
                                                                        }, 'Parse::RecDescent::Production' )
                                                               ],
                                                    'calls' => [
                                                                 'basename',
                                                                 'scope'
                                                               ],
                                                    'opcount' => 0,
                                                    'changed' => 0,
                                                    'vars' => '',
                                                    'name' => 'topname'
                                                  }, 'Parse::RecDescent::Rule' ),
                              'tm_format' => bless( {
                                                      'impcount' => 0,
                                                      'line' => '96',
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
                                                                                                  'line' => '96',
                                                                                                  'subrule' => 'string',
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
                                                                   'string'
                                                                 ],
                                                      'opcount' => 0,
                                                      'changed' => 0,
                                                      'vars' => '',
                                                      'name' => 'tm_format'
                                                    }, 'Parse::RecDescent::Rule' ),
                              'data' => bless( {
                                                 'impcount' => 0,
                                                 'line' => '279',
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
                                                                                             'description' => '\'[[\'',
                                                                                             'line' => '279',
                                                                                             'pattern' => '[[',
                                                                                             'hashname' => '__STRING1__',
                                                                                             'lookahead' => 0
                                                                                           }, 'Parse::RecDescent::Literal' ),
                                                                                    bless( {
                                                                                             'description' => '/.*(?=\\\\]\\\\])/sx',
                                                                                             'pattern' => '.*(?=\\]\\])',
                                                                                             'mod' => 'sx',
                                                                                             'hashname' => '__PATTERN1__',
                                                                                             'lookahead' => 0,
                                                                                             'ldelim' => '/',
                                                                                             'line' => '279',
                                                                                             'rdelim' => '/'
                                                                                           }, 'Parse::RecDescent::Token' ),
                                                                                    bless( {
                                                                                             'description' => '\']]\'',
                                                                                             'line' => '279',
                                                                                             'pattern' => ']]',
                                                                                             'hashname' => '__STRING2__',
                                                                                             'lookahead' => 0
                                                                                           }, 'Parse::RecDescent::Literal' ),
                                                                                    bless( {
                                                                                             'line' => '279',
                                                                                             'code' => '{ $return = $item[2]; }',
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
                                                 'name' => 'data'
                                               }, 'Parse::RecDescent::Rule' ),
                              'tau_expr' => bless( {
                                                     'impcount' => 0,
                                                     'line' => '94',
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
                                                                                                 'line' => '94',
                                                                                                 'subrule' => 'string',
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
                                                                  'string'
                                                                ],
                                                     'opcount' => 0,
                                                     'changed' => 0,
                                                     'vars' => '',
                                                     'name' => 'tau_expr'
                                                   }, 'Parse::RecDescent::Rule' ),
                              'occur' => bless( {
                                                  'impcount' => 0,
                                                  'line' => '248',
                                                  'prods' => [
                                                               bless( {
                                                                        'dircount' => 0,
                                                                        'uncommit' => undef,
                                                                        'patcount' => 0,
                                                                        'strcount' => 4,
                                                                        'number' => 0,
                                                                        'error' => undef,
                                                                        'line' => undef,
                                                                        'items' => [
                                                                                     bless( {
                                                                                              'description' => '\'\\{\'',
                                                                                              'line' => '248',
                                                                                              'pattern' => '{',
                                                                                              'hashname' => '__STRING1__',
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Literal' ),
                                                                                     bless( {
                                                                                              'line' => '248',
                                                                                              'subrule' => 'occtopic',
                                                                                              'argcode' => undef,
                                                                                              'implicit' => undef,
                                                                                              'matchrule' => 0,
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Subrule' ),
                                                                                     bless( {
                                                                                              'description' => '\',\'',
                                                                                              'line' => '248',
                                                                                              'pattern' => ',',
                                                                                              'hashname' => '__STRING2__',
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Literal' ),
                                                                                     bless( {
                                                                                              'line' => '248',
                                                                                              'subrule' => 'occtype',
                                                                                              'argcode' => undef,
                                                                                              'implicit' => undef,
                                                                                              'matchrule' => 0,
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Subrule' ),
                                                                                     bless( {
                                                                                              'description' => '\',\'',
                                                                                              'line' => '248',
                                                                                              'pattern' => ',',
                                                                                              'hashname' => '__STRING3__',
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Literal' ),
                                                                                     bless( {
                                                                                              'line' => '248',
                                                                                              'subrule' => 'resource',
                                                                                              'argcode' => undef,
                                                                                              'implicit' => undef,
                                                                                              'matchrule' => 0,
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Subrule' ),
                                                                                     bless( {
                                                                                              'description' => '\'\\}\'',
                                                                                              'line' => '248',
                                                                                              'pattern' => '}',
                                                                                              'hashname' => '__STRING4__',
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Literal' ),
                                                                                     bless( {
                                                                                              'min' => 0,
                                                                                              'argcode' => undef,
                                                                                              'matchrule' => 0,
                                                                                              'lookahead' => 0,
                                                                                              'subrule' => 'scope',
                                                                                              'line' => '248',
                                                                                              'expected' => undef,
                                                                                              'max' => 1,
                                                                                              'repspec' => '?'
                                                                                            }, 'Parse::RecDescent::Repetition' ),
                                                                                     bless( {
                                                                                              'line' => '249',
                                                                                              'code' => '{
			my $o = new XTM::occurrence ();
			$o->add_resource ($item{resource});
			$o->add_scope    (new XTM::scope());
			foreach (@{$item{scope}->[0]}) {
			  $o->scope->add_reference_s (new XTM::topicRef (href => "#$_"));
			}
			$o->scope->add_reference_s (new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) ) 
			  unless $o->scope->references;
			$o->add_instanceOf (new XTM::instanceOf ( reference => new XTM::topicRef (href => "#$item{occtype}")));

			$return = [ { topic      => $item{occtopic},
				      occurrence => $o, } ];

			#use Data::Dumper;
			#print "in occur: ", Dumper $return;
		      }',
                                                                                              'hashname' => '__ACTION1__',
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Action' )
                                                                                   ],
                                                                        'actcount' => 1
                                                                      }, 'Parse::RecDescent::Production' )
                                                             ],
                                                  'calls' => [
                                                               'occtopic',
                                                               'occtype',
                                                               'resource',
                                                               'scope'
                                                             ],
                                                  'opcount' => 0,
                                                  'changed' => 0,
                                                  'vars' => '',
                                                  'name' => 'occur'
                                                }, 'Parse::RecDescent::Rule' ),
                              'scope' => bless( {
                                                  'impcount' => 0,
                                                  'line' => '182',
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
                                                                                              'description' => '\'/\'',
                                                                                              'line' => '182',
                                                                                              'pattern' => '/',
                                                                                              'hashname' => '__STRING1__',
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Literal' ),
                                                                                     bless( {
                                                                                              'min' => 1,
                                                                                              'argcode' => undef,
                                                                                              'matchrule' => 0,
                                                                                              'lookahead' => 0,
                                                                                              'subrule' => 'name',
                                                                                              'line' => '182',
                                                                                              'expected' => undef,
                                                                                              'max' => 100000000,
                                                                                              'repspec' => 's'
                                                                                            }, 'Parse::RecDescent::Repetition' )
                                                                                   ],
                                                                        'actcount' => 0
                                                                      }, 'Parse::RecDescent::Production' )
                                                             ],
                                                  'calls' => [
                                                               'name'
                                                             ],
                                                  'opcount' => 0,
                                                  'changed' => 0,
                                                  'vars' => '',
                                                  'name' => 'scope'
                                                }, 'Parse::RecDescent::Rule' ),
                              'type' => bless( {
                                                 'impcount' => 0,
                                                 'line' => '246',
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
                                                                                             'description' => '\':\'',
                                                                                             'line' => '246',
                                                                                             'pattern' => ':',
                                                                                             'hashname' => '__STRING1__',
                                                                                             'lookahead' => 0
                                                                                           }, 'Parse::RecDescent::Literal' ),
                                                                                    bless( {
                                                                                             'line' => '246',
                                                                                             'subrule' => 'name',
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
                                                              'name'
                                                            ],
                                                 'opcount' => 0,
                                                 'changed' => 0,
                                                 'vars' => '',
                                                 'name' => 'type'
                                               }, 'Parse::RecDescent::Rule' ),
                              'component' => bless( {
                                                      'impcount' => 0,
                                                      'line' => '49',
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
                                                                                                  'line' => '49',
                                                                                                  'subrule' => 'topic',
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
                                                                            'line' => '49',
                                                                            'items' => [
                                                                                         bless( {
                                                                                                  'line' => '49',
                                                                                                  'subrule' => 'assoc',
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
                                                                            'line' => '49',
                                                                            'items' => [
                                                                                         bless( {
                                                                                                  'line' => '49',
                                                                                                  'subrule' => 'occur',
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
                                                                   'topic',
                                                                   'assoc',
                                                                   'occur'
                                                                 ],
                                                      'opcount' => 0,
                                                      'changed' => 0,
                                                      'vars' => '',
                                                      'name' => 'component'
                                                    }, 'Parse::RecDescent::Rule' ),
                              'indicator' => bless( {
                                                      'impcount' => 0,
                                                      'line' => '161',
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
                                                                                                  'line' => '161',
                                                                                                  'pattern' => '@',
                                                                                                  'hashname' => '__STRING1__',
                                                                                                  'lookahead' => 0
                                                                                                }, 'Parse::RecDescent::Literal' ),
                                                                                         bless( {
                                                                                                  'line' => '161',
                                                                                                  'subrule' => 'uri',
                                                                                                  'argcode' => undef,
                                                                                                  'implicit' => undef,
                                                                                                  'matchrule' => 0,
                                                                                                  'lookahead' => 0
                                                                                                }, 'Parse::RecDescent::Subrule' ),
                                                                                         bless( {
                                                                                                  'line' => '162',
                                                                                                  'code' => '{
			use URI;
			my $u = URI->new ($item{uri});
			$return = ref ($u) eq \'URI::_generic\' ? 
			  new XTM::topicRef (href => $item{uri}) :
			    new XTM::subjectIndicatorRef (href => $item{uri});
		      }',
                                                                                                  'hashname' => '__ACTION1__',
                                                                                                  'lookahead' => 0
                                                                                                }, 'Parse::RecDescent::Action' )
                                                                                       ],
                                                                            'actcount' => 1
                                                                          }, 'Parse::RecDescent::Production' )
                                                                 ],
                                                      'calls' => [
                                                                   'uri'
                                                                 ],
                                                      'opcount' => 0,
                                                      'changed' => 0,
                                                      'vars' => '',
                                                      'name' => 'indicator'
                                                    }, 'Parse::RecDescent::Rule' ),
                              'encoding' => bless( {
                                                     'impcount' => 0,
                                                     'line' => '51',
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
                                                                                                 'line' => '51',
                                                                                                 'pattern' => '@',
                                                                                                 'hashname' => '__STRING1__',
                                                                                                 'lookahead' => 0
                                                                                               }, 'Parse::RecDescent::Literal' ),
                                                                                        bless( {
                                                                                                 'line' => '51',
                                                                                                 'subrule' => 'string',
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
                                                                  'string'
                                                                ],
                                                     'opcount' => 0,
                                                     'changed' => 0,
                                                     'vars' => '',
                                                     'name' => 'encoding'
                                                   }, 'Parse::RecDescent::Rule' ),
                              'string' => bless( {
                                                   'impcount' => 0,
                                                   'line' => '285',
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
                                                                                               'line' => '285',
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
                                                                                               'line' => '285',
                                                                                               'rdelim' => '/'
                                                                                             }, 'Parse::RecDescent::Token' ),
                                                                                      bless( {
                                                                                               'description' => '\'"\'',
                                                                                               'line' => '285',
                                                                                               'pattern' => '"',
                                                                                               'hashname' => '__STRING2__',
                                                                                               'lookahead' => 0
                                                                                             }, 'Parse::RecDescent::Literal' ),
                                                                                      bless( {
                                                                                               'line' => '285',
                                                                                               'code' => '{ $return = $item[2]; }',
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
                                                   'name' => 'string'
                                                 }, 'Parse::RecDescent::Rule' ),
                              'directive' => bless( {
                                                      'impcount' => 0,
                                                      'line' => '52',
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
                                                                                                  'line' => '54',
                                                                                                  'subrule' => 'topicmapid_directive',
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
                                                                            'line' => '54',
                                                                            'items' => [
                                                                                         bless( {
                                                                                                  'line' => '55',
                                                                                                  'subrule' => 'mergemap_directive',
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
                                                                            'line' => '55',
                                                                            'items' => [
                                                                                         bless( {
                                                                                                  'line' => '56',
                                                                                                  'subrule' => 'baseuri_directive',
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
                                                                   'topicmapid_directive',
                                                                   'mergemap_directive',
                                                                   'baseuri_directive'
                                                                 ],
                                                      'opcount' => 0,
                                                      'changed' => 0,
                                                      'vars' => '',
                                                      'name' => 'directive'
                                                    }, 'Parse::RecDescent::Rule' ),
                              'topicmap' => bless( {
                                                     'impcount' => 0,
                                                     'line' => '5',
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
                                                                                                 'subrule' => 'encoding',
                                                                                                 'line' => '5',
                                                                                                 'expected' => undef,
                                                                                                 'max' => 1,
                                                                                                 'repspec' => '?'
                                                                                               }, 'Parse::RecDescent::Repetition' ),
                                                                                        bless( {
                                                                                                 'min' => 0,
                                                                                                 'argcode' => undef,
                                                                                                 'matchrule' => 0,
                                                                                                 'lookahead' => 0,
                                                                                                 'subrule' => 'directive',
                                                                                                 'line' => '5',
                                                                                                 'expected' => undef,
                                                                                                 'max' => 100000000,
                                                                                                 'repspec' => 's?'
                                                                                               }, 'Parse::RecDescent::Repetition' ),
                                                                                        bless( {
                                                                                                 'min' => 1,
                                                                                                 'argcode' => undef,
                                                                                                 'matchrule' => 0,
                                                                                                 'lookahead' => 0,
                                                                                                 'subrule' => 'component',
                                                                                                 'line' => '5',
                                                                                                 'expected' => undef,
                                                                                                 'max' => 100000000,
                                                                                                 'repspec' => 's'
                                                                                               }, 'Parse::RecDescent::Repetition' ),
                                                                                        bless( {
                                                                                                 'line' => '6',
                                                                                                 'code' => '{
			my $tm = $arg{tm};
			my @mentioned;

			foreach my $d (@{$item{directive}}) { # walk over directives, some contain components
			  push @{$item{component}}, $d->{components} if ($d->{components});
			}

			foreach my $cs (@{$item{component}}) {
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

		      }',
                                                                                                 'hashname' => '__ACTION1__',
                                                                                                 'lookahead' => 0
                                                                                               }, 'Parse::RecDescent::Action' )
                                                                                      ],
                                                                           'actcount' => 1
                                                                         }, 'Parse::RecDescent::Production' )
                                                                ],
                                                     'calls' => [
                                                                  'encoding',
                                                                  'directive',
                                                                  'component'
                                                                ],
                                                     'opcount' => 0,
                                                     'changed' => 0,
                                                     'vars' => '',
                                                     'name' => 'topicmap'
                                                   }, 'Parse::RecDescent::Rule' ),
                              'topic' => bless( {
                                                  'impcount' => 0,
                                                  'line' => '101',
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
                                                                                              'line' => '101',
                                                                                              'pattern' => '[',
                                                                                              'hashname' => '__STRING1__',
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Literal' ),
                                                                                     bless( {
                                                                                              'line' => '101',
                                                                                              'subrule' => 'name',
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
                                                                                              'subrule' => 'types',
                                                                                              'line' => '101',
                                                                                              'expected' => undef,
                                                                                              'max' => 1,
                                                                                              'repspec' => '?'
                                                                                            }, 'Parse::RecDescent::Repetition' ),
                                                                                     bless( {
                                                                                              'min' => 0,
                                                                                              'argcode' => undef,
                                                                                              'matchrule' => 0,
                                                                                              'lookahead' => 0,
                                                                                              'subrule' => 'topname',
                                                                                              'line' => '101',
                                                                                              'expected' => undef,
                                                                                              'max' => 100000000,
                                                                                              'repspec' => 's?'
                                                                                            }, 'Parse::RecDescent::Repetition' ),
                                                                                     bless( {
                                                                                              'min' => 0,
                                                                                              'argcode' => undef,
                                                                                              'matchrule' => 0,
                                                                                              'lookahead' => 0,
                                                                                              'subrule' => 'subject',
                                                                                              'line' => '101',
                                                                                              'expected' => undef,
                                                                                              'max' => 1,
                                                                                              'repspec' => '?'
                                                                                            }, 'Parse::RecDescent::Repetition' ),
                                                                                     bless( {
                                                                                              'min' => 0,
                                                                                              'argcode' => undef,
                                                                                              'matchrule' => 0,
                                                                                              'lookahead' => 0,
                                                                                              'subrule' => 'indicator',
                                                                                              'line' => '101',
                                                                                              'expected' => undef,
                                                                                              'max' => 100000000,
                                                                                              'repspec' => 's?'
                                                                                            }, 'Parse::RecDescent::Repetition' ),
                                                                                     bless( {
                                                                                              'description' => '\']\'',
                                                                                              'line' => '101',
                                                                                              'pattern' => ']',
                                                                                              'hashname' => '__STRING2__',
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Literal' ),
                                                                                     bless( {
                                                                                              'line' => '102',
                                                                                              'code' => '{
		       my @components; # here I collect all which I generate here

		       my $t = new XTM::topic (id => $item{name});

		       if (ref($item{types})) {
			 foreach (@{$item{types}->[0]}) {
			   $t->add__s (new XTM::instanceOf ( reference => new XTM::topicRef (href => "#$_")));
			 }
		       };
		       $t->add__s (new XTM::instanceOf ( reference => new XTM::topicRef (href => $XTM::PSI::xtm{topic})))
		          unless $t->instanceOfs && @{$t->instanceOfs};

		       if (ref($item{topname})) {
			 foreach my $bn (@{$item{topname}}) {
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
		       #print Dumper $item{subject};

		       my $s = new XTM::subjectIdentity (); # maybe we need it
		       if (ref ($item{subject}) && @{$item{subject}}) {
			 $s->add_ ( $item{subject}->[0]);
		       }

		       if (ref($item{indicator})) {
			 foreach my $sin (@{$item{indicator}}) {
			   $s->add_reference_s ($sin);
			 }
		       }
		       $t->add_subjectIdentity ($s) if $s->references || $s->resourceRef; # only add it if we found at least one reference

#		       use Data::Dumper;
#		       print Dumper $t;

		       push @components, $t;
		       $return = \\@components;
		      }',
                                                                                              'hashname' => '__ACTION1__',
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Action' )
                                                                                   ],
                                                                        'actcount' => 1
                                                                      }, 'Parse::RecDescent::Production' )
                                                             ],
                                                  'calls' => [
                                                               'name',
                                                               'types',
                                                               'topname',
                                                               'subject',
                                                               'indicator'
                                                             ],
                                                  'opcount' => 0,
                                                  'changed' => 0,
                                                  'vars' => '',
                                                  'name' => 'topic'
                                                }, 'Parse::RecDescent::Rule' ),
                              'subject' => bless( {
                                                    'impcount' => 0,
                                                    'line' => '156',
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
                                                                                                'description' => '\'%\'',
                                                                                                'line' => '156',
                                                                                                'pattern' => '%',
                                                                                                'hashname' => '__STRING1__',
                                                                                                'lookahead' => 0
                                                                                              }, 'Parse::RecDescent::Literal' ),
                                                                                       bless( {
                                                                                                'line' => '156',
                                                                                                'subrule' => 'uri',
                                                                                                'argcode' => undef,
                                                                                                'implicit' => undef,
                                                                                                'matchrule' => 0,
                                                                                                'lookahead' => 0
                                                                                              }, 'Parse::RecDescent::Subrule' ),
                                                                                       bless( {
                                                                                                'line' => '157',
                                                                                                'code' => '{
			$return = new XTM::resourceRef (href => $item{uri});
		      }',
                                                                                                'hashname' => '__ACTION1__',
                                                                                                'lookahead' => 0
                                                                                              }, 'Parse::RecDescent::Action' )
                                                                                     ],
                                                                          'actcount' => 1
                                                                        }, 'Parse::RecDescent::Production' )
                                                               ],
                                                    'calls' => [
                                                                 'uri'
                                                               ],
                                                    'opcount' => 0,
                                                    'changed' => 0,
                                                    'vars' => '',
                                                    'name' => 'subject'
                                                  }, 'Parse::RecDescent::Rule' ),
                              'basename' => bless( {
                                                     'impcount' => 0,
                                                     'line' => '176',
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
                                                                                                 'line' => '176',
                                                                                                 'subrule' => 'string',
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
                                                                  'string'
                                                                ],
                                                     'opcount' => 0,
                                                     'changed' => 0,
                                                     'vars' => '',
                                                     'name' => 'basename'
                                                   }, 'Parse::RecDescent::Rule' ),
                              'dispname' => bless( {
                                                     'impcount' => 0,
                                                     'line' => '180',
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
                                                                                                 'line' => '180',
                                                                                                 'subrule' => 'string',
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
                                                                  'string'
                                                                ],
                                                     'opcount' => 0,
                                                     'changed' => 0,
                                                     'vars' => '',
                                                     'name' => 'dispname'
                                                   }, 'Parse::RecDescent::Rule' ),
                              'uri' => bless( {
                                                'impcount' => 0,
                                                'line' => '281',
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
                                                                                            'line' => '281',
                                                                                            'subrule' => 'string',
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
                                                             'string'
                                                           ],
                                                'opcount' => 0,
                                                'changed' => 0,
                                                'vars' => '',
                                                'name' => 'uri'
                                              }, 'Parse::RecDescent::Rule' ),
                              '_alternation_1_of_production_1_of_rule_assocrole' => bless( {
                                                                                             'impcount' => 0,
                                                                                             'line' => '289',
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
                                                                                                                                         'line' => '289',
                                                                                                                                         'subrule' => 'topic',
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
                                                                                                                   'line' => '289',
                                                                                                                   'items' => [
                                                                                                                                bless( {
                                                                                                                                         'line' => '289',
                                                                                                                                         'subrule' => 'name',
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
                                                                                                          'topic',
                                                                                                          'name'
                                                                                                        ],
                                                                                             'opcount' => 0,
                                                                                             'changed' => 0,
                                                                                             'vars' => '',
                                                                                             'name' => '_alternation_1_of_production_1_of_rule_assocrole'
                                                                                           }, 'Parse::RecDescent::Rule' ),
                              'mergemap_directive' => bless( {
                                                               'impcount' => 0,
                                                               'line' => '63',
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
                                                                                                           'description' => '\'#MERGEMAP\'',
                                                                                                           'line' => '63',
                                                                                                           'pattern' => '#MERGEMAP',
                                                                                                           'hashname' => '__STRING1__',
                                                                                                           'lookahead' => 0
                                                                                                         }, 'Parse::RecDescent::Literal' ),
                                                                                                  bless( {
                                                                                                           'line' => '63',
                                                                                                           'subrule' => 'tau_expr',
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
                                                                                                           'subrule' => 'tm_format',
                                                                                                           'line' => '63',
                                                                                                           'expected' => undef,
                                                                                                           'max' => 1,
                                                                                                           'repspec' => '?'
                                                                                                         }, 'Parse::RecDescent::Repetition' ),
                                                                                                  bless( {
                                                                                                           'line' => '64',
                                                                                                           'code' => '{
#			warn "MERGEMAP: $item{tau_expr}, format $item{tm_format}";
#			use Data::Dumper;
#			print Dumper $item{tm_format};

			my $tm2; # will hold the new map
			if (scalar @{$item{tm_format}}) {
			  my $format = $item{tm_format}->[0];
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
		      }',
                                                                                                           'hashname' => '__ACTION1__',
                                                                                                           'lookahead' => 0
                                                                                                         }, 'Parse::RecDescent::Action' )
                                                                                                ],
                                                                                     'actcount' => 1
                                                                                   }, 'Parse::RecDescent::Production' )
                                                                          ],
                                                               'calls' => [
                                                                            'tau_expr',
                                                                            'tm_format'
                                                                          ],
                                                               'opcount' => 0,
                                                               'changed' => 0,
                                                               'vars' => '',
                                                               'name' => 'mergemap_directive'
                                                             }, 'Parse::RecDescent::Rule' ),
                              'comment' => bless( {
                                                    'impcount' => 0,
                                                    'line' => '283',
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
                                                                                                'description' => '\'/*\'',
                                                                                                'line' => '283',
                                                                                                'pattern' => '/*',
                                                                                                'hashname' => '__STRING1__',
                                                                                                'lookahead' => 0
                                                                                              }, 'Parse::RecDescent::Literal' ),
                                                                                       bless( {
                                                                                                'description' => '/.+/',
                                                                                                'pattern' => '.+',
                                                                                                'mod' => '',
                                                                                                'hashname' => '__PATTERN1__',
                                                                                                'lookahead' => 0,
                                                                                                'ldelim' => '/',
                                                                                                'line' => '283',
                                                                                                'rdelim' => '/'
                                                                                              }, 'Parse::RecDescent::Token' ),
                                                                                       bless( {
                                                                                                'description' => '\'*/\'',
                                                                                                'line' => '283',
                                                                                                'pattern' => '*/',
                                                                                                'hashname' => '__STRING2__',
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
                                                    'name' => 'comment'
                                                  }, 'Parse::RecDescent::Rule' ),
                              'topicmapid_directive' => bless( {
                                                                 'impcount' => 0,
                                                                 'line' => '58',
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
                                                                                                             'description' => '\'#TOPICMAP\'',
                                                                                                             'line' => '58',
                                                                                                             'pattern' => '#TOPICMAP',
                                                                                                             'hashname' => '__STRING1__',
                                                                                                             'lookahead' => 0
                                                                                                           }, 'Parse::RecDescent::Literal' ),
                                                                                                    bless( {
                                                                                                             'line' => '58',
                                                                                                             'subrule' => 'name',
                                                                                                             'argcode' => undef,
                                                                                                             'implicit' => undef,
                                                                                                             'matchrule' => 0,
                                                                                                             'lookahead' => 0
                                                                                                           }, 'Parse::RecDescent::Subrule' ),
                                                                                                    bless( {
                                                                                                             'line' => '59',
                                                                                                             'code' => '{
			warn "XTM::LTM::Parser: TOPICMAP directive ignored";
		      }',
                                                                                                             'hashname' => '__ACTION1__',
                                                                                                             'lookahead' => 0
                                                                                                           }, 'Parse::RecDescent::Action' )
                                                                                                  ],
                                                                                       'actcount' => 1
                                                                                     }, 'Parse::RecDescent::Production' )
                                                                            ],
                                                                 'calls' => [
                                                                              'name'
                                                                            ],
                                                                 'opcount' => 0,
                                                                 'changed' => 0,
                                                                 'vars' => '',
                                                                 'name' => 'topicmapid_directive'
                                                               }, 'Parse::RecDescent::Rule' ),
                              'assoc' => bless( {
                                                  'impcount' => 0,
                                                  'line' => '184',
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
                                                                                              'line' => '184',
                                                                                              'subrule' => 'name',
                                                                                              'argcode' => undef,
                                                                                              'implicit' => undef,
                                                                                              'matchrule' => 0,
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Subrule' ),
                                                                                     bless( {
                                                                                              'description' => '\'(\'',
                                                                                              'line' => '184',
                                                                                              'pattern' => '(',
                                                                                              'hashname' => '__STRING1__',
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Literal' ),
                                                                                     bless( {
                                                                                              'line' => '184',
                                                                                              'subrule' => 'assocroles',
                                                                                              'argcode' => undef,
                                                                                              'implicit' => undef,
                                                                                              'matchrule' => 0,
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Subrule' ),
                                                                                     bless( {
                                                                                              'description' => '\')\'',
                                                                                              'line' => '184',
                                                                                              'pattern' => ')',
                                                                                              'hashname' => '__STRING2__',
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Literal' ),
                                                                                     bless( {
                                                                                              'min' => 0,
                                                                                              'argcode' => undef,
                                                                                              'matchrule' => 0,
                                                                                              'lookahead' => 0,
                                                                                              'subrule' => 'scope',
                                                                                              'line' => '184',
                                                                                              'expected' => undef,
                                                                                              'max' => 1,
                                                                                              'repspec' => '?'
                                                                                            }, 'Parse::RecDescent::Repetition' ),
                                                                                     bless( {
                                                                                              'line' => '185',
                                                                                              'code' => '{
			my @components; # here I collect all which I generate here
			my $a = new XTM::association;

#			  use Data::Dumper;
#			  warn "scope : ".Dumper $item{scope};

			my $s = new XTM::scope;
			foreach my $scope (@{$item{scope}} ? @{$item{scope}->[0]}: ()) {
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
		      }',
                                                                                              'hashname' => '__ACTION1__',
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Action' )
                                                                                   ],
                                                                        'actcount' => 1
                                                                      }, 'Parse::RecDescent::Production' )
                                                             ],
                                                  'calls' => [
                                                               'name',
                                                               'assocroles',
                                                               'scope'
                                                             ],
                                                  'opcount' => 0,
                                                  'changed' => 0,
                                                  'vars' => '',
                                                  'name' => 'assoc'
                                                }, 'Parse::RecDescent::Rule' ),
                              'occtopic' => bless( {
                                                     'impcount' => 0,
                                                     'line' => '267',
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
                                                                                                 'line' => '267',
                                                                                                 'subrule' => 'name',
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
                                                                  'name'
                                                                ],
                                                     'opcount' => 0,
                                                     'changed' => 0,
                                                     'vars' => '',
                                                     'name' => 'occtopic'
                                                   }, 'Parse::RecDescent::Rule' ),
                              'assocrole' => bless( {
                                                      'impcount' => 1,
                                                      'line' => '220',
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
                                                                                                  'line' => '220',
                                                                                                  'subrule' => '_alternation_1_of_production_1_of_rule_assocrole',
                                                                                                  'argcode' => undef,
                                                                                                  'implicit' => 'topic, or name',
                                                                                                  'matchrule' => 0,
                                                                                                  'lookahead' => 0
                                                                                                }, 'Parse::RecDescent::Subrule' ),
                                                                                         bless( {
                                                                                                  'min' => 0,
                                                                                                  'argcode' => undef,
                                                                                                  'matchrule' => 0,
                                                                                                  'lookahead' => 0,
                                                                                                  'subrule' => 'type',
                                                                                                  'line' => '220',
                                                                                                  'expected' => undef,
                                                                                                  'max' => 1,
                                                                                                  'repspec' => '?'
                                                                                                }, 'Parse::RecDescent::Repetition' ),
                                                                                         bless( {
                                                                                                  'line' => '221',
                                                                                                  'code' => '{
			my $m = new XTM::member ();

#warn "type is ". Dumper $item{type};
			if (scalar @{$item{type}}) {
			  my $t = new XTM::topicRef (href => "#$item{type}->[0]");
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
		      }',
                                                                                                  'hashname' => '__ACTION1__',
                                                                                                  'lookahead' => 0
                                                                                                }, 'Parse::RecDescent::Action' )
                                                                                       ],
                                                                            'actcount' => 1
                                                                          }, 'Parse::RecDescent::Production' )
                                                                 ],
                                                      'calls' => [
                                                                   '_alternation_1_of_production_1_of_rule_assocrole',
                                                                   'type'
                                                                 ],
                                                      'opcount' => 0,
                                                      'changed' => 0,
                                                      'vars' => '',
                                                      'name' => 'assocrole'
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