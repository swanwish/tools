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

# Setup login-path for mysql

[在Linux上配置不用密码登录mysql](https://medium.com/@liwp.stephen/%E5%9C%A8linux%E4%B8%8A%E9%85%8D%E7%BD%AE%E4%B8%8D%E7%94%A8%E5%AF%86%E7%A0%81%E7%99%BB%E5%BD%95mysql-68c1a7d57863)

## Set login-path

```
$> mysql_config_editor set --login-path=client
         --host=localhost --user=localuser --password
Enter password: enter password "localpass" here
$> mysql_config_editor set --login-path=remote
         --host=remote.example.com --user=remoteuser --password
Enter password: enter password "remotepass" here
```

## Login with login-path

```
# Login mysql with login path named with client
mysql --login-path=client

# Login mysql with login path named with remote
mysql --login-path=remote
```

## Display exists login-path

```
$> mysql_config_editor print --all
```
