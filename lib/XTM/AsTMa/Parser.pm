package XTM::AsTMa::Parser;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

@ISA = qw(Exporter AutoLoader);
@EXPORT = qw( );
$VERSION = '0.03';

use Data::Dumper;
use Parse::RecDescent;

sub new {
  my $class = shift;
  my %options = @_;
  my $self = bless \%options, $class;
  return $self;
}


my $astma_grammar = q {
		       startrule : section

		       section : topic_definition | association_definition | <error: Problem parsing near "$text" (line "$thisline", col "$thiscolumn")>

		       topic_definition : ( 'tid' ':' )(?) topic_id types(?) topic_characteristic(s?)
		       {
			 my $t = new XTM::topic (id => $item{topic_id});
			 foreach (@{$item{types}->[0]}) {
			   $t->add__s (new XTM::instanceOf ( reference => new XTM::topicRef (href => "#$_")));
			 }
			 $t->add__s (new XTM::instanceOf ( reference => new XTM::topicRef (href => $XTM::PSI::xtm{topic})))
			   unless $t->instanceOfs && @{$t->instanceOfs};

			 foreach (@{$item{topic_characteristic}}) {
			   $t->add__s ($_);
			 }
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
			 $return = $t;
		       }

		       association_definition : scope(?) '(' type_topic_id ')' association_member(s)
			 {
			   my $a = new XTM::association ();

			   $a->add_scope (new XTM::scope (references => [ 
				    new XTM::topicRef (href => $item{scope}->[0] ? "#$item{scope}->[0]" : $XTM::PSI::xtm{universal_scope}) ]));
			   $a->add_instanceOf (new XTM::instanceOf (reference => 
				    new XTM::topicRef (href => "#$item{type_topic_id}")));
			   foreach (@{$item{association_member}}) {
			     $a->add__s ($_);
			   }
			   $return = $a;
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
			 if ($item{type} && $item{type}->[0]) {
			   $o->add_instanceOf (new XTM::instanceOf ( reference => new XTM::topicRef (href => "#$item{type}->[0]")));
			 } else {
			   $o->add_instanceOf (new XTM::instanceOf ( reference => new XTM::topicRef (href => $XTM::PSI::xtm{occurrence})));
			 }
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
			 if ($item{type} && $item{type}->[0]) {
			   $o->add_instanceOf (new XTM::instanceOf ( reference => new XTM::topicRef (href => "#$item{type}->[0]")));
			 } else {
			   $o->add_instanceOf (new XTM::instanceOf ( reference => new XTM::topicRef (href => $XTM::PSI::xtm{occurrence})));
			 }
			 $return = $o;
		       }

		       subject_identity : 'sin' ':' string
		       { 
			 my $s = new XTM::subjectIdentity ();
			 $s->add_resourceRef (new XTM::resourceRef (href => $item{string}));
			 $return = $s;
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
  my $name = shift;
  my $encoding = shift;
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
  
  my $parser = new Parse::RecDescent ($astma_grammar) or die "XTM::AsTMa: Problem in grammar";
  
  $self->handle_begin();

  my $prev_text_length;
  my $line = 1;
  while ($prev_text_length = length ($text)) {            # as long as there is something
    while ($text =~ s/^\s*[\n\r]//s) { $line++ };         # get rid of empty line

    if (!$text) {
      last;
    } elsif($text =~ s/^(\w+)\s*:\s*([\w\-]+)\s*[\n\r]//s) { # find encoding
      $line++;
      $self->handle_encoding ($1, $2);
    } elsif ($text =~ /^\#/) {                            # collect comments on the way
      my @comments;
      while ($text =~ s/^\#(.*?)[\n\r]//s) {
	$line++;
	push @comments, $1;
      };

      $self->handle_comment (join ("\n    ", grep (($_ =~ s/-->/-=>/g, $_), @comments))) if @comments;
    } else {                                              # try to parse in topic or association
      my $block;
      while ($text =~ s/^([^\#\n\r][[:blank:]]*[\w\-].*?[\n\r])//s) {
	$line++;
	$block .= $1;
      }
      $block =~ s/\\[\n\r]//g; # merge \<cr> lines
      eval {
	my $c = $parser->startrule (\$block);
	die "XTM::AsTMa: Found unparseable '$block' before line $line"    unless $block =~ /^\s*$/s;
	die "XTM::AsTMa: no component around '$block' before line $line"  unless defined $c;
	$self->handle_component ($c);
      }; if ($@) {
	die $@;
      }
    }
    die "XTM::AsTMa: Internal parse error, text does not shrink." 
      if length($text) >= $prev_text_length;                       # numeric comparison, there is something wrong internally
  };

  if ($auto_complete) {

    $self->handle_trailer_start();

    print STDERR "\ndefined: ", join (",", @{$self->{defined}})     if $log_level >= 2;
    print STDERR "\nmentioned: ", join (",", @{$self->{mentioned}}) if $log_level >= 2;
    
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
