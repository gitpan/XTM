#!/usr/bin/perl

use strict;
no strict ('subs');
use vars qw($VERSION);

$VERSION = "0.2";

=pod

=head1 NAME

XTM Bench - a simple XTM Interpreter

=head1 SYNOPSIS

  xtm.pl <command line switch>...

=head1 DESCRIPTION

This simple, textual oriented user interface gives access to some Topic
Map functions. This program is mainly thought for quick prototyping
and testing Topic Maps and/or TM software.

For a more convenient environment see for the server package.

=head1 OPTIONS

Following command line switches are understood by the program:

=over

=item history <file> (default: none) 

file which will be replayed at start of session. You can have any number of histories
here, they will be all replayed in the order given.

=cut

my @history = (); # can be a list of histories actually, will be concatenated

=pod

=item loglevel n (default: 1)

Controls the log level.

=cut

my $loglevel = 1;

=pod

=item about (default: no) 

The program will print out some information about the software itself, (version) and 
will terminate thereafter.

=cut

my $about = 0;

=back

=head1 FILES

The interpreter will look for history files:

      $ENV{HOME}/.xtm/history
      $ENV{HOME}/.xtmhistory
      ./.xtmhistory

in this order taking only the first it will find. It will only use the last
100 lines.

=head1 AUTHOR

  rho@telecoma.net, Copyright 2001

=cut

use Getopt::Long;
use Pod::Usage;

my $help;
if (!GetOptions ('help|?|man' => \$help, 
		 'history=s'  => \@history,
		 'loglevel=i' => \$loglevel,
		 'about!'     => \$about,
		) || $help) {
  pod2usage(-exitstatus => 0, -verbose => 2);
}


if ($about) {
  use XTM;
  print STDOUT "XTMD Topic Map interpreter ($VERSION)
XTM ($XTM::VERSION)
SOAP::Lite ($SOAP::Lite::VERSION)
";
  exit;
}



##BEGIN { $SIG{'__WARN__'} = sub {  } }  #gusch

use Term::ReadLine;
use Data::Dumper;
use XTM;
use XTM::Log;
use XTM::XML;

my $term = new Term::ReadLine 'XTM Interpreter';
my $prompt = "xtm> ";
my $OUT = $term->OUT || STDOUT;



load_history();


##-- work on history files -----------------------------------------
foreach my $h (@history) {
  use File::Slurp;
  print $OUT "Replaying '$h'\n";
  ExecuteLineList (read_file($h));
}

my $tm; # will have later variables here....
my $scope = undef;
$XTM::Log::loglevel = $loglevel;

#-- main -----------------------------------------------------------

undef $_;
do {
  ExecuteLine ($_) unless /^$/;
} while (defined ($_ = $term->readline($prompt)));
print $OUT "\n"; #argh.

##-- main end -------------------------------------------------------

save_history();

exit;

sub load_history { ## without executing it
  my $xtmhistory;
  if (     -r ($xtmhistory = $ENV{HOME}."/.xtm/history")) {
  } elsif (-r ($xtmhistory = $ENV{HOME}."/.xtmhistory")) {
  } elsif (-r ($xtmhistory =            ".xtmhistory")) {
  } else {
    return;
  }
##print $OUT "reading from $xtmhistory\n";
  eval {
    use File::Slurp;
    my @l = read_file ($xtmhistory);
    my $l = scalar @l >= 100 ? 100 : scalar @l;  ## only last 100, otherwise eternal growth, a net schlecht
    foreach my $l (@l[-$l..-1]) {
      chomp $l;
      $term->AddHistory ($l);
    }
  }; print $OUT $@ ? "Exception: $@" : "";
}

sub save_history {
##print $OUT "chceking $ENV{HOME}..." ;
  my $xtmhistory;
  if (-d $ENV{HOME}."/.xtm/") {
    $xtmhistory = $ENV{HOME}."/.xtm/history";
  } elsif ($ENV{HOME}) {
    $xtmhistory = $ENV{HOME}."/.xtmhistory";
  } else {
    $xtmhistory = ".xtmhistory";
    }
##print $OUT "writing to $mqlhistory" ;
  eval {
    use File::Slurp;
    append_file ($xtmhistory, map { $_."\n" } $term->GetHistory ());
  }; print $OUT $@ ? "Exception: $@" : "";
}


sub ExecuteLineList {
  foreach my $l (@_) {
    chomp $l;
    last if $l =~ /^skip/;     # skip rest of the file
    print $OUT "   $l\n";
    ExecuteLine ($l);
    $term->AddHistory ($l);
  }
}

sub ExecuteLine {
  foreach my $c (split (";", shift)) {
    ExecuteCommand ($c);
  }
}


sub ExecuteCommand {
  $_ = shift;
  s/^\s*//;

##print $OUT "Executing...$_....\n";

  if (/^$/) { 
    # empty line ignore
  } elsif (/^\#/) {     # comment
    print $OUT "comment\n";

##-- history --in out -----------------------------------------
  } elsif (/^history\s*(([<>])\s*(.*))?/) {
    eval {
      use File::Slurp;
      if ($2 eq '>') {
	write_file ($3, join ("\n",  grep (!/^history/, $term->GetHistory ()))."\n");
      } elsif ($2 eq '<') {
	ExecuteLineList (read_file($3));
      } else {
	print $OUT join ("\n",  $term->GetHistory ()), "\n";
      }
    }; print $OUT $@ ? "Exception: $@" : "";
##-- scoping -------------------------------------------------
  } elsif (/^scope(\s+(.+?)\s*)?$/) {
    if ($1) {
      $scope = $2;
    } else {
      print $OUT (defined $scope ? $scope : "-- undefined --"),"\n";
    }
##-- loading -------------------------------------------------
  } elsif (/^load\s+(.+?)\s*$/) {
    my $url = $1;
    eval {
      $tm = new XTM (tie => new XTM::XML (url => $url));
    }; if ($@) {
      print $OUT "xtm: Exception: $@\n";
    }
##-- the gory details ------------------------------------------------
  } elsif (/^dump/) {
    print $OUT Dumper $tm;
##-- finding -------------------------------------------------
  } elsif (/^find(\s+(.+?)\s*)?$/) {
    my $query = $2 if $1;
    eval {
      my $ts = $tm->topics ($query);
      my $bns = $tm->baseNames ($ts, [ $scope ]);
      foreach my $tid (sort { $bns->{$a} cmp $bns->{$b} } keys %$bns) {
	print $OUT "$tid: $bns->{$tid}\n";
      }
    }; if ($@) {
      print $OUT "xtm: Exception: $@";
    }
  } elsif (/^topic\s+(\S+)/) {
    my $tid = $1;
    eval {
      output_topic ($tm->topic ($tid));
    }; if ($@) {
      print $OUT "xtm: Exception: $@";
    }
  } elsif (/^assoc\s+(\S+)/) {
    my $aid = $1;
    eval {
      output_assoc ($tm->association ($aid));
    }; if ($@) {
      print $OUT "xtm: Exception: $@";
    }
  } elsif (/^loglevel(\s+(\d+))?/) {
    $XTM::Log::loglevel = $2 if $1;
    print $OUT $XTM::Log::loglevel,"\n";
  } elsif (/^exit/ || /^quit/) {
    save_history();
    exit;

  } elsif (/^help/ || /\?/ || /^command/) {
    print $OUT "
load  <url>                          loading the topic map from the <url>
topic <topic-id>                     shows some information about a particular topic
assoc <assoc-id>                     shows some information about a particular association
find  <query>                        finds all topics according to <query> (see XTM::Memory)
scope [ <scope-tid> ]                show/set scope

dump                                 dumps out the whole map (can be huge!)

history                              show history
history < <file>         	     loading a history from a file
history > <file>         	     saving the current history to a file

loglevel  n                          set logging level to n

exit                                 yes, exit
quit                                 ditto

";


##-- no clue ---------------------------------------------------------
  } else {
    print $OUT "what '$_'?\n"
  }

}

sub output_assoc {
  my $a = shift;

#  print $OUT Dumper $a;
  print $OUT "(scoped by ".join (", ", map { $_->href } @{$a->scope->references}). ")\n";
  print $OUT "is-a:  ";
  my $type = $a->instanceOf->{reference}->{href} if $a->instanceOf;
  $type =~ s/^#//;
  print $OUT "   $type\n";

  print $OUT "members:\n";
  foreach my $m (@{$a->members}) {
    my $role = $m->roleSpec ? $m->roleSpec->reference->href : "-";
    $role =~ s/^\#//;
    print $OUT "   role:    $role\n";
    print $OUT "   players: ".join (", ", map { my $s = $_->href; $s =~ s/^\#//; $s } @{$m->references}). "\n";
  }
}

sub output_topic {
  my $t = shift;

#  print $OUT Dumper $t;
  print $OUT "baseNames:\n";
  foreach my $b (@{$t->baseNames}) {
    print $OUT "   ".$b->baseNameString->string, 
               " (scoped by ".join (", ", map { $_->href } @{$b->scope->references}). ")\n";
  }
  print $OUT "is-a:\n";
  foreach my $i (@{$t->instanceOfs}) {
    my $type = $i->{reference}->{href};
    $type =~ s/^#//;
    print $OUT "   $type\n";
  }
  print $OUT "occurrences:\n";
  foreach my $o (@{$t->occurrences}) {
    print $OUT "   ".($o->resource->isa ('XTM::resourceData') ?
		      $o->resource->data : $o->resource->href);
    my $type = $o->instanceOf->reference->href;
    $type =~ s/^#//;
    print $OUT " (typed: ", $type;
    print $OUT " ,scoped by ".join (", ", map { $_->href } @{$o->scope->references}). ")\n";
  }
  print $OUT "associations:\n";
  foreach my $a (@{$tm->associations ("has-role ".$t->id)}) {
    print $OUT "as role in ".$a, "\n";
  }
  foreach my $a (@{$tm->associations ("has-member ".$t->id)}) {
    print $OUT "as member in ".$a, "\n";
  }
}

__END__
