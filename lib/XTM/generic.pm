package XTM::generic;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

@ISA = qw(Exporter AutoLoader);
@EXPORT = qw( AUTOLOAD );
$VERSION = '0.02';

use XTM::Log;
use XTM::Namespaces;

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

AUTOLOAD will capture most of the access.

If the method name begins with 'add_'. If it ends with '_s' then the provided
values will be added to a list component. Otherwise it is regarded as a single value.

If the method does not begin with 'add_' then a simple read access is assumed. Again,
if the name ends with '_s' then a list will be returned.

The component name will be derived from the
rest of the method name, if that is non-empty (like in 'add_rumsti_s'). If the
name is empty ('add__s') then the component name will be derived from the parameters
class name ('XYZ::rumsti' will result in a component name 'rumsti').

=cut

use vars qw($AUTOLOAD); 
sub AUTOLOAD {
  my ($method) = $AUTOLOAD =~ m/([^:]+)$/;
  return if $method eq 'DESTROY';

  my $self = shift;
##  XTM::Log::log (ref($self), 4, "AUTOLOAD for '$method', params: ".@_);
  if ($method =~ /^add_(.*)_s$/) { # list add
    my $component = $1;
    if ($component) {
      push @{$self->{$component."s"}}, @_;
    } else {
##      XTM::Log::log (ref($self), 4, "   list with individual");
      foreach my $c (@_) {
	(undef, $component) = split /::/, ref($c);
	push @{$self->{$component."s"}}, $c;
##	use Data::Dumper;
##	XTM::Log::log (ref($self), 5, "   pushed $component". Dumper $self);
      }
    }
  } elsif ($method =~ /^add_(.*)$/) { # scalar set
    my $component = $1;
    unless ($component) {
      (undef, $component) = split /::/, ref($_[0]);
    }
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
    return $self->{$method} || undef;
  }
}
      
=pod

The method I<undefine> gets rid of a particular component.

=cut

sub undefine {
  my $self = shift;
  foreach my $c (@_) {
    delete $self->{$c};
  }
}

=pod

=cut

sub xml {
  die "XTM::generic: unimplemented feature 'XML serialisation of ".ref(shift)."'";
}

=pod

=head1 SEE ALSO

L<XTM>

=head1 AUTHOR INFORMATION

Copyright 2001, Robert Barta <rho@telecoma.net>, All rights reserved.
 
This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.

=cut

1;

__END__
