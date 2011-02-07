*****************************
Script Name:  Interactive Automated Recovery
*****************************


Files:
*****************************
rc.xsf 		-  The Core Script
rc-Readme.txt	-  This Readme

Infrastructure Requirements
*******************************
Firmware: ExtremeXOS(TM) 12.3.x and Newer for rc.xsf standard
Platform(s): Any ExtremeXOS switch. 
TFTP Server

Description: 
*****************************
Interactive restore of switch configuration from a TFTP server with minimal console input. This allow less sophisticated administrators to recover from a catastrophic failure. It prompts the user for the name of the config file, the TFTP server's IP address, the switch's IP address, and the default route ... 

Example: 
****************************
<x250e running script>	 (Script asks operator for virtual router (e.g. in-band or out of band) 
<x250e running script>	 (Script asks operator for recovery address with CIDR Mask)
<x250e running script>	 (Script asks operator for default route)
<x250e running script>	 (Script Automatically sets route, MGMT IP. This is done on either Default vlan or MGMT van)
<x250e running script>	 (Script Automatically tftp get's c<serial>.cfg)
<x250e running script>	 (Script reboots switch with correct configuration file) 
 
   

In the above example the script would retrieve the current config file backed up with the Automated backup script.


Notes:
*******************************
 - This script requires a TFTP Server on the network
 - This script requires the automated backup script to have ran or a current configuration file c<serial>.cfg to exist
 - This script does not recover policy files or script files

Change Log and Credits
******************************
Any issues please report the bug in the ExtremeXOS Forum.

http://www.ethernation.net 

1.0 - (11 April 2010) First Version of the script

Be Extreme,
The Extreme Extensibility Team

22 April 2010