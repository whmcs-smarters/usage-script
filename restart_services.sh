#!/bin/bash
echo "Restarting OpenVPN Services ..."
if systemctl restart openvpn@server > /dev/null 2>&1; then
echo "Success: OpenVPN Service Restarted Successfully"
else
  echo "Failed: Failed to Restart OpenVPN Service"  
fi
if service ipsec restart > /dev/null 2>&1; then
  echo "Success: iPsec Service Restarted Successfully"
else
   echo "Failed: Failed to Restart iPsec Service" 
fi
