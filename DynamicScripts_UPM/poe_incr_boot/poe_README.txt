#@DetailDescriptionStart
 ###############################################################################
 # Extreme Networks(R) Universal Port Profile Library
 #
 # Script        	: POE Incremental Boot
 # Revision      	: 1.4
 # Last Updated  	: 03/17/2010
 # Platform(s): XOS Only
 # EXOS Version(s)  	: 12.4.1
 # Author		: John Padilla
 # Contact		: Extreme Networks - jpadilla@extremenetworks.com
 # 
 # Purpose: To power up PDs Incrementally
 #
 #    
 ################################################################################
 #
 ################################################################
 # INSTRUCTIONS
 ################################################################
 #
 # Created by: John Padilla jpadilla@extremenetworks.com
 #
 # Summary:
 #
 # In some cases a network POE switch will require an additional power supply to inject 
 # power to edge ports. This requirement is usually calculated by determining how many 
 # devices on a switch need to be powered by the switch's power availability. 
 #
 # For example, an x450e-48p has a Power Consumption of 600 watts and a Heat Dissipation 
 # of 180 watts. So to determine the Available Watts (AW) we subtract the two to give us 
 # a Power Surplus (PS) of 420 watts. We can use these 420 watts to supply power to POE 
 # edge devices. 
 #
 # So, what is maximum number of POE ports we can boot with this Power Availability 
 # (given worst case scenario of Class 0 or 3 boot threshold of 15.4 watts)? 
 # Note: The Power Devices may only require, for example, 8.5 watts to run but the initial
 # boot surge is 15.4 available watts.
 #
 #
 #	420 (AW) / 15.4(watts)  =   27 (Total POE Ports Enabled on Boot)
 #
 #
 # This is great, but what if we have more than 27 POE ports on this switch? We have two 
 # options here: 
 #
 # 1) Add an additional power injector 
 # 2) Use scripting to control the number of POE ports powered on boot.
 # 
 # Option 1 is pretty strait forward but can be some unexpected extra cost. 
 # Option 2 is to implement this script.
 #
 #
 #
 # Prerequisites: 
 #
 # A.	XOS Version 12.4.1 or greater
 #
 # B.	This script expects all inline-power ports to be disabled.
 #
 # C.	This script will only run "enable inline-power ports <port>"
 #	If there are any other prerequisites required for poe, then 
 #	they will need to be configured and saved prior.
 #
 # D.	This script will run in non-persistent mode. This will require
 #	all PD to rely on the autoexec.xsf script on bootup for
 #	power.
 #
 # E.	Save your config.
 #
 #
 #
 # Install:
 #
 # 1)	Modify: poe_vars.xsf 	
 #	Determine the time it takes for a Power Devices (PD) to reach idle watts using 
 #	a stop watch. Set the poeBootTime variable in milliseconds.
 #	Example: My bootup for my phones take about 2 minutes, so poeBootTime is 120000
 
 #	
 # 
 # 2)	Modify: poe_vars.xsf 	
 #	Setup each slot's list of PD by uncommenting the slot_x (where x is the slot number).
 #	Enter the list of ports for each slot. i.e. "1,2,3" or "1:1,1:2,1:3"
 #		
 # 3)	Modify: poe_vars.xsf 	
 # 	Find the available watts for each slot with the "show inline-power" command. Enter
 #	this variable into the AW_x (where x is the slot number).
 #
 # 4)	Modify: poe_vars.xsf  	
 # 	What is the maximum Operator Limit configured on the slot? Set the OL_x (where x is the 
 
 # 	slot number). Again, this operator limit is the maximum power requirement for a PD during 
 
 #	boot up. The acutally idle watts (idle watts are power requirements after boot) for the 
 
 #	PD may be less. 
 # 	show inline-power configuration ports <port_number>
 
 #	(The switch default is 15.4 watts)
 #
 # 5)	Copy all three files to the switch: poe_README.xsf, autoexec.xsf, poe_vars.xsf, and poe_scripts.xsf.
 #	Please keep all three files in lowercase. 
 #	tftp get <ip_address> vr vr-Default <file>.xsf 
 #
 # 6)	Test your variables with "load script poe_vars" from the command variables. If the  
 #	command prompt or logs do not return any errors, continue to step 7.
 #
 # 7) 	Do not save. Reboot switch
 #
 #
