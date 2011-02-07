*****************************
Script Name:  Recon Detection
*****************************


Files:
*****************************
reconDetect.pol 	-  The Example policy file
recon-Readme.txt	-  This Readme

Infrastructure Requirements
*******************************
Firmware: ExtremeXOS(TM) 12.0.x and Newer for recondDetect.pol standard
Platform(s): Summit X450a, X480, X650; BlackDiamond 8800 c-series, 8900-series, 8900-XL series, BlackDiamond 10K, 12K 

Description: 
*****************************
Purpose: This policy provides a CLEAR-Flow monitoring example that 
inspects the TCP flags on all received TCP packets to detect
potential TCP flag filtering attacks.  Should the number of TCP packets
with all TCP flags on (a method used to avoid security filters)
exceed 1000 in 1 second, then an SNMP trap is issued, and a message
indicating the situation is written to the syslog..

Example: 
****************************
<X650 Running CLEAR-FLow policy> (Rule becomes true)
<X650 Running CLEAR-FLow policy> (CLEAR-Flow takes configured actions (e.g. QoS Provision, SNMP Message, Blackhole))


In the above example the rule becomes true and CLEAR-Flow executes is actions automatically.


Notes:
*******************************
 - This requires a CLEAR-Flow enabled switch

Change Log and Credits
******************************
Any issues please report the bug in the ExtremeXOS Forum.

http://www.ethernation.net 

1.0 - (27 May 2008) First Version of the script
1.1 - (21 April 2010) Updated

Be Extreme,
The Extreme Extensibility Team

22 April 2010