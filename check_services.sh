#!/bin/bash

# Define file paths for OpenVPN and IKEv2 status

OPENVPN_STATUS_FILE="/var/www/usage/openvpn.txt"
IKEV2_STATUS_FILE="/var/www/usage/ikev2.txt"

# Check if the OpenVPN service is running
if systemctl is-active openvpn@server > /dev/null 2>&1; then
  echo "online" > $OPENVPN_STATUS_FILE
  OPENVPN_STATUS="online"
else
  echo "offline" > $OPENVPN_STATUS_FILE
  OPENVPN_STATUS="offline"
fi

# Check if the IKEv2 service is running
if ipsec status > /dev/null 2>&1; then
  echo "online" > $IKEV2_STATUS_FILE
  IKEV2_STATUS = "online"
else
  echo "offline" > $IKEV2_STATUS_FILE
  IKEV2_STATUS = "offline"
fi
