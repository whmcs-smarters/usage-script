#!/bin/bash
echo "Restarting OpenVPN Services ..."

openvpn=$(systemctl restart openvpn@server)
if $openvpn > /dev/null 2>&1; then
echo "Success: OpenVPN Service Restarted Successfully"
else
  echo "Failed: Failed to Restart OpenVPN Service"  
  echo "Error Message: $openvpn"
fi
ipsec=$(service ipsec restart)
if $ipsec > /dev/null 2>&1; then
  echo "Success: iPsec Service Restarted Successfully"
else
   echo "Failed: Failed to Restart iPsec Service" 
   echo "Error Message: $ipsec"
fi
