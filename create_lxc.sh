#!/bin/bash
Hostname=$1
sidr=$2
COUNT=5
## if need delete symbols start at / use this:
ip=${sidr%/*}
ssh-keygen -f "/root/.ssh/known_hosts" -R $ip 

lxc-create -n $Hostname -t centos-7 -- -4 $sidr
cat <<EOF >>/var/lib/lxc/$Hostname/config
# Autostart
lxc.start.auto = 1
lxc.start.delay = 5
lxc.start.order = 100
EOF

lxc-autostart

echo 'wait start lxc'
while [ true ]; do
	count=$(ping -c $COUNT $ip | grep 'received' | awk -F',' '{ print $2 }' | awk '{ print $1 }')	
	if [ $count = 5 ]; then
		echo 'lxc is started'		
		ssh root@$ip 'bash -s' < yum.sh
		echo "All done"  
		break
	fi
done
