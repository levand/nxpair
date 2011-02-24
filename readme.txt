To setup a pairing server with NX, execute the following steps:

1. Log in to a clean ubuntu ec2 instance (e.g, ami-cef405a7) as 'ubuntu' user.
2. Run the bootstrap.sh script as root supplying a password for the pair user
3. Upload the public keys of authorized users, and run the addkey.sh on them (as root)
4. Add the public key in /home/pair/.ssh/pair_key.pub to github accounts as needed
5. Login with the NX client from your local machine, using the password configured in #2
6. There is a misconfigured shortcut key in gnome's default settings. 
   Go to System->Preferences->Keyboard Shortcuts and disable the 'd' key. 
7. Tweak NX client settings for best performance.
   a. Choose "modem" as connection speed. This will allow the best performance
      without significantly impacting the quality of text.
   b. In "Advanced", bump all cache sizes to the maximum.
   c. 
   


