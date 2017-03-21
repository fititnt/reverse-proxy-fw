##ubuntu@ip-172-31-14-179:~$ cat /etc/*release
#DISTRIB_ID=Ubuntu
#DISTRIB_RELEASE=16.04
#DISTRIB_CODENAME=xenial
#DISTRIB_DESCRIPTION="Ubuntu 16.04.2 LTS"
#NAME="Ubuntu"
#VERSION="16.04.2 LTS (Xenial Xerus)"
#ID=ubuntu
#ID_LIKE=debian
#PRETTY_NAME="Ubuntu 16.04.2 LTS"
#VERSION_ID="16.04"
#HOME_URL="http://www.ubuntu.com/"
#SUPPORT_URL="http://help.ubuntu.com/"
#BUG_REPORT_URL="http://bugs.launchpad.net/ubuntu/"
#VERSION_CODENAME=xenial



sudo apt-get update
sudo apt-get install nginx -y

# Usando firewall da EC2

systemctl status nginx
systemctl start nginx

# WinSCP as Sudo https://winscp.net/eng/docs/faq_su
sudo sh -c 'echo "ubuntu  ALL=NOPASSWD: /bin/sftp-server" >> /etc/sudoers'

# Implode o padrão
sudo sh -c 'echo "#Arquivo propositalmente vazio" > /etc/nginx/sites-available/default'

## https://www.howtoforge.com/nginx-how-to-block-visitors-by-country-with-the-geoip-module-debian-ubuntu
# nginx -V | grep geo
# sudo apt-get install geoip-database libgeoip1
# ls -lah /usr/share/GeoIP/GeoIP.dat