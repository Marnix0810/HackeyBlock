cd /d "%~dp0"
mkdir "%appdata%\Microsoft\Windows\Start Menu\Programs\Hackey AdBlock by Marnix 0810\"
mkdir "%appdata%\Microsoft\Windows\Start Menu\Programs\The Marnix 0810 Site\"
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%appdata%\Microsoft\Windows\Start Menu\Programs\The Marnix 0810 Site\Mail Marnix 0810.url');$s.TargetPath='mailto:programmer.marxin0810@gmail.com';$s.Save()"
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%appdata%\Microsoft\Windows\Start Menu\Programs\The Marnix 0810 Site\The Marnix 0810 Site.url');$s.TargetPath='https://marnix0810.wordpress.com/';$s.Save()"
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%appdata%\Microsoft\Windows\Start Menu\Programs\Hackey AdBlock by Marnix 0810\Go to Hackey-AdBlock contact form.url');$s.TargetPath='https://marnix0810.wordpress.com/marnix0810s-hackey-adblock/hackeyblock-contact-form/';$s.Save()"
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%appdata%\Microsoft\Windows\Start Menu\Programs\Hackey AdBlock by Marnix 0810\Hackey AdBlock Menu.lnk');$s.TargetPath='%~dp0hackey.cmd';$s.Save()"
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%appdata%\Microsoft\Windows\Start Menu\Programs\Hackey AdBlock by Marnix 0810\Uninstall Hackey AdBlock.lnk');$s.TargetPath='%~dp0Uninstall_Trigger.cmd';$s.Save()"
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\Hackey-AdBlock@startup.lnk');$s.TargetPath='%~dp0hackeyrunner-startup.exe';$s.Save()"
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%HOMEDRIVE%\Users\Public\Desktop\Hackey-AdBlock.lnk');$s.TargetPath='%~dp0hackey.cmd';$s.Save()"
powershell -window maximized -command ""
