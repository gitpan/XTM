package XTM::ATM;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

@ISA = qw(Exporter AutoLoader);
@EXPORT = qw( );
@EXPORT_OK = qw( atm2xtm xtm2atm );
$VERSION = '0.06';

use Carp;
use XTM::Log ('elog');
use XTM::Memory;

=pod

=head1 NAME

XTM::ATM - Topic Map Conversion from AsTMa

=head1 SYNOPSIS

  # usage A: immediate conversion
  use XTM::ATM;

  print atm2xtm (in  => sub { return <> }, # default anyway
		 out => sub { print @_; }, # default
		 err => sub { print STDERR @_ }, #default
		 auto_complete => 1,
		 basename => sub { return $_[0]; }
		);

  print xtm2atm (); # will die as it is not yet implemented

  # usage B: OO with on-demand sync-in
  # reading a topic map description from a file/url
  $atm = new XTM::ATM (url => 'mymap.atm');


=head1 DESCRIPTION

This package provides conversion routines between AsTMA 

=begin html

<BLOCKQUOTE>
<A HREF="http://topicmaps.bond.edu.au/astma/">http://topicmaps.bond.edu.au/astma/</A>
</BLOCKQUOTE>

=end html

=begin man

   http://topicmaps.bond.edu.au/astma/

=end man

and XTM

=begin html

<BLOCKQUOTE>
<A HREF="http://www.topicmaps.org/xtm/">http://www.topicmaps.org/xtm/</A>
</BLOCKQUOTE>

=end html

=begin man

   http://www.topicmaps.org/xtm/

=end man

=head1 NON-OO INTERFACE

=head2 Functions

=over

=item C<atm2xtm> 

=cut

sub atm2xtm {
  my %options = @_;

  $options{in}  ||= sub { return <> };
  $options{out} ||= sub { print @_; };
  $options{err} ||= sub { print STDERR @_; };

  my $log_level = $options{log_level} || 0;

  # virginal
  my $map     = undef;
  my $topic   = undef;
  my $assoc   = undef;
  my $comment = undef;
  
  my %mentioned; # here all topic id go which were mentioned in the atm file
  my %defined;   # all defined
  
  my %abbrs;     # abbreviations
  
  my $map_done = undef; # flags one-time thing, I hate these....

  while (defined ($_ = &{$options{in}})) {
    chomp;

    print STDERR "line: $_\n" if $log_level > 1;

    last if /^_die$/; # for testing, do not tell anyone

    while (s/\\$//) {
      $_ .= &{$options{in}};
      chomp;
    }
    &{$options{err}} ( ">$_<\n") if $log_level > 0;

    if (/^\s*\#(.+)/) {
      (my $c = $1);# =~ s/-->/- - >/g;  # you never know
      $comment .= ($comment ? "\n     " : "") .$c;
    } elsif (/^([^:]+)=(.+)$/) { # abbrev
      $abbrs{$1} = $2;
      &{$options{out}} ( qq|

<!-- $_ -->|);
    } elsif (/^\s*$/) { # flush
      if ($map) {
	&{$options{out}} (qq|<?xml version="1.0" encoding="$map->{encoding}"?>
<topicMap id="$map->{id}"
          xmlns       = 'http://www.topicmaps.org/xtm/1.0/'
          xmlns:xlink = 'http://www.w3.org/1999/xlink'>
|);
	undef $map;
      } elsif ($comment) {
	&{$options{out}} ( qq|

<!-- $comment -->|);
	undef $comment;
      } elsif ($assoc) {
	if ($assoc->{roles}) {
	  xmlify_assoc ($assoc, \%abbrs, %options);
	  foreach ($assoc->{roles} ? @{$assoc->{roles}} : ()) {
	    $mentioned{$_->[0]} = 1 if $_->[0]; # role
	    foreach my $p (@{$_->[1]}) {
	      $mentioned{$p} = 1; # player
	    }
	  }
	  $mentioned{$assoc->{type}} = 1 if $assoc->{type};
	} else { # an assoc without roles? must be trivial topic
	  xmlify_topic ({id => $assoc->{type}}, \%abbrs, %options);
	}
	undef $assoc;
    } elsif ($topic) {
      xmlify_topic ($topic, \%abbrs, %options);

      $defined{$topic->{id}} = 1;

      foreach ($topic->{types} ? @{$topic->{types}} : ()) {
	$mentioned{$_} = 1;
      }
      foreach ($topic->{occurrences} ? @{$topic->{occurrences}} : ()) {
	$mentioned{$_->[0]} = 1 if $_->[0];
	$mentioned{$_->[3]} = 1 if $_->[3];
      }
      foreach ($topic->{basenames} ? @{$topic->{basenames}} : ()) {
	$mentioned{$_->[0]} = 1 if $_->[0];
      }
	  
      undef $topic;
    }
##  } elsif (/^([^:]+)(:([^\#]+))?(\#.*)?$/) {
    } elsif (/^\s*\((.*?)\)\s*(\#.*)?$/) { # (assoc-type)?
      &{$options{err}} ( "found  '$1' assoc type\n") if $log_level > 0;
      $assoc->{type}  = $1;
    } elsif (/^\s*([^\s(:]+)(\s*\((.+)\))?\s*(\#.*)?$/) { # topic id (type)?
      &{$options{err}} ( "found topic id '$1' + type '$2' or assoc type\n") if $log_level > 0;
      $topic->{id}    = $1;
      $assoc->{type}  = $1;
      if ($3) { # it is a topic, now we know
	undef $assoc; 
	$topic->{types} = [ split /\s+/, $3 ];
      }
    } elsif (/^\s*([^:\#]+)(:\s*([^\#]*))?(\#.*)?$/) {
      my $lhs = $1;
      my $rhs = $3;
      &{$options{err}} ( "match: >>>$lhs<<< >>>$rhs<<<\n") if $log_level > 0;
      
      $lhs =~ s/^\s+//; $lhs =~ s/\s+$//;
      $lhs =~ s/^"(.*)"$/$1/;
      $rhs =~ s/^\s+//; $rhs =~ s/\s+$//;
      $rhs =~ s/^"(.*)"$/$1/;
      $rhs =~ s/\#.*//; # get rid of comment
      
      &{$options{err}} ( "clean: >>>$lhs<<< >>>$rhs<<<\n") if $log_level > 1;
      
      if (!$map_done) {
	$map->{id}       = $lhs;
	$map->{encoding} = $rhs || 'iso-8859-1';
	$map_done = 1; # one of the few places where you need a flag like this, argh
      } elsif ($lhs =~ /^bn\s*(@\s*(.+))?$/) { # baseName, so sure is topic
	&{$options{err}} ( "found topic bn scoped '$2' with rhs = '$rhs'\n") if $log_level > 0;
	$topic->{id} ||= $assoc->{type}; undef $assoc; # in case we thought its an assoc
	push @{$topic->{basenames}}, [ $2, $rhs ];
      } elsif ($lhs =~ /^oc\s*(@\s*([^\(\s]+))?(\s*\((.+)\))?$/) { # occurrence, so sure is topic
	&{$options{err}} ( "found topic oc scoped '$2', $4\n") if $log_level > 0;
	$topic->{id} ||= $assoc->{type}; undef $assoc; # in case we thought its an assoc
	push @{$topic->{occurrences}}, [ $2, 'ref', $rhs, $4 ];
      } elsif ($lhs =~ /^in\s*(@\s*([^\(\s]+))?(\s*\((.+)\))?$/) { # occurrence, so sure is topic
	&{$options{err}} ( "found topic in scoped '$2', $4\n") if $log_level > 0;
	$topic->{id} ||= $assoc->{type}; undef $assoc; # in case we thought its an assoc
	push @{$topic->{occurrences}}, [ $2, 'inline' , $rhs, $4 ];
      } else {
	&{$options{err}} ( "found assoc role  '$lhs' + role '$2'\n") if $log_level > 0;
	push @{$assoc->{roles}}, [ $lhs, [ split (/\s/, $rhs) ] ];
      }
    } else { # maybe topic id, maybe assoc type, time will tell
      &{$options{err}} ( "other line '$_'") if $log_level > 0;
      $comment .= $_;
    }
}


&{$options{err}} ( "\nall mentioned\n") if $log_level > 1;
foreach (sort keys %mentioned) {
  &{$options{err}} ( "  '", $_, "'\n") if $log_level > 1;
}
&{$options{err}} ( "\nall defined\n") if $log_level > 1;
foreach (sort keys %defined) {
  &{$options{err}} ( "  '", $_, "'\n") if $log_level > 1;
}

if ($options{auto_complete}) {
  &{$options{out}} ( qq|

<!-- auto completion begins here -->|);
}

&{$options{err}} ( "\nall missing\n") if $log_level > 1;
foreach (sort keys %mentioned) {
  my $t = e($_, \%abbrs);
  next if $defined{$t};
  # check to see whether this is relative or absolute
  use URI;
  my $u = new URI ($t);
  next if $u->scheme;
  
  &{$options{err}} ("'", $_, "'\n") if $log_level > 1;
  if ($options{auto_complete}) {
    xmlify_topic ({id => $_}, \%abbrs, %options);
  } else {
    &{$options{err}} ("atm2xtm: Topic '$_' was mentioned but not defined.\n");
  }
}

if ($options{auto_complete}) {
  &{$options{out}} ( qq|

<!-- auto completion ends here -->|);
}

sub ex {
  use URI;
  my $u = new URI (shift);
  return ($u->scheme ? '' : '#' ) . e(scalar $u, shift); # making it relative
}

sub e {
  my $s = shift;
  my $abbrs = shift;
  for (; $s =~ /&(.+?);/ && $abbrs->{$1}; $s =~ s/&(.+?);/$abbrs->{$1}/e) {};

  $s =~ s/\015\012?/\012/g;
  $s =~ s/&(?!(?:[a-zA-Z0-9]+|\#\d+);)/&amp;/g;
  $s =~ s/</&lt;/g;
  $s =~ s/>/&gt;/g;
  $s =~ s/\"/&quot;/g;
  $s =~ s/\'/&apos;/g;
  return $s;
}

sub xmlify_topic {
  my $topic = shift;
  my $abbrs = shift;
  my %options = @_;

  unless ($topic->{basenames}) { # derive a name from the id
    my $name = $topic->{id};
    $name =~ s/-/ /g;
    push @{$topic->{basenames}}, [ undef, $name ];
  }

  use Data::Dumper;
  &{$options{err}} (Dumper $topic) if $options{log_level} > 2;

  warn "topic id '".$topic->{id}."' is invalid in an XML context" unless $topic->{id} =~ /^[\w_:][\w\d-\.]*/ && 
                                                                         $topic->{id} !~ /^xml:/;  # Professional XML, page 33

  &{$options{out}} (qq|

  <topic id="$topic->{id}">|);
  foreach ($topic->{types} ? @{$topic->{types}} : ()) {
    &{$options{out}} ( qq|
    <instanceOf>
      <topicRef xlink:href="|.ex($_, $abbrs).qq|"/>
    </instanceOf>|);
  }
  foreach ($topic->{basenames} ? @{$topic->{basenames}} : ()) {
    &{$options{out}} ( qq|
    <baseName>|);
    if ($_->[0]) {
      &{$options{out}} ( qq|<scope><topicRef xlink:href="|.ex($_->[0], $abbrs).qq|"/></scope>|);
    }
    &{$options{out}} ( qq|
       <baseNameString>|.e($_->[1], $abbrs).qq|</baseNameString>
    </baseName>|);
  }
  foreach ($topic->{occurrences} ? @{$topic->{occurrences}} : ()) {
    &{$options{out}} ( qq|
    <occurrence>|);
    if ($_->[0]) {
      &{$options{out}} ( qq|
      <scope><topicRef xlink:href="|.ex($_->[0], $abbrs).qq|"/></scope>|);
    }
    if ($_->[3]) {
      &{$options{out}} ( qq|
      <instanceOf>
         <topicRef xlink:href="|.ex($_->[3], $abbrs).qq|"/>
      </instanceOf>|);
    }
    if ($_->[1] eq 'ref') {
      &{$options{out}} ( qq|
      <resourceRef xlink:href="|.ex($_->[2], $abbrs).qq|"/>|);
    } elsif ($_->[1] eq 'inline') {
      &{$options{out}} ( qq|
      <resourceData>|.e($_->[2], $abbrs).qq|</resourceData>|);
    } else {
      warn "Weird selector '$_->[1]'";
    }
    &{$options{out}} ( qq|
    </occurrence>|);
  }
  &{$options{out}} ( qq|
  </topic>|);
}

sub xmlify_assoc {
  my $assoc = shift;
  my $abbrs = shift;
  my %options = @_;

  use Data::Dumper;
  &{$options{err}} ( Dumper $assoc) if $options{log_level} > 2;
  &{$options{out}} ( qq|

  <association>|);
  if ($assoc->{type}) {
    &{$options{out}} ( qq|
    <instanceOf>
      <topicRef xlink:href="|.ex($assoc->{type}, $abbrs).qq|"/>
    </instanceOf>|);
  }
  foreach ($assoc->{roles} ? @{$assoc->{roles}} : ()) {
    &{$options{out}} ( qq|
    <member>|);
    if ($_->[0]) {
      &{$options{out}} ( qq|
       <roleSpec>
         <topicRef xlink:href="|.ex($_->[0], $abbrs).qq|"/>
       </roleSpec>|);
    }
    foreach my $p (@{$_->[1]}) {
      &{$options{out}} ( qq|
       <topicRef xlink:href="|.ex($p, $abbrs).qq|"/>|);
    }
    &{$options{out}} ( qq|
    </member>|);
  }
  &{$options{out}} ( qq|
  </association>|);
}



&{$options{out}} ( qq|

</topicMap>
|);

}

=pod

=item C<xtm2atm>

Not implemented yet.


=cut

sub xtm2atm {
  die "XTM::ATM: xtm2atm not implemented yet. Sorry.";
}

=pod

=back

=head1 OO INTERFACE

=head2 Constructor

The constructor expects a hash as parameter containing one of the following fields:

=over

=item I<url>: 

If given then the AsTMa data will be read/written from/to this url.

=item I<file>: 

If given then the AsTMa data will be read/written from/to this file (This
is just a convenience function as it will be mapped to I<url>).

=item I<text>: 

If given then the AsTMa data will be read/written from/to this text. (See method
I<text> how to retrieve the current value).

=back

If several fields are specified, an exception will be raised.

Examples:

   $xtm = new XTM::ATM (file => 'here.xml');
   $xtm = new XTM::ATM (url  => 'file:here.xml');  # the same
   $xtm = new XTM::ATM (text => '....');

=cut

sub new {
  my $class = shift;
  my %options = @_;
  elog ($class, 4, 'new');
  die "XTM::ATM: constructor: too many contradicting sources" if keys %options > 1;
  my $self = bless { }, $class;
  $self->{url} = 'inline:'.$options{text} if $options{text};
  $self->{url} = 'file:'.  $options{file} if $options{file};
  $self->{url} =           $options{url}  if $options{url};
  return $self;
}

=pod

=head2 Methods

The methods C<sync_in>, C<sync_out> and C<last_mod> implement the methods from
the abstract class.

=over

=item C<last_mod> 

returns the UNIX time when the resource has been modified last. C<undef> is
returned if the result cannot be determined.


=cut

sub last_mod {
  my $self = shift;

  elog ('XTM::ATM', 4, "last mod on ATM ".$self->{url});
  if ($self->{url} =~ /^file:(.+)/) {
    use File::stat;
    my $stats = stat($1);
    return $stats->mtime;
  } elsif ($self->{url} =~ /^inline:/) {
    return undef;
  } else {
    elog ('XTM::ATM', 3, "Warning: unimplemented scheme '".$self->{url}."' in last_mod");
    return undef;
  }
}

=pod

=item C<sync_in>

actually loads an AsTMa resource and returns a L<XTM::Memory> object.


=cut

sub sync_in {
  my $self = shift;

  elog ('XTM::ATM', 3, 'sync in '.$self->{url});
  # fetch the data
  my $atm_stream;
  if ($self->{url} =~ /^inline:(.*)/) {
    $atm_stream = $1;
  } else { # some kind of URL
    use LWP::Simple;
    $atm_stream = get($self->{url}) || die "XTM::ATM: Unable to load '$self->{url}'\n";
    elog ('XTM::ATM', 5, "synced in stream", \$atm_stream);
  }

  # convert from AsTMa into XML
  my $xtm_stream;
  my @atm = split /\n/, $atm_stream.'\n\n#\n'; # ugly trick to avoid undefs there, hmmm
  atm2xtm (in  => sub { shift @atm; },
           out => sub { $xtm_stream .= join "", @_; },
	   err => sub {}, # ignore undefined topics
	   auto_complete => 1,
	   log_level => 0
	   );
  use XTM::XML::Latin1Parser;
  my $grove_builder = XTM::XML::Latin1Parser->new;
  use XML::Parser::PerlSAX;
  my $parser = XML::Parser::PerlSAX->new ( Handler => $grove_builder );
  my $grove;
  $grove  = $parser->parse ( Source => { String => $xtm_stream,
                                         Encoding => 'ISO-8859-1' } );
  use Data::Grove::Visitor;
  my $tm = new XTM::Memory;
  use XTM::XML::Grove2TM;
# this is to silence Perl in -w context: I use undef values sometimes in expressions and I'm happy with it
  use Carp ();
  local $SIG{__WARN__} = sub {};
  $grove->accept_name (XTM::XML::Grove2TM->new, $tm);
  elog ('XTM::XML', 5, '   sync in tm: ', $tm);
  return $tm;
}

=pod

=item C<sync_out>

is currently not implemented.


=cut

sub sync_out {
  warn "XTM::ATM: sync_out not yet implemented.";
}

=pod

=back




=head1 SEE ALSO

L<XTM>

=head1 AUTHOR INFORMATION

Copyright 2001, Robert Barta <rho@telecoma.net>, All rights reserved.
 
This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.

=cut

1;

__END__

