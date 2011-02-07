#!/usr/bin/perl
# ACL to EXOS POLICY CONVERTER version 0.05
# THIS SCRIPT AND ASSOCIATED FILES ARE OPEN SOURCE
######
#THE INFORMATION AND SPECIFICATIONS IN THIS SCRIPT ARE SUBJECT TO CHANGE WITHOUT
#NOTICE. ALL INFORMATION AND SPECIFICATIONS IN THIS SCRIPT ARE PRESENTED WITHOUT
#WARRANTY OF ANY KIND, EXPRESS OR IMPLIED. YOU TAKE FULL RESPONSIBILITY FOR YOUR
#USE OF THIS SCRIPT. USE THIS SCRIPT AT YOUR OWN RISK.
# PLEASE REPORT ERRORS TO mhelm@extremenetworks.com KNOWING THAT THERE IS NO
# PROMISE, EXPRESS OR IMPLIED, THAT ERRORS WILL BE FIXED
###
##
##  perl -w aclconverter.pl {aclfilename} [-c] [> outputfile]
##
##  Example:
##  perl -w sample.acl -c | sampleacl.pol
##
##  The above example results in a compressed policy file (no indents, one \n)
##
##  NOTE: icmptype.txt, icmpcode.txt, and the ACL file to be converted must be
##  in the same directory as aclconverter.pl
##
######
use strict;
die "No Filename!" unless defined (my $filename = $ARGV[0]);
my $comp = 0;
if (defined $ARGV[1]) {
$comp = ($ARGV[1] =~ m/\-c/);
}
my $nextln = "\n";
my $smspacer = "   ";
my $spacer = "      ";
if ($comp == 1) {
   $nextln = " ";
   $spacer = "";
   $smspacer = " ";
}
my $indent =
my $lineno = 1;
my $element;
my $elnum = 0;
my $named = 0;
my $name = "";
my $num  = 0;
my $extd = 0;
my $action = "";
my $actmod = "";
my $conmod = "";
my $proto = "";
my $sa = "";
my $da = "";
my $sm = "";
my $dm = "";
my $sp = "";
my $dp = "";
my $line;
my @eline;
my @line;
my $fln;
my $fname;
my $fno;
my $fcno;
open (ACLFILE, "$filename") || die "ACL file not found in directory.\n";
$line = <ACLFILE> || die "Unexpected end of ACL lines.\n";
$named = ($line =~ m/ip\saccess\-list/);
@line = split (/\s+/, $line);
if ($named == 1) {
   $name = pop (@line);
   $extd = ($line =~ m/extended/);
} else {
   $num = $line[1];
   $extd = ((($num > 99) && ($num < 1300)) || (($num > 1999) && ($num < 2000))) or $extd = 0;
   $name = "acl_$num";
}
close ACLFILE;
open (ACLFILE, "$filename") || die "ACL file not found in directory.\n";
while ($line = <ACLFILE>) {
   if ($named == 1 && $lineno == 1){
      $line = <ACLFILE> || die "Unexpected end of ACL lines.\n";
   }
   if ($line =~ s/dscp//){
      die "dscp condition not supported\n";
   }
   if ($line =~ s/dscp//){
      die "dynamic condition not supported\n";
   }
   if ($line =~ s/ttl//){
      die "ttl condition not supported\n";
   }
   if ($line =~ s/log-input//){
      die "log-input condition not supported\n";
   }
   if ($line =~ s/reflect//){
      die "reflect condition not supported\n";
   }
   if ($line =~ s/time-range//){
      die "time-range condition not supported\n";
   }
   if ($line =~ s/precedence//){
      die "precedence condition not supported\n";
   }
   if ($line =~ s/option//){
      die "option condition not supported\n";
   }
   $line =~ s/\soperator//; # We don't need this to recognise SP/DP.
   $line =~ s/access\-list\s$num//;
   if ($line =~ s/(permit)// || $line =~ s/(deny)//) {
      $action = $1;
   }
   $line =~ s/(host\s)([0-9]+\.)([0-9]+\.)([0-9]+\.)([0-9]+)/$2$3$4$5\/32/g;
   if ($extd == 1) {
      $line =~ s/ip\s//;
      if ($line =~ s/tcp\s//) {
         $proto = "tcp";
         if ($line =~ s/established//){
            $conmod = $conmod."TCP-flags RST\;".$nextln.$spacer."TCP-flags ACK\;".$nextln;
         }
      }
      if ($line =~ s/udp\s//) {
         $proto = "udp";
      }
      if ($line =~ s/icmp\s//) {
         $proto = "icmp";
         open (TYPEFILE, "icmptype.txt") || die "icmptype.txt not found in directory.\n";
         while ($fln = <TYPEFILE>) {
            ($fname, $fno) = split (/\s/,$fln);
            if ($line =~ s/$fname//) {
               $conmod = $conmod."ICMP-type $fno \;".$nextln;
            }
         }
         close TYPEFILE;
         open (CODEFILE, "icmpcode.txt") || die "icmpcode.txt not found.\n";
         while ($fln = <CODEFILE>) {
             ($fname, $fno, $fcno) = split (/\s/,$fln);
             if ($line =~ s/$fname//) {
                $conmod = $conmod."ICMP-type $fno \;".$nextln.$spacer."ICMP-code $fcno \;".$nextln;
             }
         }
         close CODEFILE;
         if ($line =~ s/(\s[0-9]+)(\s[0-9]+)\s//) {
            $conmod = $conmod."ICMP-type$1 \;".$nextln.$spacer."ICMP-code$2 \;".$nextln;
         }
      }
      $line =~ s/(range\s)([0-9]+)\s([0-9]+)/port_rg_$2\-$3/g;
      open (PORTFILE, "ports.txt") || die "ports.txt file not found in directory.\n";
      while ($fln = <PORTFILE>) {
         ($fname, $fno) = split (/\s/,$fln);
         $line =~ s/$fname/$fno/;
      }
      close PORTFILE;
      $line =~ s/([0-9]+\.)([0-9]+\.)([0-9]+\.)([0-9]+\s)([0-9]+)\.([0-9]+)\.([0-9]+)\.([0-9]+)/$1.$2.$3.$4."mask_".(255-$5)."\.".(255-$6)."\.".(255-$7)."\.".(255-$8)/eg;
      if ($line =~ s/log//){
         $actmod = $actmod."log \;".$nextln;
      }
      if ($line =~ s/fragments//){
         $conmod = $conmod."fragments \;".$nextln;
      }
      if ($line =~ s/tos\s([0-9]+)//){
         $conmod = $conmod."IP-TOS $1 \;".$nextln;
      }
      $line =~ s/gt\s/port_gt_/g;
      $line =~ s/lt\s/port_lt_/g;
      $line =~ s/neq\s/port_neq_/g;
      $line =~ s/eq\s([0-9]+)/port_eq_$1/g;
      $line =~ s/^\s+//;
      $line =~ s/\s+$//;
      @eline = split(/ /,$line);
      while ($element = shift (@eline)) {
         $elnum++;
         if ($element =~ m/(^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$)/ || $element =~ m/(^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+\/32$)/) {
            if ($elnum == 1) {
               $sa = ($1);
            } else {
              $da = ($1);
            }
         }
         if ($element =~ s/^mask\_([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+)$//) {
            if ($elnum == 2) {
               $sm = ($1);
            } else {
               $dm = ($1);
            }
         }
         if ($element =~ m/port/) {
            if ($element =~s/^port\_([a-z]+)\_([0-9]+\-[0-9]+$)// || $element =~s/port\_([a-z]+)\_([0-9]+$)//) {
            if ($elnum == 3 && $sm ne "") {
               $sp = $1." ".$2;
            } elsif ($elnum > 2) {
              $dp = $1." ".$2;
            } else {
              $sp = $1." ".$2;
            }
            $sp =~ s/eq\s//;
            $sp =~ s/rg\s//;
            $dp =~ s/eq\s//;
            $dp =~ s/rg\s//;
            }
         }
      }
   } else {
     $line =~ s/^\s+//;
     $line =~ s/\s+$//;
     if ($line =~ s/([0-9]+\.)([0-9]+\.)([0-9]+\.)([0-9]+\s)([0-9]+)\.([0-9]+)\.([0-9]+)\.([0-9]+$)/$1.$2.$3.$4."\_".(255-$5)."\.".(255-$6)."\.".(255-$7)."\.".(255-$8)/e) {
        ($sa,$sm) = split (/\_/,$line);
     } elsif ($line =~ s/host\s([0-9]+\.)([0-9]+\.)([0-9]+\.)([0-9]+)/$1$2$3$4/g || $line =~ s/([0-9]+\.)([0-9]+\.)([0-9]+\.)([0-9]+)/$1$2$3$4/g) {
        $sa = $1.$2.$3.$4."\/32";
     }
   }
   print "entry $name\_$lineno {$nextln";
   print $smspacer."if {$nextln";
   if ($proto ne "") {
      print $spacer."protocol $proto \;$nextln";
   }
   if ($sa ne "") {
      print $spacer."source-address $sa";
      if ($sm ne "") {
         print " mask $sm";
      }
      print " \;$nextln";
   }
   if ($sp ne "") {
      print $spacer."source-port $sp \;$nextln";
   }
   if ($da ne "") {
      print $spacer."destination-address $da";
      if ($dm ne "") {
         print " mask $dm";
      }
      print " \;$nextln"
   }
   if ($dp ne "") {
      print $spacer."destination-port $dp \;$nextln";
   }
   if ($conmod ne "") {
      print $spacer."$conmod";
   }
   print $smspacer."} then {$nextln";
   if ($action ne "") {
      print $spacer."$action \;$nextln";
   }
   if ($actmod ne "") {
      print $spacer."$actmod";
   }
   print $smspacer."}$nextln";
   print "}\n";
   $action = "";
   $actmod = "";
   $conmod = "";
   $proto = "";
   $sa = "";
   $da = "";
   $sm = "";
   $dm = "";
   $sp = "";
   $dp = "";
   $lineno++;
   $conmod = "";
   $actmod = "";
   $elnum = 0;
}
close ACLFILE;
exit 0;