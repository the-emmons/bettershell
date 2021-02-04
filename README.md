Bettershell is a netcat client supercharged with rlwrap, socat, a large Powershell command wordlist, and bash scripting, here in the name of bringing an end to eternally lousy Windows reverse shells.

Using bettershell in place of a typical nc listener, you can catch dope Powershell reverse shells that don't die on ctrl+c, autocomplete your powershell and cmd commands, allow arrowkey movement to edit pasted commands, and keep a searchable command history. You also get an accurate path prompt, plus no weird echoing of commands back at you. Best of all, it's blue - the way Powershell was meant to be.

Bettershell can be used to catch any reverse shell from a Windows box. For stderr support, the included socat.exe binary can easily be executed on the victim from an SMB share or unzipped on-location with the included zip.exe.

Created for the OSCP exam.

In the future, I'm planning on switching from a netcat core to a custom listener for in-shell file transfers, along with easy port egress-checking functionality. If you find yourself missing a feature, create an issue and I'll see what I can do.
