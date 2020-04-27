touch /etc/yum.repos.d/MariaDB.repo
echo '# MariaDB 10.4 CentOS repository list - created 2020-04-27 03:11 UTC
# http://downloads.mariadb.org/mariadb/repositories/
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.4/centos8-amd64
module_hotfixes=1
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1' > /etc/yum.repos.d/MariaDB.repo
dnf install -y MariaDB-server MariaDB-client
