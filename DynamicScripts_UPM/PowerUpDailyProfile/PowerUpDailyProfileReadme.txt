*****************************
Script Description
*****************************

Script:  PowerUpDailyProfile

Purpose: This profile turns power on at a specific time of day to a list of
Power-over-Ethernet enabled ports.

This Power Conservation Profile is designed to ease the set-up of power 
conservation practices in your Extreme Networks edge switches. By using the 
pre-defined power conservation profile and modifying it for use in your 
environment, you'll have the opportunity to save energy and reduce energy 
related network operating costs.

Networks that utilize Power over Ethernet enabled Voice over IP solutions,
wireless access points or other Power over Ethernet enabled devices are the 
key beneficiaries of the module.  

This profile turns on power at a specific time of day to a list of 
Power-over-Ethernet enabled ports.  The profile is intended for deployment 
with Extreme Networks EPICenter management platform Universal Port applet.

In order to properly deploy this profile, the following actions must be performed:

1.  Open the PowerUpDailyProfile
     a. Edit variables in profile to meet requirements of your network (ie., 
	 port numbers)

2.  Assign PowerUpDailyProfile to a Universal Port timer in EPICenter

3.  Configure Universal Port timer in EPICenter

*****************************
Infrastructure Requirements
*****************************
ExtremeXOS(TM) 12.0 or greater with an Edge License
EPICenter 6.0 SP1 or greater
Extreme Networks ExtremeXOS-based advanced edge switches