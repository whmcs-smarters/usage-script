#!/bin/bash
echo "Restarting OpenVPN Services ..."

openvpn=$(systemctl restart openvpn@server > /dev/null 2>&1)
if $openvpn; then
echo "Success: OpenVPN Service Restarted Successfully"
else
  echo "Failed: Failed to Restart OpenVPN Service"  
  echo "Error Message: $openvpn"
fi
ipsec=$(service ipsec restart > /dev/null 2>&1)
if $ipsec; then
  echo "Success: iPsec Service Restarted Successfully"
else
   echo "Failed: Failed to Restart iPsec Service" 
   echo "Error Message: $ipsec"
fi
