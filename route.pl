#!/usr/bin/perl -w 
use strict;
if( @ARGV != 1) {
    print "Usage: $0 find-linker-route.result \n";
    print "Destination: print route connection from find-linker-route.result \n";
    print "Note: This script split ->N(100)-> form find-linker-route.result \n";
    exit 0;
}

my $fh1=shift @ARGV;
open FH1, "< $fh1";
while(defined($_=<FH1>))
{
  chomp($_);
  my @rec=split(/-\>N\(100\)-\>/,$_);
  my $i=0;
  while($rec[$i+1]){
     print  $rec[$i]."\t".$rec[$i+1]."\n";
     $i++;
  }
}
close FH1;
