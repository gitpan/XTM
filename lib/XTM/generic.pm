package XTM::generic;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

@ISA = qw(Exporter AutoLoader);
@EXPORT = qw( AUTOLOAD );
$VERSION = '0.06';

use XTM::Log;
use XTM::Namespaces;

# downwards parentship + add actions
our $NISI = {
	     'association'         => {
				       'instanceOf'           => {'add' => 'single', },
				       'scope'                => {'add' => 'single', },
				       'member'               => {'add' => 'multiple',  },
# no id modification for associations
#				       '@id'                  => {'add' => sub { $_[0]->id ($_[2]) } },
				      },
	     'baseName'            => {
				       'scope'                => {'add' => 'single', },
				       'baseNameString'       => {'add' => 'single', },
				       'variant'              => {'add' => 'multiple', },
				      },
	     'baseNameString'      => {
				       'text()'               => {'add' => sub { $_[0]->add_string ($_[2]) } }
				      },
	     'instanceOf'          => { 
				       'topicRef'             => {'add' => sub { $_[0]->add_reference ($_[1]) } }, 
				       'subjectIndicatorRef'  => {'add' => sub { $_[0]->add_reference ($_[1]) } },
				      },
#	     'mergeMap'            => { # not applicable
	     'member'              => {
				       'roleSpec'             => {'add' => 'single', }, 
				       'topicRef'             => {'add' => 'references', }, 
				       'resourceRef'          => {'add' => 'references', }, 
				       'subjectIndicatorRef'  => {'add' => 'references', }, 
				      },
	     'occurrence'          => {
				       'instanceOf'           => {'add' => 'single', }, 
				       'scope'                => {'add' => 'single', }, 
				       'resourceRef'          => {'add' => sub { $_[0]->add_resource ($_[1]) } }, 
				       'resourceData'         => {'add' => sub { $_[0]->add_resource ($_[1]) } },
				      },
	     'parameters'          => {
				       'topicRef'             => {'add' => 'references', }, 
				       'subjectIndicatorRef'  => {'add' => 'references', },
				      },
	     'resourceData'        => {
				       'text()'               => {'add' => sub { $_[0]->add_data ($_[2]) } }
				      },
	     'resourceRef'         => {
				       '@href'                => {'add' => sub { $_[0]->href ($_[2]) } }
				      },
	     'roleSpec'            => {
				       'topicRef'             => {'add' => sub { $_[0]->add_reference ($_[1]) } }, 
				       'subjectIndicatorRef'  => {'add' => sub { $_[0]->add_reference ($_[1]) } }
				      },
	     'scope'               => {
				       'topicRef'             => {'add' => 'references', }, 
				       'resourceRef'          => {'add' => 'references', }, 
				       'subjectIndicatorRef'  => {'add' => 'references', }
				      },
	     'subjectIdentity'     => {
				       'resourceRef'          => {'add' => 'single', },
				       'topicRef'             => {'add' => 'references', }, 
				       'subjectIndicatorRef'  => {'add' => 'references', },
				      },
	     'subjectIndicatorRef' => {
				       '@href'                => {'add' => sub { $_[0]->href ($_[2]) } }
				      },
	     'topic'               => { 
				       'instanceOf'           => {'add' => 'multiple', }, 
				       'subjectIdentity'      => {'add' => 'single',   }, 
				       'baseName'             => {'add' => 'multiple', }, 
				       'occurrence'           => {'add' => 'multiple', },
				       '@id'                  => {'add' => sub { $_[0]->id ($_[2]) } },
				      },
	     'topicMap'            => { # should be caught by XTM::Memory
				       'topic'                => {'add' => sub { $_[0]->add_topic ($_[1]) }, }, 
				       'association'          => {'add' => sub { $_[0]->add ($_[1]) }, }
				      }, # no mergeMap
	     'topicRef'            => {
				       '@href'                => {'add' => sub { $_[0]->href ($_[2]) } }
				      },
	     'variant'             => { 
				       'parameters'           => {'add' => 'single', }, 
				       'variantName'          => {'add' => 'single', }, 
				       'variant'              => {'add' => 'single', },
				      },
	     'variantName'         => { 
				       'resourceRef'          => {'add' => 'single', }, 
				       'resourceData'         => {'add' => 'single', }
				      },
	   };

=pod

=head1 NAME

XTM::generic - XTM generic accessor

=head1 SYNOPSIS

  # very much an internal package...

=head1 DESCRIPTION

Generic provider for accessor functions.

Instead of hard-coding simple accessor functions into trivial packages, these
packages can inherit the methods from this package.

=head1 INTERFACE

=head2 Constructor

The constructor just returns a blessed object reference to the class in question. All
parameters - given in a hash - will be components of the resulting object.

=cut

sub new {
  my $class = shift;
  my %pars  = @_;
##  XTM::Log::log ($class, 5, "new '$class'");

  return bless { %pars }, $class;
}

=pod

=head2 Methods

=over

=item B<add>

I<$o>->add (I<$p>, ....)

I<add> analyzes the class of the parameters and incorporates them according to the
nesting imposed by this implementation of the XTM standard. An exception will be raised if the
internal consistency would be violated.

=cut

sub add {
  my $self = shift;
  (my $stag = ref($self)) =~ s/^XTM:://;

  use Data::Dumper;
  foreach my $x (@_) {
#    warn "in add: ".Dumper $x;
    my $xtag = ref($x);
    my $v;
    if ($xtag eq 'ARRAY') {
      $xtag = $x->[0]; # text(), @href or @id
      $v    = $x->[1]; # value, string, data
    } else {
      $xtag =~ s/^XTM:://;
    }

#    warn "adding $xtag to $stag";
    my $add = $NISI->{$stag}->{$xtag}->{add};
    if (ref($add) eq "CODE") {
      &$add ($self, $x, $v);
    } elsif ($add eq "single") {
#      warn " single";
      $self->add_ ($x);
    } elsif ($add eq "references") {
#      warn " references";
      $self->add_reference_s ($x);
    } elsif ($add eq "multiple") {
#      warn " multiple";
      $self->add__s ($x);
    } else {
      die ref($self).": violating XTM consistency with adding ".ref($x);
    }
  }
}

=pod

=item B<add_>, B<add__s>

AUTOLOAD will capture most of the set/get accesses.

If the method name begins with 'add_', then the information provided as parameter
will be I<added> as follows. If it ends with '_s' then the provided
values will be added to a list component with a particular name (see below). 
Otherwise it is regarded as a single value.

If the method does not begin with 'add_' then a simple read access is assumed. Again,
if the name ends with '_s' then a list will be returned.

The component name will be derived from the
rest of the method name, if that is non-empty ('rumsti' as in 'add_rumsti_s'). If the
name is empty ('add__s') then the component name will be derived from the parameters
class name ('XYZ::rumsti' will result in a component name 'rumsti').

=cut

our %requests;
our %callers;

use vars qw($AUTOLOAD);
sub AUTOLOAD {
  my ($method) = $AUTOLOAD =~ m/([^:]+)$/;
  return if $method eq 'DESTROY';

##  print STDERR "AUTOLOAD from: ".join ("\t",  caller)."\n";
  my $self = shift;

  $callers{$method}->{join ("",caller)}++;


  if ($method =~ /^add_(.*)_s$/) { # list add
    my $component = $1;
    if ($component) {
      push @{$self->{$component."s"}}, @_;
    } else {
      foreach my $c (@_) {
	(undef, $component) = split /::/, ref($c);
	push @{$self->{$component."s"}}, $c;
      }
    }
  } elsif ($method =~ /^add_(.*)$/) { # scalar set
    my $component = $1;
    unless ($component) {
      (undef, $component) = split /::/, ref($_[0]);
    }
    warn "XTM::generic: no guessable component found." unless $component;
#warn "method '$method' component '$component'", caller;
    $self->{$component} = shift;
  } elsif ($method =~ /^(.*)_s$/) { # list retrieve
##    XTM::Log::log (ref($self), 5, "  $1 list retrieve");
##    use Data::Dumper;
##    print STDERR Dumper $self->{$1."s"};
    if (defined $self->{$1."s"} && ref ($self->{$1."s"}) eq 'ARRAY') {
      return defined wantarray ? @{$self->{$1."s"}} : scalar @{$self->{$1."s"}};
    } else {
      return ();
    }
#    return (defined $self->{$1."s"} && ref ($self->{$1."s"}) eq 'ARRAY') ? @{$self->{$1."s"}}: ();
  } else {
    return defined $_[0] ? $self->{$method} = $_[0] : $self->{$method} || undef;
  }
}

=pod

=item I<undefine>

The method I<undefine> gets rid of a particular component.

=cut

sub undefine {
  my $self = shift;
  foreach my $c (@_) {
    delete $self->{$c};
  }
}

=pod

=item I<xml>

This method is meant for serialisation into XTM. As this class is generic, every subclass will
have to implement this.

=cut

sub xml {
  die "XTM::generic: unimplemented feature 'XML serialisation of ".ref(shift)."'";
}

=pod

=back

=head1 SEE ALSO

L<XTM>

=head1 AUTHOR INFORMATION

Copyright 200[1-2], Robert Barta <rho@telecoma.net>, All rights reserved.

This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.
http://www.perl.com/perl/misc/Artistic.html

=cut

1;

__END__
