package XTM::LTM::MemoryBuilder;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

use base qw (XTM::LTM::Parser);

@EXPORT = qw( );
$VERSION = '0.01';

sub handle_encoding {
  my $self     = shift;
  my $encoding = shift;

  if ($self->{encoding}) {
    warn "XTM::LTM::MemoryBuilder: Duplicate encoding '$encoding' ignored";
    return;
  }
  $self->{encoding} = $encoding;
}

sub handle_naming {
  my $self     = shift;
  my $name     = shift;

  if ($self->{name}) {
    warn "XTM::LTM::MemoryBuilder: Duplicate naming '$name' ignored";
    return;
  }
  $self->{tm}->{id} = $self->{name} = $name;
}

sub handle_component {
  my $self = shift;
  my $c    = shift;

  push @{$self->{mentioned}}, @{$c->connected};
  push @{$self->{defined}},   $c->id if ref ($c) eq "XTM::topic";

  $self->{tm}->add ($c);
}

sub handle_undefined_topic {
  my $self = shift;
  my $tid  = shift;

  $self->{tm}->add (new XTM::topic (id => $tid, populate => \&XTM::topic::default_populate))
}


1;

__END__
