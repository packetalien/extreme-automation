**************************
Script Description
**************************

Script:  AvayaVoIPNetloginDetect

Purpose: This script provides an example of a method for configuring
network parameters for Avaya VoIP phones that support 802.1x
user authentication and LLDP on ExtremeXOS(TM) edge switches.

This universl port script is triggered on successful device 
authentication or unauthentication.  The script provides scenarios 
for both device network authentication and network unauthentication.
Instead of using a Dynamic Host Configuration Protocol (DHCP) server,
the port is provisioned using LLDP parameters developed jointly
by Extreme Networks and Avaya.

Upon receipt of an authentication trigger, this script provisions
Avaya VoIP service through the following actions:

  1. Optionally enables SNMP LLDP traps

  2. Configures LLDP parameters on the port with a specific
     Differentiated Services Code Point (DSCP) value

  3. Configures Avaya vendor-specific LLDP parameters on the
     port

  4. Optionally configures a QoS assignment for the port.

  5. Changes the port label to "voip"

For VoIP phone device network unauthentication, this script performs
the following actions:

  1. If SNMP LLDP traps were enabled, SNMP LLDP traps are disabled

  2. The LLDP configuration on the port is reset to the default

  3. If the port was assigned to a QoS profile, the QoS profile
     is unconfigured on the port.

  4. Resets the port label

This script assumes the following actions were performed prior
to executing the script to ensure proper operation:

  1.  The specified VLAN for voice traffic needs to be created 
      prior to executing this script through the following command:

        "create vlan <voice_vlan_name>"

  2.  The specified QoS profile needs to be created prior to 
      executing this script through the following command:

        "create qosprofile <qos_profile_name>"

  3.  The RADIUS server for user authentication (802.1x) needs
      to be appropriately configured.
 
NOTE:  There is a restriction that the number of characters in a 
       Universal Port Manager (UPM) profile be less than 5000
       characters.  The Avaya VoIP Netlogin Detect example EXCEEDS 
       that limit.  It is recommended that the comment lines be 
       deleted from this example prior to customizing and installing
       the example as a UPM profile.

See the "ExtremeXOS Concepts Guide" for more information.

***************************
Infrastructure Requirements
***************************
ExtremeXOS 12.0
Extreme Networks edge switch

