package XTM::XML::UTF8;

require 5.004;
require Exporter;
@ISA = qw(Exporter);

@EXPORT_OK = qw (utf82iso iso2utf8);
#@EXPORT    = qw (utf82iso iso2utf8);

=pod

=head1 NAME

XTM::XML::UTF - XTM backwards compatible UTF support

=head1 DESCRIPTION

This package contains auxiliary functions to convert from UTF8 to Latin1
characters and vice-versa.

=head1 SYNOPSIS

  $s = "..some ugly characters ...";
  $t = utf82iso ($s);

  unless ($s eq iso2utf8 ($t)) {
    print STDERR "maybe you should not use iso2utf8\n";
  }

=head1 INTERFACE

=over

=item I<utf82iso>

converts an array and/or a single UTF-8 scalar into its ISOLatin equivalent.

=cut

#From: "Trevor Carden" <trevor@carden.demon.co.uk>
#To: "Perl-XML Mailing List" <perl-xml@listserv.activestate.com>
 
sub utf82iso {
  #convert special and multi-byte utf-8 bytes to numerical entities
  my $array;
  if (defined wantarray) {
      $array = [@_]; # copy
  } else {
      $array = \@_;  # modify in-place
  }
  for (@$array) {
     s/([&<>"\xc0-\xff])([\x80-\xbf]*)/
      #$1=start byte, $2=all utf-8 follow-on bytes
      my $res = ord($1); #builds up character value
      my $mask = 0x7f;   #significant bits in $res
      if ($2) { #unnecessary test but probably helps speed
        #merge utf-8 follow-on bytes into $res
        for my $i (unpack('C*',$2)) {
          #shift in 6 bits from follow-on byte
          $res  = ($res  << 6) | ($i & 0x3f);
          #but drop the extra byte-count bit from first byte
          $mask = ($mask << 5) |       0x1f ;
        }
      }
      "&#" . ($res & $mask) . ";"; /eg;
       }
    wantarray ? @$array : $array->[0];
}

=pod

=item I<iso2utf8>

and the other way round.

=cut

sub iso2utf8 {
  die "iso2utf8 not implemented";
  my $str = shift;
  $str =~ s/([\x80-\xff])/_iso2utf8($1)/eg;
  return $str;
}


sub _iso2utf8 {
  my $val = shift;
  return chr($val) unless $val & ~0x7f;
  my $str = chr($val & 0x3f | 0x80); #last follow-on byte
  $val >>= 6;
  my $data = 0x1f; #data bit positions in first of 2 utf8 bytes
  while ($val & ~$data) { #add follow-on byte if $val won't fit in $data
    $str = chr($val & 0x3f | 0x80) . $str; #lowest 6 bits + follow-on marker
    $val >>= 6;
    $data >>= 1; #allow for one more count bit in first utf8 char
  }
  return chr((0xfe & ~($data<<1)) | $val).$str; #first byte count bits + data
}

=pod

=head1 AUTHOR INFORMATION

Copyright 2001, Robert Barta <rho@telecoma.net>, All rights reserved.
 
This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.

=cut

1;
