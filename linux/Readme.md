# The script for Linux

# Secure server

The linux server will save history on the file system, it is not secure if this folder accessed by others.

The secure_server.sh file will link the history files to /dev/null

# Login RSA

When we enable login to remote server via rsa public key, the folder .ssh and authorized_keys file should have certain privileges, so I write the login_rsa.sh file to do this, the .ssh folder should has 700 privilege and authorized_keys should has 600 privilege.
