package XTM::AsTMa::Parser;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

@ISA = qw(Exporter AutoLoader);
@EXPORT = qw( );
$VERSION = '0.08';

use Data::Dumper;
use Parse::RecDescent;
use URI;

use XTM;
use XTM::topic;
use XTM::association;

sub new {
  my $class = shift;
  my %options = @_;
  my $self = bless \%options, $class;
  return $self;
}



our $astma_grammar = q {




		       startrule : section

		       section : topic_definition | association_definition | <error: Problem parsing near "$text" (line "$thisline", col "$thiscolumn")>

		       topic_definition : ( 'tid' ':' )(?) topic_id types(?) reification(?) isreification(s?) topic_characteristic(s?)
		       {
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
		       }

		       reification : 'reifies' uri
                       {
                         # check for relative URI ?
		         $return = new XTM::resourceRef (href => $item{uri});
                       }

		       isreification : 'is-reified-by' uri
                       {
			 $return = $item{uri};
                       }

		       association_definition : scopes(?) '(' type_topic_id ')' isreification(s?) association_member(s)
			 {
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
			 }

		       association_member : topic_id ':' list_of_member_topic_ids
			 {
			   my $m = new XTM::member ();

                           my $r = new XTM::roleSpec ();
			   my $t = new XTM::topicRef (href => "#$item{topic_id}");
			   $r->add_reference ($t);
			   $m->add_roleSpec ($r);

			   foreach (@{$item{list_of_member_topic_ids}}) {
			     $m->add_reference_s (new XTM::topicRef (href => "#$_"));
			   }

			   $return = $m;
			 }

		       types : '(' list_of_type_topic_ids ')'   { $return = $item{list_of_type_topic_ids}; }

		       topic_characteristic : basename_characteristic     |
			                      resourceRef_characteristic  |
					      resourceData_characteristic |
					      subject_identity

		       basename_characteristic : 'bn' scopes(?) ':' string
		       {
			 my $b = new XTM::baseName ();
			 $b->add_baseNameString (new XTM::baseNameString (string => $item{string}));
			 $b->add_scope          (new XTM::scope());
			 foreach (@{$item{scopes}->[0]}) {
			   $b->scope->add_reference_s (new XTM::topicRef (href => "#$_"));
			 }
			 $b->scope->add_reference_s (new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) ) 
			   unless $b->scope->references;
			 $return = $b;
		       }

		       resourceRef_characteristic : 'oc' scopes(?) type(?) ':' string
		       {
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
		       }

		       resourceData_characteristic : 'in' scopes(?) type(?) ':' string
		       {
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
		       }

		       subject_identity : 'sin' ':' string
		       {
			 use URI;
			 my $u = URI->new ($item{string});
			 $return = ref ($u) eq 'URI::_generic' ? 
			   new XTM::topicRef (href => $item{string}) :
			     new XTM::subjectIndicatorRef (href => $item{string});
		       }

		       type : '(' type_topic_id ')'  { $return = $item{type_topic_id}; }

		       scopes : '@' list_of_scope_topic_ids

		       scope  : '@' topic_id

		       type_topic_id : topic_id

		       list_of_scope_topic_ids : list_of_ids

		       list_of_type_topic_ids : list_of_ids

		       list_of_member_topic_ids : list_of_ids

		       list_of_ids : <skip:'[ ]*'> id(s)

		       topic_id : id

		       id : /[\w\-\.]+/

		       string : /[^\n\r]+/

		       uri :  /[\w\-\.\/\?\&\:\,\+]+/
		      };
	
sub handle_begin {
}

sub handle_end {
}

sub handle_comment {
  my $self = shift;
  my $comment = shift;
}

sub handle_encoding {
  my $self = shift;
  my $encoding = shift;
}

sub handle_naming {
  my $self = shift;
  my $name = shift;
}

sub handle_component {
  my $self = shift;
  my $c = shift;

}

sub handle_trailer_start {
  my $self = shift;
}

sub handle_trailer_end {
  my $self = shift;
}

sub handle_undefined_topic {
  my $self = shift;
  my $tid  = shift;
}








sub handle_astma {
  my $self    = shift;
  my %options = @_;
  
  my $text          = ($options{text} || '') . "\n"; # MUST have a \n at the end
  my $log_level     = $options{log_level} || 0;
  my $auto_complete = $options{auto_complete};

  $options{err}  ||= sub { print STDERR @_; };
  
  my $parser;
  eval {
    require XTM::AsTMa::CParser;
    $parser = XTM::AsTMa::CParser->new();
  }; if ($@) {
    warn "could not find CParser ($@)";
    $parser = new Parse::RecDescent ($astma_grammar) or die "XTM::AsTMa: Problem in grammar";
  };
  
  $self->handle_begin();

  my $prev_text_length;
  my $line = 0;
  while ($prev_text_length = length ($text)) {            # as long as there is something
    while ($text =~ s/^\s*?[\n\r]//s) { $line++ };         # get rid of empty line

    if (!$text) {
	last;
    } elsif ($text =~ s/^%log\s*(.*?)[\n\r]//s) {
	$line++;
	warn "XTM::AsTMa: Log at line $line". ($1 ? " $1" : '');
    } elsif ($text =~ s/^%name\s*(.*?)[\n\r]//s) {
	$line++;
	$self->handle_naming   ($1);
    } elsif ($text =~ s/^%encoding\s*(.*?)[\n\r]//s) {
	$line++;
	my $encoding = $1;
	$self->handle_encoding ($encoding);
	use Text::Iconv;
	my $converter;
	eval {
	  $converter = Text::Iconv->new($encoding, "utf8"); # into Perl utf8 encoding
	}; if ($@) {
	  die "XTM::AsTMa::Parser: Could not convert encoding '$encoding' into utf-8 ($@)";
	};
	if ($text =~ /(.+?)(%encoding.+)/s) { # there is a second encoding here
	  $text = $converter->convert($1).$2;
	} else {
	  $text = $converter->convert($text);
	}
    } elsif ($text =~ /^%cancel/) {
	$line++;
	warn "XTM::AsTMa: Cancelled at line $line";
	last;
    } elsif ($text =~ s/^%auto_complete\s*(.*?)[\n\r]//s) {
	$line++;
	$auto_complete = $1 =~ /on/i ? 1 : 0;
    } elsif($text =~ s/^(\w+)\s*:\s*([\w\-]+)\s*[\n\r]//s) { # find encoding
	$line++;
	$self->handle_naming   ($1);
	$self->handle_encoding ($2);
    } elsif ($text =~ /^\#/) {                            # collect comments on the way
      my @comments;
      while ($text =~ s/^\#(.*?)[\n\r]//s) {
	$line++;
	push @comments, $1;
      };
      $self->handle_comment (join ("\n    ", grep (($_ =~ s/-->/-=>/g, $_), @comments))) if @comments;
    } else {                                              # try to parse in topic or association
      my $block;
      my $start_line = $line;
      while (1) {
	last if $text =~ /^[\#\%\n\r]/s; # comment, directives
	last if $text =~ /^\s*[\n\r]/s;  # lines containing only spaces
	last unless $text;
	$text =~ s/^([[:blank:]]*.*?[\n\r])//s;
	$line++;
        my $l = $1;
        $l =~ s/\s+#.*//; # anything which start with <blank>#, all blanks are ignored
	$block .= $l;
      }

      $block =~ s/\\[\n\r]//g; # merge \<cr> lines
      eval {
	my $cs = $parser->startrule (\$block);
	die "XTM::AsTMa: Found unparseable '$block' between lines [$start_line, $line]"    unless $block =~ /^\s*$/s;
	die "XTM::AsTMa: no component around '$block' between lines [$start_line, $line]"  unless defined $cs;
	foreach (@$cs) {
	  $self->handle_component ($_);
	}
      }; if ($@) {
	die $@;
      }
    }
    die "XTM::AsTMa: Internal parse error, text does not shrink." 
      if length($text) >= $prev_text_length;                       # numeric comparison, there is something wrong internally
  };

  if ($auto_complete) {

    $self->handle_trailer_start();

    warn "\ndefined: ".   ($self->{defined}   ? join (",", @{$self->{defined}})   : 'none') if $log_level >= 2;
    warn "\nmentioned: ". ($self->{mentioned} ? join (",", @{$self->{mentioned}}) : 'none') if $log_level >= 2;
    
    foreach my $href (@{$self->{mentioned}}) {
      use URI;
      my $u = new URI ($href);
      next if $u->scheme; # external
      my $tid = $u->fragment;
      next if grep ($tid eq $_, @{$self->{defined}});
      
      $self->handle_undefined_topic ($tid);
      push @{$self->{defined}}, $tid;
    }
    
    $self->handle_trailer_end();

  }

  $self->handle_end();
}

1;

__END__
