*****************************
Script Name:  Time-based MAC Restrictions
*****************************


Files:
*****************************
tbmr.xsf 		-  The Core Script
tbmr-Readme.txt	-  This Readme

Infrastructure Requirements
*******************************
Firmware: ExtremeXOS(TM) 12.3.x and Newer for tbmr.xsf standard
Platform(s): Any ExtremeXOS switch. 

Description: 
*****************************
Based on time, restricts network usage to preconfigured MAC addresses

Example: 
****************************
<x250e running script> (timed event triggers lockout)
<x250e running script> (MAC Detected and blackholed)


Notes:
*******************************
 - This script requires pre-configuration and editing of restricted MAC addresses in the .xsf

Change Log and Credits
******************************
Any issues please report the bug in the ExtremeXOS Forum.

http://www.ethernation.net 

1.0 - (16 April 2010) First Version of the script

Be Extreme,
The Extreme Extensibility Team

22 April 2010