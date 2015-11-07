touch /etc/yum.repos.d/MariaDB.repo
echo '# MariaDB 10.0 CentOS repository list - created 2015-06-02 07:26 UTC
# http://mariadb.org/mariadb/repositories/
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.0/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1' > /etc/yum.repos.d/MariaDB.repo
yum install -y MariaDB-server MariaDB-client
