*****************************
Script Name:  Chassis Hibernation
*****************************


Files:
*****************************
chassishibernate.xsf 	-  The Core Script
ch-Readme.txt		-  This Readme

Infrastructure Requirements
*******************************
Firmware: ExtremeXOS(TM) 11.6.x and Newer for chassishibernation.xsf standard
Platform(s): BD8806/8810 (Not blade dependent) 

Description: 
*****************************
Administrators can use the chassis hibernation script to save energy by setting up a profile that defines when they would like the system to place specified blades into a standby state.  The administrator must specify when and which blades are enabled for this power saving.  

Example: 
****************************
<BD8806 Running UPM> (6AM Timer Triggers and Enables Blades)
<BD8806 Running UPM> (10PM Timer Triggers and Disables Blades)

In the above example the UPM, based on configured time of day, will disable  and enable BD8806 Blades for power conservation.

Notes:
*******************************
 - Configuring time of day is required

Change Log and Credits
******************************
Any issues please report the bug in the ExtremeXOS Forum.

http://www.ethernation.net 

1.0 - (19 April 2010) First Version of the script

Be Extreme,
The Extreme Extensibility Team

22 April 2010