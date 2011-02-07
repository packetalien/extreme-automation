*****************************
Script Description
*****************************

Script:  NtwkDeployEAPS

Purpose:  This widget assists in the configuration of security, managment and
		  operational parameters for a new edge switch with EAPS redudancy. 

Specifically, this widget performs the following functions:

1.  Configure SNMP
      a.  Enable SNMP v1/v2 access
      b.  Remove standard read/write community strings
      c.  Create switch name and location
      d.  Create trap receivers

2.  Create a time server

3.  Create a syslog server

4.  Setup QoS Profiles for VLANs  (For prioritizing traffic, typically used for
	voice or video)

5.  Create an EAPS ring for Access Layer redundancy (For use with dual Core/
	Distribution switches)

6.  Create up to 5 VLANs and associated parameters
      a.  Add ports (tagged if uplink and untagged for users)
      b.  Give it an IP address (optional for management or routing)
      c.  Add VLAN to QoS profile (For prioritizing traffic)

7.  Configure and enable RADIUS for Network Login (For secure user/machine 
	access)

8.  Configure and enable RADIUS (For secure switch management)

***************************
Infrastructure Requirements
***************************
Extreme Networks(R) switch
ExtremeXOS(TM) 12.0 or greater with Core or an Advanced Core license
EPICenter(R) 6.0 SP2 (Needed for graphical interface and deployment)