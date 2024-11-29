@echo off
:: Create a scheduled task to block GitHub in 1 hour
echo Creating scheduled task to block GitHub after 1 hour...

:: Schedule the task to run 1 hour later (3600 seconds)
schtasks /create /tn "BlockGitHub" /tr "cmd /c echo 127.0.0.1 github.com >> C:\Windows\System32\drivers\etc\hosts" /sc once /st %time:~0,2%:%time:~3,2% /sd %date% /ru SYSTEM /f /delay 01:00:00

:: Display message that the task was scheduled
echo Task created! GitHub will be blocked in 1 hour.

:: End the batch file
exit
