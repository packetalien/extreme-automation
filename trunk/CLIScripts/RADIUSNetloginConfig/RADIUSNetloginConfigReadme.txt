*****************************
Script Description
*****************************

Script:  RADIUSNetloginConfig

Purpose: This script provides an example for configuring an
ExtremeXOS(TM) switch for RADIUS netlogin.

Remote Authentication Dial IN User Service (RADIUS) is a mechanism
for authenticating and centrally administrating access to network
nodes.  The ExtremeXOS RADIUS client information allows authentication
for access to a switch.  In order for ExtremeXOS to provide this
access, RADIUS must be appropriately configured on the switch.  This
example shows how RADIUS netlogin information is applied to an
ExtremeXOS switch.

Specifically, this example performs the following functions:

  1. Configures the switch with RADIUS netlogin information

  2. Creates and configures a guest VLAN for the RADIUS server

  3. Enables RADIUS netlogin for the switch

*****************************
Infrastructure Requirements
*****************************
ExtremeXOS 12.0
Extreme Networks switch

