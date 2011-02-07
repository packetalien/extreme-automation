*****************************
Script Name:  Automated Backup Script
*****************************


Files:
*****************************
xbd.xsf 	-  The Core Script
xbd-Readme.rtf	-  This Readme

Infrastructure Requirements
*******************************
Firmware: ExtremeXOS(TM) 12.3.x and Newer for xbd.xsf standard
Platform(s): Any ExtremeXOS switch. 
TFTP Server: IPv4 TFTP Server that allows switch to write files

Description: 
*****************************
Run automated back up on all scripts, including configuration, policy and scripts. Benefits include a simple rollback and configuration history.

Example: 
****************************
<x250e running script>	(log entry of AAA.AuthPass triggers UPM) 
<x250e running script>	(UPM Runs and uploads current config as c<serial>.cfg)
<x250e running script>	(UPM Recursively uploads all files)      


In the above example the x250e would upload all files on the switch and a second file in the root of the tftp for use with the Interactive Recovery script.


Notes:
*******************************
 - This requires a TFTP Server with write privileges by the switch
 - This requires a date structure in the TFTP directory (e.g. /tftpboot/<year>/<mo>/<day> or /tftpboot/2010/04/27)
 

Change Log and Credits
******************************
Any issues please report the bug in the ExtremeXOS Forum.

http://www.ethernation.net 

1.0 - ( March 2009) First Version of the script
1.1 - ( April 2010) Changes made to interact with other scripts

Be Extreme,
The Extreme Extensibility Team

21 April 2010