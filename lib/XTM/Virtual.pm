package XTM::Virtual;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

@ISA = qw(Exporter AutoLoader);
@EXPORT = qw(  );
@EXPORT_OK = qw( );
$VERSION = '0.07';

use Carp;
use Data::Dumper;
use XTM;
use XTM::Log ('elog');
use XTM::Memory;

my %cache;

=pod

=head1 NAME

XTM::Virtual - Topic Map management, Virtual (topic induced) maps

=head1 SYNOPSIS

  use XTM::Virtual;
  my $tm = new XTM (tie => new XTM::Virtual (expr => '/m-some-map'));

=head1 DESCRIPTION

!!!This description has to be improved!!!

This is a tie wrapper for topic induced topic maps. The idea is that there
is a global tree of topic maps (maybe distributed over several topic map servers).

Every topic can---in principle---have a complete map as 'refinement'. So, for instance,
a topic 't-internet' in a particular map can have a topic map attached dealing with
details about the Internet.

In this sense we induce some topic map hierarchy, which can be easily
flexed by organising maps via Topic Map algebraic definitions. The hierarchy
only helps us to organize the maps physically.


=over

=item Topic Map Algebra

When loading topic maps (regardless their format), following operations
can be performed:

=over

=item joining

Here two topic maps are B<joined> by identifying topics in each of
the maps to be synonymous. The mapping is done by another map.

=item scoping

Given a particular topic map, the scope filters out only those topics
and associations for this very scope.

=item versioning

As topic maps may exist in different version it is sometimes
practical to select a particular version.

=back

???????

The syntax for an topic map expression is as follows:

  expr 	  -> tm-url                     # primitive
  expr 	  -> expr '[' expr ']' expr     # join
  expr 	  -> expr [ 'v' version ]       # versioning
                  [ '@' host    ]       # remote server
                  [ '|' scope   ]       # scoping
  version -> natural [ '.' natural ]
  scope   -> I<SGML topic>-identifier
  host    -> I<some machine name or IP address>
  natural -> I<some number greater equal 0>

The I<tm-url> has the form

 tm://server-name/map-id1/map-id2/....

=back

=head1 INTERFACE

=head2 Global variables

=over

=item C<urlbase> this path is used as a basis for all maps loaded from the
file system (or via HTTP/FTP). This should point to the bootstrap map.

=cut

use vars qw($urlbase);
use URI::file;
$urlbase = URI::file->cwd; # everything relative will be resolved against this

=pod

=item C<tmbase> this path is used as a basis for all maps loaded from the tm:// name space.

=cut

use vars qw($tmbase);

=pod

=back

=head2 Constructor

The constructor expects a hash with the following fields:

=over

=item I<expr> denotes a topic map algebraic expression.

=back

Examples:
   
  # relative to this server
  $vtm = new XTM::Virtual (expr => '/m-test');
  # absolute
  $vtm = new XTM::Virtual (expr => 'tm://se-namod/map-topic1/map-topic2/');
  # directly the server knowledge map
  $vtm = new XTM::Virtual (expr => '/');
  # some other server's knowledge map
  $vtm = new XTM::Virtual (expr => 'tm://se-some-server/');

=cut

sub new {
  my $class    = shift;  
  my %options  = @_;
  elog ('XTM::Virtual', 5, "in new Virtual $options{expr}");
  return bless { %options }, $class;
}

=pod

=head2 Methods

=over

=item I<sync_in>

This method will cause the map to be loaded and/or generated, depending
on the complexity of the expression. The L<XTM::Memory> object will be returned.

=cut

sub sync_in {
  my $self = shift;
  elog ('XTM::Virtual', 3, "syncing in ", $self->{expr});
  return _assert ($self->{expr}, $self->{key});
}

=pod

=item I<sync_out>

=cut

sub sync_out {
  warn "syncing out via virtual\n";
}

=pod

=item I<staleness> returns the number of seconds the loaded map is old relative to the
external source. If the last modification of the source cannot be determined, then
the staleness is always 0.

=cut

sub staleness {
  my $expr = shift;
  my $tm   = $cache{$expr} or return 1;
  my $S = 0; #assumption

  elog ('XTM::Virtual', 4, "staleness for $expr");
  elog ('XTM::Virtual', 5, "   map itself: ", $tm);
  if ($tm->{depends}) { # take largest staleness of depend_ons
    foreach my $d (@{$tm->{depends}}) {  
      elog ('XTM::Virtual', 4, "  substaleness for $d ");
      my $s = staleness ($d);
      $S = $s if defined $s && $s > $S;
    }
  } else { # compute this from the difference of last_mod of source and syncin
    elog ('XTM::Virtual', 4, "  last mod for $tm $tm->{last_mod}", " lastsync ".$tm->{last_syncin} );
    if (defined $tm->{last_mod}) {
      $S = $tm->{last_mod} - $tm->{last_syncin};
    } else {
      $S = 0;
    }
  }
  elog ('XTM::Virtual', 4, "   is ", $S);
  return $S;
}

sub _assert_package {
  my $module = shift;
  my $key    = shift || $module;

  elog ('XTM::Virtual', 3, "_assert package for '$module', '$key'");
  return $cache{$key} if staleness ($key) <= 0;

  elog ('XTM::Virtual', 3, "  XML loading via '$module'");
  my $tm;
  eval qq|
    use $module;
    \$tm = new XTM (tie         => new $module (),
		    last_mod    => time,
		    last_syncin => time);
  |; if ($@) {
    elog ('XTM::Virtual', 1, "Problem when loading via '$module': '$@'....continuing....");
  }
  return $cache{$key} = $tm;
}

sub _assert_xml {
  my $url = shift;
  my $key = shift || $url;

  elog ('XTM::Virtual', 3, "_assert xml for '$url', '$key'");
  return $cache{$key} if staleness ($key) <= 0;

  use XTM::XML;
  elog ('XTM::Virtual', 3, "  XML loading via $url");
  return $cache{$key} = new XTM (tie         => new XTM::XML (url => $url),
				 last_mod    => time,
				 last_syncin => time);
}

sub _assert_atm {
  my $url = shift;
  my $key = shift || $url;

  elog ('XTM::Virtual', 3, "_assert atm for '$url', '$key'");
  return $cache{$key} if staleness ($key) <= 0;

  use XTM::AsTMa;
  elog ('XTM::Virtual', 3, "  ATM loading via $url");
  return $cache{$key} = new XTM (tie         => new XTM::AsTMa (url => $url),
				 last_mod    => time,
				 last_syncin => time);
}

sub _assert_topic {
  my $tmurl = shift;
  my $key   = shift || $tmurl;

  elog ('XTM::Virtual', 3, "_assert topic for tmurl: $tmurl");
  return $cache{$key} if staleness ($key) <= 0;

  use URI;
  my $uri = new URI ($tmurl); 
  die "XTM::Virtual: remote hosting to '".$uri->authority."' not yet implemented." 
    unless $tmurl =~ $tmbase; # I'm on the same server

  ## starting from the bottom, working our way up
  elog ('XTM::Virtual', 3, "  resolving total: ", $uri->path);

  my @path = split (m|/|, $uri->path);
  my $tid  = pop @path || ($tmbase =~ m|tm://(.+)/| ? $1 : die "XTM::Virtual: Cannot determine server identity."); # 'se-namod';
  my $tm   = @path ? _assert_topic ($tmbase.join ("/", @path)) : _assert_xml ('','_peers');
  my $t    = $tm->topic ($tid); # might raise an exception which is propagated

  elog ('XTM::Virtual', 5, "  corresponding topic: ", $t);

  use XTM::PSI;
  my @os = @{$t->occurrences ( sub { my $o = shift; return $o->instanceOf->reference->href eq $XTM::PSI::priv{'knowledge'}; } )};
  die "XTM::Virtual: Could not find a knowledge occurrence for '$tid'" unless @os;
  elog ('XTM::Virtual', 5, " knowledge",  $os[0]);
  return $cache{$key} = _assert_expr ($os[0]->resource->href);
}

sub _assert_atom {
  my $expr = shift;
  my $key  = shift || $expr;

  elog ('XTM::Virtual', 3, "  working on '$expr'");
  return $cache{$key} if staleness ($key) <= 0;

  use URI;
  my $uri    = new URI ($expr);
  $uri->scheme ('file') unless $uri->scheme; # default is 'file:'
  my $scheme = $uri->scheme;

  elog ('XTM::Virtual', 3, "  loading from $uri, ($scheme) base '$urlbase' path: ".$uri->path);

  if (grep (/$scheme/, qw(http ftp file))) {
    my $url = $urlbase =~ /^$scheme/ ?
      scalar URI->new_abs ($uri->path, $urlbase) :
      $uri->as_string;
    elog ('XTM::Virtual', 4, "  loading from $url");
    return $url =~ /\.atm$/i ? _assert_atm ($url) : _assert_xml($url);
  } elsif ($uri->scheme eq 'tm') {
    my $url = scalar URI->new_abs ($uri->path, $tmbase);
    elog ('XTM::Virtual', 4, "  loading from $url");
    return _assert_topic ($url);
  } elsif ($expr =~ /^package:\/\/(.+)/i) { ## Firm database, et.al
    elog ('XTM::Virtual', 3, "  loading via $1");
    return _assert_package ($1);
    elog ('XTM::Virtual', 4, "      Done.");
  } else {
    die "XTM::Virtual: Unhandled scheme '".$uri->scheme."'in _assert_expr\n";
  }
}

sub _assert_expr {
  my $expr = shift;
  my $key  = shift || $expr;

  elog ('XTM::Virtual', 3, "_assert expr '$expr'");
  return $cache{$key} if staleness ($key) <= 0;

  my $tm;

  unless ($expr =~ /\s*\[\]\s*/) { # so no composite here
    $tm = _assert_atom ($expr, $expr);
  } else {
    # highly simplistic expression parser      
    $tm = new XTM;
    $tm->{id} = $expr; # just to give a good idea what it is about

    foreach my $e (split /\s*\[\]\s*/, $expr) {
      elog ('XTM::Virtual', 3, "working on '$e'");
      my $tm_to_be_added = _assert_atom ($e);
      elog ('XTM::Virtual', 4, "  merging new map (id=".($tm_to_be_added->{id} ? $tm_to_be_added->{id} : '??')." to ".($tm->{id} ? $tm->{id} : '?'));
      $tm->add ($tm_to_be_added->memory);
      push @{$tm->{depends}}, $e; # note, that I'm dependent on others
    }
  }
  $cache{$key}->{last_mod}   = $cache{$key}->{last_syncin} = time;
  return $cache{$key} = $tm;
}

sub _assert {
  my $r;
  eval {
    $r = _assert_expr (@_);
  }; if ($@) {
    elog ('XTM::Virtual', 1, "_assert failed ($@)", @_);
  };
  elog ('XTM::Virtual', 4, "   now asserted: ", \%cache);
  return $r;
}


sub _asserted {
  return [ keys %cache ];
}

=pod

=back

=head1 AUTHOR INFORMATION

Copyright 2001, 2002, Robert Barta <rho@telecoma.net>, All rights reserved.

This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.
http://www.perl.com/perl/misc/Artistic.html

=cut

1;

__END__
