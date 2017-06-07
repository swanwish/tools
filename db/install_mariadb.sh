touch /etc/yum.repos.d/MariaDB.repo
echo '# MariaDB 10.2 CentOS repository list - created 2017-06-07 02:50 UTC
# http://downloads.mariadb.org/mariadb/repositories/
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.2/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1' > /etc/yum.repos.d/MariaDB.repo
yum install -y MariaDB-server MariaDB-client
