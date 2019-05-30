#!/usr/bin/perl -w 
use strict;
if( @ARGV != 2) {
    print "Usage:  $0 final.nodes insertN\n";
    exit 0;
}

#CR848821.12_R	f	1	95891	CABZ01041119.1_F	f	2525	11178	0	0	0.00039619651347067	1.04285073676547e-05	0.000406625020838325	One
#	One

my $fh1=shift @ARGV;
my $lower=shift @ARGV;
#print "Start finding header.......\n";
my $next;
my $length;
my $next_info;
my $before;
my $read;

open FH1, "< $fh1";
while(<FH1>)
{
  chomp($_);
  my @rec=split(/\s+/,$_);
  $next->{$rec[0]}=$rec[1];
  $before->{$rec[1]}=$rec[0];
  $length->{$rec[0]}{$rec[1]}=0;
  $length->{$rec[1]}{$rec[0]}=0;
}
close FH1;
#my $real_header;
foreach my $key (keys %$next)
{
   if (!exists($before->{$key}) && !exists($read->{$key}))
   {
   print $key; 
   #   $real_header->{$key}=1;
    printnode ($key)
   }
}
#print "Finishing finding header.......\n";
my $temp;
sub printnode
{ 
  my ($key1)=@_; 
#  print $key1."(".$next_info->{$key1}{$next->{$key1}}.")->";
#  $mark->{$key1}=1;
  if (exists ($next->{$key1}) )
  {
     print "->";
     
     if (int($length->{$key1}{$next->{$key1}}) < $lower)
     {
       print "N(".($lower - int($length->{$key1}{$next->{$key1}})).")->";
     }
     print $next->{$key1};
     return (printnode($next->{$key1})); 
  }
  elsif (!exists ($next->{$key1}))
  {
    if ($key1=~/([\S]+)\/r$/)
    {
    
      $read->{$1}=1;
    }
    else 
    {
      $temp=$key1."/r";
      $read->{$temp}=1;
    }
   #  print $key1."(".$next_info->{$key1}{$next->{$key1}}.")->";
     print "\n";
  }
} 

