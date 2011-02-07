*****************************
Script Name: QoS Configuration
*****************************


Files:
*****************************
QoSConfig.xsf 	-  The Core Script
qos-Readme.txt	-  This Readme

Infrastructure Requirements
*******************************
Firmware: ExtremeXOS(TM) 12.0.x and Newer for QoSConfig.xsf standard
Platform(s): BD8800, SummitX 

Description: 
*****************************
For a set of ports, advanced QoS settings can be easily provisioned. The settings include scheduling algorithm (priority or WRR),  weights for different traffic classes, as well as 802.1p/DSCP examination and replacement

This script is intended for use configuring QoS settings on ExtremeXOS 
BlackDiamond(R) 8800, SummitStack(TM), or Summit(R) switch.  This script
is not intended for use to configure QoS settings on a BlackDiamond 12000
or a BlackDiamond 10000 switch.

Quality of service settings for a port or a set of ports is defined by 
associating a QoS profile to these ports and tailoring this QoS profile
with specific optimizations to deliver an intended level ofservice.  In
other words, the level of service that a particular type of traffic or 
traffic grouping receives is determined by assigning it to an appropriately
configured QoS profile.

In this example, a QoS profile is created and configured.  The default 
configurations specified in this example for the QoS profile are the
standard defaults as specified by ExtremeXOS.  Please be careful in 
overriding these standard QoS configurations as unexpected results may occur.

This example may be used to enable "dot1p" examination on ingress packets 
for traffic grouping and prioritization.  Additionally, "dot1p" replacement 
can also be specified for egress packets.  The "dot1p" traffic grouping 
feature requires ports use tagged addressing (802.1Q).  Tagged
addressing needs to be specified to ensure correct operation of this script.

Likewise, this example may be used to enable "diffserv" examination on ingress
packets and "diffserv" replacement on egress packets.  Diffserv, or differen-
tiated services, does not require ports use tagged addressing (careful, not 
all devices in a network may support IP differentiated services).

Specifically, this example performs the following functions:

  1. Creates a QoS profile

  2. Optionally configures the QoS scheduler for the switch (switch level
     operation)

  3. Configures the QoS profile

  4. Optionally enables dot1p examination and/or dot1p replacement

  5. Optionally enables diffserv examination and/or diffserv replacement

Example: 
****************************
<x250e running script>	 (Script Interactively using $read asks operator a series of questions)
<x250e running script>	(Script auto-provisions QoS based on Questions)

Notes:
*******************************
 - This script not intended to be run on BlackDiamond 10K,12K,20K

Change Log and Credits
******************************
Any issues please report the bug in the ExtremeXOS Forum.

http://www.ethernation.net 

1.0 - (20 June 2008) First Version of the script
1.1 - (21 April 2010) Corrected Inconsistency in running both ExtremeXOS(™) and Epicenter(™) scripting syntax.

Be Extreme,
The Extreme Extensibility Team

22 April 2010