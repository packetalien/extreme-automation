**************************
Script Description
**************************

Script:  GenericVoIPNetloginDetect

Purpose: This script provides an example of a method for configuring
network parameters for VoIP phones (or other devices) that support
802.1x user authentication, but not LLDP on ExtremeXOS(TM) edge
switches.

This universl port script is triggered on successful device 
authentication or unauthentication.  The script provides scenarios 
for both device network authentication and network unauthentication.
It is assumed that specific VoIP provisioning is accomplished 
through a Dynamic Host Configuration Protocol (DHCP) server.

For VoIP phone device network authentication, this script provisions
the generic VoIP service through the following actions:

  1. Optionally assigns the port to a QoS profile and configures 
     this QoS profile

  2. Optionally enables denial-of-service (DOS) protection to
     the port.

For VoIP phone device network unauthentication, this script performs
the following actions:

  1. If the port was assigned to a QoS profile, the QoS profile
     is unconfigured on the port


This script assumes the following actions were performed prior
to executing the script to ensure proper operation:

  1.  The specified QoS profile needs to be created prior to
      executing this script through the following command:

        "create qosprofile <qos_profile_name>"

  2.  The RADIUS server for user authentication (802.1x) needs
      to be appropriately configured

  3.  The Dynamic Host Configuration Protocol (DHCP) server
      needs to be appropriately configured

  4.  The Trivial File Transfer Protocol (TFTP) server needs
      to be appropriately configured

  5.  The Call Server needs to be appropriately configured.

NOTE:  There is a restriction that the number of characters in a 
       Universal Port Manager (UPM) profile be less than 5000
       characters.  The Generic VoIP Netlogin Detect example EXCEEDS 
       that limit.  It is recommended that the comment lines be 
       deleted from this example prior to customizing and installing
       the example as a UPM profile.

See the "ExtremeXOS Concepts Guide" for more information.

***************************
Infrastructure Requirements
***************************
ExtremeXOS 12.0
Extreme Networks edge switch

