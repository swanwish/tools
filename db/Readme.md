# Database tools

## Install database from url

    curl https://raw.githubusercontent.com/swanwish/tools/master/db/install_mariadb.sh | bash

## Install MariaDB on CentOS 8 from url

	curl https://raw.githubusercontent.com/swanwish/tools/master/db/install_mariadb_centos8.sh | bash

## Uninstall MariaDB on CentOS 8

	dnf remove MariaDB-server MariaDB-client

## Backup database from url

	curl https://raw.githubusercontent.com/swanwish/tools/master/db/backup_db.sh | bash -s path_of_db_conf_file
	
## Restore database from url

    curl https://raw.githubusercontent.com/swanwish/tools/master/db/restore_db.sh | bash -s path_of_db_conf_file

