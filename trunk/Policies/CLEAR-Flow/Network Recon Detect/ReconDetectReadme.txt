*****************************
Policy Description
*****************************

Policy:  ReconDetect

Purpose: This policy provides a CLEAR-Flow monitoring example that 
inspects the TCP flags on all received TCP packets to detect
potential TCP flag filtering attacks.  Should the number of TCP packets
with all TCP flags on (a method used to avoid security filters)
exceed 1000 in 1 second, then an SNMP trap is issued, and a message
indicating the situation is written to the syslog.

CLEAR-Flow is supported on the BlackDiamond(R) 10808, 
BlackDiamond 12800R series, BlackDiamond 12804C, BlackDiamond 8800 "c" series, 
and Summit(R) X450a switches.    

For additonal information on CLEAR-Flow policies, please refer to 
the ExtremeXOS(TM) Concetps Guide.  

*****************************
Infrastructure Requirements
*****************************
ExtremeXOS(TM) 12.0
CLEAR-Flow compatible Extreme Networks core and aggregate switches.