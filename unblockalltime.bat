@echo off
set website=github.com
set hostsFile=%SystemRoot%\System32\drivers\etc\hosts
set tempHosts=%temp%\hosts.bak

:: Check if the site is already blocked
findstr "127.0.0.1 %website%" %hostsFile% >nul 2>&1
if %errorlevel%==0 (
    echo Site is currently blocked. Unblocking...
    findstr /v "127.0.0.1 %website%" %hostsFile% > %tempHosts%
    copy /y %tempHosts% %hostsFile% >nul
    echo Site unblocked. Access is now allowed.
) else (
    echo Site is already accessible.
)

:: Flush DNS to apply changes
ipconfig /flushdns >nul
echo %website% is now accessible. Exiting.

exit