
VPN_NETWORKS="10.107.0.0/16 
10.108.0.0/16 
10.109.0.0/16
10.118.0.0/16
10.208.0.0/16
172.16.0.0/16 
212.111.36.8/29
212.111.36.128/27
212.111.36.129/32 
212.111.36.160/27
212.111.36.187/32
212.111.56.32/27
212.111.56.128/27" 

VPN_IP=`ifconfig ppp0 | grep inet | awk '{ print $2 }'`

for NETWORK in $VPN_NETWORKS; do
  sudo route add -net $NETWORK gw $VPN_IP dev ppp0
done

echo 'search youdevise.com' >> /etc/resolv.conf
