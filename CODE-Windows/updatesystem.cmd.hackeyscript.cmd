@ECHO OFF
if not "%Adminrequested%"=="1" (
call HARR "%~s0"
)

:gotAdmin
    pushd "%CD%"
    CD /D "%Toinstallationfolder%"
call "%~dp0loadset.cmd"
set Toinstallationfolder=%ProgramFiles%\marnix0810\HackeyBlock\
if not "%ProgramFiles(x86)%"=="" set Toinstallationfolder=%ProgramFiles(x86)%\marnix0810\HackeyBlock\
CD /D "%Toinstallationfolder%"
:ret2
cls
echo checking for updates.
FOR /F "usebackq tokens=1" %%A IN (`PING google.com`) DO (
    REM Check the current line for the indication of a successful connection.
    IF /I "%%A"=="Reply" SET Connected=true
)
If "%connected%"=="false" (
cls
echo ... no internet connection found. Update system needs internet.
goto ret2
)
del /f /q latest-version.txt >NUL
call powershell -command "iwr -outf latest-version.txt https://raw.githubusercontent.com/Marnix0810/HackeyBlock/master/latest-release.txt"
set /p "latestver="<"latest-version.txt"
set /p "installedver="<"Hackey-install-version.txt"
if "%latestver%"=="%installedver%" (
echo Hackey is up-to-date. Installed version: 
type Hackey-install-version.txt
goto don2
)
cls
echo update is available.
taskkill /f /im python.exe
taskkill /f /im powershell.exe
echo Restoring onblocked patrons of hostsfile.
copy C:\Windows\System32\drivers\etc\hosts_before-Hackey.bkup C:\Windows\System32\drivers\etc\hosts /y
del /q /f "installed"
(
echo TYPE "%Toinstallationfolder%updatesystem.cmd.Hackeyscript" ^>  "%Toinstallationfolder%updatesystem.cmd"
echo CALL updatesystem.cmd
echo exit /b
)> Hackeyblock.cmd
:ret1
cls
echo deleting old version.
del /f /q /s "%Toinstallationfolder%*.*"
cls
echo locating installer for HackeyBlock
call powershell -command "iwr -outf updurl.txt https://raw.githubusercontent.com/Marnix0810/HackeyBlock/master/updurl.txt"
set /p "updurl="<"updurl.txt"
echo downloading updater for HackeyBlock.
call powershell -command "iwr -outf Hackeyupdate.exe %updurl%"
start /wait Hackeyupdate.exe
cls
Echo checking if update went well...
if not exist "%Toinstallationfolder%installed" (
echo E: unknown error while updating.
echo retry is needed, files are deleted and to make sure Hackey keeps working, you should install the update... sorry!
goto ret1
)
cls
echo Update went well!
:don1
cls
echo please wait...
call "%Toinstallationfolder%shortcuts.cmd"
cls
echo hello and welcome to Hackey!
Echo:
Echo Hackey will start automatically. to go to it's menu, you will find a shortcut in start menu --^> programs --^> Marnix 0810
echo:
echo finished update!
ping localhost -n 1 >NUL
type NUL > "%~s0"
start cmd /c "%Toinstallationfolder%HackeyBlock_menu.exe"
start cmd /c "%Toinstallationfolder%Hackeyblock.cmd"
exit
:don2
timeout /t 5 >NUL
exit