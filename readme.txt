To setup a pairing server with NX, execute the following steps:

1. Log in to a clean ec2 instance (e.g, ami-cef405a7) as 'ubuntu' user.
2. Run the bootstrap.sh script as root supplying a password for the pair user
3. Upload the public keys of authorized users, and run the addkey.sh on them (as root)
4. Add the public key in /home/pair/.ssh/pair_key.pub to github accounts as needed
5. Login with the NX client from your local machine, using the password configured in #2
6. Tweak settings for best performance
