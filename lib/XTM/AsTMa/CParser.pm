package XTM::AsTMa::CParser;
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
sub Parse::RecDescent::namespace000001::list_of_scope_topic_ids
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"list_of_scope_topic_ids"};
	
	Parse::RecDescent::_trace(q{Trying rule: [list_of_scope_topic_ids]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{list_of_scope_topic_ids})
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
					  q{list_of_scope_topic_ids})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{list_of_scope_topic_ids});
		%item = (__RULE__ => q{list_of_scope_topic_ids});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [list_of_ids]},
				  Parse::RecDescent::_tracefirst($text),
				  q{list_of_scope_topic_ids})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::list_of_ids($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [list_of_ids]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{list_of_scope_topic_ids})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [list_of_ids]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{list_of_scope_topic_ids})
						if defined $::RD_TRACE;
		$item{q{list_of_ids}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [list_of_ids]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{list_of_scope_topic_ids})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{list_of_scope_topic_ids})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{list_of_scope_topic_ids})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{list_of_scope_topic_ids});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{list_of_scope_topic_ids})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::topic_definition
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"topic_definition"};
	
	Parse::RecDescent::_trace(q{Trying rule: [topic_definition]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{topic_definition})
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
					  q{topic_definition})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{topic_definition});
		%item = (__RULE__ => q{topic_definition});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying repeated subrule: ['tid']},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic_definition})
					if defined $::RD_TRACE;
		$expectation->is(q{})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::_alternation_1_of_production_1_of_rule_topic_definition, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: ['tid']>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic_definition})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [_alternation_1_of_production_1_of_rule_topic_definition]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_definition})
						if defined $::RD_TRACE;
		$item{q{'tid'}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying subrule: [topic_id]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic_definition})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{topic_id})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::topic_id($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [topic_id]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic_definition})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [topic_id]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_definition})
						if defined $::RD_TRACE;
		$item{q{topic_id}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying repeated subrule: [types]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic_definition})
					if defined $::RD_TRACE;
		$expectation->is(q{types})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::types, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [types]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic_definition})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [types]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_definition})
						if defined $::RD_TRACE;
		$item{q{types}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying repeated subrule: [reification]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic_definition})
					if defined $::RD_TRACE;
		$expectation->is(q{reification})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::reification, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [reification]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic_definition})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [reification]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_definition})
						if defined $::RD_TRACE;
		$item{q{reification}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying repeated subrule: [isreification]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic_definition})
					if defined $::RD_TRACE;
		$expectation->is(q{isreification})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::isreification, 0, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [isreification]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic_definition})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [isreification]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_definition})
						if defined $::RD_TRACE;
		$item{q{isreification}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying repeated subrule: [topic_characteristic]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic_definition})
					if defined $::RD_TRACE;
		$expectation->is(q{topic_characteristic})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::topic_characteristic, 0, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [topic_characteristic]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic_definition})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [topic_characteristic]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_definition})
						if defined $::RD_TRACE;
		$item{q{topic_characteristic}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_definition})
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			 my @components; # here I collect all which I generate here

			 # deal with the topic first
			 my $t = new XTM::topic (id => $item{topic_id});
			 foreach (@{$item{types}->[0]}) {
			   $t->add__s (new XTM::instanceOf ( reference => new XTM::topicRef (href => "#$_")));
			 }
			 $t->add__s (new XTM::instanceOf ( reference => new XTM::topicRef (href => $XTM::PSI::xtm{topic})))
			   unless $t->instanceOfs && @{$t->instanceOfs};
			 
			 my $s = new XTM::subjectIdentity (); # maybe we need it
			 foreach (@{$item{topic_characteristic}}) {
			   if (ref($_) eq 'XTM::subjectIndicatorRef') {
			     $s->add_reference_s ($_);
			   } elsif (ref($_) eq 'XTM::topicRef') {
			     $s->add_reference_s ($_);
			   } else {
			     $t->add__s ($_);
			   }
			 }
			 if (ref($item{reification}) eq 'ARRAY' && @{$item{reification}}) {
			   $s->add_ ( $item{reification}->[0] );
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

			 foreach my $uri (@{$item{isreification}}) {
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
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['tid' topic_id types reification isreification topic_characteristic]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_definition})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{topic_definition})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{topic_definition})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{topic_definition});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{topic_definition})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::section
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"section"};
	
	Parse::RecDescent::_trace(q{Trying rule: [section]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{section})
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
					  q{section})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{section});
		%item = (__RULE__ => q{section});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [topic_definition]},
				  Parse::RecDescent::_tracefirst($text),
				  q{section})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::topic_definition($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [topic_definition]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{section})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [topic_definition]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{section})
						if defined $::RD_TRACE;
		$item{q{topic_definition}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [topic_definition]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{section})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [association_definition]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{section})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{section});
		%item = (__RULE__ => q{section});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [association_definition]},
				  Parse::RecDescent::_tracefirst($text),
				  q{section})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::association_definition($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [association_definition]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{section})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [association_definition]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{section})
						if defined $::RD_TRACE;
		$item{q{association_definition}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [association_definition]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{section})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [<error...>]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{section})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[2];
		
		my $_savetext;
		@item = (q{section});
		%item = (__RULE__ => q{section});
		my $repcount = 0;


		

		Parse::RecDescent::_trace(q{Trying directive: [<error...>]},
					Parse::RecDescent::_tracefirst($text),
					  q{section})
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
					  q{section})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{section})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{section})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{section});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{section})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::list_of_type_topic_ids
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"list_of_type_topic_ids"};
	
	Parse::RecDescent::_trace(q{Trying rule: [list_of_type_topic_ids]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{list_of_type_topic_ids})
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
					  q{list_of_type_topic_ids})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{list_of_type_topic_ids});
		%item = (__RULE__ => q{list_of_type_topic_ids});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [list_of_ids]},
				  Parse::RecDescent::_tracefirst($text),
				  q{list_of_type_topic_ids})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::list_of_ids($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [list_of_ids]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{list_of_type_topic_ids})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [list_of_ids]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{list_of_type_topic_ids})
						if defined $::RD_TRACE;
		$item{q{list_of_ids}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [list_of_ids]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{list_of_type_topic_ids})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{list_of_type_topic_ids})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{list_of_type_topic_ids})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{list_of_type_topic_ids});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{list_of_type_topic_ids})
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [section]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{startrule})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{startrule});
		%item = (__RULE__ => q{startrule});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [section]},
				  Parse::RecDescent::_tracefirst($text),
				  q{startrule})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::section($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [section]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{startrule})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [section]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{startrule})
						if defined $::RD_TRACE;
		$item{q{section}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [section]<<},
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['(' list_of_type_topic_ids ')']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{types})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{types});
		%item = (__RULE__ => q{types});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['(']},
					  Parse::RecDescent::_tracefirst($text),
					  q{types})
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
				  q{types})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{list_of_type_topic_ids})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::list_of_type_topic_ids($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [list_of_type_topic_ids]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{types})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [list_of_type_topic_ids]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{types})
						if defined $::RD_TRACE;
		$item{q{list_of_type_topic_ids}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying terminal: [')']},
					  Parse::RecDescent::_tracefirst($text),
					  q{types})
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
					  q{types})
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = $item{list_of_type_topic_ids}; };
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['(' list_of_type_topic_ids ')']<<},
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
sub Parse::RecDescent::namespace000001::type_topic_id
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"type_topic_id"};
	
	Parse::RecDescent::_trace(q{Trying rule: [type_topic_id]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{type_topic_id})
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
					  q{type_topic_id})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{type_topic_id});
		%item = (__RULE__ => q{type_topic_id});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [topic_id]},
				  Parse::RecDescent::_tracefirst($text),
				  q{type_topic_id})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::topic_id($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [topic_id]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{type_topic_id})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [topic_id]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{type_topic_id})
						if defined $::RD_TRACE;
		$item{q{topic_id}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [topic_id]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{type_topic_id})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{type_topic_id})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{type_topic_id})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{type_topic_id});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{type_topic_id})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::resourceData_characteristic
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"resourceData_characteristic"};
	
	Parse::RecDescent::_trace(q{Trying rule: [resourceData_characteristic]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{resourceData_characteristic})
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
		
		Parse::RecDescent::_trace(q{Trying production: ['in' scopes type ':' string]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{resourceData_characteristic})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{resourceData_characteristic});
		%item = (__RULE__ => q{resourceData_characteristic});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['in']},
					  Parse::RecDescent::_tracefirst($text),
					  q{resourceData_characteristic})
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
				  q{resourceData_characteristic})
					if defined $::RD_TRACE;
		$expectation->is(q{scopes})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::scopes, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [scopes]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{resourceData_characteristic})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [scopes]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{resourceData_characteristic})
						if defined $::RD_TRACE;
		$item{q{scopes}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying repeated subrule: [type]},
				  Parse::RecDescent::_tracefirst($text),
				  q{resourceData_characteristic})
					if defined $::RD_TRACE;
		$expectation->is(q{type})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::type, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [type]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{resourceData_characteristic})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [type]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{resourceData_characteristic})
						if defined $::RD_TRACE;
		$item{q{type}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying terminal: [':']},
					  Parse::RecDescent::_tracefirst($text),
					  q{resourceData_characteristic})
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
				  q{resourceData_characteristic})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{string})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::string($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [string]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{resourceData_characteristic})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [string]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{resourceData_characteristic})
						if defined $::RD_TRACE;
		$item{q{string}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{resourceData_characteristic})
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			 my $o = new XTM::occurrence ();
			 $o->add_resource (new XTM::resourceData (data => $item{string}));
			 $o->add_scope    (new XTM::scope());
			 foreach (@{$item{scopes}->[0]}) {
			   $o->scope->add_reference_s (new XTM::topicRef (href => "#$_"));
			 }
			 $o->scope->add_reference_s (new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) ) 
			   unless $o->scope->references;

			 $o->add_instanceOf (new XTM::instanceOf ( reference => new XTM::topicRef (href => 
				$item{type} && $item{type}->[0] ?	 "#$item{type}->[0]" : $XTM::PSI::xtm{occurrence}
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
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['in' scopes type ':' string]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{resourceData_characteristic})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{resourceData_characteristic})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{resourceData_characteristic})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{resourceData_characteristic});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{resourceData_characteristic})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::reification
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"reification"};
	
	Parse::RecDescent::_trace(q{Trying rule: [reification]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{reification})
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
					  q{reification})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{reification});
		%item = (__RULE__ => q{reification});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['reifies']},
					  Parse::RecDescent::_tracefirst($text),
					  q{reification})
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
				  q{reification})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{uri})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::uri($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [uri]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{reification})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [uri]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{reification})
						if defined $::RD_TRACE;
		$item{q{uri}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{reification})
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
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['reifies' uri]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{reification})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{reification})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{reification})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{reification});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{reification})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::isreification
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"isreification"};
	
	Parse::RecDescent::_trace(q{Trying rule: [isreification]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{isreification})
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
					  q{isreification})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{isreification});
		%item = (__RULE__ => q{isreification});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['is-reified-by']},
					  Parse::RecDescent::_tracefirst($text),
					  q{isreification})
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
				  q{isreification})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{uri})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::uri($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [uri]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{isreification})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [uri]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{isreification})
						if defined $::RD_TRACE;
		$item{q{uri}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{isreification})
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
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['is-reified-by' uri]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{isreification})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{isreification})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{isreification})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{isreification});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{isreification})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::topic_characteristic
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"topic_characteristic"};
	
	Parse::RecDescent::_trace(q{Trying rule: [topic_characteristic]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{topic_characteristic})
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
					  q{topic_characteristic})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{topic_characteristic});
		%item = (__RULE__ => q{topic_characteristic});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [basename_characteristic]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic_characteristic})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::basename_characteristic($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [basename_characteristic]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic_characteristic})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [basename_characteristic]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_characteristic})
						if defined $::RD_TRACE;
		$item{q{basename_characteristic}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [basename_characteristic]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_characteristic})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [resourceRef_characteristic]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{topic_characteristic})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{topic_characteristic});
		%item = (__RULE__ => q{topic_characteristic});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [resourceRef_characteristic]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic_characteristic})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::resourceRef_characteristic($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [resourceRef_characteristic]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic_characteristic})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [resourceRef_characteristic]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_characteristic})
						if defined $::RD_TRACE;
		$item{q{resourceRef_characteristic}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [resourceRef_characteristic]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_characteristic})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [resourceData_characteristic]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{topic_characteristic})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[2];
		$text = $_[1];
		my $_savetext;
		@item = (q{topic_characteristic});
		%item = (__RULE__ => q{topic_characteristic});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [resourceData_characteristic]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic_characteristic})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::resourceData_characteristic($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [resourceData_characteristic]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic_characteristic})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [resourceData_characteristic]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_characteristic})
						if defined $::RD_TRACE;
		$item{q{resourceData_characteristic}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [resourceData_characteristic]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_characteristic})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [subject_identity]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{topic_characteristic})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[3];
		$text = $_[1];
		my $_savetext;
		@item = (q{topic_characteristic});
		%item = (__RULE__ => q{topic_characteristic});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [subject_identity]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic_characteristic})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::subject_identity($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [subject_identity]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic_characteristic})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [subject_identity]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_characteristic})
						if defined $::RD_TRACE;
		$item{q{subject_identity}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [subject_identity]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_characteristic})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{topic_characteristic})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{topic_characteristic})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{topic_characteristic});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{topic_characteristic})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::association_definition
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"association_definition"};
	
	Parse::RecDescent::_trace(q{Trying rule: [association_definition]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{association_definition})
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
					  q{association_definition})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{association_definition});
		%item = (__RULE__ => q{association_definition});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying repeated subrule: [scopes]},
				  Parse::RecDescent::_tracefirst($text),
				  q{association_definition})
					if defined $::RD_TRACE;
		$expectation->is(q{})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::scopes, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [scopes]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{association_definition})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [scopes]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{association_definition})
						if defined $::RD_TRACE;
		$item{q{scopes}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying terminal: ['(']},
					  Parse::RecDescent::_tracefirst($text),
					  q{association_definition})
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
				  q{association_definition})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{type_topic_id})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::type_topic_id($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [type_topic_id]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{association_definition})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [type_topic_id]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{association_definition})
						if defined $::RD_TRACE;
		$item{q{type_topic_id}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying terminal: [')']},
					  Parse::RecDescent::_tracefirst($text),
					  q{association_definition})
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
				  q{association_definition})
					if defined $::RD_TRACE;
		$expectation->is(q{isreification})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::isreification, 0, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [isreification]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{association_definition})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [isreification]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{association_definition})
						if defined $::RD_TRACE;
		$item{q{isreification}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying repeated subrule: [association_member]},
				  Parse::RecDescent::_tracefirst($text),
				  q{association_definition})
					if defined $::RD_TRACE;
		$expectation->is(q{association_member})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::association_member, 1, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [association_member]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{association_definition})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [association_member]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{association_definition})
						if defined $::RD_TRACE;
		$item{q{association_member}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{association_definition})
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			   my @components; # here I collect all which I generate here

			   my $a = new XTM::association ();
			   my $s = new XTM::scope();
			   $a->add_scope ($s);
			   foreach (@{$item{scopes}->[0]}) {
			     $s->add_reference_s (new XTM::topicRef (href => "#$_"));
			   }
			   $a->scope->add_reference_s (new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) ) 
			     unless $a->scope->references;

			   $a->add_instanceOf (new XTM::instanceOf (reference => 
				    new XTM::topicRef (href => "#$item{type_topic_id}")));
			   foreach (@{$item{association_member}}) {
			     $a->add__s ($_);
			   }

			   push @components, $a;

			   foreach my $uri (@{$item{isreification}}) {
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
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [scopes '(' type_topic_id ')' isreification association_member]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{association_definition})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{association_definition})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{association_definition})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{association_definition});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{association_definition})
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['@' topic_id]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{scope})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{scope});
		%item = (__RULE__ => q{scope});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['@']},
					  Parse::RecDescent::_tracefirst($text),
					  q{scope})
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
				  q{scope})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{topic_id})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::topic_id($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [topic_id]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{scope})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [topic_id]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{scope})
						if defined $::RD_TRACE;
		$item{q{topic_id}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: ['@' topic_id]<<},
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['(' type_topic_id ')']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{type})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{type});
		%item = (__RULE__ => q{type});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['(']},
					  Parse::RecDescent::_tracefirst($text),
					  q{type})
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
				  q{type})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{type_topic_id})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::type_topic_id($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [type_topic_id]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{type})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [type_topic_id]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{type})
						if defined $::RD_TRACE;
		$item{q{type_topic_id}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying terminal: [')']},
					  Parse::RecDescent::_tracefirst($text),
					  q{type})
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
					  q{type})
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = $item{type_topic_id}; };
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
		


		Parse::RecDescent::_trace(q{>>Matched production: ['(' type_topic_id ')']<<},
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
sub Parse::RecDescent::namespace000001::subject_identity
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"subject_identity"};
	
	Parse::RecDescent::_trace(q{Trying rule: [subject_identity]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{subject_identity})
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
					  q{subject_identity})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{subject_identity});
		%item = (__RULE__ => q{subject_identity});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['sin']},
					  Parse::RecDescent::_tracefirst($text),
					  q{subject_identity})
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
					  q{subject_identity})
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
				  q{subject_identity})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{string})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::string($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [string]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{subject_identity})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [string]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{subject_identity})
						if defined $::RD_TRACE;
		$item{q{string}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{subject_identity})
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
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['sin' ':' string]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{subject_identity})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{subject_identity})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{subject_identity})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{subject_identity});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{subject_identity})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::topic_id
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"topic_id"};
	
	Parse::RecDescent::_trace(q{Trying rule: [topic_id]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{topic_id})
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
					  q{topic_id})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{topic_id});
		%item = (__RULE__ => q{topic_id});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [id]},
				  Parse::RecDescent::_tracefirst($text),
				  q{topic_id})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::id($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [id]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{topic_id})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [id]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_id})
						if defined $::RD_TRACE;
		$item{q{id}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [id]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{topic_id})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{topic_id})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{topic_id})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{topic_id});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{topic_id})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::association_member
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"association_member"};
	
	Parse::RecDescent::_trace(q{Trying rule: [association_member]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{association_member})
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
					  q{association_member})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{association_member});
		%item = (__RULE__ => q{association_member});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [topic_id]},
				  Parse::RecDescent::_tracefirst($text),
				  q{association_member})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::topic_id($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [topic_id]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{association_member})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [topic_id]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{association_member})
						if defined $::RD_TRACE;
		$item{q{topic_id}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying terminal: [':']},
					  Parse::RecDescent::_tracefirst($text),
					  q{association_member})
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
				  q{association_member})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{list_of_member_topic_ids})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::list_of_member_topic_ids($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [list_of_member_topic_ids]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{association_member})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [list_of_member_topic_ids]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{association_member})
						if defined $::RD_TRACE;
		$item{q{list_of_member_topic_ids}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{association_member})
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
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [topic_id ':' list_of_member_topic_ids]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{association_member})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{association_member})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{association_member})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{association_member});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{association_member})
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [/[^\\n\\r]+/]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{string})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{string});
		%item = (__RULE__ => q{string});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: [/[^\\n\\r]+/]}, Parse::RecDescent::_tracefirst($text),
					  q{string})
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
sub Parse::RecDescent::namespace000001::list_of_ids
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"list_of_ids"};
	
	Parse::RecDescent::_trace(q{Trying rule: [list_of_ids]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{list_of_ids})
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
					  q{list_of_ids})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{list_of_ids});
		%item = (__RULE__ => q{list_of_ids});
		my $repcount = 0;


		

		Parse::RecDescent::_trace(q{Trying directive: [<skip:'[ ]*'>]},
					Parse::RecDescent::_tracefirst($text),
					  q{list_of_ids})
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
				  q{list_of_ids})
					if defined $::RD_TRACE;
		$expectation->is(q{id})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::id, 1, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [id]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{list_of_ids})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [id]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{list_of_ids})
						if defined $::RD_TRACE;
		$item{q{id}} = $_tok;
		push @item, $_tok;
		



		Parse::RecDescent::_trace(q{>>Matched production: [<skip:'[ ]*'> id]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{list_of_ids})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{list_of_ids})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{list_of_ids})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{list_of_ids});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{list_of_ids})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::_alternation_1_of_production_1_of_rule_topic_definition
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"_alternation_1_of_production_1_of_rule_topic_definition"};
	
	Parse::RecDescent::_trace(q{Trying rule: [_alternation_1_of_production_1_of_rule_topic_definition]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{_alternation_1_of_production_1_of_rule_topic_definition})
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
					  q{_alternation_1_of_production_1_of_rule_topic_definition})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{_alternation_1_of_production_1_of_rule_topic_definition});
		%item = (__RULE__ => q{_alternation_1_of_production_1_of_rule_topic_definition});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['tid']},
					  Parse::RecDescent::_tracefirst($text),
					  q{_alternation_1_of_production_1_of_rule_topic_definition})
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
					  q{_alternation_1_of_production_1_of_rule_topic_definition})
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
					  q{_alternation_1_of_production_1_of_rule_topic_definition})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{_alternation_1_of_production_1_of_rule_topic_definition})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{_alternation_1_of_production_1_of_rule_topic_definition})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{_alternation_1_of_production_1_of_rule_topic_definition});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{_alternation_1_of_production_1_of_rule_topic_definition})
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
	
	my $thiscolumn;
	tie $thiscolumn, q{Parse::RecDescent::ColCounter}, \$text, $thisparser;
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [/[\\w\\-\\.\\/\\?\\&\\:\\,\\+]+/]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{uri})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{uri});
		%item = (__RULE__ => q{uri});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: [/[\\w\\-\\.\\/\\?\\&\\:\\,\\+]+/]}, Parse::RecDescent::_tracefirst($text),
					  q{uri})
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
sub Parse::RecDescent::namespace000001::resourceRef_characteristic
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"resourceRef_characteristic"};
	
	Parse::RecDescent::_trace(q{Trying rule: [resourceRef_characteristic]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{resourceRef_characteristic})
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
					  q{resourceRef_characteristic})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{resourceRef_characteristic});
		%item = (__RULE__ => q{resourceRef_characteristic});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['oc']},
					  Parse::RecDescent::_tracefirst($text),
					  q{resourceRef_characteristic})
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
				  q{resourceRef_characteristic})
					if defined $::RD_TRACE;
		$expectation->is(q{scopes})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::scopes, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [scopes]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{resourceRef_characteristic})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [scopes]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{resourceRef_characteristic})
						if defined $::RD_TRACE;
		$item{q{scopes}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying repeated subrule: [type]},
				  Parse::RecDescent::_tracefirst($text),
				  q{resourceRef_characteristic})
					if defined $::RD_TRACE;
		$expectation->is(q{type})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::type, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [type]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{resourceRef_characteristic})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [type]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{resourceRef_characteristic})
						if defined $::RD_TRACE;
		$item{q{type}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying terminal: [':']},
					  Parse::RecDescent::_tracefirst($text),
					  q{resourceRef_characteristic})
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
				  q{resourceRef_characteristic})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{string})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::string($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [string]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{resourceRef_characteristic})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [string]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{resourceRef_characteristic})
						if defined $::RD_TRACE;
		$item{q{string}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{resourceRef_characteristic})
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			 my $o = new XTM::occurrence ();
			 $o->add_resource (new XTM::resourceRef (href => $item{string}));
			 $o->add_scope    (new XTM::scope());
			 foreach (@{$item{scopes}->[0]}) {
			   $o->scope->add_reference_s (new XTM::topicRef (href => "#$_"));
			 }
			 $o->scope->add_reference_s (new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) ) 
			   unless $o->scope->references;

			 $o->add_instanceOf (new XTM::instanceOf ( reference => new XTM::topicRef (href => 
				$item{type} && $item{type}->[0] ?	 "#$item{type}->[0]" : $XTM::PSI::xtm{occurrence}
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
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['oc' scopes type ':' string]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{resourceRef_characteristic})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{resourceRef_characteristic})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{resourceRef_characteristic})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{resourceRef_characteristic});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{resourceRef_characteristic})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::id
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"id"};
	
	Parse::RecDescent::_trace(q{Trying rule: [id]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{id})
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
					  q{id})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{id});
		%item = (__RULE__ => q{id});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: [/[\\w\\-\\.]+/]}, Parse::RecDescent::_tracefirst($text),
					  q{id})
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
					  q{id})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{id})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{id})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{id});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{id})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::list_of_member_topic_ids
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"list_of_member_topic_ids"};
	
	Parse::RecDescent::_trace(q{Trying rule: [list_of_member_topic_ids]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{list_of_member_topic_ids})
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
					  q{list_of_member_topic_ids})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{list_of_member_topic_ids});
		%item = (__RULE__ => q{list_of_member_topic_ids});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [list_of_ids]},
				  Parse::RecDescent::_tracefirst($text),
				  q{list_of_member_topic_ids})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::list_of_ids($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [list_of_ids]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{list_of_member_topic_ids})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [list_of_ids]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{list_of_member_topic_ids})
						if defined $::RD_TRACE;
		$item{q{list_of_ids}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: [list_of_ids]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{list_of_member_topic_ids})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{list_of_member_topic_ids})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{list_of_member_topic_ids})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{list_of_member_topic_ids});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{list_of_member_topic_ids})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::basename_characteristic
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"basename_characteristic"};
	
	Parse::RecDescent::_trace(q{Trying rule: [basename_characteristic]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{basename_characteristic})
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
					  q{basename_characteristic})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{basename_characteristic});
		%item = (__RULE__ => q{basename_characteristic});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['bn']},
					  Parse::RecDescent::_tracefirst($text),
					  q{basename_characteristic})
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
				  q{basename_characteristic})
					if defined $::RD_TRACE;
		$expectation->is(q{scopes})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::namespace000001::scopes, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [scopes]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{basename_characteristic})
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [scopes]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{basename_characteristic})
						if defined $::RD_TRACE;
		$item{q{scopes}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying terminal: [':']},
					  Parse::RecDescent::_tracefirst($text),
					  q{basename_characteristic})
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
				  q{basename_characteristic})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{string})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::string($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [string]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{basename_characteristic})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [string]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{basename_characteristic})
						if defined $::RD_TRACE;
		$item{q{string}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{basename_characteristic})
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
			 my $b = new XTM::baseName ();
			 $b->add_baseNameString (new XTM::baseNameString (string => $item{string}));
			 $b->add_scope          (new XTM::scope());
			 foreach (@{$item{scopes}->[0]}) {
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
					  . $_tok . q{])}, $text)
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['bn' scopes ':' string]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{basename_characteristic})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{basename_characteristic})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{basename_characteristic})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{basename_characteristic});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{basename_characteristic})
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::namespace000001::scopes
{
	my $thisparser = $_[0];
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"scopes"};
	
	Parse::RecDescent::_trace(q{Trying rule: [scopes]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{scopes})
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
					  q{scopes})
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{scopes});
		%item = (__RULE__ => q{scopes});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['@']},
					  Parse::RecDescent::_tracefirst($text),
					  q{scopes})
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
				  q{scopes})
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{list_of_scope_topic_ids})->at($text);
		unless (defined ($_tok = Parse::RecDescent::namespace000001::list_of_scope_topic_ids($thisparser,$text,$repeating,$_noactions,undef)))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [list_of_scope_topic_ids]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{scopes})
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [list_of_scope_topic_ids]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{scopes})
						if defined $::RD_TRACE;
		$item{q{list_of_scope_topic_ids}} = $_tok;
		push @item, $_tok;
		
		}


		Parse::RecDescent::_trace(q{>>Matched production: ['@' list_of_scope_topic_ids]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{scopes})
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{scopes})
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{scopes})
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{scopes});
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{scopes})
	}
	$_[1] = $text;
	return $return;
}
}
package XTM::AsTMa::CParser; sub new { my $self = bless( {
                 '_AUTOTREE' => undef,
                 'rules' => {
                              'list_of_scope_topic_ids' => bless( {
                                                                    'impcount' => 0,
                                                                    'line' => '207',
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
                                                                                                                'line' => '207',
                                                                                                                'subrule' => 'list_of_ids',
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
                                                                                 'list_of_ids'
                                                                               ],
                                                                    'opcount' => 0,
                                                                    'changed' => 0,
                                                                    'vars' => '',
                                                                    'name' => 'list_of_scope_topic_ids'
                                                                  }, 'Parse::RecDescent::Rule' ),
                              'topic_definition' => bless( {
                                                             'impcount' => 1,
                                                             'line' => '7',
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
                                                                                                         'subrule' => '_alternation_1_of_production_1_of_rule_topic_definition',
                                                                                                         'line' => '7',
                                                                                                         'expected' => '\'tid\'',
                                                                                                         'max' => 1,
                                                                                                         'repspec' => '?'
                                                                                                       }, 'Parse::RecDescent::Repetition' ),
                                                                                                bless( {
                                                                                                         'line' => '7',
                                                                                                         'subrule' => 'topic_id',
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
                                                                                                         'line' => '7',
                                                                                                         'expected' => undef,
                                                                                                         'max' => 1,
                                                                                                         'repspec' => '?'
                                                                                                       }, 'Parse::RecDescent::Repetition' ),
                                                                                                bless( {
                                                                                                         'min' => 0,
                                                                                                         'argcode' => undef,
                                                                                                         'matchrule' => 0,
                                                                                                         'lookahead' => 0,
                                                                                                         'subrule' => 'reification',
                                                                                                         'line' => '7',
                                                                                                         'expected' => undef,
                                                                                                         'max' => 1,
                                                                                                         'repspec' => '?'
                                                                                                       }, 'Parse::RecDescent::Repetition' ),
                                                                                                bless( {
                                                                                                         'min' => 0,
                                                                                                         'argcode' => undef,
                                                                                                         'matchrule' => 0,
                                                                                                         'lookahead' => 0,
                                                                                                         'subrule' => 'isreification',
                                                                                                         'line' => '7',
                                                                                                         'expected' => undef,
                                                                                                         'max' => 100000000,
                                                                                                         'repspec' => 's?'
                                                                                                       }, 'Parse::RecDescent::Repetition' ),
                                                                                                bless( {
                                                                                                         'min' => 0,
                                                                                                         'argcode' => undef,
                                                                                                         'matchrule' => 0,
                                                                                                         'lookahead' => 0,
                                                                                                         'subrule' => 'topic_characteristic',
                                                                                                         'line' => '7',
                                                                                                         'expected' => undef,
                                                                                                         'max' => 100000000,
                                                                                                         'repspec' => 's?'
                                                                                                       }, 'Parse::RecDescent::Repetition' ),
                                                                                                bless( {
                                                                                                         'line' => '8',
                                                                                                         'code' => '{
			 my @components; # here I collect all which I generate here

			 # deal with the topic first
			 my $t = new XTM::topic (id => $item{topic_id});
			 foreach (@{$item{types}->[0]}) {
			   $t->add__s (new XTM::instanceOf ( reference => new XTM::topicRef (href => "#$_")));
			 }
			 $t->add__s (new XTM::instanceOf ( reference => new XTM::topicRef (href => $XTM::PSI::xtm{topic})))
			   unless $t->instanceOfs && @{$t->instanceOfs};
			 
			 my $s = new XTM::subjectIdentity (); # maybe we need it
			 foreach (@{$item{topic_characteristic}}) {
			   if (ref($_) eq \'XTM::subjectIndicatorRef\') {
			     $s->add_reference_s ($_);
			   } elsif (ref($_) eq \'XTM::topicRef\') {
			     $s->add_reference_s ($_);
			   } else {
			     $t->add__s ($_);
			   }
			 }
			 if (ref($item{reification}) eq \'ARRAY\' && @{$item{reification}}) {
			   $s->add_ ( $item{reification}->[0] );
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

			 foreach my $uri (@{$item{isreification}}) {
			   push @components, _make_reifying_topic ($uri, $t->id);
			 }

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
                                                                          '_alternation_1_of_production_1_of_rule_topic_definition',
                                                                          'topic_id',
                                                                          'types',
                                                                          'reification',
                                                                          'isreification',
                                                                          'topic_characteristic'
                                                                        ],
                                                             'opcount' => 0,
                                                             'changed' => 0,
                                                             'vars' => '',
                                                             'name' => 'topic_definition'
                                                           }, 'Parse::RecDescent::Rule' ),
                              'section' => bless( {
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
                                                                                                'line' => '5',
                                                                                                'subrule' => 'topic_definition',
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
                                                                          'line' => '5',
                                                                          'items' => [
                                                                                       bless( {
                                                                                                'line' => '5',
                                                                                                'subrule' => 'association_definition',
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
                                                                          'number' => 2,
                                                                          'error' => 1,
                                                                          'line' => '5',
                                                                          'items' => [
                                                                                       bless( {
                                                                                                'line' => '5',
                                                                                                'commitonly' => '',
                                                                                                'hashname' => '__DIRECTIVE1__',
                                                                                                'lookahead' => 0,
                                                                                                'msg' => ' Problem parsing near "$text" (line "$thisline", col "$thiscolumn")'
                                                                                              }, 'Parse::RecDescent::Error' )
                                                                                     ],
                                                                          'actcount' => 0
                                                                        }, 'Parse::RecDescent::Production' )
                                                               ],
                                                    'calls' => [
                                                                 'topic_definition',
                                                                 'association_definition'
                                                               ],
                                                    'opcount' => 0,
                                                    'changed' => 0,
                                                    'vars' => '',
                                                    'name' => 'section'
                                                  }, 'Parse::RecDescent::Rule' ),
                              'list_of_type_topic_ids' => bless( {
                                                                   'impcount' => 0,
                                                                   'line' => '209',
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
                                                                                                               'line' => '209',
                                                                                                               'subrule' => 'list_of_ids',
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
                                                                                'list_of_ids'
                                                                              ],
                                                                   'opcount' => 0,
                                                                   'changed' => 0,
                                                                   'vars' => '',
                                                                   'name' => 'list_of_type_topic_ids'
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
                                                                                                  'subrule' => 'section',
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
                                                                   'section'
                                                                 ],
                                                      'opcount' => 0,
                                                      'changed' => 0,
                                                      'vars' => '',
                                                      'name' => 'startrule'
                                                    }, 'Parse::RecDescent::Rule' ),
                              'types' => bless( {
                                                  'impcount' => 0,
                                                  'line' => '136',
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
                                                                                              'description' => '\'(\'',
                                                                                              'line' => '136',
                                                                                              'pattern' => '(',
                                                                                              'hashname' => '__STRING1__',
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Literal' ),
                                                                                     bless( {
                                                                                              'line' => '136',
                                                                                              'subrule' => 'list_of_type_topic_ids',
                                                                                              'argcode' => undef,
                                                                                              'implicit' => undef,
                                                                                              'matchrule' => 0,
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Subrule' ),
                                                                                     bless( {
                                                                                              'description' => '\')\'',
                                                                                              'line' => '136',
                                                                                              'pattern' => ')',
                                                                                              'hashname' => '__STRING2__',
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Literal' ),
                                                                                     bless( {
                                                                                              'line' => '136',
                                                                                              'code' => '{ $return = $item{list_of_type_topic_ids}; }',
                                                                                              'hashname' => '__ACTION1__',
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Action' )
                                                                                   ],
                                                                        'actcount' => 1
                                                                      }, 'Parse::RecDescent::Production' )
                                                             ],
                                                  'calls' => [
                                                               'list_of_type_topic_ids'
                                                             ],
                                                  'opcount' => 0,
                                                  'changed' => 0,
                                                  'vars' => '',
                                                  'name' => 'types'
                                                }, 'Parse::RecDescent::Rule' ),
                              'type_topic_id' => bless( {
                                                          'impcount' => 0,
                                                          'line' => '205',
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
                                                                                                      'line' => '205',
                                                                                                      'subrule' => 'topic_id',
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
                                                                       'topic_id'
                                                                     ],
                                                          'opcount' => 0,
                                                          'changed' => 0,
                                                          'vars' => '',
                                                          'name' => 'type_topic_id'
                                                        }, 'Parse::RecDescent::Rule' ),
                              'resourceData_characteristic' => bless( {
                                                                        'impcount' => 0,
                                                                        'line' => '173',
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
                                                                                                                    'description' => '\'in\'',
                                                                                                                    'line' => '173',
                                                                                                                    'pattern' => 'in',
                                                                                                                    'hashname' => '__STRING1__',
                                                                                                                    'lookahead' => 0
                                                                                                                  }, 'Parse::RecDescent::Literal' ),
                                                                                                           bless( {
                                                                                                                    'min' => 0,
                                                                                                                    'argcode' => undef,
                                                                                                                    'matchrule' => 0,
                                                                                                                    'lookahead' => 0,
                                                                                                                    'subrule' => 'scopes',
                                                                                                                    'line' => '173',
                                                                                                                    'expected' => undef,
                                                                                                                    'max' => 1,
                                                                                                                    'repspec' => '?'
                                                                                                                  }, 'Parse::RecDescent::Repetition' ),
                                                                                                           bless( {
                                                                                                                    'min' => 0,
                                                                                                                    'argcode' => undef,
                                                                                                                    'matchrule' => 0,
                                                                                                                    'lookahead' => 0,
                                                                                                                    'subrule' => 'type',
                                                                                                                    'line' => '173',
                                                                                                                    'expected' => undef,
                                                                                                                    'max' => 1,
                                                                                                                    'repspec' => '?'
                                                                                                                  }, 'Parse::RecDescent::Repetition' ),
                                                                                                           bless( {
                                                                                                                    'description' => '\':\'',
                                                                                                                    'line' => '173',
                                                                                                                    'pattern' => ':',
                                                                                                                    'hashname' => '__STRING2__',
                                                                                                                    'lookahead' => 0
                                                                                                                  }, 'Parse::RecDescent::Literal' ),
                                                                                                           bless( {
                                                                                                                    'line' => '173',
                                                                                                                    'subrule' => 'string',
                                                                                                                    'argcode' => undef,
                                                                                                                    'implicit' => undef,
                                                                                                                    'matchrule' => 0,
                                                                                                                    'lookahead' => 0
                                                                                                                  }, 'Parse::RecDescent::Subrule' ),
                                                                                                           bless( {
                                                                                                                    'line' => '174',
                                                                                                                    'code' => '{
			 my $o = new XTM::occurrence ();
			 $o->add_resource (new XTM::resourceData (data => $item{string}));
			 $o->add_scope    (new XTM::scope());
			 foreach (@{$item{scopes}->[0]}) {
			   $o->scope->add_reference_s (new XTM::topicRef (href => "#$_"));
			 }
			 $o->scope->add_reference_s (new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) ) 
			   unless $o->scope->references;

			 $o->add_instanceOf (new XTM::instanceOf ( reference => new XTM::topicRef (href => 
				$item{type} && $item{type}->[0] ?	 "#$item{type}->[0]" : $XTM::PSI::xtm{occurrence}
												  )));
			 $return = $o;
		       }',
                                                                                                                    'hashname' => '__ACTION1__',
                                                                                                                    'lookahead' => 0
                                                                                                                  }, 'Parse::RecDescent::Action' )
                                                                                                         ],
                                                                                              'actcount' => 1
                                                                                            }, 'Parse::RecDescent::Production' )
                                                                                   ],
                                                                        'calls' => [
                                                                                     'scopes',
                                                                                     'type',
                                                                                     'string'
                                                                                   ],
                                                                        'opcount' => 0,
                                                                        'changed' => 0,
                                                                        'vars' => '',
                                                                        'name' => 'resourceData_characteristic'
                                                                      }, 'Parse::RecDescent::Rule' ),
                              'reification' => bless( {
                                                        'impcount' => 0,
                                                        'line' => '81',
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
                                                                                                    'description' => '\'reifies\'',
                                                                                                    'line' => '81',
                                                                                                    'pattern' => 'reifies',
                                                                                                    'hashname' => '__STRING1__',
                                                                                                    'lookahead' => 0
                                                                                                  }, 'Parse::RecDescent::Literal' ),
                                                                                           bless( {
                                                                                                    'line' => '81',
                                                                                                    'subrule' => 'uri',
                                                                                                    'argcode' => undef,
                                                                                                    'implicit' => undef,
                                                                                                    'matchrule' => 0,
                                                                                                    'lookahead' => 0
                                                                                                  }, 'Parse::RecDescent::Subrule' ),
                                                                                           bless( {
                                                                                                    'line' => '82',
                                                                                                    'code' => '{
                         # check for relative URI ?
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
                                                        'name' => 'reification'
                                                      }, 'Parse::RecDescent::Rule' ),
                              'isreification' => bless( {
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
                                                                                                      'description' => '\'is-reified-by\'',
                                                                                                      'line' => '87',
                                                                                                      'pattern' => 'is-reified-by',
                                                                                                      'hashname' => '__STRING1__',
                                                                                                      'lookahead' => 0
                                                                                                    }, 'Parse::RecDescent::Literal' ),
                                                                                             bless( {
                                                                                                      'line' => '87',
                                                                                                      'subrule' => 'uri',
                                                                                                      'argcode' => undef,
                                                                                                      'implicit' => undef,
                                                                                                      'matchrule' => 0,
                                                                                                      'lookahead' => 0
                                                                                                    }, 'Parse::RecDescent::Subrule' ),
                                                                                             bless( {
                                                                                                      'line' => '88',
                                                                                                      'code' => '{
			 $return = $item{uri};
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
                                                          'name' => 'isreification'
                                                        }, 'Parse::RecDescent::Rule' ),
                              'topic_characteristic' => bless( {
                                                                 'impcount' => 0,
                                                                 'line' => '138',
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
                                                                                                             'line' => '138',
                                                                                                             'subrule' => 'basename_characteristic',
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
                                                                                       'line' => '138',
                                                                                       'items' => [
                                                                                                    bless( {
                                                                                                             'line' => '139',
                                                                                                             'subrule' => 'resourceRef_characteristic',
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
                                                                                       'line' => '139',
                                                                                       'items' => [
                                                                                                    bless( {
                                                                                                             'line' => '140',
                                                                                                             'subrule' => 'resourceData_characteristic',
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
                                                                                       'number' => 3,
                                                                                       'error' => undef,
                                                                                       'line' => '140',
                                                                                       'items' => [
                                                                                                    bless( {
                                                                                                             'line' => '141',
                                                                                                             'subrule' => 'subject_identity',
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
                                                                              'basename_characteristic',
                                                                              'resourceRef_characteristic',
                                                                              'resourceData_characteristic',
                                                                              'subject_identity'
                                                                            ],
                                                                 'opcount' => 0,
                                                                 'changed' => 0,
                                                                 'vars' => '',
                                                                 'name' => 'topic_characteristic'
                                                               }, 'Parse::RecDescent::Rule' ),
                              'association_definition' => bless( {
                                                                   'impcount' => 0,
                                                                   'line' => '92',
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
                                                                                                               'min' => 0,
                                                                                                               'argcode' => undef,
                                                                                                               'matchrule' => 0,
                                                                                                               'lookahead' => 0,
                                                                                                               'subrule' => 'scopes',
                                                                                                               'line' => '92',
                                                                                                               'expected' => undef,
                                                                                                               'max' => 1,
                                                                                                               'repspec' => '?'
                                                                                                             }, 'Parse::RecDescent::Repetition' ),
                                                                                                      bless( {
                                                                                                               'description' => '\'(\'',
                                                                                                               'line' => '92',
                                                                                                               'pattern' => '(',
                                                                                                               'hashname' => '__STRING1__',
                                                                                                               'lookahead' => 0
                                                                                                             }, 'Parse::RecDescent::Literal' ),
                                                                                                      bless( {
                                                                                                               'line' => '92',
                                                                                                               'subrule' => 'type_topic_id',
                                                                                                               'argcode' => undef,
                                                                                                               'implicit' => undef,
                                                                                                               'matchrule' => 0,
                                                                                                               'lookahead' => 0
                                                                                                             }, 'Parse::RecDescent::Subrule' ),
                                                                                                      bless( {
                                                                                                               'description' => '\')\'',
                                                                                                               'line' => '92',
                                                                                                               'pattern' => ')',
                                                                                                               'hashname' => '__STRING2__',
                                                                                                               'lookahead' => 0
                                                                                                             }, 'Parse::RecDescent::Literal' ),
                                                                                                      bless( {
                                                                                                               'min' => 0,
                                                                                                               'argcode' => undef,
                                                                                                               'matchrule' => 0,
                                                                                                               'lookahead' => 0,
                                                                                                               'subrule' => 'isreification',
                                                                                                               'line' => '92',
                                                                                                               'expected' => undef,
                                                                                                               'max' => 100000000,
                                                                                                               'repspec' => 's?'
                                                                                                             }, 'Parse::RecDescent::Repetition' ),
                                                                                                      bless( {
                                                                                                               'min' => 1,
                                                                                                               'argcode' => undef,
                                                                                                               'matchrule' => 0,
                                                                                                               'lookahead' => 0,
                                                                                                               'subrule' => 'association_member',
                                                                                                               'line' => '92',
                                                                                                               'expected' => undef,
                                                                                                               'max' => 100000000,
                                                                                                               'repspec' => 's'
                                                                                                             }, 'Parse::RecDescent::Repetition' ),
                                                                                                      bless( {
                                                                                                               'line' => '93',
                                                                                                               'code' => '{
			   my @components; # here I collect all which I generate here

			   my $a = new XTM::association ();
			   my $s = new XTM::scope();
			   $a->add_scope ($s);
			   foreach (@{$item{scopes}->[0]}) {
			     $s->add_reference_s (new XTM::topicRef (href => "#$_"));
			   }
			   $a->scope->add_reference_s (new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) ) 
			     unless $a->scope->references;

			   $a->add_instanceOf (new XTM::instanceOf (reference => 
				    new XTM::topicRef (href => "#$item{type_topic_id}")));
			   foreach (@{$item{association_member}}) {
			     $a->add__s ($_);
			   }

			   push @components, $a;

			   foreach my $uri (@{$item{isreification}}) {
			     push @components, _make_reifying_topic ($uri, $a->id);
			   }

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
                                                                                'scopes',
                                                                                'type_topic_id',
                                                                                'isreification',
                                                                                'association_member'
                                                                              ],
                                                                   'opcount' => 0,
                                                                   'changed' => 0,
                                                                   'vars' => '',
                                                                   'name' => 'association_definition'
                                                                 }, 'Parse::RecDescent::Rule' ),
                              'scope' => bless( {
                                                  'impcount' => 0,
                                                  'line' => '203',
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
                                                                                              'line' => '203',
                                                                                              'pattern' => '@',
                                                                                              'hashname' => '__STRING1__',
                                                                                              'lookahead' => 0
                                                                                            }, 'Parse::RecDescent::Literal' ),
                                                                                     bless( {
                                                                                              'line' => '203',
                                                                                              'subrule' => 'topic_id',
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
                                                               'topic_id'
                                                             ],
                                                  'opcount' => 0,
                                                  'changed' => 0,
                                                  'vars' => '',
                                                  'name' => 'scope'
                                                }, 'Parse::RecDescent::Rule' ),
                              'type' => bless( {
                                                 'impcount' => 0,
                                                 'line' => '199',
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
                                                                                             'description' => '\'(\'',
                                                                                             'line' => '199',
                                                                                             'pattern' => '(',
                                                                                             'hashname' => '__STRING1__',
                                                                                             'lookahead' => 0
                                                                                           }, 'Parse::RecDescent::Literal' ),
                                                                                    bless( {
                                                                                             'line' => '199',
                                                                                             'subrule' => 'type_topic_id',
                                                                                             'argcode' => undef,
                                                                                             'implicit' => undef,
                                                                                             'matchrule' => 0,
                                                                                             'lookahead' => 0
                                                                                           }, 'Parse::RecDescent::Subrule' ),
                                                                                    bless( {
                                                                                             'description' => '\')\'',
                                                                                             'line' => '199',
                                                                                             'pattern' => ')',
                                                                                             'hashname' => '__STRING2__',
                                                                                             'lookahead' => 0
                                                                                           }, 'Parse::RecDescent::Literal' ),
                                                                                    bless( {
                                                                                             'line' => '199',
                                                                                             'code' => '{ $return = $item{type_topic_id}; }',
                                                                                             'hashname' => '__ACTION1__',
                                                                                             'lookahead' => 0
                                                                                           }, 'Parse::RecDescent::Action' )
                                                                                  ],
                                                                       'actcount' => 1
                                                                     }, 'Parse::RecDescent::Production' )
                                                            ],
                                                 'calls' => [
                                                              'type_topic_id'
                                                            ],
                                                 'opcount' => 0,
                                                 'changed' => 0,
                                                 'vars' => '',
                                                 'name' => 'type'
                                               }, 'Parse::RecDescent::Rule' ),
                              'subject_identity' => bless( {
                                                             'impcount' => 0,
                                                             'line' => '190',
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
                                                                                                         'description' => '\'sin\'',
                                                                                                         'line' => '190',
                                                                                                         'pattern' => 'sin',
                                                                                                         'hashname' => '__STRING1__',
                                                                                                         'lookahead' => 0
                                                                                                       }, 'Parse::RecDescent::Literal' ),
                                                                                                bless( {
                                                                                                         'description' => '\':\'',
                                                                                                         'line' => '190',
                                                                                                         'pattern' => ':',
                                                                                                         'hashname' => '__STRING2__',
                                                                                                         'lookahead' => 0
                                                                                                       }, 'Parse::RecDescent::Literal' ),
                                                                                                bless( {
                                                                                                         'line' => '190',
                                                                                                         'subrule' => 'string',
                                                                                                         'argcode' => undef,
                                                                                                         'implicit' => undef,
                                                                                                         'matchrule' => 0,
                                                                                                         'lookahead' => 0
                                                                                                       }, 'Parse::RecDescent::Subrule' ),
                                                                                                bless( {
                                                                                                         'line' => '191',
                                                                                                         'code' => '{
			 use URI;
			 my $u = URI->new ($item{string});
			 $return = ref ($u) eq \'URI::_generic\' ? 
			   new XTM::topicRef (href => $item{string}) :
			     new XTM::subjectIndicatorRef (href => $item{string});
		       }',
                                                                                                         'hashname' => '__ACTION1__',
                                                                                                         'lookahead' => 0
                                                                                                       }, 'Parse::RecDescent::Action' )
                                                                                              ],
                                                                                   'actcount' => 1
                                                                                 }, 'Parse::RecDescent::Production' )
                                                                        ],
                                                             'calls' => [
                                                                          'string'
                                                                        ],
                                                             'opcount' => 0,
                                                             'changed' => 0,
                                                             'vars' => '',
                                                             'name' => 'subject_identity'
                                                           }, 'Parse::RecDescent::Rule' ),
                              'topic_id' => bless( {
                                                     'impcount' => 0,
                                                     'line' => '215',
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
                                                                                                 'line' => '215',
                                                                                                 'subrule' => 'id',
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
                                                                  'id'
                                                                ],
                                                     'opcount' => 0,
                                                     'changed' => 0,
                                                     'vars' => '',
                                                     'name' => 'topic_id'
                                                   }, 'Parse::RecDescent::Rule' ),
                              'association_member' => bless( {
                                                               'impcount' => 0,
                                                               'line' => '120',
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
                                                                                                           'line' => '120',
                                                                                                           'subrule' => 'topic_id',
                                                                                                           'argcode' => undef,
                                                                                                           'implicit' => undef,
                                                                                                           'matchrule' => 0,
                                                                                                           'lookahead' => 0
                                                                                                         }, 'Parse::RecDescent::Subrule' ),
                                                                                                  bless( {
                                                                                                           'description' => '\':\'',
                                                                                                           'line' => '120',
                                                                                                           'pattern' => ':',
                                                                                                           'hashname' => '__STRING1__',
                                                                                                           'lookahead' => 0
                                                                                                         }, 'Parse::RecDescent::Literal' ),
                                                                                                  bless( {
                                                                                                           'line' => '120',
                                                                                                           'subrule' => 'list_of_member_topic_ids',
                                                                                                           'argcode' => undef,
                                                                                                           'implicit' => undef,
                                                                                                           'matchrule' => 0,
                                                                                                           'lookahead' => 0
                                                                                                         }, 'Parse::RecDescent::Subrule' ),
                                                                                                  bless( {
                                                                                                           'line' => '121',
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
			 }',
                                                                                                           'hashname' => '__ACTION1__',
                                                                                                           'lookahead' => 0
                                                                                                         }, 'Parse::RecDescent::Action' )
                                                                                                ],
                                                                                     'actcount' => 1
                                                                                   }, 'Parse::RecDescent::Production' )
                                                                          ],
                                                               'calls' => [
                                                                            'topic_id',
                                                                            'list_of_member_topic_ids'
                                                                          ],
                                                               'opcount' => 0,
                                                               'changed' => 0,
                                                               'vars' => '',
                                                               'name' => 'association_member'
                                                             }, 'Parse::RecDescent::Rule' ),
                              'string' => bless( {
                                                   'impcount' => 0,
                                                   'line' => '219',
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
                                                                                               'description' => '/[^\\\\n\\\\r]+/',
                                                                                               'pattern' => '[^\\n\\r]+',
                                                                                               'mod' => '',
                                                                                               'hashname' => '__PATTERN1__',
                                                                                               'lookahead' => 0,
                                                                                               'ldelim' => '/',
                                                                                               'line' => '219',
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
                                                   'name' => 'string'
                                                 }, 'Parse::RecDescent::Rule' ),
                              'list_of_ids' => bless( {
                                                        'impcount' => 0,
                                                        'line' => '213',
                                                        'prods' => [
                                                                     bless( {
                                                                              'dircount' => 1,
                                                                              'uncommit' => undef,
                                                                              'patcount' => 0,
                                                                              'strcount' => 0,
                                                                              'number' => 0,
                                                                              'error' => undef,
                                                                              'line' => undef,
                                                                              'items' => [
                                                                                           bless( {
                                                                                                    'line' => '213',
                                                                                                    'code' => 'my $oldskip = $skip; $skip=\'[ ]*\'; $oldskip',
                                                                                                    'hashname' => '__DIRECTIVE1__',
                                                                                                    'lookahead' => 0,
                                                                                                    'name' => '<skip:\'[ ]*\'>'
                                                                                                  }, 'Parse::RecDescent::Directive' ),
                                                                                           bless( {
                                                                                                    'min' => 1,
                                                                                                    'argcode' => undef,
                                                                                                    'matchrule' => 0,
                                                                                                    'lookahead' => 0,
                                                                                                    'subrule' => 'id',
                                                                                                    'line' => '213',
                                                                                                    'expected' => undef,
                                                                                                    'max' => 100000000,
                                                                                                    'repspec' => 's'
                                                                                                  }, 'Parse::RecDescent::Repetition' )
                                                                                         ],
                                                                              'actcount' => 0
                                                                            }, 'Parse::RecDescent::Production' )
                                                                   ],
                                                        'calls' => [
                                                                     'id'
                                                                   ],
                                                        'opcount' => 0,
                                                        'changed' => 0,
                                                        'vars' => '',
                                                        'name' => 'list_of_ids'
                                                      }, 'Parse::RecDescent::Rule' ),
                              '_alternation_1_of_production_1_of_rule_topic_definition' => bless( {
                                                                                                    'impcount' => 0,
                                                                                                    'line' => '222',
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
                                                                                                                                                'description' => '\'tid\'',
                                                                                                                                                'line' => '222',
                                                                                                                                                'pattern' => 'tid',
                                                                                                                                                'hashname' => '__STRING1__',
                                                                                                                                                'lookahead' => 0
                                                                                                                                              }, 'Parse::RecDescent::Literal' ),
                                                                                                                                       bless( {
                                                                                                                                                'description' => '\':\'',
                                                                                                                                                'line' => '222',
                                                                                                                                                'pattern' => ':',
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
                                                                                                    'name' => '_alternation_1_of_production_1_of_rule_topic_definition'
                                                                                                  }, 'Parse::RecDescent::Rule' ),
                              'uri' => bless( {
                                                'impcount' => 0,
                                                'line' => '221',
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
                                                                                            'description' => '/[\\\\w\\\\-\\\\.\\\\/\\\\?\\\\&\\\\:\\\\,\\\\+]+/',
                                                                                            'pattern' => '[\\w\\-\\.\\/\\?\\&\\:\\,\\+]+',
                                                                                            'mod' => '',
                                                                                            'hashname' => '__PATTERN1__',
                                                                                            'lookahead' => 0,
                                                                                            'ldelim' => '/',
                                                                                            'line' => '221',
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
                                                'name' => 'uri'
                                              }, 'Parse::RecDescent::Rule' ),
                              'resourceRef_characteristic' => bless( {
                                                                       'impcount' => 0,
                                                                       'line' => '156',
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
                                                                                                                   'description' => '\'oc\'',
                                                                                                                   'line' => '156',
                                                                                                                   'pattern' => 'oc',
                                                                                                                   'hashname' => '__STRING1__',
                                                                                                                   'lookahead' => 0
                                                                                                                 }, 'Parse::RecDescent::Literal' ),
                                                                                                          bless( {
                                                                                                                   'min' => 0,
                                                                                                                   'argcode' => undef,
                                                                                                                   'matchrule' => 0,
                                                                                                                   'lookahead' => 0,
                                                                                                                   'subrule' => 'scopes',
                                                                                                                   'line' => '156',
                                                                                                                   'expected' => undef,
                                                                                                                   'max' => 1,
                                                                                                                   'repspec' => '?'
                                                                                                                 }, 'Parse::RecDescent::Repetition' ),
                                                                                                          bless( {
                                                                                                                   'min' => 0,
                                                                                                                   'argcode' => undef,
                                                                                                                   'matchrule' => 0,
                                                                                                                   'lookahead' => 0,
                                                                                                                   'subrule' => 'type',
                                                                                                                   'line' => '156',
                                                                                                                   'expected' => undef,
                                                                                                                   'max' => 1,
                                                                                                                   'repspec' => '?'
                                                                                                                 }, 'Parse::RecDescent::Repetition' ),
                                                                                                          bless( {
                                                                                                                   'description' => '\':\'',
                                                                                                                   'line' => '156',
                                                                                                                   'pattern' => ':',
                                                                                                                   'hashname' => '__STRING2__',
                                                                                                                   'lookahead' => 0
                                                                                                                 }, 'Parse::RecDescent::Literal' ),
                                                                                                          bless( {
                                                                                                                   'line' => '156',
                                                                                                                   'subrule' => 'string',
                                                                                                                   'argcode' => undef,
                                                                                                                   'implicit' => undef,
                                                                                                                   'matchrule' => 0,
                                                                                                                   'lookahead' => 0
                                                                                                                 }, 'Parse::RecDescent::Subrule' ),
                                                                                                          bless( {
                                                                                                                   'line' => '157',
                                                                                                                   'code' => '{
			 my $o = new XTM::occurrence ();
			 $o->add_resource (new XTM::resourceRef (href => $item{string}));
			 $o->add_scope    (new XTM::scope());
			 foreach (@{$item{scopes}->[0]}) {
			   $o->scope->add_reference_s (new XTM::topicRef (href => "#$_"));
			 }
			 $o->scope->add_reference_s (new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) ) 
			   unless $o->scope->references;

			 $o->add_instanceOf (new XTM::instanceOf ( reference => new XTM::topicRef (href => 
				$item{type} && $item{type}->[0] ?	 "#$item{type}->[0]" : $XTM::PSI::xtm{occurrence}
												  )));
			 $return = $o;
		       }',
                                                                                                                   'hashname' => '__ACTION1__',
                                                                                                                   'lookahead' => 0
                                                                                                                 }, 'Parse::RecDescent::Action' )
                                                                                                        ],
                                                                                             'actcount' => 1
                                                                                           }, 'Parse::RecDescent::Production' )
                                                                                  ],
                                                                       'calls' => [
                                                                                    'scopes',
                                                                                    'type',
                                                                                    'string'
                                                                                  ],
                                                                       'opcount' => 0,
                                                                       'changed' => 0,
                                                                       'vars' => '',
                                                                       'name' => 'resourceRef_characteristic'
                                                                     }, 'Parse::RecDescent::Rule' ),
                              'id' => bless( {
                                               'impcount' => 0,
                                               'line' => '217',
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
                                                                                           'description' => '/[\\\\w\\\\-\\\\.]+/',
                                                                                           'pattern' => '[\\w\\-\\.]+',
                                                                                           'mod' => '',
                                                                                           'hashname' => '__PATTERN1__',
                                                                                           'lookahead' => 0,
                                                                                           'ldelim' => '/',
                                                                                           'line' => '217',
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
                                               'name' => 'id'
                                             }, 'Parse::RecDescent::Rule' ),
                              'list_of_member_topic_ids' => bless( {
                                                                     'impcount' => 0,
                                                                     'line' => '211',
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
                                                                                                                 'line' => '211',
                                                                                                                 'subrule' => 'list_of_ids',
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
                                                                                  'list_of_ids'
                                                                                ],
                                                                     'opcount' => 0,
                                                                     'changed' => 0,
                                                                     'vars' => '',
                                                                     'name' => 'list_of_member_topic_ids'
                                                                   }, 'Parse::RecDescent::Rule' ),
                              'basename_characteristic' => bless( {
                                                                    'impcount' => 0,
                                                                    'line' => '143',
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
                                                                                                                'description' => '\'bn\'',
                                                                                                                'line' => '143',
                                                                                                                'pattern' => 'bn',
                                                                                                                'hashname' => '__STRING1__',
                                                                                                                'lookahead' => 0
                                                                                                              }, 'Parse::RecDescent::Literal' ),
                                                                                                       bless( {
                                                                                                                'min' => 0,
                                                                                                                'argcode' => undef,
                                                                                                                'matchrule' => 0,
                                                                                                                'lookahead' => 0,
                                                                                                                'subrule' => 'scopes',
                                                                                                                'line' => '143',
                                                                                                                'expected' => undef,
                                                                                                                'max' => 1,
                                                                                                                'repspec' => '?'
                                                                                                              }, 'Parse::RecDescent::Repetition' ),
                                                                                                       bless( {
                                                                                                                'description' => '\':\'',
                                                                                                                'line' => '143',
                                                                                                                'pattern' => ':',
                                                                                                                'hashname' => '__STRING2__',
                                                                                                                'lookahead' => 0
                                                                                                              }, 'Parse::RecDescent::Literal' ),
                                                                                                       bless( {
                                                                                                                'line' => '143',
                                                                                                                'subrule' => 'string',
                                                                                                                'argcode' => undef,
                                                                                                                'implicit' => undef,
                                                                                                                'matchrule' => 0,
                                                                                                                'lookahead' => 0
                                                                                                              }, 'Parse::RecDescent::Subrule' ),
                                                                                                       bless( {
                                                                                                                'line' => '144',
                                                                                                                'code' => '{
			 my $b = new XTM::baseName ();
			 $b->add_baseNameString (new XTM::baseNameString (string => $item{string}));
			 $b->add_scope          (new XTM::scope());
			 foreach (@{$item{scopes}->[0]}) {
			   $b->scope->add_reference_s (new XTM::topicRef (href => "#$_"));
			 }
			 $b->scope->add_reference_s (new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) ) 
			   unless $b->scope->references;
			 $return = $b;
		       }',
                                                                                                                'hashname' => '__ACTION1__',
                                                                                                                'lookahead' => 0
                                                                                                              }, 'Parse::RecDescent::Action' )
                                                                                                     ],
                                                                                          'actcount' => 1
                                                                                        }, 'Parse::RecDescent::Production' )
                                                                               ],
                                                                    'calls' => [
                                                                                 'scopes',
                                                                                 'string'
                                                                               ],
                                                                    'opcount' => 0,
                                                                    'changed' => 0,
                                                                    'vars' => '',
                                                                    'name' => 'basename_characteristic'
                                                                  }, 'Parse::RecDescent::Rule' ),
                              'scopes' => bless( {
                                                   'impcount' => 0,
                                                   'line' => '201',
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
                                                                                               'line' => '201',
                                                                                               'pattern' => '@',
                                                                                               'hashname' => '__STRING1__',
                                                                                               'lookahead' => 0
                                                                                             }, 'Parse::RecDescent::Literal' ),
                                                                                      bless( {
                                                                                               'line' => '201',
                                                                                               'subrule' => 'list_of_scope_topic_ids',
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
                                                                'list_of_scope_topic_ids'
                                                              ],
                                                   'opcount' => 0,
                                                   'changed' => 0,
                                                   'vars' => '',
                                                   'name' => 'scopes'
                                                 }, 'Parse::RecDescent::Rule' )
                            },
                 'namespace' => 'Parse::RecDescent::namespace000001',
                 '_check' => {
                               'prevline' => '',
                               'prevcolumn' => '',
                               'thiscolumn' => '1',
                               'prevoffset' => '',
                               'thisoffset' => '',
                               'itempos' => ''
                             },
                 '_AUTOACTION' => undef,
                 'localvars' => '',
                 'startcode' => ''
               }, 'Parse::RecDescent' );
}