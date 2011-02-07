#!/usr/bin/perl -w
#
# Description: This programs reads the:
#   - source IP:          in dotted decimal format, eg. 10.10.100.2
#   - destination IP:     in dotted decimal format, eg. 100.120.1.3
#   - source port:        as a 16-bit number
#   - destination port:   as a 16-bit number
#
# The basic algorithm of this program is to calculate the XOR (exclusive OR) of
# the values enter.  The XOR is calculated on the lowest three bits of each byte of
# the input.  That is, each number of the IP is a byte, so use bits 2-0, and the
# port number is a 16-bit (2 bytes) value, hence bits 2-0 and 10-8.
#
#
# USAGE: <program> [-h | -d] <source ip>:port <dest ip>:port <number of links>
#         WHERE:
#           -h displays the screen and usage.
#           -d turns on debugging output as the program runs.
#
#-----------------------------------------------------------------------------

#  GLOBAL Variables:
#-----------------------------------------------------------------------------
$debugOff = 1;  ##  0 = turn on debug statements, 1 = turn off.

#  FUNCTION/SUBROUTINE Prototype:
#-----------------------------------------------------------------------------
sub usage;
sub getIpAndPort($);
sub convertIpAndPort2ByteArray;


# Main:
#-----------------------------------------------------------------------------
my $option = $ARGV[0];

if(defined($option) && "-h" eq $option){
  shift(@ARGV);
  usage();
}

if(defined($option) && "-d" eq $option){
  shift(@ARGV);
  $debugOff = 0;
}

# remove source and destination IP/PORT if provided on the command line.
my $srcIpAndPort = $ARGV[0];
my $destIpAndPort = $ARGV[1];

# and the number of links
my $numLinks = $ARGV[2];

# Get input to work on if it wasn't provided on the commandline
if(!defined($srcIpAndPort)){
  $srcIpAndPort = getIpAndPort("source");
}

if(!defined($destIpAndPort)){
  $destIpAndPort = getIpAndPort("destination");
}

my @numbers = convertIpAndPort2ByteArray($srcIpAndPort);
push(@numbers, convertIpAndPort2ByteArray($destIpAndPort));

# calculate XOR of the array's values
my $i = 0;
my $result = $numbers[$i++];

for(;$i <= $#numbers; $i++){
#printf("$result XOR $numbers[$i] = %d\n", $result ^ $numbers[$i]);
  $result = $result ^ $numbers[$i];
}

printf("XOR Result: %d\n", $result);

if(!$numLinks){
  printf("Enter number of links (between 1-8): ");
  $numLinks = <STDIN>;
  printf("\n");
}

$numLinks = $numLinks + 0;
if(1 > $numLinks){
  printf("Error: Invalid input for number of links.\n");
  exit 1;
}

chomp $numLinks;
printf("\nLink lag: %d\n", $result % $numLinks);

exit 0;
# ------------------- END MAIN -----------------------------------------------

# FUNCTION/SUBROUTINE
#-----------------------------------------------------------------------------
# NAME: usage
# PURPOSE: Prints the usage screen and exits.
#
# INPUT: NONE
#
# RETURN: NONE
sub usage{
  print <<USAGE
USAGE: $0 [-h | -d] <source ip>:port <dest ip>:port <number of links>
    WHERE:
        -h displays the screen and usage.
        -d turns on debugging output as the program runs.

USAGE
;

  exit 0;
}

# NAME: convertIpAndPort2ByteArray
# PURPOSE: Given an IP address and port number pair, create an array of 8-bit
#          values.  Where teach byte/value is the octet of the ip (4 bytes) or
#          the upper and lower bytes of the port number (2 bytes).  The result
#          is therefore always a 6 element array.
#
# INPUT: Expects the correctly formatted <IP> and <port number> colon, ':',
# separated.
#
# RETURN: Returns an array of 6 nubmer bytes (no valueis greater than 255).
sub convertIpAndPort2ByteArray{
  my ($ipAddr, $portNum) = split(/:/, $_[0]);

  my @temp = split(/\./, $ipAddr);

  $portNum = $portNum + 0;
  # add port number which is 2-bytes
  push(@temp, ((($portNum & 0x0700) >> 8), $portNum & 0x07));

  my @numbers = ();

  # convert string values to number and mask off the upper 5-bits.
  $i = 0;
  printf("\nDEBUG: IP: %s, Port number: %s\n", $ipAddr, $portNum)
    unless($debugOff);

  foreach (@temp){
    printf("DEBUG: Byte[$i] = %s => %d\n", $_, ($_ + 0) & 0x07)
      unless($debugOff);
    ++$i;
    push(@numbers, ($_ + 0) & 0x07);  # and with 00000111
  }

  return @numbers;
}

# NAME: getIpAndPort
# PURPOSE: prompts the user for the IP address in dotted-decimal format and the
#          port number, colon separated.  
#
# INPUT: Expects the type of <IP>:<port> to place in the prompt.  e.g
#        source/src, destination/dest.
#
# RETURN: Returns an array where the first element is the IP address as a
#         string.  The second element of the array is the port number as a
#         integral value.
sub getIpAndPort($){
  my $prompt = pop;

  my $invalidInput = 1;
  my($ipAddr, $portNum) = ("", 0);

  while($invalidInput){
    printf("Enter %s IP and Port (eg. 10.10.20.3:5323): ", $prompt);

    $input = <STDIN>;
    chomp $input;

    ($ipAddr, $portNum) = split(/:/, $input);

    if($ipAddr !~ m/\d{0,3}\.\d{0,3}\.\d{0,3}\.\d{0,3}/){
      printf("Invalid input format: %s\n", $input);
    }
    else{
      $invalidInput = 0;
    }
  }

  return $input;
}
