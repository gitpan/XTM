package XTM::XML;

use strict;
use vars qw($VERSION @EXPORT @EXPORT_OK);

require Exporter;
require AutoLoader;

use base qw (XTM::IO);

$VERSION = '0.04';

use XTM::Memory;
use XTM::Log ('elog');

=pod

=head1 NAME

XTM::XML - Topic Map management, syncing with XML data

=head1 SYNOPSIS

  use XTM::XML;
  # reading a topic map description from an XML file
  $xml = new XTM::XML (file => 'mymap.tm');

=head1 DESCRIPTION

This package provides interfacing with external resources based on 
XTM (XML Topic Map) format as described in

=begin html

<BLOCKQUOTE>
<A HREF="http://www.topicmaps.org/xtm/1.0/">http://www.topicmaps.org/xtm/1.0/</A>
</BLOCKQUOTE>

=end html

=begin man

   http://www.topicmaps.org/xtm/1.0/

=end man

except 

=over

=item 

that it ignores all merging related constraints (TNC) given in
       http://www.topicmaps.org/xtm/1.0/#processing

=item

it only allows ONE SINGLE <topicMap> element in a document violating
    '4.4 XTM Document Conformance', item 2. The reasoning for this is
    that loading multiple maps implicitely means that some merging has
    to occur.

=item

All elements with no explicit ID element remain anonymous, except

=over

=item

<topic> and

=item

<association>

=back

elements which will get an ID assigned automatically.

=back


=head1 INTERFACE

=head2 Constructor

The constructor expects a hash as parameter containing one of the following fields:

=over

=item I<url>: 

If given then the XML data will be read/written from/to this url.

=item I<file>: 

If given then the XML data will be read/written from/to this file (This
is just a convenience function as it will be mapped to I<url>).

=item I<text>:

If given then the XML data will be read/written from/to this text. (See method
I<text> how to retrieve the current value).

=item I<auto_complete>

If set to 0, the XTM loader will NOT try to automatically generate topics which
have been mentioned without being declared.

=back

If several fields (C<file>, C<url>, C<text>) are specified, it is undefined which 
one will be taken.

Examples:

   $xtm = new XTM::XML (file => 'here.xml');
   $xtm = new XTM::XML (url  => 'file:here.xml',  # the same
			auto_complete => 0);      # but with auto_completion turned off
   $xtm = new XTM::XML (text => '<?xml version="1.0"?><topicMap> ...</topicMap>');

=cut

sub new {
  my $class   = shift;
  my %options = @_;

  elog ($class, 4, 'new');


  my $self = bless { }, $class;
  $self->{url} = 'inline:'.$options{text} if $options{text};
  $self->{url} = 'file:'.  $options{file} if $options{file};
  $self->{url} =           $options{url}  if $options{url};

  $self->{auto_complete} = defined $options{auto_complete} ? $options{auto_complete} : 1;

  return $self;
}

=pod

=head2 Methods

The methods C<sync_in>, C<sync_out> and C<last_mod> implement the methods from
the abstract class L<XTM::IO>

=over

=item I<last_mod> 

returns the UNIX time when the resource has been modified last. C<undef> is
returned if the result cannot be determined.


=cut

sub last_mod {
  my $self = shift;

  elog ('XTM::XML', 4, "last mod on XML ".$self->{url});
  if ($self->{url} =~ /^file:(.+)/) {
    use File::stat;
    my $stats = stat($1);
    return $stats->mtime;
  } elsif ($self->{url} =~ /^inline:/) {
    return undef;
  } else {
    elog ('XTM::XML', 3, "Warning: unimplemented scheme '".$self->{url}."' in last_mod");
    return undef;
  }
}

=pod

=item I<sync_in>

actually loads an XTM resource and returns a L<XTM::Memory> object.


=cut

use XTM::XML::MemoryBuilder;
use XML::SAX::ParserFactory;

sub sync_in {
  my $self = shift;

  elog ('XTM::XML', 3, 'sync in '.$self->{url});
  my $stream;
  if ($self->{url} =~ /^inline:(.*)/s) {
    $stream = $1;
  } else {                                                  # some kind of URL
    use LWP::Simple;
    $stream = get($self->{url}) || die "XTM::XML: Unable to load '$self->{url}'\n";
    elog ('XTM::XML', 5, "synced in stream", \$stream);
  }

  my $builder = new XTM::XML::MemoryBuilder (tm            => new XTM::Memory,
#					     auto_complete => $self->{auto_complete}
					    );
  my $parser  = XML::SAX::ParserFactory->parser(Handler          => $builder,
#						RequiredFeatures => {
#								     'http://xml.org/sax/features/validation' => 1,
#								    }
						);
#  print STDERR "I'm using ", ref ($parser), "\n";
# this is to silence Perl in -w context: I use undef values sometimes in expressions and I'm happy with it
  use Carp ();
  local $SIG{__WARN__} = sub {};

  $parser->parse_string($stream);

  if ($self->{auto_complete}) {

#print "topics: ", join ('\n', @{$builder->{tm}->topics()}), "\n";
#  use Data::Dumper;
#print Dumper $builder->{tm};

    foreach my $t (map {$builder->{tm}->topic($_)} @{$builder->{tm}->topics}) {
#print "checking out ", $t->id, "\n";
      push @{$builder->{mentioned}}, @{$t->connected};
      push @{$builder->{defined}},   $t->id;
    }
#print "defined: ", join ('\n', @{$builder->{defined}}), "\n";
    foreach my $a (map {$builder->{tm}->association($_)} @{$builder->{tm}->associations}) {
      push @{$builder->{mentioned}}, @{$a->connected};
    }
    foreach my $href (@{$builder->{mentioned}}) {
      use URI;
      my $u = new URI ($href);
      next if $u->scheme; # external
      next if $builder->{tm}->is_topic ($u->fragment);
      
      $builder->{tm}->add (new XTM::topic (id => $u->fragment, populate => \&XTM::topic::default_populate))
    }
  }

  return $builder->{tm};
}

=pod

=item I<sync_out>

is currently not implemented.


=cut

sub sync_out {
  warn "XTM::XML: sync_out not yet implemented.";
}

=pod

=back

=head1 SEE ALSO

L<XTM>

=head1 AUTHOR INFORMATION

Copyright 2002, Robert Barta <rho@telecoma.net>, All rights reserved.

This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.
http://www.perl.com/perl/misc/Artistic.html

=cut

1;

__END__
