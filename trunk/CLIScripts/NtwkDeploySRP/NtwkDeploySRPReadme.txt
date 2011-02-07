*****************************
Script Description
*****************************

Script:	NtwkDeploySRP

Purpose:  This widget assists in the configuration of security, managment and
		  operational parameters for a new edge switch with Software-Controlled
          Redundant Physical Port redundancy.

1.  Configure SNMP
      a.  Enable SNMP v1/v2 access
      b.  Remove standard read/write community strings
      c.  Create switch name and location
      d.  Create trap receivers

2.  Configure parameters for a time server

3.  Configure parameters for a syslog server

4.  Setup QoS Profiles for VLANs  (For prioritizing traffic, typically used for 
    voice or video)

5.  Create up to 5 VLANs and associated parameters
      a.  Add ports (tagged if uplink and untagged for users)
      b.  Give it an IP address (optional for management or routing)
      c.  Add VLAN to QoS profile (For prioritizing traffic)

6.  Configure Software-Controlled Redundant Physical Port

7.  Configure and enable RADIUS  (For secure switch management)

8. Configure and enable RADIUS for Network Login  (For secure user/machine access)

***************************
Infrastructure Requirements
***************************
Extreme Networks(R) switch
ExtremeXOS(TM) 12.0 or greater with Core or an Advanced Core license
EPICenter(R) 6.0 SP2 (Needed for graphical interface and deployment)


