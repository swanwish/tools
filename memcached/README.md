# Upgrade memcached to 1.5.9

```
# Install memcache
yum install memcached

# Download this binary
wget https://github.com/swanwish/tools/raw/master/memcached/memcached-1.5.9-centos7.tar.gz

# Backup old memcached file
sudo mv /usr/bin/memcached /usr/bin/memcached_before_1.5.9

# Extract the new memcache file to `/usr/bin` folder
sudo tar -C /usr/bin -xzf memcached-1.5.9-centos7.tar.gz

# Enable and start memcached service
sudo systemctl enable memcached
sudo systemctl start memcached

# Check memcached version
memcached-tool localhost stats

# We will get some output like below
version       1.5.9
```

## Setting for the memcached on CentOS

```
# File
/etc/sysconfig/memcached

# Change CACHESIZE to 2048M
CACHESIZE="2048"

```