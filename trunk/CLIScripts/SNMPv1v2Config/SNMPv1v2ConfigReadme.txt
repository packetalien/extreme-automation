**************************
Script Description
**************************

Script:  SNMPv1v2Config

Purpose: This script provides an example of SNMP V1/V2 configuration for 
an ExtremeXOS(TM) switch.

This script is a simple example of how one might go about configuring 
SNMP V1/V2 on an ExtremeXOS switch.  The script can be used to enable 
or disable SNMP V1/V2 access.  The script shows how to specify the 
optional name, location and contact information.  The SNMP V1/V2 trap
receivers can optionally be created and configured.  Lastly, tailored
read-write and read-only community strings can be configured and the
default read-write and read-only community strings can be deleted from
the switch.

Specifically, this example performs the following functions:

  1. Configures SNMP V1/V2 switch name, location and contact information

  2. Optionally creates trap receivers

  3. Optionally creates tailored read-write and read-only community strings

  4. Optionally deletes read-write and read-only community strings 

***************************
Infrastructure Requirements
***************************
ExtremeXOS 12.0
Extreme Networks switch

