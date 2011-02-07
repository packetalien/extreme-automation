*****************************
Script Description
*****************************

Script:  IPv6UnicastConfig

Purpose: This script provides an example of IPv6 unicast routing in
         ExtremeXOS(TM).

In this example, assume there are three VLANS to be configured on 
a BlackDiamond(TM) switch - a protocol-sensitive VLAN using IPv6 
addressing ("vlan1"), a protocol-sensistive VLAN using IPv6 addressing 
("vlan2"), and a port-based VLAN handling all other traffic ("vlan3").
  
The first IPv6 VLAN, "vlan1", is to be assigned all ports on slots 1 and
3 with the IP address of "2001:db8:35::1/48", while the other IPv6 VLAN, 
"vlan2", is to be assigned all ports on slots 2 and 4 with the IP address
of "2001:db8:36::1/48".  Finally, the third VLAN, "vlan3", is assigned to
slots 1 through 4 on this BlackDiamond switch.

The devices connected to the network generate a combination of IPv6
traffic and other forms of traffic (e.g., NetBIOS).  The IPv6 traffic is
filtered by the protocol-sensitive VLANs, while all other traffic is
directed to VLAN "vlan3".

Thus, in this configuration, all IPv6 traffic from devices connected to
slots 1 and 3 have access to the router by way of VLAN "vlan1".  Ports on 
slots 2 and 4 reach the router by way of VLAN "vlan2". All other traffic
(NetBIOS) is part of the VLAN "vlan3".

The following functions are performed in this example:

  1. Create three VLANS - "vlan1", "vlan2", and "vlan3"

  2. Configure "vlan1" and "vlan2" for IPv6

  3. Provide the port congiuration for all the VLANs

  4. Configure the IP addresses for "vlan1" and "vlan2"

  5. Configure ripng for "vlan1" and "vlan2"

  6. Enable IPv6 forwarding

  7. Enable ripng

*****************************
Infrastructure Requirements
*****************************
ExtremeXOS(TM) 12.1 or greater
ExtremeXOS based Extreme Networks switches



