
VPN_NETWORKS="10.107.0.0 10.108.0.0 10.109.0.0 10.118.0.0 10.208.0.0 172.16.0.0"

VPN_IP=`ifconfig ppp0 | grep inet | awk '{ print $2 }'`

for NETWORK in $VPN_NETWORKS; do
  route add -net $NETWORK netmask 255.255.0.0 gw $VPN_IP dev ppp0
done


