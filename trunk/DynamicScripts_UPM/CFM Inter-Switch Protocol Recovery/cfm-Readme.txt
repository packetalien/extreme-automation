*****************************
Script Name:  Inter-Switch Protocol Recovery
*****************************


Files:
*****************************
cfmdisableport.xsf 	-  The Core Script
cfm-Readme.txt	-  This Readme

Infrastructure Requirements
*******************************
Firmware: ExtremeXOS(TM) 12.3.x and Newer for avp.xsf standard
Platform(s): Any ExtremeXOS switch. 

Description: 
*****************************
If there is a CFM event, this Universal Port script dynamically disables the port.

Example: 
****************************
<x450a running script>	 (Receives a CFM.MEPExp Message from a third party device)
<x450a running script> (Disables the port based on the message)

Notes:
*******************************
 - This requires cfm to be configured
 - This script was tested between an Extreme Networks ExtremeXOS(™) switch and a third party switch.

Change Log and Credits
******************************
Any issues please report the bug in the ExtremeXOS Forum.

http://www.ethernation.net 

1.0 - (21 January 2010) First Version of the script
1.1 - (21 April 2010) Minor updates for Interop

Be Extreme,
The Extreme Extensibility Team

22 April 2010