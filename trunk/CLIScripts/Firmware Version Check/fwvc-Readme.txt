*****************************
Script Name:  Firmware Version Check
*****************************


Files:
*****************************
fwvc.xsf 	-  The Core Script
fwvc-Readme.txt	-  This Readme

Infrastructure Requirements
*******************************
Firmware: ExtremeXOS(TM) 12.3.x and Newer for fwvc.xsf standard
Platform(s): Any ExtremeXOS switch.
TFTP Server

Description: 
*****************************
Allows for automatic firmware version validation at bootup. When a switch boots, this script matches the configured-firmware-version with the correct-firmware setting. If the configured-firmware setting is off, it is corrected with the switch boot-up.

Example: 
****************************
<x650 loaded with autoexec.xsf> (switch examines correct firmware)
<x650 loaded with autoexec.xsf> (If incorrect downloads correct image)
<x650 loaded with autoexec.xsf> (Option to reboot switch)


In the above example the x650 switch would check it's firmware version against a pre-set supported version. If the incorrect version was detected upon boot, this would be corrected and switch (if selected) would reboot itself.


Notes:
*******************************
 - This requires a TFTP server
 - This requires pre-setting correct firmware version in the script
 - For automation the script should be copied into a default.xsf and or an autoexec.xsf

Change Log and Credits
******************************
Any issues please report the bug in the ExtremeXOS Forum.

http://www.ethernation.net 

1.0 - (7 Feb 2010) First Version of the script

Be Extreme,
The Extreme Extensibility Team

22 April 2010