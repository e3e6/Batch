@echo off

set TIMESTAMP=%date:~4,2%-%date:~7,2%-%date:~10,4%_%time:~0,2%-%time:~3,2%-%time:~6,2%

set LOGS_DIR=NetworkInfo
set LOG_FILE=%LOGS_DIR%\%TIMESTAMP%.
set EXT=.log


If Not Exist %LOGS_DIR% (
 md %LOGS_DIR%
)

START "nslookup" CMD.EXE /C ^(nslookup google.com ^> %LOG_FILE%nslookup%EXT%^)

START "ping" CMD.EXE /C ^(ping 192.168.32.1 ^> %LOG_FILE%ping%EXT%^)

START "tracert" CMD.EXE /C ^(tracert -d google.com ^> %LOG_FILE%tracert%EXT%^)

START "ipconfig" CMD.EXE /C ^(ipconfig /all ^> %LOG_FILE%ipconfig%EXT%^)

START "route" CMD.EXE /C ^(route print ^> %LOG_FILE%route%EXT%^)