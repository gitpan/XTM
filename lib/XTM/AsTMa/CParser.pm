package XTM::AsTMa::CParser;
use Parse::RecDescent;

{ my $ERRORS;


package Parse::RecDescent::XTM::AsTMa::CParser;
use strict;
use vars qw($skip $AUTOLOAD  );
$skip = '\s*';


{
local $SIG{__WARN__} = sub {0};
# PRETEND TO BE IN Parse::RecDescent NAMESPACE
*Parse::RecDescent::XTM::AsTMa::CParser::AUTOLOAD	= sub
{
	no strict 'refs';
	$AUTOLOAD =~ s/^Parse::RecDescent::XTM::AsTMa::CParser/Parse::RecDescent/;
	goto &{$AUTOLOAD};
}
}

push @Parse::RecDescent::XTM::AsTMa::CParser::ISA, 'Parse::RecDescent';
# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::AsTMa::CParser::type_topic_id
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"type_topic_id"};
	
	Parse::RecDescent::_trace(q{Trying rule: [type_topic_id]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{type_topic_id},
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [topic_id]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{type_topic_id},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{type_topic_id});
		%item = (__RULE__ => q{type_topic_id});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [topic_id]},
				  Parse::RecDescent::_tracefirst($text),
				  q{type_topic_id},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::AsTMa::CParser::topic_id($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [topic_id]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{type_topic_id},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [topic_id]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{type_topic_id},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{topic_id}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [topic_id]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{type_topic_id},
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
					 q{type_topic_id},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{type_topic_id},
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
					  q{type_topic_id},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{type_topic_id},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::AsTMa::CParser::association_member
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"association_member"};
	
	Parse::RecDescent::_trace(q{Trying rule: [association_member]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{association_member},
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [topic_id ':' list_of_member_topic_ids]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{association_member},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{association_member});
		%item = (__RULE__ => q{association_member});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [topic_id]},
				  Parse::RecDescent::_tracefirst($text),
				  q{association_member},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::AsTMa::CParser::topic_id($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [topic_id]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{association_member},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [topic_id]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{association_member},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{topic_id}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying terminal: [':']},
					  Parse::RecDescent::_tracefirst($text),
					  q{association_member},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{':'})->at($text);
		

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
		

		Parse::RecDescent::_trace(q{Trying subrule: [list_of_member_topic_ids]},
				  Parse::RecDescent::_tracefirst($text),
				  q{association_member},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{list_of_member_topic_ids})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::AsTMa::CParser::list_of_member_topic_ids($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [list_of_member_topic_ids]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{association_member},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [list_of_member_topic_ids]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{association_member},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{list_of_member_topic_ids}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{association_member},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			   my $m = new XTM::member ();

                           my $r = new XTM::roleSpec ();
			   my $t = new XTM::topicRef (href => "#$item{topic_id}");
			   $r->add_reference ($t);
			   $m->add_roleSpec ($r);

			   foreach (@{$item{list_of_member_topic_ids}}) {
			     $m->add_reference_s (new XTM::topicRef (href => "#$_"));
			   }

			   $return = $m;
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
		


		Parse::RecDescent::_trace(q{>>Matched production: [topic_id ':' list_of_member_topic_ids]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{association_member},
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
					 q{association_member},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{association_member},
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
					  q{association_member},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{association_member},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::AsTMa::CParser::types
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['(' list_of_type_topic_ids ')']},
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


		Parse::RecDescent::_trace(q{Trying terminal: ['(']},
					  Parse::RecDescent::_tracefirst($text),
					  q{types},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

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
		

		Parse::RecDescent::_trace(q{Trying subrule: [list_of_type_topic_ids]},
				  Parse::RecDescent::_tracefirst($text),
				  q{types},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{list_of_type_topic_ids})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::AsTMa::CParser::list_of_type_topic_ids($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [list_of_type_topic_ids]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{types},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [list_of_type_topic_ids]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{types},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{list_of_type_topic_ids}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying terminal: [')']},
					  Parse::RecDescent::_tracefirst($text),
					  q{types},
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
		

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{types},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = $item{list_of_type_topic_ids}; };
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['(' list_of_type_topic_ids ')']<<},
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
sub Parse::RecDescent::XTM::AsTMa::CParser::topic_id
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"topic_id"};
	
	Parse::RecDescent::_trace(q{Trying rule: [topic_id]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{topic_id},
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [id]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{topic_id},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{topic_id});
		%item = (__RULE__ => q{topic_id});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [id]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic_id},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::AsTMa::CParser::id($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [id]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic_id},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [id]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_id},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{id}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [id]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_id},
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
					 q{topic_id},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{topic_id},
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
					  q{topic_id},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{topic_id},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::AsTMa::CParser::string
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [/[^\\n\\r]+/]},
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


		Parse::RecDescent::_trace(q{Trying terminal: [/[^\\n\\r]+/]}, Parse::RecDescent::_tracefirst($text),
					  q{string},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:[^\n\r]+)//)
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
		


		Parse::RecDescent::_trace(q{>>Matched production: [/[^\\n\\r]+/]<<},
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
sub Parse::RecDescent::XTM::AsTMa::CParser::section
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"section"};
	
	Parse::RecDescent::_trace(q{Trying rule: [section]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{section},
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [topic_definition]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{section},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{section});
		%item = (__RULE__ => q{section});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [topic_definition]},
				  Parse::RecDescent::_tracefirst($text),
				  q{section},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::AsTMa::CParser::topic_definition($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [topic_definition]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{section},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [topic_definition]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{section},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{topic_definition}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [topic_definition]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{section},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [association_definition]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{section},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{section});
		%item = (__RULE__ => q{section});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [association_definition]},
				  Parse::RecDescent::_tracefirst($text),
				  q{section},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::AsTMa::CParser::association_definition($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [association_definition]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{section},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [association_definition]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{section},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{association_definition}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [association_definition]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{section},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [<error...>]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{section},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[2];
		
		my $_savetext;
		@item = (q{section});
		%item = (__RULE__ => q{section});
		my $repcount = 0;


		

		Parse::RecDescent::_trace(q{Trying directive: [<error...>]},
					Parse::RecDescent::_tracefirst($text),
					  q{section},
					  $tracelevel)
						if defined $::RD_TRACE; 
		$_tok = do { if (1) { do {push @{$thisparser->{errors}}, [qq{ Problem parsing near "$text" (line "$thisline", col "$thiscolumn")},$thisline];} unless  $_noactions; undef } else {0} };
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
					  q{section},
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
					 q{section},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{section},
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
					  q{section},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{section},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::AsTMa::CParser::_alternation_1_of_production_1_of_rule_topic_definition
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"_alternation_1_of_production_1_of_rule_topic_definition"};
	
	Parse::RecDescent::_trace(q{Trying rule: [_alternation_1_of_production_1_of_rule_topic_definition]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{_alternation_1_of_production_1_of_rule_topic_definition},
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['tid' ':']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{_alternation_1_of_production_1_of_rule_topic_definition},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_topic_definition});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_topic_definition});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['tid']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_topic_definition},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\Atid//)
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
		

		Parse::RecDescent::_trace(q{Trying terminal: [':']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_topic_definition},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{':'})->at($text);
		

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
		push @item, $item{__STRING2__}=$&;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['tid' ':']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_topic_definition},
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
					 q{_alternation_1_of_production_1_of_rule_topic_definition},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{_alternation_1_of_production_1_of_rule_topic_definition},
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
					  q{_alternation_1_of_production_1_of_rule_topic_definition},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{_alternation_1_of_production_1_of_rule_topic_definition},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::AsTMa::CParser::subject_identity
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"subject_identity"};
	
	Parse::RecDescent::_trace(q{Trying rule: [subject_identity]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{subject_identity},
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['sin' ':' string]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{subject_identity},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{subject_identity});
		%item = (__RULE__ => q{subject_identity});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['sin']},
					  Parse::RecDescent::_tracefirst($text),
					  q{subject_identity},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\Asin//)
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
		

		Parse::RecDescent::_trace(q{Trying terminal: [':']},
					  Parse::RecDescent::_tracefirst($text),
					  q{subject_identity},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{':'})->at($text);
		

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
		push @item, $item{__STRING2__}=$&;
		

		Parse::RecDescent::_trace(q{Trying subrule: [string]},
				  Parse::RecDescent::_tracefirst($text),
				  q{subject_identity},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{string})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::AsTMa::CParser::string($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [string]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{subject_identity},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [string]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{subject_identity},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{string}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{subject_identity},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			 use URI;
			 my $u = URI->new ($item{string});
			 $return = ref ($u) eq 'URI::_generic' ? 
			   new XTM::topicRef (href => $item{string}) :
			     new XTM::subjectIndicatorRef (href => $item{string});
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['sin' ':' string]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{subject_identity},
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
					 q{subject_identity},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{subject_identity},
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
					  q{subject_identity},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{subject_identity},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::AsTMa::CParser::basename_characteristic
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"basename_characteristic"};
	
	Parse::RecDescent::_trace(q{Trying rule: [basename_characteristic]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{basename_characteristic},
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['bn' scopes ':' string]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{basename_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{basename_characteristic});
		%item = (__RULE__ => q{basename_characteristic});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['bn']},
					  Parse::RecDescent::_tracefirst($text),
					  q{basename_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\Abn//)
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
		

		Parse::RecDescent::_trace(q{Trying repeated subrule: [scopes]},
				  Parse::RecDescent::_tracefirst($text),
				  q{basename_characteristic},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{scopes})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::AsTMa::CParser::scopes, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [scopes]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{basename_characteristic},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [scopes]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{basename_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{scopes(?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying terminal: [':']},
					  Parse::RecDescent::_tracefirst($text),
					  q{basename_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{':'})->at($text);
		

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
		push @item, $item{__STRING2__}=$&;
		

		Parse::RecDescent::_trace(q{Trying subrule: [string]},
				  Parse::RecDescent::_tracefirst($text),
				  q{basename_characteristic},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{string})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::AsTMa::CParser::string($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [string]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{basename_characteristic},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [string]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{basename_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{string}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{basename_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			 my $b = new XTM::baseName ();
			 $b->add_baseNameString (new XTM::baseNameString (string => $item{string}));
			 $b->add_scope          (new XTM::scope());
			 foreach (@{$item{'scopes(?)'}->[0]}) {
			   $b->scope->add_reference_s (new XTM::topicRef (href => "#$_"));
			 }
			 $b->scope->add_reference_s (new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) ) 
			   unless $b->scope->references;
			 $return = $b;
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['bn' scopes ':' string]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{basename_characteristic},
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
					 q{basename_characteristic},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{basename_characteristic},
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
					  q{basename_characteristic},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{basename_characteristic},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::AsTMa::CParser::isreification
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"isreification"};
	
	Parse::RecDescent::_trace(q{Trying rule: [isreification]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{isreification},
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['is-reified-by' uri]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{isreification},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{isreification});
		%item = (__RULE__ => q{isreification});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['is-reified-by']},
					  Parse::RecDescent::_tracefirst($text),
					  q{isreification},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\Ais\-reified\-by//)
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
				  q{isreification},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{uri})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::AsTMa::CParser::uri($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [uri]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{isreification},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [uri]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{isreification},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{uri}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{isreification},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			 $return = $item{uri};
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['is-reified-by' uri]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{isreification},
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
					 q{isreification},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{isreification},
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
					  q{isreification},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{isreification},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::AsTMa::CParser::association_definition
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"association_definition"};
	
	Parse::RecDescent::_trace(q{Trying rule: [association_definition]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{association_definition},
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [scopes '(' type_topic_id ')' isreification association_member]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{association_definition},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{association_definition});
		%item = (__RULE__ => q{association_definition});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying repeated subrule: [scopes]},
				  Parse::RecDescent::_tracefirst($text),
				  q{association_definition},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::AsTMa::CParser::scopes, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [scopes]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{association_definition},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [scopes]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{association_definition},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{scopes(?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying terminal: ['(']},
					  Parse::RecDescent::_tracefirst($text),
					  q{association_definition},
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
		

		Parse::RecDescent::_trace(q{Trying subrule: [type_topic_id]},
				  Parse::RecDescent::_tracefirst($text),
				  q{association_definition},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{type_topic_id})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::AsTMa::CParser::type_topic_id($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [type_topic_id]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{association_definition},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [type_topic_id]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{association_definition},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{type_topic_id}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying terminal: [')']},
					  Parse::RecDescent::_tracefirst($text),
					  q{association_definition},
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
		

		Parse::RecDescent::_trace(q{Trying repeated subrule: [isreification]},
				  Parse::RecDescent::_tracefirst($text),
				  q{association_definition},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{isreification})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::AsTMa::CParser::isreification, 0, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [isreification]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{association_definition},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [isreification]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{association_definition},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{isreification(s?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying repeated subrule: [association_member]},
				  Parse::RecDescent::_tracefirst($text),
				  q{association_definition},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{association_member})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::AsTMa::CParser::association_member, 1, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [association_member]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{association_definition},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [association_member]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{association_definition},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{association_member(s)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{association_definition},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			   my @components; # here I collect all which I generate here

			   my $a = new XTM::association ();
			   my $s = new XTM::scope();
			   $a->add_scope ($s);
			   foreach (@{$item{'scopes(?)'}->[0]}) {
			     $s->add_reference_s (new XTM::topicRef (href => "#$_"));
			   }
			   $a->scope->add_reference_s (new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) ) 
			     unless $a->scope->references;

			   $a->add_instanceOf (new XTM::instanceOf (reference => 
				    new XTM::topicRef (href => "#$item{type_topic_id}")));
			   foreach (@{$item{'association_member(s)'}}) {
			     $a->add__s ($_);
			   }

			   push @components, $a;

			   foreach my $uri (@{$item{'isreification(s?)'}}) {
			     push @components, _make_reifying_topic ($uri, $a->id);
			   }

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
		


		Parse::RecDescent::_trace(q{>>Matched production: [scopes '(' type_topic_id ')' isreification association_member]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{association_definition},
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
					 q{association_definition},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{association_definition},
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
					  q{association_definition},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{association_definition},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::AsTMa::CParser::list_of_type_topic_ids
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"list_of_type_topic_ids"};
	
	Parse::RecDescent::_trace(q{Trying rule: [list_of_type_topic_ids]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{list_of_type_topic_ids},
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [list_of_ids]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{list_of_type_topic_ids},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{list_of_type_topic_ids});
		%item = (__RULE__ => q{list_of_type_topic_ids});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [list_of_ids]},
				  Parse::RecDescent::_tracefirst($text),
				  q{list_of_type_topic_ids},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::AsTMa::CParser::list_of_ids($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [list_of_ids]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{list_of_type_topic_ids},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [list_of_ids]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{list_of_type_topic_ids},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{list_of_ids}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [list_of_ids]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{list_of_type_topic_ids},
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
					 q{list_of_type_topic_ids},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{list_of_type_topic_ids},
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
					  q{list_of_type_topic_ids},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{list_of_type_topic_ids},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::AsTMa::CParser::resourceData_characteristic
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"resourceData_characteristic"};
	
	Parse::RecDescent::_trace(q{Trying rule: [resourceData_characteristic]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{resourceData_characteristic},
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['in' scopes type colon string]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{resourceData_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{resourceData_characteristic});
		%item = (__RULE__ => q{resourceData_characteristic});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['in']},
					  Parse::RecDescent::_tracefirst($text),
					  q{resourceData_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\Ain//)
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
		

		Parse::RecDescent::_trace(q{Trying repeated subrule: [scopes]},
				  Parse::RecDescent::_tracefirst($text),
				  q{resourceData_characteristic},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{scopes})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::AsTMa::CParser::scopes, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [scopes]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{resourceData_characteristic},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [scopes]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{resourceData_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{scopes(?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying repeated subrule: [type]},
				  Parse::RecDescent::_tracefirst($text),
				  q{resourceData_characteristic},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{type})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::AsTMa::CParser::type, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [type]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{resourceData_characteristic},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [type]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{resourceData_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{type(?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying repeated subrule: [colon]},
				  Parse::RecDescent::_tracefirst($text),
				  q{resourceData_characteristic},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{colon})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::AsTMa::CParser::colon, 1, 2, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [colon]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{resourceData_characteristic},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [colon]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{resourceData_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{colon(1..2)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying subrule: [string]},
				  Parse::RecDescent::_tracefirst($text),
				  q{resourceData_characteristic},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{string})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::AsTMa::CParser::string($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [string]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{resourceData_characteristic},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [string]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{resourceData_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{string}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{resourceData_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			 my $o = new XTM::occurrence ();
# fixme: need better way to figure out whether unescape needed; now looks for %0A at end....
			 $o->add_resource (new XTM::resourceData (data => (@{$item{'colon(1..2)'}}==2?URI::Escape::uri_unescape($item{string}):$item{string})));
			 $o->add_scope    (new XTM::scope());
			 foreach (@{$item{'scopes(?)'}->[0]}) {
			   $o->scope->add_reference_s (new XTM::topicRef (href => "#$_"));
			 }
			 $o->scope->add_reference_s (new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) ) 
			   unless $o->scope->references;

			 $o->add_instanceOf (new XTM::instanceOf ( reference => new XTM::topicRef (href => 
				$item{'type(?)'} && $item{'type(?)'}->[0] ?	 "#$item{'type(?)'}->[0]" : $XTM::PSI::xtm{occurrence}
												  )));
			 $return = $o;
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['in' scopes type colon string]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{resourceData_characteristic},
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
					 q{resourceData_characteristic},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{resourceData_characteristic},
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
					  q{resourceData_characteristic},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{resourceData_characteristic},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::AsTMa::CParser::topic_characteristic
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"topic_characteristic"};
	
	Parse::RecDescent::_trace(q{Trying rule: [topic_characteristic]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{topic_characteristic},
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [basename_characteristic]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{topic_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{topic_characteristic});
		%item = (__RULE__ => q{topic_characteristic});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [basename_characteristic]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic_characteristic},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::AsTMa::CParser::basename_characteristic($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [basename_characteristic]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic_characteristic},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [basename_characteristic]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{basename_characteristic}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [basename_characteristic]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [resourceRef_characteristic]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{topic_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{topic_characteristic});
		%item = (__RULE__ => q{topic_characteristic});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [resourceRef_characteristic]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic_characteristic},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::AsTMa::CParser::resourceRef_characteristic($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [resourceRef_characteristic]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic_characteristic},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [resourceRef_characteristic]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{resourceRef_characteristic}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [resourceRef_characteristic]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [resourceData_characteristic]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{topic_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[2];
		$text = $_[1];
		my $_savetext;
		@item = (q{topic_characteristic});
		%item = (__RULE__ => q{topic_characteristic});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [resourceData_characteristic]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic_characteristic},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::AsTMa::CParser::resourceData_characteristic($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [resourceData_characteristic]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic_characteristic},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [resourceData_characteristic]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{resourceData_characteristic}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [resourceData_characteristic]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [subject_identity]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{topic_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[3];
		$text = $_[1];
		my $_savetext;
		@item = (q{topic_characteristic});
		%item = (__RULE__ => q{topic_characteristic});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [subject_identity]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic_characteristic},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::AsTMa::CParser::subject_identity($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [subject_identity]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic_characteristic},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [subject_identity]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{subject_identity}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [subject_identity]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_characteristic},
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
					 q{topic_characteristic},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{topic_characteristic},
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
					  q{topic_characteristic},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{topic_characteristic},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::AsTMa::CParser::id
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"id"};
	
	Parse::RecDescent::_trace(q{Trying rule: [id]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{id},
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [/[\\w\\-\\.]+/]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{id},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{id});
		%item = (__RULE__ => q{id});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: [/[\\w\\-\\.]+/]}, Parse::RecDescent::_tracefirst($text),
					  q{id},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:[\w\-\.]+)//)
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
		


		Parse::RecDescent::_trace(q{>>Matched production: [/[\\w\\-\\.]+/]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{id},
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
					 q{id},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{id},
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
					  q{id},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{id},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::AsTMa::CParser::startrule
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [section]},
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


		Parse::RecDescent::_trace(q{Trying subrule: [section]},
				  Parse::RecDescent::_tracefirst($text),
				  q{startrule},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::AsTMa::CParser::section($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [section]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{startrule},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [section]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{startrule},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{section}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [section]<<},
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
sub Parse::RecDescent::XTM::AsTMa::CParser::scope
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['@' topic_id]},
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


		Parse::RecDescent::_trace(q{Trying terminal: ['@']},
					  Parse::RecDescent::_tracefirst($text),
					  q{scope},
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
		

		Parse::RecDescent::_trace(q{Trying subrule: [topic_id]},
				  Parse::RecDescent::_tracefirst($text),
				  q{scope},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{topic_id})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::AsTMa::CParser::topic_id($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [topic_id]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{scope},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [topic_id]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{scope},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{topic_id}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: ['@' topic_id]<<},
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
sub Parse::RecDescent::XTM::AsTMa::CParser::list_of_scope_topic_ids
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"list_of_scope_topic_ids"};
	
	Parse::RecDescent::_trace(q{Trying rule: [list_of_scope_topic_ids]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{list_of_scope_topic_ids},
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [list_of_ids]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{list_of_scope_topic_ids},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{list_of_scope_topic_ids});
		%item = (__RULE__ => q{list_of_scope_topic_ids});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [list_of_ids]},
				  Parse::RecDescent::_tracefirst($text),
				  q{list_of_scope_topic_ids},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::AsTMa::CParser::list_of_ids($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [list_of_ids]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{list_of_scope_topic_ids},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [list_of_ids]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{list_of_scope_topic_ids},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{list_of_ids}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [list_of_ids]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{list_of_scope_topic_ids},
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
					 q{list_of_scope_topic_ids},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{list_of_scope_topic_ids},
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
					  q{list_of_scope_topic_ids},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{list_of_scope_topic_ids},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::AsTMa::CParser::reification
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"reification"};
	
	Parse::RecDescent::_trace(q{Trying rule: [reification]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{reification},
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['reifies' uri]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{reification},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{reification});
		%item = (__RULE__ => q{reification});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['reifies']},
					  Parse::RecDescent::_tracefirst($text),
					  q{reification},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\Areifies//)
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
				  q{reification},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{uri})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::AsTMa::CParser::uri($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [uri]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{reification},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [uri]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{reification},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{uri}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{reification},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
                         # check for relative URI ?
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['reifies' uri]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{reification},
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
					 q{reification},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{reification},
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
					  q{reification},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{reification},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::AsTMa::CParser::resourceRef_characteristic
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"resourceRef_characteristic"};
	
	Parse::RecDescent::_trace(q{Trying rule: [resourceRef_characteristic]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{resourceRef_characteristic},
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['oc' scopes type ':' string]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{resourceRef_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{resourceRef_characteristic});
		%item = (__RULE__ => q{resourceRef_characteristic});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['oc']},
					  Parse::RecDescent::_tracefirst($text),
					  q{resourceRef_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\Aoc//)
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
		

		Parse::RecDescent::_trace(q{Trying repeated subrule: [scopes]},
				  Parse::RecDescent::_tracefirst($text),
				  q{resourceRef_characteristic},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{scopes})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::AsTMa::CParser::scopes, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [scopes]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{resourceRef_characteristic},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [scopes]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{resourceRef_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{scopes(?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying repeated subrule: [type]},
				  Parse::RecDescent::_tracefirst($text),
				  q{resourceRef_characteristic},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{type})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::AsTMa::CParser::type, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [type]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{resourceRef_characteristic},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [type]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{resourceRef_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{type(?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying terminal: [':']},
					  Parse::RecDescent::_tracefirst($text),
					  q{resourceRef_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{':'})->at($text);
		

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
		push @item, $item{__STRING2__}=$&;
		

		Parse::RecDescent::_trace(q{Trying subrule: [string]},
				  Parse::RecDescent::_tracefirst($text),
				  q{resourceRef_characteristic},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{string})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::AsTMa::CParser::string($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [string]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{resourceRef_characteristic},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [string]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{resourceRef_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{string}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{resourceRef_characteristic},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			 my $o = new XTM::occurrence ();
			 $o->add_resource (new XTM::resourceRef (href => $item{string}));
			 $o->add_scope    (new XTM::scope());
			 foreach (@{$item{'scopes(?)'}->[0]}) {
			   $o->scope->add_reference_s (new XTM::topicRef (href => "#$_"));
			 }
			 $o->scope->add_reference_s (new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) ) 
			   unless $o->scope->references;

			 $o->add_instanceOf (new XTM::instanceOf ( reference => new XTM::topicRef (href => 
				$item{'type(?)'} && $item{'type(?)'}->[0] ?	 "#$item{'type(?)'}->[0]" : $XTM::PSI::xtm{occurrence}
												  )));
			 $return = $o;
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['oc' scopes type ':' string]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{resourceRef_characteristic},
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
					 q{resourceRef_characteristic},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{resourceRef_characteristic},
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
					  q{resourceRef_characteristic},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{resourceRef_characteristic},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::AsTMa::CParser::topic_definition
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"topic_definition"};
	
	Parse::RecDescent::_trace(q{Trying rule: [topic_definition]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{topic_definition},
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['tid' topic_id types reification isreification topic_characteristic]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{topic_definition},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{topic_definition});
		%item = (__RULE__ => q{topic_definition});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying repeated subrule: ['tid']},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic_definition},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::AsTMa::CParser::_alternation_1_of_production_1_of_rule_topic_definition, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: ['tid']>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic_definition},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [_alternation_1_of_production_1_of_rule_topic_definition]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_definition},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{_alternation_1_of_production_1_of_rule_topic_definition(?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying subrule: [topic_id]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic_definition},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{topic_id})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::AsTMa::CParser::topic_id($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [topic_id]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic_definition},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [topic_id]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_definition},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{topic_id}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying repeated subrule: [types]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic_definition},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{types})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::AsTMa::CParser::types, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [types]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic_definition},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [types]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_definition},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{types(?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying repeated subrule: [reification]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic_definition},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{reification})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::AsTMa::CParser::reification, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [reification]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic_definition},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [reification]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_definition},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{reification(?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying repeated subrule: [isreification]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic_definition},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{isreification})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::AsTMa::CParser::isreification, 0, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [isreification]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic_definition},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [isreification]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_definition},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{isreification(s?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying repeated subrule: [topic_characteristic]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic_definition},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{topic_characteristic})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::AsTMa::CParser::topic_characteristic, 0, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [topic_characteristic]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic_definition},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [topic_characteristic]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_definition},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{topic_characteristic(s?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_definition},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			 my @components; # here I collect all which I generate here

			 # deal with the topic first
			 my $t = new XTM::topic (id => $item{topic_id});
			 foreach (@{$item{'types(?)'}->[0]}) {
			   $t->add__s (new XTM::instanceOf ( reference => new XTM::topicRef (href => "#$_")));
			 }
			 $t->add__s (new XTM::instanceOf ( reference => new XTM::topicRef (href => $XTM::PSI::xtm{topic})))
			   unless $t->instanceOfs && @{$t->instanceOfs};
			 
			 my $s = new XTM::subjectIdentity (); # maybe we need it
			 foreach (@{$item{'topic_characteristic(s?)'}}) {
			   if (ref($_) eq 'XTM::subjectIndicatorRef') {
			     $s->add_reference_s ($_);
			   } elsif (ref($_) eq 'XTM::topicRef') {
			     $s->add_reference_s ($_);
			   } else {
			     $t->add__s ($_);
			   }
			 }
			 if (ref($item{'reification(?)'}) eq 'ARRAY' && @{$item{'reification(?)'}}) {
			   $s->add_ ( $item{'reification(?)'}->[0] );
			 }
			 $t->add_subjectIdentity ($s) if $s->references || $s->resourceRef; # only add it if we found at least one reference


			 # provide default basename, universally scoped
			 unless ($t->baseNames && @{$t->baseNames}) {
			   my $name = $item{topic_id};
			   $name =~ s/-/ /g;
			   my $b = new XTM::baseName ();
			   $b->add_baseNameString (new XTM::baseNameString (string => $name));
			   $b->add_scope          (new XTM::scope());
			   $b->scope->add_reference_s (new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) );
			   $t->add__s ($b);
			 }

			 push @components, $t;

sub _make_reifying_topic {
  my $uri  = shift; # my id
  my $taid = shift; # assoc or topic id which we reify

  my $u = new URI ($uri);
  #print "==found reification==", $uri;
  my $t = new XTM::topic (id => $uri);

  if ($u->scheme) {                         # a resource
  } else {                                  # a local topic
    my $s2 = new XTM::subjectIdentity ();
    my $r2 = new XTM::resourceRef (href => '#'.$taid);
    $s2->add_ ($r2);
    $t->add_ ($s2);
    
    my $name = $uri;
    $name =~ s/-/ /g;
    my $b2 = new XTM::baseName ();
    $b2->add_baseNameString (new XTM::baseNameString (string => $name));
    $b2->add_scope          (new XTM::scope());
    $b2->scope->add_reference_s (new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) );
    $t->add__s ($b2);
  }
  return $t;
}

			 foreach my $uri (@{$item{'isreification(s?)'}}) {
			   push @components, _make_reifying_topic ($uri, $t->id);
			 }

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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['tid' topic_id types reification isreification topic_characteristic]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_definition},
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
					 q{topic_definition},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{topic_definition},
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
					  q{topic_definition},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{topic_definition},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::AsTMa::CParser::uri
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [/[\\w\\-\\.\\/\\?\\&\\:\\,\\+]+/]},
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


		Parse::RecDescent::_trace(q{Trying terminal: [/[\\w\\-\\.\\/\\?\\&\\:\\,\\+]+/]}, Parse::RecDescent::_tracefirst($text),
					  q{uri},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:[\w\-\.\/\?\&\:\,\+]+)//)
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
		


		Parse::RecDescent::_trace(q{>>Matched production: [/[\\w\\-\\.\\/\\?\\&\\:\\,\\+]+/]<<},
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
sub Parse::RecDescent::XTM::AsTMa::CParser::colon
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"colon"};
	
	Parse::RecDescent::_trace(q{Trying rule: [colon]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{colon},
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [':']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{colon},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{colon});
		%item = (__RULE__ => q{colon});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: [':']},
					  Parse::RecDescent::_tracefirst($text),
					  q{colon},
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
		


		Parse::RecDescent::_trace(q{>>Matched production: [':']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{colon},
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
					 q{colon},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{colon},
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
					  q{colon},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{colon},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::AsTMa::CParser::list_of_ids
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"list_of_ids"};
	
	Parse::RecDescent::_trace(q{Trying rule: [list_of_ids]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{list_of_ids},
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		local $skip = defined($skip) ? $skip : $Parse::RecDescent::skip;
		Parse::RecDescent::_trace(q{Trying production: [<skip:'[ ]*'> id]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{list_of_ids},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{list_of_ids});
		%item = (__RULE__ => q{list_of_ids});
		my $repcount = 0;


		

		Parse::RecDescent::_trace(q{Trying directive: [<skip:'[ ]*'>]},
					Parse::RecDescent::_tracefirst($text),
					  q{list_of_ids},
					  $tracelevel)
						if defined $::RD_TRACE; 
		$_tok = do { my $oldskip = $skip; $skip='[ ]*'; $oldskip };
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
		

		Parse::RecDescent::_trace(q{Trying repeated subrule: [id]},
				  Parse::RecDescent::_tracefirst($text),
				  q{list_of_ids},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{id})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::XTM::AsTMa::CParser::id, 1, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [id]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{list_of_ids},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [id]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{list_of_ids},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{id(s)}} = $_tok;
		push @item, $_tok;
		



		Parse::RecDescent::_trace(q{>>Matched production: [<skip:'[ ]*'> id]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{list_of_ids},
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
					 q{list_of_ids},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{list_of_ids},
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
					  q{list_of_ids},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{list_of_ids},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::AsTMa::CParser::scopes
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"scopes"};
	
	Parse::RecDescent::_trace(q{Trying rule: [scopes]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{scopes},
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['@' list_of_scope_topic_ids]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{scopes},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{scopes});
		%item = (__RULE__ => q{scopes});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['@']},
					  Parse::RecDescent::_tracefirst($text),
					  q{scopes},
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
		

		Parse::RecDescent::_trace(q{Trying subrule: [list_of_scope_topic_ids]},
				  Parse::RecDescent::_tracefirst($text),
				  q{scopes},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{list_of_scope_topic_ids})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::AsTMa::CParser::list_of_scope_topic_ids($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [list_of_scope_topic_ids]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{scopes},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [list_of_scope_topic_ids]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{scopes},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{list_of_scope_topic_ids}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: ['@' list_of_scope_topic_ids]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{scopes},
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
					 q{scopes},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{scopes},
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
					  q{scopes},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{scopes},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::XTM::AsTMa::CParser::type
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['(' type_topic_id ')']},
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


		Parse::RecDescent::_trace(q{Trying terminal: ['(']},
					  Parse::RecDescent::_tracefirst($text),
					  q{type},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

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
		

		Parse::RecDescent::_trace(q{Trying subrule: [type_topic_id]},
				  Parse::RecDescent::_tracefirst($text),
				  q{type},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{type_topic_id})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::AsTMa::CParser::type_topic_id($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [type_topic_id]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{type},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [type_topic_id]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{type},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{type_topic_id}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying terminal: [')']},
					  Parse::RecDescent::_tracefirst($text),
					  q{type},
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
		

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{type},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = $item{type_topic_id}; };
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['(' type_topic_id ')']<<},
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
sub Parse::RecDescent::XTM::AsTMa::CParser::list_of_member_topic_ids
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"list_of_member_topic_ids"};
	
	Parse::RecDescent::_trace(q{Trying rule: [list_of_member_topic_ids]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{list_of_member_topic_ids},
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [list_of_ids]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{list_of_member_topic_ids},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{list_of_member_topic_ids});
		%item = (__RULE__ => q{list_of_member_topic_ids});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [list_of_ids]},
				  Parse::RecDescent::_tracefirst($text),
				  q{list_of_member_topic_ids},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::XTM::AsTMa::CParser::list_of_ids($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [list_of_ids]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{list_of_member_topic_ids},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [list_of_ids]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{list_of_member_topic_ids},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{list_of_ids}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [list_of_ids]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{list_of_member_topic_ids},
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
					 q{list_of_member_topic_ids},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{list_of_member_topic_ids},
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
					  q{list_of_member_topic_ids},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{list_of_member_topic_ids},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}
}
package XTM::AsTMa::CParser; sub new { my $self = bless( {
                 '_AUTOTREE' => undef,
                 'localvars' => '',
                 'startcode' => '',
                 '_check' => {
                               'thisoffset' => '',
                               'itempos' => '',
                               'prevoffset' => '',
                               'prevline' => '',
                               'prevcolumn' => '',
                               'thiscolumn' => '1'
                             },
                 'namespace' => 'Parse::RecDescent::XTM::AsTMa::CParser',
                 '_AUTOACTION' => undef,
                 'rules' => {
                              'type_topic_id' => bless( {
                                                          'impcount' => 0,
                                                          'calls' => [
                                                                       'topic_id'
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
                                                                                                      'subrule' => 'topic_id',
                                                                                                      'matchrule' => 0,
                                                                                                      'implicit' => undef,
                                                                                                      'argcode' => undef,
                                                                                                      'lookahead' => 0,
                                                                                                      'line' => 206
                                                                                                    }, 'Parse::RecDescent::Subrule' )
                                                                                           ],
                                                                                'line' => undef
                                                                              }, 'Parse::RecDescent::Production' )
                                                                     ],
                                                          'name' => 'type_topic_id',
                                                          'vars' => '',
                                                          'line' => 206
                                                        }, 'Parse::RecDescent::Rule' ),
                              'association_member' => bless( {
                                                               'impcount' => 0,
                                                               'calls' => [
                                                                            'topic_id',
                                                                            'list_of_member_topic_ids'
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
                                                                                                           'subrule' => 'topic_id',
                                                                                                           'matchrule' => 0,
                                                                                                           'implicit' => undef,
                                                                                                           'argcode' => undef,
                                                                                                           'lookahead' => 0,
                                                                                                           'line' => 120
                                                                                                         }, 'Parse::RecDescent::Subrule' ),
                                                                                                  bless( {
                                                                                                           'pattern' => ':',
                                                                                                           'hashname' => '__STRING1__',
                                                                                                           'description' => '\':\'',
                                                                                                           'lookahead' => 0,
                                                                                                           'line' => 120
                                                                                                         }, 'Parse::RecDescent::Literal' ),
                                                                                                  bless( {
                                                                                                           'subrule' => 'list_of_member_topic_ids',
                                                                                                           'matchrule' => 0,
                                                                                                           'implicit' => undef,
                                                                                                           'argcode' => undef,
                                                                                                           'lookahead' => 0,
                                                                                                           'line' => 120
                                                                                                         }, 'Parse::RecDescent::Subrule' ),
                                                                                                  bless( {
                                                                                                           'hashname' => '__ACTION1__',
                                                                                                           'lookahead' => 0,
                                                                                                           'line' => 121,
                                                                                                           'code' => '{
			   my $m = new XTM::member ();

                           my $r = new XTM::roleSpec ();
			   my $t = new XTM::topicRef (href => "#$item{topic_id}");
			   $r->add_reference ($t);
			   $m->add_roleSpec ($r);

			   foreach (@{$item{list_of_member_topic_ids}}) {
			     $m->add_reference_s (new XTM::topicRef (href => "#$_"));
			   }

			   $return = $m;
			 }'
                                                                                                         }, 'Parse::RecDescent::Action' )
                                                                                                ],
                                                                                     'line' => undef
                                                                                   }, 'Parse::RecDescent::Production' )
                                                                          ],
                                                               'name' => 'association_member',
                                                               'vars' => '',
                                                               'line' => 120
                                                             }, 'Parse::RecDescent::Rule' ),
                              'types' => bless( {
                                                  'impcount' => 0,
                                                  'calls' => [
                                                               'list_of_type_topic_ids'
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
                                                                                              'pattern' => '(',
                                                                                              'hashname' => '__STRING1__',
                                                                                              'description' => '\'(\'',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 136
                                                                                            }, 'Parse::RecDescent::Literal' ),
                                                                                     bless( {
                                                                                              'subrule' => 'list_of_type_topic_ids',
                                                                                              'matchrule' => 0,
                                                                                              'implicit' => undef,
                                                                                              'argcode' => undef,
                                                                                              'lookahead' => 0,
                                                                                              'line' => 136
                                                                                            }, 'Parse::RecDescent::Subrule' ),
                                                                                     bless( {
                                                                                              'pattern' => ')',
                                                                                              'hashname' => '__STRING2__',
                                                                                              'description' => '\')\'',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 136
                                                                                            }, 'Parse::RecDescent::Literal' ),
                                                                                     bless( {
                                                                                              'hashname' => '__ACTION1__',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 136,
                                                                                              'code' => '{ $return = $item{list_of_type_topic_ids}; }'
                                                                                            }, 'Parse::RecDescent::Action' )
                                                                                   ],
                                                                        'line' => undef
                                                                      }, 'Parse::RecDescent::Production' )
                                                             ],
                                                  'name' => 'types',
                                                  'vars' => '',
                                                  'line' => 136
                                                }, 'Parse::RecDescent::Rule' ),
                              'topic_id' => bless( {
                                                     'impcount' => 0,
                                                     'calls' => [
                                                                  'id'
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
                                                                                                 'subrule' => 'id',
                                                                                                 'matchrule' => 0,
                                                                                                 'implicit' => undef,
                                                                                                 'argcode' => undef,
                                                                                                 'lookahead' => 0,
                                                                                                 'line' => 216
                                                                                               }, 'Parse::RecDescent::Subrule' )
                                                                                      ],
                                                                           'line' => undef
                                                                         }, 'Parse::RecDescent::Production' )
                                                                ],
                                                     'name' => 'topic_id',
                                                     'vars' => '',
                                                     'line' => 216
                                                   }, 'Parse::RecDescent::Rule' ),
                              'string' => bless( {
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
                                                                                               'pattern' => '[^\\n\\r]+',
                                                                                               'hashname' => '__PATTERN1__',
                                                                                               'description' => '/[^\\\\n\\\\r]+/',
                                                                                               'lookahead' => 0,
                                                                                               'rdelim' => '/',
                                                                                               'line' => 220,
                                                                                               'mod' => '',
                                                                                               'ldelim' => '/'
                                                                                             }, 'Parse::RecDescent::Token' )
                                                                                    ],
                                                                         'line' => undef
                                                                       }, 'Parse::RecDescent::Production' )
                                                              ],
                                                   'name' => 'string',
                                                   'vars' => '',
                                                   'line' => 220
                                                 }, 'Parse::RecDescent::Rule' ),
                              'section' => bless( {
                                                    'impcount' => 0,
                                                    'calls' => [
                                                                 'topic_definition',
                                                                 'association_definition'
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
                                                                                                'subrule' => 'topic_definition',
                                                                                                'matchrule' => 0,
                                                                                                'implicit' => undef,
                                                                                                'argcode' => undef,
                                                                                                'lookahead' => 0,
                                                                                                'line' => 5
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
                                                                                                'subrule' => 'association_definition',
                                                                                                'matchrule' => 0,
                                                                                                'implicit' => undef,
                                                                                                'argcode' => undef,
                                                                                                'lookahead' => 0,
                                                                                                'line' => 5
                                                                                              }, 'Parse::RecDescent::Subrule' )
                                                                                     ],
                                                                          'line' => 5
                                                                        }, 'Parse::RecDescent::Production' ),
                                                                 bless( {
                                                                          'number' => '2',
                                                                          'strcount' => 0,
                                                                          'dircount' => 1,
                                                                          'uncommit' => 0,
                                                                          'error' => 1,
                                                                          'patcount' => 0,
                                                                          'actcount' => 0,
                                                                          'items' => [
                                                                                       bless( {
                                                                                                'msg' => ' Problem parsing near "$text" (line "$thisline", col "$thiscolumn")',
                                                                                                'hashname' => '__DIRECTIVE1__',
                                                                                                'commitonly' => '',
                                                                                                'lookahead' => 0,
                                                                                                'line' => 5
                                                                                              }, 'Parse::RecDescent::Error' )
                                                                                     ],
                                                                          'line' => 5
                                                                        }, 'Parse::RecDescent::Production' )
                                                               ],
                                                    'name' => 'section',
                                                    'vars' => '',
                                                    'line' => 5
                                                  }, 'Parse::RecDescent::Rule' ),
                              '_alternation_1_of_production_1_of_rule_topic_definition' => bless( {
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
                                                                                                                          'patcount' => 0,
                                                                                                                          'actcount' => 0,
                                                                                                                          'items' => [
                                                                                                                                       bless( {
                                                                                                                                                'pattern' => 'tid',
                                                                                                                                                'hashname' => '__STRING1__',
                                                                                                                                                'description' => '\'tid\'',
                                                                                                                                                'lookahead' => 0,
                                                                                                                                                'line' => 225
                                                                                                                                              }, 'Parse::RecDescent::Literal' ),
                                                                                                                                       bless( {
                                                                                                                                                'pattern' => ':',
                                                                                                                                                'hashname' => '__STRING2__',
                                                                                                                                                'description' => '\':\'',
                                                                                                                                                'lookahead' => 0,
                                                                                                                                                'line' => 225
                                                                                                                                              }, 'Parse::RecDescent::Literal' )
                                                                                                                                     ],
                                                                                                                          'line' => undef
                                                                                                                        }, 'Parse::RecDescent::Production' )
                                                                                                               ],
                                                                                                    'name' => '_alternation_1_of_production_1_of_rule_topic_definition',
                                                                                                    'vars' => '',
                                                                                                    'line' => 225
                                                                                                  }, 'Parse::RecDescent::Rule' ),
                              'subject_identity' => bless( {
                                                             'impcount' => 0,
                                                             'calls' => [
                                                                          'string'
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
                                                                                                         'pattern' => 'sin',
                                                                                                         'hashname' => '__STRING1__',
                                                                                                         'description' => '\'sin\'',
                                                                                                         'lookahead' => 0,
                                                                                                         'line' => 191
                                                                                                       }, 'Parse::RecDescent::Literal' ),
                                                                                                bless( {
                                                                                                         'pattern' => ':',
                                                                                                         'hashname' => '__STRING2__',
                                                                                                         'description' => '\':\'',
                                                                                                         'lookahead' => 0,
                                                                                                         'line' => 191
                                                                                                       }, 'Parse::RecDescent::Literal' ),
                                                                                                bless( {
                                                                                                         'subrule' => 'string',
                                                                                                         'matchrule' => 0,
                                                                                                         'implicit' => undef,
                                                                                                         'argcode' => undef,
                                                                                                         'lookahead' => 0,
                                                                                                         'line' => 191
                                                                                                       }, 'Parse::RecDescent::Subrule' ),
                                                                                                bless( {
                                                                                                         'hashname' => '__ACTION1__',
                                                                                                         'lookahead' => 0,
                                                                                                         'line' => 192,
                                                                                                         'code' => '{
			 use URI;
			 my $u = URI->new ($item{string});
			 $return = ref ($u) eq \'URI::_generic\' ? 
			   new XTM::topicRef (href => $item{string}) :
			     new XTM::subjectIndicatorRef (href => $item{string});
		       }'
                                                                                                       }, 'Parse::RecDescent::Action' )
                                                                                              ],
                                                                                   'line' => undef
                                                                                 }, 'Parse::RecDescent::Production' )
                                                                        ],
                                                             'name' => 'subject_identity',
                                                             'vars' => '',
                                                             'line' => 191
                                                           }, 'Parse::RecDescent::Rule' ),
                              'basename_characteristic' => bless( {
                                                                    'impcount' => 0,
                                                                    'calls' => [
                                                                                 'scopes',
                                                                                 'string'
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
                                                                                                                'pattern' => 'bn',
                                                                                                                'hashname' => '__STRING1__',
                                                                                                                'description' => '\'bn\'',
                                                                                                                'lookahead' => 0,
                                                                                                                'line' => 143
                                                                                                              }, 'Parse::RecDescent::Literal' ),
                                                                                                       bless( {
                                                                                                                'subrule' => 'scopes',
                                                                                                                'expected' => undef,
                                                                                                                'min' => 0,
                                                                                                                'argcode' => undef,
                                                                                                                'max' => 1,
                                                                                                                'matchrule' => 0,
                                                                                                                'repspec' => '?',
                                                                                                                'lookahead' => 0,
                                                                                                                'line' => 143
                                                                                                              }, 'Parse::RecDescent::Repetition' ),
                                                                                                       bless( {
                                                                                                                'pattern' => ':',
                                                                                                                'hashname' => '__STRING2__',
                                                                                                                'description' => '\':\'',
                                                                                                                'lookahead' => 0,
                                                                                                                'line' => 143
                                                                                                              }, 'Parse::RecDescent::Literal' ),
                                                                                                       bless( {
                                                                                                                'subrule' => 'string',
                                                                                                                'matchrule' => 0,
                                                                                                                'implicit' => undef,
                                                                                                                'argcode' => undef,
                                                                                                                'lookahead' => 0,
                                                                                                                'line' => 143
                                                                                                              }, 'Parse::RecDescent::Subrule' ),
                                                                                                       bless( {
                                                                                                                'hashname' => '__ACTION1__',
                                                                                                                'lookahead' => 0,
                                                                                                                'line' => 144,
                                                                                                                'code' => '{
			 my $b = new XTM::baseName ();
			 $b->add_baseNameString (new XTM::baseNameString (string => $item{string}));
			 $b->add_scope          (new XTM::scope());
			 foreach (@{$item{\'scopes(?)\'}->[0]}) {
			   $b->scope->add_reference_s (new XTM::topicRef (href => "#$_"));
			 }
			 $b->scope->add_reference_s (new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) ) 
			   unless $b->scope->references;
			 $return = $b;
		       }'
                                                                                                              }, 'Parse::RecDescent::Action' )
                                                                                                     ],
                                                                                          'line' => undef
                                                                                        }, 'Parse::RecDescent::Production' )
                                                                               ],
                                                                    'name' => 'basename_characteristic',
                                                                    'vars' => '',
                                                                    'line' => 143
                                                                  }, 'Parse::RecDescent::Rule' ),
                              'isreification' => bless( {
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
                                                                                                      'pattern' => 'is-reified-by',
                                                                                                      'hashname' => '__STRING1__',
                                                                                                      'description' => '\'is-reified-by\'',
                                                                                                      'lookahead' => 0,
                                                                                                      'line' => 87
                                                                                                    }, 'Parse::RecDescent::Literal' ),
                                                                                             bless( {
                                                                                                      'subrule' => 'uri',
                                                                                                      'matchrule' => 0,
                                                                                                      'implicit' => undef,
                                                                                                      'argcode' => undef,
                                                                                                      'lookahead' => 0,
                                                                                                      'line' => 87
                                                                                                    }, 'Parse::RecDescent::Subrule' ),
                                                                                             bless( {
                                                                                                      'hashname' => '__ACTION1__',
                                                                                                      'lookahead' => 0,
                                                                                                      'line' => 88,
                                                                                                      'code' => '{
			 $return = $item{uri};
                       }'
                                                                                                    }, 'Parse::RecDescent::Action' )
                                                                                           ],
                                                                                'line' => undef
                                                                              }, 'Parse::RecDescent::Production' )
                                                                     ],
                                                          'name' => 'isreification',
                                                          'vars' => '',
                                                          'line' => 87
                                                        }, 'Parse::RecDescent::Rule' ),
                              'association_definition' => bless( {
                                                                   'impcount' => 0,
                                                                   'calls' => [
                                                                                'scopes',
                                                                                'type_topic_id',
                                                                                'isreification',
                                                                                'association_member'
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
                                                                                                               'subrule' => 'scopes',
                                                                                                               'expected' => undef,
                                                                                                               'min' => 0,
                                                                                                               'argcode' => undef,
                                                                                                               'max' => 1,
                                                                                                               'matchrule' => 0,
                                                                                                               'repspec' => '?',
                                                                                                               'lookahead' => 0,
                                                                                                               'line' => 92
                                                                                                             }, 'Parse::RecDescent::Repetition' ),
                                                                                                      bless( {
                                                                                                               'pattern' => '(',
                                                                                                               'hashname' => '__STRING1__',
                                                                                                               'description' => '\'(\'',
                                                                                                               'lookahead' => 0,
                                                                                                               'line' => 92
                                                                                                             }, 'Parse::RecDescent::Literal' ),
                                                                                                      bless( {
                                                                                                               'subrule' => 'type_topic_id',
                                                                                                               'matchrule' => 0,
                                                                                                               'implicit' => undef,
                                                                                                               'argcode' => undef,
                                                                                                               'lookahead' => 0,
                                                                                                               'line' => 92
                                                                                                             }, 'Parse::RecDescent::Subrule' ),
                                                                                                      bless( {
                                                                                                               'pattern' => ')',
                                                                                                               'hashname' => '__STRING2__',
                                                                                                               'description' => '\')\'',
                                                                                                               'lookahead' => 0,
                                                                                                               'line' => 92
                                                                                                             }, 'Parse::RecDescent::Literal' ),
                                                                                                      bless( {
                                                                                                               'subrule' => 'isreification',
                                                                                                               'expected' => undef,
                                                                                                               'min' => 0,
                                                                                                               'argcode' => undef,
                                                                                                               'max' => 100000000,
                                                                                                               'matchrule' => 0,
                                                                                                               'repspec' => 's?',
                                                                                                               'lookahead' => 0,
                                                                                                               'line' => 92
                                                                                                             }, 'Parse::RecDescent::Repetition' ),
                                                                                                      bless( {
                                                                                                               'subrule' => 'association_member',
                                                                                                               'expected' => undef,
                                                                                                               'min' => 1,
                                                                                                               'argcode' => undef,
                                                                                                               'max' => 100000000,
                                                                                                               'matchrule' => 0,
                                                                                                               'repspec' => 's',
                                                                                                               'lookahead' => 0,
                                                                                                               'line' => 92
                                                                                                             }, 'Parse::RecDescent::Repetition' ),
                                                                                                      bless( {
                                                                                                               'hashname' => '__ACTION1__',
                                                                                                               'lookahead' => 0,
                                                                                                               'line' => 93,
                                                                                                               'code' => '{
			   my @components; # here I collect all which I generate here

			   my $a = new XTM::association ();
			   my $s = new XTM::scope();
			   $a->add_scope ($s);
			   foreach (@{$item{\'scopes(?)\'}->[0]}) {
			     $s->add_reference_s (new XTM::topicRef (href => "#$_"));
			   }
			   $a->scope->add_reference_s (new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) ) 
			     unless $a->scope->references;

			   $a->add_instanceOf (new XTM::instanceOf (reference => 
				    new XTM::topicRef (href => "#$item{type_topic_id}")));
			   foreach (@{$item{\'association_member(s)\'}}) {
			     $a->add__s ($_);
			   }

			   push @components, $a;

			   foreach my $uri (@{$item{\'isreification(s?)\'}}) {
			     push @components, _make_reifying_topic ($uri, $a->id);
			   }

			   $return = \\@components;
			 }'
                                                                                                             }, 'Parse::RecDescent::Action' )
                                                                                                    ],
                                                                                         'line' => undef
                                                                                       }, 'Parse::RecDescent::Production' )
                                                                              ],
                                                                   'name' => 'association_definition',
                                                                   'vars' => '',
                                                                   'line' => 92
                                                                 }, 'Parse::RecDescent::Rule' ),
                              'list_of_type_topic_ids' => bless( {
                                                                   'impcount' => 0,
                                                                   'calls' => [
                                                                                'list_of_ids'
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
                                                                                                               'subrule' => 'list_of_ids',
                                                                                                               'matchrule' => 0,
                                                                                                               'implicit' => undef,
                                                                                                               'argcode' => undef,
                                                                                                               'lookahead' => 0,
                                                                                                               'line' => 210
                                                                                                             }, 'Parse::RecDescent::Subrule' )
                                                                                                    ],
                                                                                         'line' => undef
                                                                                       }, 'Parse::RecDescent::Production' )
                                                                              ],
                                                                   'name' => 'list_of_type_topic_ids',
                                                                   'vars' => '',
                                                                   'line' => 210
                                                                 }, 'Parse::RecDescent::Rule' ),
                              'resourceData_characteristic' => bless( {
                                                                        'impcount' => 0,
                                                                        'calls' => [
                                                                                     'scopes',
                                                                                     'type',
                                                                                     'colon',
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
                                                                                              'actcount' => 1,
                                                                                              'items' => [
                                                                                                           bless( {
                                                                                                                    'pattern' => 'in',
                                                                                                                    'hashname' => '__STRING1__',
                                                                                                                    'description' => '\'in\'',
                                                                                                                    'lookahead' => 0,
                                                                                                                    'line' => 173
                                                                                                                  }, 'Parse::RecDescent::Literal' ),
                                                                                                           bless( {
                                                                                                                    'subrule' => 'scopes',
                                                                                                                    'expected' => undef,
                                                                                                                    'min' => 0,
                                                                                                                    'argcode' => undef,
                                                                                                                    'max' => 1,
                                                                                                                    'matchrule' => 0,
                                                                                                                    'repspec' => '?',
                                                                                                                    'lookahead' => 0,
                                                                                                                    'line' => 173
                                                                                                                  }, 'Parse::RecDescent::Repetition' ),
                                                                                                           bless( {
                                                                                                                    'subrule' => 'type',
                                                                                                                    'expected' => undef,
                                                                                                                    'min' => 0,
                                                                                                                    'argcode' => undef,
                                                                                                                    'max' => 1,
                                                                                                                    'matchrule' => 0,
                                                                                                                    'repspec' => '?',
                                                                                                                    'lookahead' => 0,
                                                                                                                    'line' => 173
                                                                                                                  }, 'Parse::RecDescent::Repetition' ),
                                                                                                           bless( {
                                                                                                                    'subrule' => 'colon',
                                                                                                                    'expected' => undef,
                                                                                                                    'min' => 1,
                                                                                                                    'argcode' => undef,
                                                                                                                    'max' => 2,
                                                                                                                    'matchrule' => 0,
                                                                                                                    'repspec' => '1..2',
                                                                                                                    'lookahead' => 0,
                                                                                                                    'line' => 173
                                                                                                                  }, 'Parse::RecDescent::Repetition' ),
                                                                                                           bless( {
                                                                                                                    'subrule' => 'string',
                                                                                                                    'matchrule' => 0,
                                                                                                                    'implicit' => undef,
                                                                                                                    'argcode' => undef,
                                                                                                                    'lookahead' => 0,
                                                                                                                    'line' => 173
                                                                                                                  }, 'Parse::RecDescent::Subrule' ),
                                                                                                           bless( {
                                                                                                                    'hashname' => '__ACTION1__',
                                                                                                                    'lookahead' => 0,
                                                                                                                    'line' => 174,
                                                                                                                    'code' => '{
			 my $o = new XTM::occurrence ();
# fixme: need better way to figure out whether unescape needed; now looks for %0A at end....
			 $o->add_resource (new XTM::resourceData (data => (@{$item{\'colon(1..2)\'}}==2?URI::Escape::uri_unescape($item{string}):$item{string})));
			 $o->add_scope    (new XTM::scope());
			 foreach (@{$item{\'scopes(?)\'}->[0]}) {
			   $o->scope->add_reference_s (new XTM::topicRef (href => "#$_"));
			 }
			 $o->scope->add_reference_s (new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) ) 
			   unless $o->scope->references;

			 $o->add_instanceOf (new XTM::instanceOf ( reference => new XTM::topicRef (href => 
				$item{\'type(?)\'} && $item{\'type(?)\'}->[0] ?	 "#$item{\'type(?)\'}->[0]" : $XTM::PSI::xtm{occurrence}
												  )));
			 $return = $o;
		       }'
                                                                                                                  }, 'Parse::RecDescent::Action' )
                                                                                                         ],
                                                                                              'line' => undef
                                                                                            }, 'Parse::RecDescent::Production' )
                                                                                   ],
                                                                        'name' => 'resourceData_characteristic',
                                                                        'vars' => '',
                                                                        'line' => 173
                                                                      }, 'Parse::RecDescent::Rule' ),
                              'topic_characteristic' => bless( {
                                                                 'impcount' => 0,
                                                                 'calls' => [
                                                                              'basename_characteristic',
                                                                              'resourceRef_characteristic',
                                                                              'resourceData_characteristic',
                                                                              'subject_identity'
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
                                                                                                             'subrule' => 'basename_characteristic',
                                                                                                             'matchrule' => 0,
                                                                                                             'implicit' => undef,
                                                                                                             'argcode' => undef,
                                                                                                             'lookahead' => 0,
                                                                                                             'line' => 138
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
                                                                                                             'subrule' => 'resourceRef_characteristic',
                                                                                                             'matchrule' => 0,
                                                                                                             'implicit' => undef,
                                                                                                             'argcode' => undef,
                                                                                                             'lookahead' => 0,
                                                                                                             'line' => 139
                                                                                                           }, 'Parse::RecDescent::Subrule' )
                                                                                                  ],
                                                                                       'line' => 138
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
                                                                                                             'subrule' => 'resourceData_characteristic',
                                                                                                             'matchrule' => 0,
                                                                                                             'implicit' => undef,
                                                                                                             'argcode' => undef,
                                                                                                             'lookahead' => 0,
                                                                                                             'line' => 140
                                                                                                           }, 'Parse::RecDescent::Subrule' )
                                                                                                  ],
                                                                                       'line' => 139
                                                                                     }, 'Parse::RecDescent::Production' ),
                                                                              bless( {
                                                                                       'number' => '3',
                                                                                       'strcount' => 0,
                                                                                       'dircount' => 0,
                                                                                       'uncommit' => undef,
                                                                                       'error' => undef,
                                                                                       'patcount' => 0,
                                                                                       'actcount' => 0,
                                                                                       'items' => [
                                                                                                    bless( {
                                                                                                             'subrule' => 'subject_identity',
                                                                                                             'matchrule' => 0,
                                                                                                             'implicit' => undef,
                                                                                                             'argcode' => undef,
                                                                                                             'lookahead' => 0,
                                                                                                             'line' => 141
                                                                                                           }, 'Parse::RecDescent::Subrule' )
                                                                                                  ],
                                                                                       'line' => 140
                                                                                     }, 'Parse::RecDescent::Production' )
                                                                            ],
                                                                 'name' => 'topic_characteristic',
                                                                 'vars' => '',
                                                                 'line' => 138
                                                               }, 'Parse::RecDescent::Rule' ),
                              'id' => bless( {
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
                                                                                           'pattern' => '[\\w\\-\\.]+',
                                                                                           'hashname' => '__PATTERN1__',
                                                                                           'description' => '/[\\\\w\\\\-\\\\.]+/',
                                                                                           'lookahead' => 0,
                                                                                           'rdelim' => '/',
                                                                                           'line' => 218,
                                                                                           'mod' => '',
                                                                                           'ldelim' => '/'
                                                                                         }, 'Parse::RecDescent::Token' )
                                                                                ],
                                                                     'line' => undef
                                                                   }, 'Parse::RecDescent::Production' )
                                                          ],
                                               'name' => 'id',
                                               'vars' => '',
                                               'line' => 218
                                             }, 'Parse::RecDescent::Rule' ),
                              'startrule' => bless( {
                                                      'impcount' => 0,
                                                      'calls' => [
                                                                   'section'
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
                                                                                                  'subrule' => 'section',
                                                                                                  'matchrule' => 0,
                                                                                                  'implicit' => undef,
                                                                                                  'argcode' => undef,
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
                                                               'topic_id'
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
                                                                                              'line' => 204
                                                                                            }, 'Parse::RecDescent::Literal' ),
                                                                                     bless( {
                                                                                              'subrule' => 'topic_id',
                                                                                              'matchrule' => 0,
                                                                                              'implicit' => undef,
                                                                                              'argcode' => undef,
                                                                                              'lookahead' => 0,
                                                                                              'line' => 204
                                                                                            }, 'Parse::RecDescent::Subrule' )
                                                                                   ],
                                                                        'line' => undef
                                                                      }, 'Parse::RecDescent::Production' )
                                                             ],
                                                  'name' => 'scope',
                                                  'vars' => '',
                                                  'line' => 204
                                                }, 'Parse::RecDescent::Rule' ),
                              'list_of_scope_topic_ids' => bless( {
                                                                    'impcount' => 0,
                                                                    'calls' => [
                                                                                 'list_of_ids'
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
                                                                                                                'subrule' => 'list_of_ids',
                                                                                                                'matchrule' => 0,
                                                                                                                'implicit' => undef,
                                                                                                                'argcode' => undef,
                                                                                                                'lookahead' => 0,
                                                                                                                'line' => 208
                                                                                                              }, 'Parse::RecDescent::Subrule' )
                                                                                                     ],
                                                                                          'line' => undef
                                                                                        }, 'Parse::RecDescent::Production' )
                                                                               ],
                                                                    'name' => 'list_of_scope_topic_ids',
                                                                    'vars' => '',
                                                                    'line' => 208
                                                                  }, 'Parse::RecDescent::Rule' ),
                              'reification' => bless( {
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
                                                                                                    'pattern' => 'reifies',
                                                                                                    'hashname' => '__STRING1__',
                                                                                                    'description' => '\'reifies\'',
                                                                                                    'lookahead' => 0,
                                                                                                    'line' => 81
                                                                                                  }, 'Parse::RecDescent::Literal' ),
                                                                                           bless( {
                                                                                                    'subrule' => 'uri',
                                                                                                    'matchrule' => 0,
                                                                                                    'implicit' => undef,
                                                                                                    'argcode' => undef,
                                                                                                    'lookahead' => 0,
                                                                                                    'line' => 81
                                                                                                  }, 'Parse::RecDescent::Subrule' ),
                                                                                           bless( {
                                                                                                    'hashname' => '__ACTION1__',
                                                                                                    'lookahead' => 0,
                                                                                                    'line' => 82,
                                                                                                    'code' => '{
                         # check for relative URI ?
		         $return = new XTM::resourceRef (href => $item{uri});
                       }'
                                                                                                  }, 'Parse::RecDescent::Action' )
                                                                                         ],
                                                                              'line' => undef
                                                                            }, 'Parse::RecDescent::Production' )
                                                                   ],
                                                        'name' => 'reification',
                                                        'vars' => '',
                                                        'line' => 81
                                                      }, 'Parse::RecDescent::Rule' ),
                              'resourceRef_characteristic' => bless( {
                                                                       'impcount' => 0,
                                                                       'calls' => [
                                                                                    'scopes',
                                                                                    'type',
                                                                                    'string'
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
                                                                                                                   'pattern' => 'oc',
                                                                                                                   'hashname' => '__STRING1__',
                                                                                                                   'description' => '\'oc\'',
                                                                                                                   'lookahead' => 0,
                                                                                                                   'line' => 156
                                                                                                                 }, 'Parse::RecDescent::Literal' ),
                                                                                                          bless( {
                                                                                                                   'subrule' => 'scopes',
                                                                                                                   'expected' => undef,
                                                                                                                   'min' => 0,
                                                                                                                   'argcode' => undef,
                                                                                                                   'max' => 1,
                                                                                                                   'matchrule' => 0,
                                                                                                                   'repspec' => '?',
                                                                                                                   'lookahead' => 0,
                                                                                                                   'line' => 156
                                                                                                                 }, 'Parse::RecDescent::Repetition' ),
                                                                                                          bless( {
                                                                                                                   'subrule' => 'type',
                                                                                                                   'expected' => undef,
                                                                                                                   'min' => 0,
                                                                                                                   'argcode' => undef,
                                                                                                                   'max' => 1,
                                                                                                                   'matchrule' => 0,
                                                                                                                   'repspec' => '?',
                                                                                                                   'lookahead' => 0,
                                                                                                                   'line' => 156
                                                                                                                 }, 'Parse::RecDescent::Repetition' ),
                                                                                                          bless( {
                                                                                                                   'pattern' => ':',
                                                                                                                   'hashname' => '__STRING2__',
                                                                                                                   'description' => '\':\'',
                                                                                                                   'lookahead' => 0,
                                                                                                                   'line' => 156
                                                                                                                 }, 'Parse::RecDescent::Literal' ),
                                                                                                          bless( {
                                                                                                                   'subrule' => 'string',
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
			 my $o = new XTM::occurrence ();
			 $o->add_resource (new XTM::resourceRef (href => $item{string}));
			 $o->add_scope    (new XTM::scope());
			 foreach (@{$item{\'scopes(?)\'}->[0]}) {
			   $o->scope->add_reference_s (new XTM::topicRef (href => "#$_"));
			 }
			 $o->scope->add_reference_s (new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) ) 
			   unless $o->scope->references;

			 $o->add_instanceOf (new XTM::instanceOf ( reference => new XTM::topicRef (href => 
				$item{\'type(?)\'} && $item{\'type(?)\'}->[0] ?	 "#$item{\'type(?)\'}->[0]" : $XTM::PSI::xtm{occurrence}
												  )));
			 $return = $o;
		       }'
                                                                                                                 }, 'Parse::RecDescent::Action' )
                                                                                                        ],
                                                                                             'line' => undef
                                                                                           }, 'Parse::RecDescent::Production' )
                                                                                  ],
                                                                       'name' => 'resourceRef_characteristic',
                                                                       'vars' => '',
                                                                       'line' => 156
                                                                     }, 'Parse::RecDescent::Rule' ),
                              'topic_definition' => bless( {
                                                             'impcount' => 1,
                                                             'calls' => [
                                                                          '_alternation_1_of_production_1_of_rule_topic_definition',
                                                                          'topic_id',
                                                                          'types',
                                                                          'reification',
                                                                          'isreification',
                                                                          'topic_characteristic'
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
                                                                                                         'subrule' => '_alternation_1_of_production_1_of_rule_topic_definition',
                                                                                                         'expected' => '\'tid\'',
                                                                                                         'min' => 0,
                                                                                                         'argcode' => undef,
                                                                                                         'max' => 1,
                                                                                                         'matchrule' => 0,
                                                                                                         'repspec' => '?',
                                                                                                         'lookahead' => 0,
                                                                                                         'line' => 7
                                                                                                       }, 'Parse::RecDescent::Repetition' ),
                                                                                                bless( {
                                                                                                         'subrule' => 'topic_id',
                                                                                                         'matchrule' => 0,
                                                                                                         'implicit' => undef,
                                                                                                         'argcode' => undef,
                                                                                                         'lookahead' => 0,
                                                                                                         'line' => 7
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
                                                                                                         'line' => 7
                                                                                                       }, 'Parse::RecDescent::Repetition' ),
                                                                                                bless( {
                                                                                                         'subrule' => 'reification',
                                                                                                         'expected' => undef,
                                                                                                         'min' => 0,
                                                                                                         'argcode' => undef,
                                                                                                         'max' => 1,
                                                                                                         'matchrule' => 0,
                                                                                                         'repspec' => '?',
                                                                                                         'lookahead' => 0,
                                                                                                         'line' => 7
                                                                                                       }, 'Parse::RecDescent::Repetition' ),
                                                                                                bless( {
                                                                                                         'subrule' => 'isreification',
                                                                                                         'expected' => undef,
                                                                                                         'min' => 0,
                                                                                                         'argcode' => undef,
                                                                                                         'max' => 100000000,
                                                                                                         'matchrule' => 0,
                                                                                                         'repspec' => 's?',
                                                                                                         'lookahead' => 0,
                                                                                                         'line' => 7
                                                                                                       }, 'Parse::RecDescent::Repetition' ),
                                                                                                bless( {
                                                                                                         'subrule' => 'topic_characteristic',
                                                                                                         'expected' => undef,
                                                                                                         'min' => 0,
                                                                                                         'argcode' => undef,
                                                                                                         'max' => 100000000,
                                                                                                         'matchrule' => 0,
                                                                                                         'repspec' => 's?',
                                                                                                         'lookahead' => 0,
                                                                                                         'line' => 7
                                                                                                       }, 'Parse::RecDescent::Repetition' ),
                                                                                                bless( {
                                                                                                         'hashname' => '__ACTION1__',
                                                                                                         'lookahead' => 0,
                                                                                                         'line' => 8,
                                                                                                         'code' => '{
			 my @components; # here I collect all which I generate here

			 # deal with the topic first
			 my $t = new XTM::topic (id => $item{topic_id});
			 foreach (@{$item{\'types(?)\'}->[0]}) {
			   $t->add__s (new XTM::instanceOf ( reference => new XTM::topicRef (href => "#$_")));
			 }
			 $t->add__s (new XTM::instanceOf ( reference => new XTM::topicRef (href => $XTM::PSI::xtm{topic})))
			   unless $t->instanceOfs && @{$t->instanceOfs};
			 
			 my $s = new XTM::subjectIdentity (); # maybe we need it
			 foreach (@{$item{\'topic_characteristic(s?)\'}}) {
			   if (ref($_) eq \'XTM::subjectIndicatorRef\') {
			     $s->add_reference_s ($_);
			   } elsif (ref($_) eq \'XTM::topicRef\') {
			     $s->add_reference_s ($_);
			   } else {
			     $t->add__s ($_);
			   }
			 }
			 if (ref($item{\'reification(?)\'}) eq \'ARRAY\' && @{$item{\'reification(?)\'}}) {
			   $s->add_ ( $item{\'reification(?)\'}->[0] );
			 }
			 $t->add_subjectIdentity ($s) if $s->references || $s->resourceRef; # only add it if we found at least one reference


			 # provide default basename, universally scoped
			 unless ($t->baseNames && @{$t->baseNames}) {
			   my $name = $item{topic_id};
			   $name =~ s/-/ /g;
			   my $b = new XTM::baseName ();
			   $b->add_baseNameString (new XTM::baseNameString (string => $name));
			   $b->add_scope          (new XTM::scope());
			   $b->scope->add_reference_s (new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) );
			   $t->add__s ($b);
			 }

			 push @components, $t;

sub _make_reifying_topic {
  my $uri  = shift; # my id
  my $taid = shift; # assoc or topic id which we reify

  my $u = new URI ($uri);
  #print "==found reification==", $uri;
  my $t = new XTM::topic (id => $uri);

  if ($u->scheme) {                         # a resource
  } else {                                  # a local topic
    my $s2 = new XTM::subjectIdentity ();
    my $r2 = new XTM::resourceRef (href => \'#\'.$taid);
    $s2->add_ ($r2);
    $t->add_ ($s2);
    
    my $name = $uri;
    $name =~ s/-/ /g;
    my $b2 = new XTM::baseName ();
    $b2->add_baseNameString (new XTM::baseNameString (string => $name));
    $b2->add_scope          (new XTM::scope());
    $b2->scope->add_reference_s (new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) );
    $t->add__s ($b2);
  }
  return $t;
}

			 foreach my $uri (@{$item{\'isreification(s?)\'}}) {
			   push @components, _make_reifying_topic ($uri, $t->id);
			 }

			 $return = \\@components;
		       }'
                                                                                                       }, 'Parse::RecDescent::Action' )
                                                                                              ],
                                                                                   'line' => undef
                                                                                 }, 'Parse::RecDescent::Production' )
                                                                        ],
                                                             'name' => 'topic_definition',
                                                             'vars' => '',
                                                             'line' => 7
                                                           }, 'Parse::RecDescent::Rule' ),
                              'uri' => bless( {
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
                                                                                            'pattern' => '[\\w\\-\\.\\/\\?\\&\\:\\,\\+]+',
                                                                                            'hashname' => '__PATTERN1__',
                                                                                            'description' => '/[\\\\w\\\\-\\\\.\\\\/\\\\?\\\\&\\\\:\\\\,\\\\+]+/',
                                                                                            'lookahead' => 0,
                                                                                            'rdelim' => '/',
                                                                                            'line' => 222,
                                                                                            'mod' => '',
                                                                                            'ldelim' => '/'
                                                                                          }, 'Parse::RecDescent::Token' )
                                                                                 ],
                                                                      'line' => undef
                                                                    }, 'Parse::RecDescent::Production' )
                                                           ],
                                                'name' => 'uri',
                                                'vars' => '',
                                                'line' => 222
                                              }, 'Parse::RecDescent::Rule' ),
                              'colon' => bless( {
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
                                                                                              'pattern' => ':',
                                                                                              'hashname' => '__STRING1__',
                                                                                              'description' => '\':\'',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 224
                                                                                            }, 'Parse::RecDescent::Literal' )
                                                                                   ],
                                                                        'line' => undef
                                                                      }, 'Parse::RecDescent::Production' )
                                                             ],
                                                  'name' => 'colon',
                                                  'vars' => '',
                                                  'line' => 224
                                                }, 'Parse::RecDescent::Rule' ),
                              'list_of_ids' => bless( {
                                                        'impcount' => 0,
                                                        'calls' => [
                                                                     'id'
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
                                                                              'patcount' => 0,
                                                                              'actcount' => 0,
                                                                              'items' => [
                                                                                           bless( {
                                                                                                    'hashname' => '__DIRECTIVE1__',
                                                                                                    'name' => '<skip:\'[ ]*\'>',
                                                                                                    'lookahead' => 0,
                                                                                                    'line' => 214,
                                                                                                    'code' => 'my $oldskip = $skip; $skip=\'[ ]*\'; $oldskip'
                                                                                                  }, 'Parse::RecDescent::Directive' ),
                                                                                           bless( {
                                                                                                    'subrule' => 'id',
                                                                                                    'expected' => undef,
                                                                                                    'min' => 1,
                                                                                                    'argcode' => undef,
                                                                                                    'max' => 100000000,
                                                                                                    'matchrule' => 0,
                                                                                                    'repspec' => 's',
                                                                                                    'lookahead' => 0,
                                                                                                    'line' => 214
                                                                                                  }, 'Parse::RecDescent::Repetition' )
                                                                                         ],
                                                                              'line' => undef
                                                                            }, 'Parse::RecDescent::Production' )
                                                                   ],
                                                        'name' => 'list_of_ids',
                                                        'vars' => '',
                                                        'line' => 214
                                                      }, 'Parse::RecDescent::Rule' ),
                              'scopes' => bless( {
                                                   'impcount' => 0,
                                                   'calls' => [
                                                                'list_of_scope_topic_ids'
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
                                                                                               'line' => 202
                                                                                             }, 'Parse::RecDescent::Literal' ),
                                                                                      bless( {
                                                                                               'subrule' => 'list_of_scope_topic_ids',
                                                                                               'matchrule' => 0,
                                                                                               'implicit' => undef,
                                                                                               'argcode' => undef,
                                                                                               'lookahead' => 0,
                                                                                               'line' => 202
                                                                                             }, 'Parse::RecDescent::Subrule' )
                                                                                    ],
                                                                         'line' => undef
                                                                       }, 'Parse::RecDescent::Production' )
                                                              ],
                                                   'name' => 'scopes',
                                                   'vars' => '',
                                                   'line' => 202
                                                 }, 'Parse::RecDescent::Rule' ),
                              'type' => bless( {
                                                 'impcount' => 0,
                                                 'calls' => [
                                                              'type_topic_id'
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
                                                                                             'pattern' => '(',
                                                                                             'hashname' => '__STRING1__',
                                                                                             'description' => '\'(\'',
                                                                                             'lookahead' => 0,
                                                                                             'line' => 200
                                                                                           }, 'Parse::RecDescent::Literal' ),
                                                                                    bless( {
                                                                                             'subrule' => 'type_topic_id',
                                                                                             'matchrule' => 0,
                                                                                             'implicit' => undef,
                                                                                             'argcode' => undef,
                                                                                             'lookahead' => 0,
                                                                                             'line' => 200
                                                                                           }, 'Parse::RecDescent::Subrule' ),
                                                                                    bless( {
                                                                                             'pattern' => ')',
                                                                                             'hashname' => '__STRING2__',
                                                                                             'description' => '\')\'',
                                                                                             'lookahead' => 0,
                                                                                             'line' => 200
                                                                                           }, 'Parse::RecDescent::Literal' ),
                                                                                    bless( {
                                                                                             'hashname' => '__ACTION1__',
                                                                                             'lookahead' => 0,
                                                                                             'line' => 200,
                                                                                             'code' => '{ $return = $item{type_topic_id}; }'
                                                                                           }, 'Parse::RecDescent::Action' )
                                                                                  ],
                                                                       'line' => undef
                                                                     }, 'Parse::RecDescent::Production' )
                                                            ],
                                                 'name' => 'type',
                                                 'vars' => '',
                                                 'line' => 200
                                               }, 'Parse::RecDescent::Rule' ),
                              'list_of_member_topic_ids' => bless( {
                                                                     'impcount' => 0,
                                                                     'calls' => [
                                                                                  'list_of_ids'
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
                                                                                                                 'subrule' => 'list_of_ids',
                                                                                                                 'matchrule' => 0,
                                                                                                                 'implicit' => undef,
                                                                                                                 'argcode' => undef,
                                                                                                                 'lookahead' => 0,
                                                                                                                 'line' => 212
                                                                                                               }, 'Parse::RecDescent::Subrule' )
                                                                                                      ],
                                                                                           'line' => undef
                                                                                         }, 'Parse::RecDescent::Production' )
                                                                                ],
                                                                     'name' => 'list_of_member_topic_ids',
                                                                     'vars' => '',
                                                                     'line' => 212
                                                                   }, 'Parse::RecDescent::Rule' )
                            }
               }, 'Parse::RecDescent' );
}