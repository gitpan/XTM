package XTM::AsTMa::MemoryBuilder;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

use base qw (XTM::AsTMa::Parser);

@EXPORT = qw( );
$VERSION = '0.05';

sub handle_encoding {
  my $self     = shift;
  my $name     = shift;
  my $encoding = shift;

  if ($self->{name} || $self->{encoding}) {
    warn "XTM::AsTMa::MemoryBuilder: Duplicate encoding $name : $encoding ignored";
    return;
  }
  ($self->{name}, $self->{encoding}) = ($name, $encoding);
  $self->{tm}->{id} = $self->{name};
}

sub handle_component {
  my $self = shift;
  my $c    = shift;

  push @{$self->{mentioned}}, @{$c->connected};
  push @{$self->{defined}},   $c->id if ref ($c) eq "XTM::topic";

  $self->{tm}->add ($c)
}

sub handle_undefined_topic {
  my $self = shift;
  my $tid  = shift;

  $self->{tm}->add (new XTM::topic (id => $tid, populate => \&XTM::topic::default_populate))
}


1;

__END__
