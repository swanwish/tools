# The script for Linux

# Secure server

The linux server will save history on the file system, it is not secure if this folder accessed by others.

The secure_server.sh file will link the history files to /dev/null

`curl https://raw.githubusercontent.com/swanwish/tools/master/linux/secure_server.sh | bash`

# Login RSA

When we enable login to remote server via rsa public key, the folder .ssh and authorized_keys file should have certain privileges, so I write the login_rsa.sh file to do this, the .ssh folder should has 700 privilege and authorized_keys should has 600 privilege.

`curl https://raw.githubusercontent.com/swanwish/tools/master/linux/login_rsa.sh | bash`

# Clean old files

This tool can be used for delete old files, it can accept two parameters, the first one is the path to check, the second one is the days to keep
