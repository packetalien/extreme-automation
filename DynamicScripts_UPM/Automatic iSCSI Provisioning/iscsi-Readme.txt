*****************************
Script Name:  Automatic iSCSI Provisioning
*****************************


Files:
*****************************
iscsi.pol 		-  The Example policy file
iscsi-Readme.txt	-  This Readme

Infrastructure Requirements
*******************************
Firmware: ExtremeXOS(TM) 11.6.x and Newer for iscsi.pol standard
Platform(s): Summit X450a, X480, X650; BlackDiamond 8800 c-series, 8900-series, 8900-XL series, BlackDiamond 10K, 12K 

Description: 
*****************************
This simple script uses CLEAR-Flow to identify iSCSI traffic (port 3260) ,  assign it the right Quality of Service, and enable jumbo frames. This pre-provisioned settings in a network allows iSCSI traffic to be protected in a higher priority queue.

Example: 
****************************
<X650 Running CLEAR-FLow policy> (Rule becomes true)
<X650 Running CLEAR-FLow policy> (CLEAR-Flow takes configured actions (e.g. QoS Provision))


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