#!/usr/bin/perl

package XTMFormatter;


use XTM::AsTMa::Parser;
use XTM::Namespaces;
use XTM;

use vars qw(@ISA $undefined_topics $log_level);
@ISA = qw(XTM::AsTMa::Parser);

$undefined_topics = 'auto_complete';
$log_level        = 0;

use IO::String;
use XML::Writer;
use Data::Dumper;


sub new {
  my $class = shift;
  return bless {writer => shift}, $class;
}


sub handle_begin {
}

sub handle_end {
  my $self = shift;

  $self->flush();
  $self->{writer}->endTag([ $XTM::Namespaces::topicmap_ns, "topicMap"]);
  $self->{writer}->end();
}

sub handle_trailer_start {
  my $self = shift;
  $self->handle_comment ("auto completion begins here") if ($undefined_topics eq 'auto_complete');
}

sub handle_undefined_topic {
  my $self = shift;
  my $tid  = shift;

##print "called undef '$tid' $undefined_topics\n";

  if ($undefined_topics eq 'auto_complete') {
    my $t = new XTM::topic (id => $tid);
    { # default base name
      my $name = $t->id;
      $name =~ s/-/ /g;
      my $b = new XTM::baseName ();
      $b->add_baseNameString (new XTM::baseNameString (string => $name));
      $b->add_scope          (new XTM::scope());
      $b->scope->add_reference_s (new XTM::topicRef (href => $XTM::PSI::xtm{universal_scope}) );
      $t->add__s ($b);
    }
    $self->handle_component ($t);
  } elsif ($undefined_topics eq 'warn') {
    warn "XTM::astma2xtm: topic '".$u->fragment."' mentioned but not defined\n";
  } else {
    # ignore
  }
}

sub handle_trailer_end {
  my $self = shift;
  $self->handle_comment ("auto completion ends here") if ($undefined_topics eq 'auto_complete');
}

sub handle_comment {
  my $self = shift;
  my $comment = shift;

  unshift @{$self->{output}}, "$comment\n"; # stall these for a moment
}

sub flush {
  my $self = shift;

  if ($self->{encoding_found}) {
    while (my $c = pop (@{$self->{output}})) {
      $self->{writer}->comment ($c);
    }
  }
}

sub handle_encoding {
  my $self = shift;
  my $name = shift;
  my $encoding = shift;

  $self->{writer}->xmlDecl($encoding);
  $self->{writer}->startTag([ $XTM::Namespaces::topicmap_ns, "topicMap"],
			    "id"          => $name,
			    [ $XTM::Namespaces::xlink_ns, "href" ] => "",
			   );
  $self->{encoding_found} = 1;
}


sub handle_component {
  my $self = shift;
  my $c    = shift;

  unless ($self->{encoding_found}) { # default
    $self->handle_encoding ('map', 'iso8859-1');
  }
  $self->flush();
  push @{$self->{mentioned}}, @{$c->connected};
  push @{$self->{defined}},   $c->id if ref ($c) eq "XTM::topic";
  $c->xml($self->{writer});
}

1;

package main;

use strict;
use vars qw($VERSION);

$VERSION = "0.2";


=pod

=head1 NAME

astma2xtm.pl - an AsTMa to XTM converter 

=head1 SYNOPSIS

  cat map.atm | astma2xtm.pl <command line switch>... > map.xtm

=head1 DESCRIPTION

This filter consumes on STDIN a topic map written in AsTMa syntax as described
at

 http://topicmaps.bond.edu.au/astma/

and produces on STDOUT an XTM representation of this map.
All conversion problems and warnings will go to STDERR.

Type 'help' within this shell to get an overview over available
commands.

=head1 OPTIONS

Following command line switches are understood by the program:

=over

=item B<help> 

...does hopefully what you would expect.

=item B<undefined_topics> (default: auto_complete) 

This directive controls how the parser will react on topics which are mentioned but never defined
in this AsTMa instance:

=over

=item auto_complete will cause the topics to be created with some reasonable default baseName,

=item warn will create a warning for each use on STDERR,

=item ignore will do just this

=back

=cut

$XTMFormatter::auto_complete = 0;

=pod

=item B<copy-ids> (default: no)

If on, then the converter will copy all IDs, not only of the topics into the XTM code.
Currently not implemented.

=cut

my $copy_ids = 0;

=pod

=item B<basename-generation> (default: remove blanks)

This feature will allow to customize B<how> the basename is derived
from the topic information. Currently, all dashes will be converted into
blanks.

=cut

my $basename_generation = 0;

=pod

=item B<copy-default-psi> (default: 1) 

By default, the PSIs of default type, default scope are copied into the XTM code. As any
XTM processor should add them when reading the XTM instance, they could be dropped without
a loss of information

=cut

my $copy_default_psi = 1;

=pod

=item B<log-level> (default: 0) 

The log level determines the verbosity of the program for the STDERR output. This is for debugging mainly.

=cut

my $log_level = 0;

=pod

=item B<about> (default: no) 

The program will print out some information about the software itself, (version) and 
will terminate thereafter.

=cut

my $about = 0;

=back

=head1 AsTMa (Asymptotic Topic Map), the Notation

Please refer to the online documentation

   http://topicmaps.bond.edu.au/astma/


=head1 AUTHOR INFORMATION

Copyright 2001, 2002, Robert Barta <rho@telecoma.net>, All rights reserved.
 
This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.

=cut

use Getopt::Long;
use Pod::Usage;
use Data::Dumper;


my $help;
if (!GetOptions ('help|?|man'          => \$help,
		 'undefined-topics=s'  => \$XTMFormatter::undefined_topics,
		 'copy-ids'            => \$copy_ids,
		 'basename-generation' => \$basename_generation,
		 'copy-default-psi'    => \$copy_default_psi,
		 'log-level=i'         => \$log_level,
		 'about!'              => \$about,
		) || $help) {
  pod2usage(-exitstatus => 0, -verbose => 2);
}

$XTMFormatter::log_level = $log_level;

die "Copy ids currently not implemented" if $copy_ids;
die "Customizable basename generation currently not implemented" if $basename_generation;
die "Suppressing PSIs is not yet supported." unless $copy_default_psi;

if ($about) {
  use XTM;
  print STDOUT "AsTMa Topic Map Converter ($VERSION)
XTM ($XTM::VERSION)
XTM::AsTMa ($XTM::AsTMa)
XTM::AsTMa::Parser ($XTM::AsTMa::Parser)
";
  exit;
}


my $buffer = '';
my $output = IO::String->new ($buffer);


my $writer = $XML::Writer::VERSION =~ /_\d/ ? # patched
  new XML::Writer(OUTPUT     => $output,
		  NAMESPACES => 1,
		  NEW_LINES  => 1,
		  PREFIX_MAP => {$XTM::Namespaces::xlink_ns    => 'xlink',
				 $XTM::Namespaces::topicmap_ns => '' })
  : # unpatched
  new XML::Writer(OUTPUT     => $output,
		  NAMESPACES => 1,
		  NEW_LINES  => 1,
		  PREFIX_MAP => {$XTM::Namespaces::xlink_ns    => 'xlink',
				 '' => $XTM::Namespaces::topicmap_ns });  # bug in XML::Writer

my $fo     = new XTMFormatter($writer);

undef $/; # read all
$fo->handle_astma (text          => <>,
		   log_level     => $log_level);
$output->close();
print $buffer;

__END__
