#!/usr/bin/perl -w 
use strict;
if( @ARGV != 3 ) {
    print "Usage: grep-ID-boat.pl  BOAT-file ID-file column-in-big-file \n";
    print "Destination: find the common dataset from the plus-file and minus-file\n";
    print "Note:This script can be used to identify cis- and trans-\n";
    print "Note:This script can also be used to the entries in target file which source file uncover \n";
    exit 0;
}
my $fh1=shift @ARGV;
my $fh2=shift @ARGV;
my $fh3=shift @ARGV;
open FH2,"<$fh2";
open FH1,"<$fh1";
my $minus;
while (<FH2>)
{
#dm_10001_p.1.0  dm_10001_m.0.47
#dm_10001_p.1.0  dm_10001_m.0.85
  chomp($_);
  $_ =~ s# ##g;  
  $minus->{$_}=1;
}
close FH2;
while (<FH1>)
{
  chomp($_);
  my @rec=split(/[\s]+/,$_);
  $rec[$fh3-1] =~ s# ##g;
  if (! exists($minus->{$rec[$fh3-1]}))
   {
   print $_."\n";
   }
   
}
close FH1;

