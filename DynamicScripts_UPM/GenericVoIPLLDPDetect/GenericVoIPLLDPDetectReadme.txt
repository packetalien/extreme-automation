**************************
Script Description
**************************

Script:  GenericVoIPLLDPDetect

Purpose: This script provides an example of a method for configuring
network parameters for VoIP phones (or other devices) that support
LLDP, but not 802.1x user authentication on ExtremeXOS(TM) edge
switches.

This universl port script is triggered on the detection of a LLDP 
packet on a port.  The script provides scenarios for both device
detection and device undetection.

For VoIP phone device detection, this script provisions the generic
VoIP service through the following actions:

  1. Adds the port to a voice VLAN using tagged addressing

  2. Optionally enables SNMP LLDP traps

  3. Configures LLDP on the port with a specific Differentiated
     Service Code Point (DSCP) value

  4. Configures POE settings on the port based on the detected
     device

  5. Optionally configures a QoS assignment for the port.

For VoIP phone device undetect, this script performs the following
actions:

  1. If SNMP LLDP traps were enabled, SNMP LLDP traps are disabled

  2. The LLDP configuration on the port is reset to the default

  3. The POE setting on the port is reset to the default

  4. If the port was assigned to a QoS profile, the QoS profile
     is unconfigured on the port.

This script assumes the following actions were performed prior
to executing the script to ensure proper operation:

  1.  LLDP must be enabled on the port through the following
      command:
  
        "enable lldp ports <port_list>"

  2.  The specified VLAN for voice traffic needs to be created
      prior to exeucting this script through the following 
      command:

        "create Vlan <voice_vlan_name>

  3.  The specified QoS profile needs to be created prior to
      executing this script through the following command:

        "create qosprofile <qos_profile_name>"

  4.  The Dynamic Host Configuration Protocol (DHCP) server
      needs to be appropriately configured

  5.  The Trivial File Transfer Protocol (TFTP) server needs
      to be appropriately configured

  6.  The Call Server needs to be appropriately configured.

NOTE:  There is a restriction that the number of characters in a 
       Universal Port Manager (UPM) profile be less than 5000
       characters.  The Generic VoIP LLDP Detect example EXCEEDS 
       that limit.  It is recommended that the comment lines be 
       deleted from this example prior to customizing and installing
       the example as a UPM profile.

See the "ExtremeXOS Concepts Guide" for more information.

***************************
Infrastructure Requirements
***************************
ExtremeXOS 12.0
Extreme Networks edge switch

