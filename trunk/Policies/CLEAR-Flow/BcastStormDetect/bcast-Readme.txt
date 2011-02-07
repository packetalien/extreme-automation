*****************************
Script Name: Broadcast Storm Detection
*****************************


Files:
*****************************
BcastStormDetect.pol	-  The Example policy file
bcast-Readme.txt	-  This Readme

Infrastructure Requirements
*******************************
Firmware: ExtremeXOS(TM) 11.6.x and Newer for BcastStormDetect.pol standard
Platform(s): Summit X450a, X480, X650; BlackDiamond 8800 c-series, 8900-series, 8900-XL series, BlackDiamond 10K, 12K 

Description: 
*****************************
Purpose: This policy provides a CLEAR-Flow monitoring example that 
inspects received broadcast message packets to detect potential
broadcast storm attacks.  Both TCP and UDP broadcast packets are
counted and should the sum of these broadcast messages exceed 
100,000 in one second.  In this case, an SNMP trap is issued 
along with a syslog message to provide notification of a 
potential broadcast storm attack.

Example: 
****************************
<X650 Running CLEAR-FLow policy> (Rule becomes true)
<X650 Running CLEAR-FLow policy> (CLEAR-Flow takes configured actions (e.g. QoS BCast Traffic))


In the above example the rule becomes true and CLEAR-Flow executes is actions automatically.


Notes:
*******************************
 - This requires a CLEAR-Flow enabled switch

Change Log and Credits
******************************
Any issues please report the bug in the ExtremeXOS Forum.

http://www.ethernation.net 

1.0 - (1 April 2010) First Version of the script

Be Extreme,
The Extreme Extensibility Team

22 April 2010