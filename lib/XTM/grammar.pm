package XTM::grammar;

use strict;

our $VERSION = '0.01';

our $adjacency = 
  {
   topicMap            => [ qw( topic association mergeMap ) ],
   topic               => [ qw( instanceOf subjectIdentity baseName occurrence @id) ],
   instanceOf          => [ qw( topicRef subjectIndicatorRef ) ],
   subjectIdentity     => [ qw( resourceRef topicRef subjectIndicatorRef ) ],
   topicRef            => [ qw( @href ) ],
   subjectIndicatorRef => [ qw( @href ) ],
   baseName            => [ qw( scope baseNameString variant ) ],
   baseNameString      => [ qw( text() ) ],
   variant             => [ qw( parameters variantName variant ) ],
   variantName         => [ qw( resourceRef resourceData ) ],
   parameters          => [ qw( topicRef subjectIndicatorRef ) ],
   occurrence          => [ qw( instanceOf scope resourceRef resourceData ) ],
   resourceRef         => [ qw( @href ) ],
   resourceData        => [ qw( text() ) ],
   association         => [ qw( instanceOf scope member ) ],
   member              => [ qw( roleSpec topicRef resourceRef subjectIndicatorRef ) ],
   roleSpec            => [ qw( topicRef subjectIndicatorRef ) ],
   scope               => [ qw( topicRef resourceRef subjectIndicatorRef ) ],
   mergeMap            => [ qw( topicRef resourceRef subjectIndicatorRef @href ) ],
};


our $PATHS;

our $ISIN;

sub recompute_isin {
  foreach my $n (keys %$adjacency) {
    foreach my $m (@{$adjacency->{$n}}) {
      push @{$ISIN->{$m}}, $n;
    }
  }
}



sub _scout {
  my $path = shift;

  my $lastnode = $path->[-1];

  foreach my $next (@{$adjacency->{$lastnode}}) {
#    warn " path from ".$path->[0]." via ".join (",",@$path)." to $next (".(scalar @$path).")";
    push @{$PATHS->{$path->[0]}->{$next}}, [ @$path, $next ];
    _scout ([ @$path, $next ]) unless grep $next eq $_, @$path;
  }
}

sub recompute_paths {
  foreach my $start (keys %$adjacency) {
#    warn "start with $start";
    _scout ([ $start ]);
  }
}

#sub INIT {
  recompute_paths();
  recompute_isin();
#use Data::Dumper;
#print Dumper $ISIN;
#}

1;
