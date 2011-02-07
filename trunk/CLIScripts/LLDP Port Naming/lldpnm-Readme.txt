*****************************
Script Name:  Auto-VLAN Provision
*****************************


Files:
*****************************
lldpportname.xsf 	-  The Core Script
lldpnm-Readme.txt	-  This Readme

Infrastructure Requirements
*******************************
Firmware: ExtremeXOS(TM) 12.3.x and Newer for avp.xsf standard
Platform(s): Any ExtremeXOS switch. 
LLDP Enabled Server

Description: 
*****************************
This installed script queries the ports attached using LLDP. The LLDP response is used to assign the switch port name

Example: 
****************************
<x250e running script>	 (sends LLDP query) ----> <Any LLDP Server>
<Any LLDP Enabled Server> (replies with LLDP PDU) ---> <x250e running script>
<x250e running script> (Parses LLDP output and configures switch port name)


Notes:
*******************************
 - This requires the responder on the port to have LLDP Enabled

Change Log and Credits
******************************
Any issues please report the bug in the ExtremeXOS Forum.

http://www.ethernation.net 

1.0 - (10 February 2010) First Version of the script

Be Extreme,
The Extreme Extensibility Team

22 April 2010