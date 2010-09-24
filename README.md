# zerigo dyndns client in shell script
This is a simple dns update client for zerigo. It uses
[icanhazip.com](http://icanhazip.com) for checking the external address and
saves it to a textfile. The textfile is checked and updates are only done if
the IP has actually changed.

## Files
- `zerigo_dyndns.sh` is the actual script to execute
- `launch.plist` is a launchd plist file to run the shell script once per hour
