#!/bin/bash
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')
echo -e '\E[32m'"CPU Load Average :" $CPU
MEMORY=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
echo -e '\E[32m'"Memory usage :" $MEMORY
DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
echo -e '\E[32m'"Disk Usage :" $DISK
tecuptime=$(uptime | awk '{print $3,$4}' | cut -f1 -d,)
echo -e '\E[32m'"System Uptime Days/(HH:MM) :" $tecuptime
echo "Calculating Bandwidth Usage"
eth0=$(ip route get 8.8.8.8 | awk -- '{printf $5}')
vnstat -tr -i $eth0 >> /tmp/usage.txt
upload=$(cat /tmp/usage.txt | grep -i "tx")
download=$(cat /tmp/usage.txt | grep -i "rx")
upload2=$(echo $upload | cut -d" " -f2,3)
download2=$(echo $download | cut -d" " -f2,3)
echo "Current update data trasfer  speed :" $upload2
echo "Current downlod  data trasfer Speed :" $download2
vnstat -t -s -i $eth0 >> /tmp/usage2.txt
totald=$(cat /tmp/usage2.txt | grep -i "today" | cut -f3 -d"/")
#echo  -e '\E[32m' "Total Data Usage:" $totald
totald2=$(echo $totald | tr -d ' ')
echo  -e '\E[32m' "Total Data Usage:" $totald2
rm -Rf /tmp/usage*
echo "Calculating Download and Upload Speed on Server"
curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -  >> /tmp/speed.txt
speed1=$(cat /tmp/speed.txt | grep -i "Download:")
speed2=$(cat /tmp/speed.txt |grep -i "Upload:")
echo $speed1
echo $speed2
rm -Rf /tmp/speed*
