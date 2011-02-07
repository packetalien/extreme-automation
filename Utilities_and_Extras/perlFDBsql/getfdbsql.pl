#t!/usr/bin/perl -w
######
#THE INFORMATION AND SPECIFICATIONS IN THIS DEVELOPER KIT ARE SUBJECT TO CHANGE WITHOUT 
#NOTICE.    ALL INFORMATION AND SPECIFICATIONS IN THIS DEVELOPER KIT ARE PRESENTED WITHOUT 
#WARRANTY OF ANY KIND, EXPRESS OR IMPLIED.    YOU TAKE FULL RESPONSIBILITY FOR YOUR USE OF 
#THE DEVELOPER KIT. 
#
# THE DEVELOPER KIT IS LICENSED TO YOU UNDER THE THEN-CURRENT LICENSE TERMS FOR THE    
# DEVELOPER KIT IN EFFECT AT THE TIME THE DEVELOPER KIT IS PROVIDED TO YOU BY 
# EXTREME NETWORKS. PLEASE CONTACT EXTREME NETWORKS IF YOU DO NOT HAVE A COPY OF THE 
# LICENSE TERMS.    USE OF THE DEVELOPER KIT CONSTITUTES YOUR ACCEPTANCE OF THE DEVELOPER 
# KIT LICENSE TERMS.
#
#  Copyright (c) Extreme Networks Inc.    2007,2008
###
##
##  This is an example on how to use getAllFdb API.
##  It will read  switch ip, username and password from the command line
##	
##	Usage: "perl getAllFdb.pl <ip_address> <account> <password>
##  Example: "perl getAllFdb.pl 10.0.0.1 admin password"
##  
##  Copyright (c) Extreme Networks Inc.  2006,2007
##  All rights reserved 
##  
### 
######
###
##	Contributors:
##
##	Thorsten Krohn 	- Wilhelm Tel, Germany
##	Andy Gatward 	- Reading University, United Kingdom
##	Paul Tinsley	- Lightining Source, United States
##	Jussi Sjöström  - Xenetic, Finland
##
###
######
use SOAP::Lite; 
use DBI;
use DBD::mysql;
#use IO::All;

require ('sessionManage.pl');

my $host=$ARGV[0];
my $usrname=$ARGV[1];
my $pwd=$ARGV[2];

# MYSQL CONFIG VARIABLES
my $dbhost = "localhost";
my $database = "fdb";
my $tablename = "fdb";
my $user = "fdb";
my $pw = "fdbfdb";

# PERL MYSQL CONNECT()
my $connect = Mysql->connect($dbhost, $database, $user, $pw);

# SELECT DB
$connect->selectdb($database);

my $sessid=opensession($host,$usrname,$pwd);

if ($sessid==null) {
    die "Could not open connection to switch.\n";
} else {
    print "Connection to switch opened, sessionid $sessid.\n";
	
	# set up connection
	my $connection = SOAP::Lite
	-> proxy("http://$usrname:$pwd\@$host/xmlservice", timeout=>10)
	-> ns("urn:xapi/l2protocol/fdb", "xos") # namespace and prefix for operation
	-> autotype(0)
	-> envprefix('SOAP-ENV'); # envelope prefix
	
	# assemble the SOAP Message
	my $method = SOAP::Data->name('xos:getAllFdb');
	
	
	# Assign the Result
	$result = $connection->call($method);
	handleResponse($result);
	
	
	# send request
	my $response = $connection->call($method => @params);
}


sub handleResponse {
	my $res = shift;
	if ($res->fault) { 
		print $res->faultcode, " ", $res->faultstring, "\n"; 
		exit();
	}else
	{
		my @fdbentry = $result->valueof('//Body/getAllFdbResponse/reply/fdb');
		my $len = @fdbentry;
		print $len."\n";
		my  $i=0;
		for ($i=0; $i < $len; $i++) {
			
			my $fdbentry= $fdb[$i];
			my $macAdress=$fdb->{"macAddress"};
			my $vlan=$fdb->{"vlan"};
			my $port=$fdb->{"port"};
			my $age=$fdb->{"age"};
			
		}
		
		foreach my $test (@fdbentry){
			$mac = $test->{'macAddress'};
			$vlan = $test->{'vlan'};
			$port = $test->{'port'};
			$age = $test->{'age'};
			my $fdbinsert = "INSERT INTO $tablename (id, mac, vlan, port, age) VALUES (id,$mac,$vlan,$port,$age)";
			
			# EXECUTE THE QUERY FUNCTION
			$execute = $connect->query($myquery);
			# AFFECTED ROWS
			$affectedrows = $execute->affectedrows($myquery);
			
			# ID OF LAST INSERT
			$lastid = $execute->insertid($myquery)
			
		}
	}  
}
}

closesession($sessid,$host,$usrname);