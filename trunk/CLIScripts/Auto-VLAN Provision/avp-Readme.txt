*****************************
Script Name:  Auto-VLAN Provision
*****************************


Files:
*****************************
avp.xsf 	-  The Core Script
avp-Readme.txt	-  This Readme
avpdefault.xsf	-  Auto-VLAN Provision Deployed as a default.xsf script and using UPM from a Script

Infrastructure Requirements
*******************************
Firmware: ExtremeXOS(TM) 12.3.x and Newer for avp.xsf standard
Firmware: ExtremeXOS 12.4.x and Newer for avpdefault.xsf expanded
Platform(s): Any ExtremeXOS switch. 

Description: 
*****************************
This script will auto-configure an edge switch based on the ports seen on the  uplink port. The script will initially show EDP to find the VLAN, VLAN ID and port that will be connected to the uplink.  The script will then create a VLAN, configure it with VLAN ID and add the port tagged or untagged as necessary.

Example: 
****************************
<x250e running script>	 (sends edp query) ----> <x450a with VLAN: EDP_TEST TAG 2010>
<x450a with VLAN: EDP_TEST TAG 2010> (replies with EDP PDU) ---> <x250e running script>
<x250e running script> (Parses EDP output and configures switch)

In the above example the x250e running the applet would automatically configure it's upliknk with VLAN: EDP_TEST with a tag of 2010.


Notes:
*******************************
 - This requires a unique VLAN on the EDP uplink port that a switch running this script can see. 
 - This version will only provision the first VLAN. Multiple VLANs are ignored.
 - The avpdefault.xsf will need to be renamed to default.xsf for ExtremeXOS to to use it when a configuration file is not selected. For more information please see the ExtremeXOS Concepts guide.

Change Log and Credits
******************************
Any issues please report the bug in the ExtremeXOS Forum.

http://www.ethernation.net 

1.0 - (19 April 2010) First Version of the script

Be Extreme,
The Extreme Extensibility Team

22 April 2010