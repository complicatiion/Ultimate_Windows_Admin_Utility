@echo off
setlocal EnableExtensions EnableDelayedExpansion
title Ultimate Windows Admin Utility

color 0E
chcp 65001 >nul

:: Check for administrator rights
net session >nul 2>&1
if %errorlevel%==0 (
  set "ISADMIN=1"
) else (
  set "ISADMIN=0"
)

:: Base folders
set "BASE=%USERPROFILE%\Desktop\AdminToolkitReports"
set "R_SYSTEM=%BASE%\System"
set "R_POWER=%BASE%\Power"
set "R_NETWORK=%BASE%\Network"
set "R_SQL=%BASE%\SQL"
set "R_USERS=%BASE%\Users"
set "R_CLEAN=%BASE%\Cleanup"

if not exist "%BASE%" md "%BASE%" >nul 2>&1
if not exist "%R_SYSTEM%" md "%R_SYSTEM%" >nul 2>&1
if not exist "%R_POWER%" md "%R_POWER%" >nul 2>&1
if not exist "%R_NETWORK%" md "%R_NETWORK%" >nul 2>&1
if not exist "%R_SQL%" md "%R_SQL%" >nul 2>&1
if not exist "%R_USERS%" md "%R_USERS%" >nul 2>&1
if not exist "%R_CLEAN%" md "%R_CLEAN%" >nul 2>&1

set "AGEDAYS=60"
set "DOMAIN_TARGET=www.example.com"
set "SERVER_TARGET=localhost"

:MAIN
cls
echo ============================================================
echo Ultimate Windows Admin Utility by complicatiion
echo ============================================================
echo.
if "%ISADMIN%"=="1" (
  echo Admin status: YES
) else (
  echo Admin status: NO
)
echo Report base folder: %BASE%
echo.
echo [1] System and hardware
echo [2] Power and battery
echo [3] Network, domain and server checks
echo [4] SQL Browser and SQL Express checks
echo [5] User accounts and profile cleanup
echo [6] Temp and Windows cleanup
echo [7] Full health report
echo [8] Open report base folder
echo [0] Exit
echo.
set /p CHO="Selection: "

if "%CHO%"=="1" goto :MENU_SYSTEM
if "%CHO%"=="2" goto :MENU_POWER
if "%CHO%"=="3" goto :MENU_NETWORK
if "%CHO%"=="4" goto :MENU_SQL
if "%CHO%"=="5" goto :MENU_USERS
if "%CHO%"=="6" goto :MENU_CLEAN
if "%CHO%"=="7" goto :FULLREPORT
if "%CHO%"=="8" goto :OPENBASE
if "%CHO%"=="0" goto :END
goto :MAIN

:MENU_SYSTEM
cls
echo ============================================================
echo System and hardware
echo ============================================================
echo.
echo [1] Quick live system status
echo [2] Full hardware audit report
echo [3] System information
echo [4] CPU information
echo [5] Memory information
echo [6] Disk and volume usage
echo [7] Device problems
echo [8] Top processes by CPU
echo [9] Top processes by memory
echo [A] Recent system critical and error events
echo [B] Open system report folder
echo [0] Back
echo.
set /p CHO="Selection: "

if "%CHO%"=="1" goto :SYS_QUICK
if "%CHO%"=="2" goto :SYS_FULL
if "%CHO%"=="3" goto :SYS_INFO
if "%CHO%"=="4" goto :SYS_CPU
if "%CHO%"=="5" goto :SYS_MEM
if "%CHO%"=="6" goto :SYS_DISK
if "%CHO%"=="7" goto :SYS_DEVICES
if "%CHO%"=="8" goto :SYS_TOPCPU
if "%CHO%"=="9" goto :SYS_TOPMEM
if /I "%CHO%"=="A" goto :SYS_EVENTS
if /I "%CHO%"=="B" goto :OPEN_SYSTEM
if "%CHO%"=="0" goto :MAIN
goto :MENU_SYSTEM

:MENU_POWER
cls
echo ============================================================
echo Power and battery
echo ============================================================
echo.
echo [1] Quick power status
echo [2] Full power report
echo [3] Battery report
echo [4] Energy report                              [Admin]
echo [5] Sleep study                               [Admin / supported systems]
echo [6] Wake analysis
echo [7] Show available power plans
echo [8] Set Balanced plan                         [Admin]
echo [9] Set High performance plan                 [Admin]
echo [A] Set Power saver plan                      [Admin]
echo [B] Enable hibernation                        [Admin]
echo [C] Disable hibernation                       [Admin]
echo [D] Open power report folder
echo [0] Back
echo.
set /p CHO="Selection: "

if "%CHO%"=="1" goto :PWR_QUICK
if "%CHO%"=="2" goto :PWR_FULL
if "%CHO%"=="3" goto :PWR_BATTERY
if "%CHO%"=="4" goto :PWR_ENERGY
if "%CHO%"=="5" goto :PWR_SLEEP
if "%CHO%"=="6" goto :PWR_WAKE
if "%CHO%"=="7" goto :PWR_PLANS
if "%CHO%"=="8" goto :PWR_BAL
if "%CHO%"=="9" goto :PWR_HIGH
if /I "%CHO%"=="A" goto :PWR_SAVE
if /I "%CHO%"=="B" goto :PWR_HIBON
if /I "%CHO%"=="C" goto :PWR_HIBOFF
if /I "%CHO%"=="D" goto :OPEN_POWER
if "%CHO%"=="0" goto :MAIN
goto :MENU_POWER

:MENU_NETWORK
cls
echo ============================================================
echo Network, domain and server checks
echo ============================================================
echo.
echo Current domain target: %DOMAIN_TARGET%
echo Current server target: %SERVER_TARGET%
echo.
echo [1] Set domain target
echo [2] Set server target
echo [3] Quick network status
echo [4] Domain check menu
echo [5] Server check menu
echo [6] IP and adapter overview
echo [7] DNS cache and DNS servers
echo [8] Open network report folder
echo [0] Back
echo.
set /p CHO="Selection: "

if "%CHO%"=="1" goto :SET_DOMAIN
if "%CHO%"=="2" goto :SET_SERVER
if "%CHO%"=="3" goto :NET_QUICK
if "%CHO%"=="4" goto :MENU_DOMAIN
if "%CHO%"=="5" goto :MENU_SERVER
if "%CHO%"=="6" goto :NET_IP
if "%CHO%"=="7" goto :NET_DNS
if "%CHO%"=="8" goto :OPEN_NETWORK
if "%CHO%"=="0" goto :MAIN
goto :MENU_NETWORK

:MENU_DOMAIN
cls
echo ============================================================
echo Domain checks
echo ============================================================
echo.
echo Target: %DOMAIN_TARGET%
echo.
echo [1] Ping check
echo [2] DNS lookup
echo [3] NS lookup
echo [4] MX lookup
echo [5] Trace route
echo [6] Port 80 check
echo [7] Port 443 check
echo [8] Full domain report
echo [0] Back
echo.
set /p CHO="Selection: "

if "%CHO%"=="1" goto :DOM_PING
if "%CHO%"=="2" goto :DOM_DNS
if "%CHO%"=="3" goto :DOM_NS
if "%CHO%"=="4" goto :DOM_MX
if "%CHO%"=="5" goto :DOM_TRACE
if "%CHO%"=="6" goto :DOM_80
if "%CHO%"=="7" goto :DOM_443
if "%CHO%"=="8" goto :DOM_REPORT
if "%CHO%"=="0" goto :MENU_NETWORK
goto :MENU_DOMAIN

:MENU_SERVER
cls
echo ============================================================
echo Server checks
echo ============================================================
echo.
echo Target: %SERVER_TARGET%
echo.
echo [1] Ping check
echo [2] DNS lookup
echo [3] Reverse DNS lookup
echo [4] Trace route
echo [5] SMB port 445 check
echo [6] RDP port 3389 check
echo [7] WinRM port 5985 check
echo [8] HTTP port 80 check
echo [9] HTTPS port 443 check
echo [A] SQL port 1433 check
echo [B] Net view check
echo [C] Full server report
echo [0] Back
echo.
set /p CHO="Selection: "

if "%CHO%"=="1" goto :SRV_PING
if "%CHO%"=="2" goto :SRV_DNS
if "%CHO%"=="3" goto :SRV_RDNS
if "%CHO%"=="4" goto :SRV_TRACE
if "%CHO%"=="5" goto :SRV_445
if "%CHO%"=="6" goto :SRV_3389
if "%CHO%"=="7" goto :SRV_5985
if "%CHO%"=="8" goto :SRV_80
if "%CHO%"=="9" goto :SRV_443
if /I "%CHO%"=="A" goto :SRV_1433
if /I "%CHO%"=="B" goto :SRV_NETVIEW
if /I "%CHO%"=="C" goto :SRV_REPORT
if "%CHO%"=="0" goto :MENU_NETWORK
goto :MENU_SERVER

:MENU_SQL
cls
echo ============================================================
echo SQL Browser and SQL Express checks
echo ============================================================
echo.
echo [1] Quick SQL status
echo [2] Check SQLBrowser service
echo [3] Set SQLBrowser startup to Automatic       [Admin]
echo [4] Start SQLBrowser service                  [Admin]
echo [5] Check SQL instances and services
echo [6] Check SQL Express installation details
echo [7] Full SQL report
echo [8] Open SQL report folder
echo [0] Back
echo.
set /p CHO="Selection: "

if "%CHO%"=="1" goto :SQL_QUICK
if "%CHO%"=="2" goto :SQL_BROWSER
if "%CHO%"=="3" goto :SQL_AUTO
if "%CHO%"=="4" goto :SQL_START
if "%CHO%"=="5" goto :SQL_INST
if "%CHO%"=="6" goto :SQL_DETAIL
if "%CHO%"=="7" goto :SQL_REPORT
if "%CHO%"=="8" goto :OPEN_SQL
if "%CHO%"=="0" goto :MAIN
goto :MENU_SQL

:MENU_USERS
cls
echo ============================================================
echo User accounts and profile cleanup
echo ============================================================
echo.
echo Old domain profile threshold: %AGEDAYS% days
echo Whitelist patterns: ADMP / Admin
echo.
echo [1] List user accounts and profiles
echo [2] Profile details and inactivity
echo [3] Profile size check
echo [4] User profile report
echo [5] Delete selected profile                   [Admin]
echo [6] Delete local user account                 [Admin]
echo [7] Delete profile and local account          [Admin]
echo [8] Delete all domain profiles                [Admin]
echo [9] Delete old domain profiles only           [Admin]
echo [A] Show old domain profiles with whitelist
echo [B] Open user report folder
echo [0] Back
echo.
set /p CHO="Selection: "

if "%CHO%"=="1" goto :USR_LIST
if "%CHO%"=="2" goto :USR_DETAILS
if "%CHO%"=="3" goto :USR_SIZES
if "%CHO%"=="4" goto :USR_REPORT
if "%CHO%"=="5" goto :USR_DELPROF
if "%CHO%"=="6" goto :USR_DELUSER
if "%CHO%"=="7" goto :USR_DELBOTH
if "%CHO%"=="8" goto :USR_DELALLDOM
if "%CHO%"=="9" goto :USR_DELOLD
if /I "%CHO%"=="A" goto :USR_SHOWOLD
if /I "%CHO%"=="B" goto :OPEN_USERS
if "%CHO%"=="0" goto :MAIN
goto :MENU_USERS

:MENU_CLEAN
cls
echo ============================================================
echo Temp and Windows cleanup
echo ============================================================
echo.
echo [1] Quick junk scan
echo [2] Detailed junk scan
echo [3] Clean user temp
echo [4] Clean Windows temp                        [Admin]
echo [5] Clean Prefetch                            [Admin]
echo [6] Empty recycle bin
echo [7] Clean Windows Update cache                [Admin]
echo [8] Flush DNS cache
echo [9] Clean thumbnail cache
echo [A] Run all standard cleanups
echo [B] Cleanup report
echo [C] Open cleanup report folder
echo [0] Back
echo.
set /p CHO="Selection: "

if "%CHO%"=="1" goto :CLN_QUICK
if "%CHO%"=="2" goto :CLN_DETAIL
if "%CHO%"=="3" goto :CLN_USERTEMP
if "%CHO%"=="4" goto :CLN_WINTEMP
if "%CHO%"=="5" goto :CLN_PREFETCH
if "%CHO%"=="6" goto :CLN_RECYCLE
if "%CHO%"=="7" goto :CLN_WU
if "%CHO%"=="8" goto :CLN_DNS
if "%CHO%"=="9" goto :CLN_THUMB
if /I "%CHO%"=="A" goto :CLN_ALL
if /I "%CHO%"=="B" goto :CLN_REPORT
if /I "%CHO%"=="C" goto :OPEN_CLEAN
if "%CHO%"=="0" goto :MAIN
goto :MENU_CLEAN

:OPENBASE
start "" explorer.exe "%BASE%"
goto :MAIN

:OPEN_SYSTEM
start "" explorer.exe "%R_SYSTEM%"
goto :MENU_SYSTEM

:OPEN_POWER
start "" explorer.exe "%R_POWER%"
goto :MENU_POWER

:OPEN_NETWORK
start "" explorer.exe "%R_NETWORK%"
goto :MENU_NETWORK

:OPEN_SQL
start "" explorer.exe "%R_SQL%"
goto :MENU_SQL

:OPEN_USERS
start "" explorer.exe "%R_USERS%"
goto :MENU_USERS

:OPEN_CLEAN
start "" explorer.exe "%R_CLEAN%"
goto :MENU_CLEAN

:SET_DOMAIN
cls
echo ============================================================
echo Set domain target
echo ============================================================
echo.
set /p DOMAIN_TARGET="Enter domain or host name: "
if "%DOMAIN_TARGET%"=="" set "DOMAIN_TARGET=www.example.com"
goto :MENU_NETWORK

:SET_SERVER
cls
echo ============================================================
echo Set server target
echo ============================================================
echo.
set /p SERVER_TARGET="Enter server name or IP: "
if "%SERVER_TARGET%"=="" set "SERVER_TARGET=localhost"
goto :MENU_NETWORK

:SYS_QUICK
cls
echo ============================================================
echo Quick live system status
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "$os = Get-CimInstance Win32_OperatingSystem; $cpu = Get-CimInstance Win32_Processor | Select-Object -First 1; $cs = Get-CimInstance Win32_ComputerSystem; $disks = Get-CimInstance Win32_LogicalDisk -Filter 'DriveType=3'; Write-Host ('Computer        : ' + $env:COMPUTERNAME); Write-Host ('Manufacturer    : ' + $cs.Manufacturer); Write-Host ('Model           : ' + $cs.Model); Write-Host ('CPU             : ' + $cpu.Name.Trim()); Write-Host ('CPU Load        : ' + $cpu.LoadPercentage + '%%'); $total = [math]::Round($cs.TotalPhysicalMemory / 1GB, 2); $free = [math]::Round($os.FreePhysicalMemory * 1KB / 1GB, 2); $used = [math]::Round($total - $free, 2); Write-Host ('Memory Total    : ' + $total + ' GB'); Write-Host ('Memory Used     : ' + $used + ' GB'); Write-Host ('Memory Free     : ' + $free + ' GB'); Write-Host ''; Write-Host 'Drives:'; $disks | ForEach-Object { $size=[math]::Round($_.Size/1GB,2); $free=[math]::Round($_.FreeSpace/1GB,2); $used=[math]::Round($size-$free,2); $pct=if($_.Size -gt 0){[math]::Round((($_.Size-$_.FreeSpace)/$_.Size)*100,1)}else{0}; Write-Host ('  ' + $_.DeviceID + '  Used: ' + $used + ' GB / ' + $size + ' GB  (' + $pct + '%%)') }"
echo.
pause
goto :MENU_SYSTEM

:SYS_INFO
cls
echo ============================================================
echo System information
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-CimInstance Win32_ComputerSystem | Select-Object Manufacturer, Model, Domain, SystemType, UserName, TotalPhysicalMemory | Format-List; Get-CimInstance Win32_BIOS | Select-Object Manufacturer, SMBIOSBIOSVersion, ReleaseDate, SerialNumber | Format-List; Get-CimInstance Win32_OperatingSystem | Select-Object Caption, Version, BuildNumber, OSArchitecture, InstallDate, LastBootUpTime | Format-List"
echo.
pause
goto :MENU_SYSTEM

:SYS_CPU
cls
echo ============================================================
echo CPU information
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-CimInstance Win32_Processor | Select-Object Name, Manufacturer, NumberOfCores, NumberOfLogicalProcessors, MaxClockSpeed, CurrentClockSpeed, LoadPercentage | Format-List"
echo.
pause
goto :MENU_SYSTEM

:SYS_MEM
cls
echo ============================================================
echo Memory information
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "$cs=Get-CimInstance Win32_ComputerSystem; $os=Get-CimInstance Win32_OperatingSystem; $total=[math]::Round($cs.TotalPhysicalMemory/1GB,2); $free=[math]::Round($os.FreePhysicalMemory*1KB/1GB,2); $used=[math]::Round($total-$free,2); Write-Output ('Total RAM : ' + $total + ' GB'); Write-Output ('Used RAM  : ' + $used + ' GB'); Write-Output ('Free RAM  : ' + $free + ' GB'); '' ; Get-CimInstance Win32_PhysicalMemory | Select-Object BankLabel, DeviceLocator, Manufacturer, @{N='CapacityGB';E={[math]::Round($_.Capacity/1GB,2)}}, Speed, PartNumber | Format-Table -AutoSize"
echo.
pause
goto :MENU_SYSTEM

:SYS_DISK
cls
echo ============================================================
echo Disk and volume usage
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-CimInstance Win32_DiskDrive | Select-Object Model, InterfaceType, MediaType, SerialNumber, @{N='SizeGB';E={[math]::Round($_.Size/1GB,2)}}, Status | Format-Table -AutoSize; ''; Get-CimInstance Win32_LogicalDisk -Filter 'DriveType=3' | ForEach-Object { $size=[math]::Round($_.Size/1GB,2); $free=[math]::Round($_.FreeSpace/1GB,2); $used=[math]::Round($size-$free,2); $pct=if($_.Size -gt 0){[math]::Round((($_.Size-$_.FreeSpace)/$_.Size)*100,1)}else{0}; [pscustomobject]@{Drive=$_.DeviceID; Label=$_.VolumeName; FileSystem=$_.FileSystem; SizeGB=$size; UsedGB=$used; FreeGB=$free; UsedPercent=$pct} } | Format-Table -AutoSize"
echo.
pause
goto :MENU_SYSTEM

:SYS_DEVICES
cls
echo ============================================================
echo Device problems
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "$p = Get-PnpDevice -PresentOnly -ErrorAction SilentlyContinue | Where-Object { $_.Status -ne 'OK' }; if($p){$p | Select-Object Class, FriendlyName, Status, ProblemCode, InstanceId | Format-Table -AutoSize}else{'No currently reported PnP device errors found.'}"
echo.
pause
goto :MENU_SYSTEM

:SYS_TOPCPU
cls
echo ============================================================
echo Top processes by CPU
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-Process | Sort-Object CPU -Descending | Select-Object -First 15 Name, Id, CPU, @{N='WorkingSetMB';E={[math]::Round($_.WS/1MB,1)}}, @{N='PrivateMB';E={[math]::Round($_.PM/1MB,1)}} | Format-Table -AutoSize"
echo.
pause
goto :MENU_SYSTEM

:SYS_TOPMEM
cls
echo ============================================================
echo Top processes by memory
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-Process | Sort-Object WS -Descending | Select-Object -First 15 Name, Id, @{N='WorkingSetMB';E={[math]::Round($_.WS/1MB,1)}}, @{N='PrivateMB';E={[math]::Round($_.PM/1MB,1)}} | Format-Table -AutoSize"
echo.
pause
goto :MENU_SYSTEM

:SYS_EVENTS
cls
echo ============================================================
echo Recent system critical and error events
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-WinEvent -LogName System -MaxEvents 200 -ErrorAction SilentlyContinue | Where-Object { $_.LevelDisplayName -in @('Critical','Error') } | Select-Object -First 25 TimeCreated, Id, ProviderName, LevelDisplayName, Message | Format-List"
echo.
pause
goto :MENU_SYSTEM

:SYS_FULL
cls
echo [*] Creating full hardware audit report...
echo.
for /f %%I in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd_HH-mm-ss"') do set "STAMP=%%I"
set "OUTFILE=%R_SYSTEM%\Hardware_Audit_%STAMP%.txt"
(
echo ============================================================
echo Hardware Audit and System Report
echo Created: %DATE% %TIME%
echo Computer: %COMPUTERNAME%
echo User: %USERNAME%
echo ============================================================
echo.
echo [1] System summary
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-CimInstance Win32_ComputerSystem | Select-Object Manufacturer, Model, Domain, SystemType, TotalPhysicalMemory | Format-List; Get-CimInstance Win32_BIOS | Select-Object Manufacturer, SMBIOSBIOSVersion, ReleaseDate, SerialNumber | Format-List; Get-CimInstance Win32_OperatingSystem | Select-Object Caption, Version, BuildNumber, OSArchitecture, LastBootUpTime | Format-List"
echo.
echo [2] CPU
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-CimInstance Win32_Processor | Select-Object Name, Manufacturer, NumberOfCores, NumberOfLogicalProcessors, MaxClockSpeed, CurrentClockSpeed, LoadPercentage | Format-List"
echo.
echo [3] Memory
powershell -NoProfile -ExecutionPolicy Bypass -Command "$cs=Get-CimInstance Win32_ComputerSystem; $os=Get-CimInstance Win32_OperatingSystem; $total=[math]::Round($cs.TotalPhysicalMemory/1GB,2); $free=[math]::Round($os.FreePhysicalMemory*1KB/1GB,2); $used=[math]::Round($total-$free,2); Write-Output ('Total RAM : ' + $total + ' GB'); Write-Output ('Used RAM  : ' + $used + ' GB'); Write-Output ('Free RAM  : ' + $free + ' GB'); ''; Get-CimInstance Win32_PhysicalMemory | Select-Object BankLabel, DeviceLocator, Manufacturer, @{N='CapacityGB';E={[math]::Round($_.Capacity/1GB,2)}}, Speed, PartNumber | Format-Table -AutoSize"
echo.
echo [4] Graphics
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-CimInstance Win32_VideoController | Select-Object Name, DriverVersion, @{N='AdapterRAMGB';E={[math]::Round($_.AdapterRAM/1GB,2)}}, VideoProcessor, CurrentHorizontalResolution, CurrentVerticalResolution, CurrentRefreshRate | Format-List"
echo.
echo [5] Disks and volumes
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-CimInstance Win32_DiskDrive | Select-Object Model, InterfaceType, MediaType, SerialNumber, @{N='SizeGB';E={[math]::Round($_.Size/1GB,2)}}, Status | Format-Table -AutoSize; ''; Get-CimInstance Win32_LogicalDisk -Filter 'DriveType=3' | ForEach-Object { $size=[math]::Round($_.Size/1GB,2); $free=[math]::Round($_.FreeSpace/1GB,2); $used=[math]::Round($size-$free,2); $pct=if($_.Size -gt 0){[math]::Round((($_.Size-$_.FreeSpace)/$_.Size)*100,1)}else{0}; [pscustomobject]@{Drive=$_.DeviceID; Label=$_.VolumeName; FileSystem=$_.FileSystem; SizeGB=$size; UsedGB=$used; FreeGB=$free; UsedPercent=$pct} } | Format-Table -AutoSize"
echo.
echo [6] Network adapters
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-NetAdapter -ErrorAction SilentlyContinue | Select-Object Name, InterfaceDescription, Status, LinkSpeed, MacAddress | Format-Table -AutoSize"
echo.
echo [7] Device problems
powershell -NoProfile -ExecutionPolicy Bypass -Command "$p = Get-PnpDevice -PresentOnly -ErrorAction SilentlyContinue | Where-Object { $_.Status -ne 'OK' }; if($p){$p | Select-Object Class, FriendlyName, Status, ProblemCode, InstanceId | Format-Table -AutoSize}else{'No currently reported PnP device errors found.'}"
echo.
echo [8] Top CPU processes
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-Process | Sort-Object CPU -Descending | Select-Object -First 15 Name, Id, CPU, @{N='WorkingSetMB';E={[math]::Round($_.WS/1MB,1)}}, @{N='PrivateMB';E={[math]::Round($_.PM/1MB,1)}} | Format-Table -AutoSize"
echo.
echo [9] Top memory processes
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-Process | Sort-Object WS -Descending | Select-Object -First 15 Name, Id, @{N='WorkingSetMB';E={[math]::Round($_.WS/1MB,1)}}, @{N='PrivateMB';E={[math]::Round($_.PM/1MB,1)}} | Format-Table -AutoSize"
echo.
echo [10] Recent system critical and error events
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-WinEvent -LogName System -MaxEvents 200 -ErrorAction SilentlyContinue | Where-Object { $_.LevelDisplayName -in @('Critical','Error') } | Select-Object -First 25 TimeCreated, Id, ProviderName, LevelDisplayName, Message | Format-List"
echo.
) > "%OUTFILE%" 2>&1
echo Report created:
echo %OUTFILE%
echo.
pause
goto :MENU_SYSTEM

:PWR_QUICK
cls
echo ============================================================
echo Quick power status
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "$cs = Get-CimInstance Win32_ComputerSystem; try{$bat = Get-CimInstance Win32_Battery -ErrorAction Stop}catch{$bat=$null}; Write-Host ('Manufacturer : ' + $cs.Manufacturer); Write-Host ('Model        : ' + $cs.Model); if($bat){ foreach($b in $bat){ Write-Host ''; Write-Host ('Battery Name : ' + $b.Name); Write-Host ('Status Code  : ' + $b.BatteryStatus); Write-Host ('Charge %%     : ' + $b.EstimatedChargeRemaining); Write-Host ('AC Power     : ' + $(if($b.PowerOnline){'Yes'}else{'No / Unknown'})) } } else { Write-Host ''; Write-Host 'No battery detected or battery information not available.' }; Write-Host ''; Write-Host 'Active Power Plan:'; powercfg /getactivescheme"
echo.
pause
goto :MENU_POWER

:PWR_PLANS
cls
echo ============================================================
echo Power plans
echo ============================================================
echo.
powercfg /list
echo.
echo Active plan:
powercfg /getactivescheme
echo.
pause
goto :MENU_POWER

:PWR_WAKE
cls
echo ============================================================
echo Wake analysis
echo ============================================================
echo.
echo [1] Last wake source
powercfg /lastwake
echo.
echo [2] Wake timers
powercfg /waketimers
echo.
echo [3] Devices allowed to wake the system
powercfg /devicequery wake_armed
echo.
pause
goto :MENU_POWER

:PWR_BATTERY
cls
echo [*] Generating battery report...
powercfg /batteryreport /output "%R_POWER%\battery-report.html"
echo.
pause
goto :MENU_POWER

:PWR_ENERGY
if not "%ISADMIN%"=="1" goto :NEEDADMIN_POWER
cls
echo [*] Generating energy report...
powercfg /energy /duration 30 /output "%R_POWER%\energy-report.html"
echo.
pause
goto :MENU_POWER

:PWR_SLEEP
if not "%ISADMIN%"=="1" goto :NEEDADMIN_POWER
cls
echo [*] Generating sleep study...
powercfg /sleepstudy /output "%R_POWER%\sleepstudy.html"
echo.
pause
goto :MENU_POWER

:PWR_BAL
if not "%ISADMIN%"=="1" goto :NEEDADMIN_POWER
powercfg /setactive SCHEME_BALANCED
echo Balanced plan set.
pause
goto :MENU_POWER

:PWR_HIGH
if not "%ISADMIN%"=="1" goto :NEEDADMIN_POWER
powercfg /setactive SCHEME_MIN
echo High performance plan set.
pause
goto :MENU_POWER

:PWR_SAVE
if not "%ISADMIN%"=="1" goto :NEEDADMIN_POWER
powercfg /setactive SCHEME_MAX
echo Power saver plan set.
pause
goto :MENU_POWER

:PWR_HIBON
if not "%ISADMIN%"=="1" goto :NEEDADMIN_POWER
powercfg /hibernate on
echo Hibernation enabled.
pause
goto :MENU_POWER

:PWR_HIBOFF
if not "%ISADMIN%"=="1" goto :NEEDADMIN_POWER
powercfg /hibernate off
echo Hibernation disabled.
pause
goto :MENU_POWER

:PWR_FULL
cls
echo [*] Creating full power report...
for /f %%I in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd_HH-mm-ss"') do set "STAMP=%%I"
set "OUTFILE=%R_POWER%\Power_Report_%STAMP%.txt"
(
echo ============================================================
echo Power and Battery Report
echo Created: %DATE% %TIME%
echo Computer: %COMPUTERNAME%
echo ============================================================
echo.
echo [1] Power status
powershell -NoProfile -ExecutionPolicy Bypass -Command "$cs = Get-CimInstance Win32_ComputerSystem; try{$bat = Get-CimInstance Win32_Battery -ErrorAction Stop}catch{$bat=$null}; Write-Output ('Manufacturer : ' + $cs.Manufacturer); Write-Output ('Model        : ' + $cs.Model); if($bat){ foreach($b in $bat){ ''; 'Battery Name : ' + $b.Name; 'Status Code  : ' + $b.BatteryStatus; 'Charge %%     : ' + $b.EstimatedChargeRemaining; 'AC Power     : ' + $(if($b.PowerOnline){'Yes'}else{'No / Unknown'}) } } else { ''; 'No battery detected or battery information not available.' }"
echo.
echo [2] Active and available plans
powercfg /getactivescheme
echo.
powercfg /list
echo.
echo [3] Available sleep states
powercfg /a
echo.
echo [4] Wake analysis
powercfg /lastwake
echo.
powercfg /waketimers
echo.
powercfg /devicequery wake_armed
echo.
echo [5] Battery report file
powercfg /batteryreport /output "%R_POWER%\battery-report.html" >nul 2>&1
if exist "%R_POWER%\battery-report.html" (echo Created: %R_POWER%\battery-report.html) else (echo Battery report not created.)
echo.
echo [6] Energy report file

if "%ISADMIN%"=="1" (
powercfg /energy /duration 15 /output "%R_POWER%\energy-report.html" >nul 2>&1
if exist "%R_POWER%\energy-report.html" (echo Created: %R_POWER%\energy-report.html) else (echo Energy report not created.)
) else (
echo Skipped - admin rights required.
)
echo.
) > "%OUTFILE%" 2>&1
echo Report created:
echo %OUTFILE%
echo.
pause
goto :MENU_POWER

:NEEDADMIN_POWER
cls
echo Administrator rights are required for this action.
echo.
pause
goto :MENU_POWER

:NET_QUICK
cls
echo ============================================================
echo Quick network status
echo ============================================================
echo.
ipconfig /all
echo.
pause
goto :MENU_NETWORK

:NET_IP
cls
echo ============================================================
echo IP and adapter overview
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-NetIPConfiguration -ErrorAction SilentlyContinue | Format-List; ''; Get-NetAdapter -ErrorAction SilentlyContinue | Select-Object Name, Status, LinkSpeed, MacAddress, InterfaceDescription | Format-Table -AutoSize"
echo.
pause
goto :MENU_NETWORK

:NET_DNS
cls
echo ============================================================
echo DNS cache and DNS servers
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-DnsClientServerAddress -AddressFamily IPv4 -ErrorAction SilentlyContinue | Format-Table -AutoSize"
echo.
echo Local DNS cache summary:
ipconfig /displaydns | more
echo.
pause
goto :MENU_NETWORK

:DOM_PING
cls
echo ============================================================
echo Ping check
echo ============================================================
echo.
ping %DOMAIN_TARGET%
echo.
pause
goto :MENU_DOMAIN

:DOM_DNS
cls
echo ============================================================
echo DNS lookup
echo ============================================================
echo.
nslookup %DOMAIN_TARGET%
echo.
pause
goto :MENU_DOMAIN

:DOM_NS
cls
echo ============================================================
echo NS lookup
echo ============================================================
echo.
nslookup -type=NS %DOMAIN_TARGET%
echo.
pause
goto :MENU_DOMAIN

:DOM_MX
cls
echo ============================================================
echo MX lookup
echo ============================================================
echo.
nslookup -type=MX %DOMAIN_TARGET%
echo.
pause
goto :MENU_DOMAIN

:DOM_TRACE
cls
echo ============================================================
echo Trace route
echo ============================================================
echo.
tracert %DOMAIN_TARGET%
echo.
pause
goto :MENU_DOMAIN

:DOM_80
cls
echo ============================================================
echo Port 80 check
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "Test-NetConnection -ComputerName '%DOMAIN_TARGET%' -Port 80"
echo.
pause
goto :MENU_DOMAIN

:DOM_443
cls
echo ============================================================
echo Port 443 check
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "Test-NetConnection -ComputerName '%DOMAIN_TARGET%' -Port 443"
echo.
pause
goto :MENU_DOMAIN

:DOM_REPORT
cls
echo [*] Creating domain report...
for /f %%I in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd_HH-mm-ss"') do set "STAMP=%%I"
set "SAFEHOST=%DOMAIN_TARGET::=-%"
set "SAFEHOST=%SAFEHOST:/=-%"
set "SAFEHOST=%SAFEHOST:\=-%"
set "OUTFILE=%R_NETWORK%\Domain_Check_%SAFEHOST%_%STAMP%.txt"
(
echo ============================================================
echo Domain Check Report
echo Created: %DATE% %TIME%
echo Target: %DOMAIN_TARGET%
echo ============================================================
echo.
echo [1] Ping check
ping %DOMAIN_TARGET%
echo.
echo [2] DNS lookup
nslookup %DOMAIN_TARGET%
echo.
echo [3] NS lookup
nslookup -type=NS %DOMAIN_TARGET%
echo.
echo [4] MX lookup
nslookup -type=MX %DOMAIN_TARGET%
echo.
echo [5] Trace route
tracert %DOMAIN_TARGET%
echo.
echo [6] Port 80 check
powershell -NoProfile -ExecutionPolicy Bypass -Command "Test-NetConnection -ComputerName '%DOMAIN_TARGET%' -Port 80"
echo.
echo [7] Port 443 check
powershell -NoProfile -ExecutionPolicy Bypass -Command "Test-NetConnection -ComputerName '%DOMAIN_TARGET%' -Port 443"
echo.
) > "%OUTFILE%" 2>&1
echo Report created:
echo %OUTFILE%
echo.
pause
goto :MENU_DOMAIN

:SRV_PING
cls
echo ============================================================
echo Ping check
echo ============================================================
echo.
ping %SERVER_TARGET%
echo.
pause
goto :MENU_SERVER

:SRV_DNS
cls
echo ============================================================
echo DNS lookup
echo ============================================================
echo.
nslookup %SERVER_TARGET%
echo.
pause
goto :MENU_SERVER

:SRV_RDNS
cls
echo ============================================================
echo Reverse DNS lookup
echo ============================================================
echo.
set "RESOLVEDIP="
for /f "tokens=2 delims=[]" %%I in ('ping -n 1 %SERVER_TARGET% ^| findstr /I "["') do set "RESOLVEDIP=%%I"
if defined RESOLVEDIP (
  nslookup !RESOLVEDIP!
) else (
  echo Could not resolve target IP for reverse lookup.
)
echo.
pause
goto :MENU_SERVER

:SRV_TRACE
cls
echo ============================================================
echo Trace route
echo ============================================================
echo.
tracert %SERVER_TARGET%
echo.
pause
goto :MENU_SERVER

:SRV_445
cls
echo ============================================================
echo SMB port 445 check
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "Test-NetConnection -ComputerName '%SERVER_TARGET%' -Port 445"
echo.
pause
goto :MENU_SERVER

:SRV_3389
cls
echo ============================================================
echo RDP port 3389 check
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "Test-NetConnection -ComputerName '%SERVER_TARGET%' -Port 3389"
echo.
pause
goto :MENU_SERVER

:SRV_5985
cls
echo ============================================================
echo WinRM port 5985 check
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "Test-NetConnection -ComputerName '%SERVER_TARGET%' -Port 5985"
echo.
pause
goto :MENU_SERVER

:SRV_80
cls
echo ============================================================
echo HTTP port 80 check
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "Test-NetConnection -ComputerName '%SERVER_TARGET%' -Port 80"
echo.
pause
goto :MENU_SERVER

:SRV_443
cls
echo ============================================================
echo HTTPS port 443 check
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "Test-NetConnection -ComputerName '%SERVER_TARGET%' -Port 443"
echo.
pause
goto :MENU_SERVER

:SRV_1433
cls
echo ============================================================
echo SQL port 1433 check
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "Test-NetConnection -ComputerName '%SERVER_TARGET%' -Port 1433"
echo.
pause
goto :MENU_SERVER

:SRV_NETVIEW
cls
echo ============================================================
echo Net view check
echo ============================================================
echo.
net view \\%SERVER_TARGET%
echo.
pause
goto :MENU_SERVER

:SRV_REPORT
cls
echo [*] Creating server report...
for /f %%I in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd_HH-mm-ss"') do set "STAMP=%%I"
set "SAFEHOST=%SERVER_TARGET::=-%"
set "SAFEHOST=%SAFEHOST:/=-%"
set "SAFEHOST=%SAFEHOST:\=-%"
set "OUTFILE=%R_NETWORK%\Server_Check_%SAFEHOST%_%STAMP%.txt"
(
echo ============================================================
echo Server Check Report
echo Created: %DATE% %TIME%
echo Target: %SERVER_TARGET%
echo ============================================================
echo.
echo [1] Ping check
ping %SERVER_TARGET%
echo.
echo [2] DNS lookup
nslookup %SERVER_TARGET%
echo.
echo [3] Reverse DNS lookup
set "RESOLVEDIP="
for /f "tokens=2 delims=[]" %%I in ('ping -n 1 %SERVER_TARGET% ^| findstr /I "["') do set "RESOLVEDIP=%%I"
if defined RESOLVEDIP (nslookup !RESOLVEDIP!) else (echo Could not resolve target IP for reverse lookup.)
echo.
echo [4] Trace route
tracert %SERVER_TARGET%
echo.
echo [5] SMB port 445 check
powershell -NoProfile -ExecutionPolicy Bypass -Command "Test-NetConnection -ComputerName '%SERVER_TARGET%' -Port 445"
echo.
echo [6] RDP port 3389 check
powershell -NoProfile -ExecutionPolicy Bypass -Command "Test-NetConnection -ComputerName '%SERVER_TARGET%' -Port 3389"
echo.
echo [7] WinRM port 5985 check
powershell -NoProfile -ExecutionPolicy Bypass -Command "Test-NetConnection -ComputerName '%SERVER_TARGET%' -Port 5985"
echo.
echo [8] HTTP port 80 check
powershell -NoProfile -ExecutionPolicy Bypass -Command "Test-NetConnection -ComputerName '%SERVER_TARGET%' -Port 80"
echo.
echo [9] HTTPS port 443 check
powershell -NoProfile -ExecutionPolicy Bypass -Command "Test-NetConnection -ComputerName '%SERVER_TARGET%' -Port 443"
echo.
echo [10] SQL port 1433 check
powershell -NoProfile -ExecutionPolicy Bypass -Command "Test-NetConnection -ComputerName '%SERVER_TARGET%' -Port 1433"
echo.
echo [11] Net view check
net view \\%SERVER_TARGET%
echo.
) > "%OUTFILE%" 2>&1
echo Report created:
echo %OUTFILE%
echo.
pause
goto :MENU_SERVER

:SQL_QUICK
cls
echo ============================================================
echo Quick SQL status
echo ============================================================
echo.
echo [1] SQLBrowser configuration
sc qc SQLBrowser
echo.
echo [2] SQLBrowser state
sc query SQLBrowser
echo.
echo [3] SQL services
sc query type= service state= all | findstr /I "SQL MSSQL SQLAgent SQLBrowser"
echo.
pause
goto :MENU_SQL

:SQL_BROWSER
cls
echo ============================================================
echo SQLBrowser service
echo ============================================================
echo.
sc qc SQLBrowser
echo.
sc query SQLBrowser
echo.
pause
goto :MENU_SQL

:SQL_AUTO
if not "%ISADMIN%"=="1" goto :NEEDADMIN_SQL
sc config SQLBrowser start= auto
echo.
sc qc SQLBrowser
echo.
pause
goto :MENU_SQL

:SQL_START
if not "%ISADMIN%"=="1" goto :NEEDADMIN_SQL
sc start SQLBrowser
echo.
sc query SQLBrowser
echo.
pause
goto :MENU_SQL

:SQL_INST
cls
echo ============================================================
echo SQL instances and services
echo ============================================================
echo.
sc query type= service state= all | findstr /I "SQL MSSQL SQLAgent SQLBrowser"
echo.
reg query "HKLM\SOFTWARE\Microsoft\Microsoft SQL Server\Instance Names\SQL"
echo.
pause
goto :MENU_SQL

:SQL_DETAIL
cls
echo ============================================================
echo SQL installation details
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server' -ErrorAction SilentlyContinue | Where-Object { $_.PSChildName -match 'MSSQL' } | ForEach-Object { try { Get-ItemProperty $_.PSPath -ErrorAction Stop } catch {} } | Select-Object PSChildName, Version, PatchLevel, Edition, SQLBinRoot, VerSpecificRootDir | Format-List"
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*','HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*' -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -match 'SQL Server|SQL Express' } | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Sort-Object DisplayName | Format-Table -AutoSize"
echo.
pause
goto :MENU_SQL

:SQL_REPORT
cls
echo [*] Creating SQL report...
for /f %%I in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd_HH-mm-ss"') do set "STAMP=%%I"
set "OUTFILE=%R_SQL%\SQL_Report_%STAMP%.txt"
(
echo ============================================================
echo SQL Diagnostic Report
echo Created: %DATE% %TIME%
echo Computer: %COMPUTERNAME%
echo ============================================================
echo.
echo [1] SQLBrowser configuration
sc qc SQLBrowser
echo.
echo [2] SQLBrowser state
sc query SQLBrowser
echo.
echo [3] SQL services
sc query type= service state= all | findstr /I "SQL MSSQL SQLAgent SQLBrowser"
echo.
echo [4] SQL instances
reg query "HKLM\SOFTWARE\Microsoft\Microsoft SQL Server\Instance Names\SQL"
echo.
echo [5] Registry details
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server' -ErrorAction SilentlyContinue | Where-Object { $_.PSChildName -match 'MSSQL' } | ForEach-Object { try { Get-ItemProperty $_.PSPath -ErrorAction Stop } catch {} } | Select-Object PSChildName, Version, PatchLevel, Edition, SQLBinRoot, VerSpecificRootDir | Format-List"
echo.
echo [6] Installed programs
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*','HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*' -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -match 'SQL Server|SQL Express' } | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Sort-Object DisplayName | Format-Table -AutoSize"
echo.
) > "%OUTFILE%" 2>&1
echo Report created:
echo %OUTFILE%
echo.
pause
goto :MENU_SQL

:NEEDADMIN_SQL
cls
echo Administrator rights are required for this action.
echo.
pause
goto :MENU_SQL

:USR_LIST
cls
echo ============================================================
echo User accounts and profiles
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "$profiles = Get-CimInstance Win32_UserProfile | Where-Object { $_.LocalPath -like 'C:\Users\*' -and $_.Special -eq $false } | ForEach-Object { $name = Split-Path $_.LocalPath -Leaf; $last = if($_.LastUseTime){ [Management.ManagementDateTimeConverter]::ToDateTime($_.LastUseTime) } else { $null }; $sidObj = New-Object System.Security.Principal.SecurityIdentifier($_.SID); $acct = try { $sidObj.Translate([System.Security.Principal.NTAccount]).Value } catch { $null }; $isLocal = $false; if($acct){ $prefix = ($acct -split '\\')[0]; if($prefix -eq $env:COMPUTERNAME){ $isLocal = $true } }; $type = if($isLocal){ 'Local' } else { 'Domain/External' }; $wl = if($name -match 'ADMP|Admin'){ 'Yes' } else { 'No' }; [pscustomobject]@{ User=$name; Type=$type; Whitelist=$wl; LastUse=$last; Loaded=$_.Loaded; Status=$_.Status; Path=$_.LocalPath } }; $profiles | Sort-Object LastUse | Format-Table -AutoSize"
echo.
pause
goto :MENU_USERS

:USR_DETAILS
cls
echo ============================================================
echo Profile details and inactivity
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "$profiles = Get-CimInstance Win32_UserProfile | Where-Object { $_.LocalPath -like 'C:\Users\*' -and $_.Special -eq $false } | ForEach-Object { $name = Split-Path $_.LocalPath -Leaf; $last = if($_.LastUseTime){ [Management.ManagementDateTimeConverter]::ToDateTime($_.LastUseTime) } else { $null }; $days = if($last){ [int]((Get-Date) - $last).TotalDays } else { $null }; $state = if($days -ge 180){ 'Old' } elseif($days -ge %AGEDAYS%){ 'Aging' } else { 'Active' }; $sidObj = New-Object System.Security.Principal.SecurityIdentifier($_.SID); $acct = try { $sidObj.Translate([System.Security.Principal.NTAccount]).Value } catch { $null }; $isLocal = $false; if($acct){ $prefix = ($acct -split '\\')[0]; if($prefix -eq $env:COMPUTERNAME){ $isLocal = $true } }; $type = if($isLocal){ 'Local' } else { 'Domain/External' }; $wl = if($name -match 'ADMP|Admin'){ 'Yes' } else { 'No' }; [pscustomobject]@{ User=$name; Type=$type; Whitelist=$wl; LastUse=$last; DaysInactive=$days; State=$state; Loaded=$_.Loaded; Path=$_.LocalPath } }; $profiles | Sort-Object LastUse | Format-Table -AutoSize"
echo.
pause
goto :MENU_USERS

:USR_SIZES
cls
echo ============================================================
echo Profile size check
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "$profiles = Get-CimInstance Win32_UserProfile | Where-Object { $_.LocalPath -like 'C:\Users\*' -and $_.Special -eq $false }; $result = foreach($p in $profiles){ $name = Split-Path $p.LocalPath -Leaf; $last = if($p.LastUseTime){ [Management.ManagementDateTimeConverter]::ToDateTime($p.LastUseTime) } else { $null }; $sidObj = New-Object System.Security.Principal.SecurityIdentifier($p.SID); $acct = try { $sidObj.Translate([System.Security.Principal.NTAccount]).Value } catch { $null }; $isLocal = $false; if($acct){ $prefix = ($acct -split '\\')[0]; if($prefix -eq $env:COMPUTERNAME){ $isLocal = $true } }; $type = if($isLocal){ 'Local' } else { 'Domain/External' }; $wl = if($name -match 'ADMP|Admin'){ 'Yes' } else { 'No' }; $size = 0; if(Test-Path $p.LocalPath){ try { $size = (Get-ChildItem $p.LocalPath -Force -Recurse -ErrorAction SilentlyContinue | Measure-Object Length -Sum).Sum } catch {} }; [pscustomobject]@{ User=$name; Type=$type; Whitelist=$wl; LastUse=$last; SizeGB=[math]::Round(($size / 1GB),2); Path=$p.LocalPath } }; $result | Sort-Object LastUse | Format-Table -AutoSize"
echo.
echo Note: Size calculation may take time depending on profile size.
echo.
pause
goto :MENU_USERS

:USR_SHOWOLD
cls
echo ============================================================
echo Old domain profiles with whitelist
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "$profiles = Get-CimInstance Win32_UserProfile | Where-Object { $_.LocalPath -like 'C:\Users\*' -and $_.Special -eq $false }; $result = foreach($p in $profiles){ $name = Split-Path $p.LocalPath -Leaf; $last = if($p.LastUseTime){ [Management.ManagementDateTimeConverter]::ToDateTime($p.LastUseTime) } else { $null }; $days = if($last){ [int]((Get-Date) - $last).TotalDays } else { 99999 }; $sidObj = New-Object System.Security.Principal.SecurityIdentifier($p.SID); $acct = try { $sidObj.Translate([System.Security.Principal.NTAccount]).Value } catch { $null }; $isLocal = $false; if($acct){ $prefix = ($acct -split '\\')[0]; if($prefix -eq $env:COMPUTERNAME){ $isLocal = $true } }; $isWhite = ($name -match 'ADMP|Admin'); if((-not $isLocal) -and ($days -ge %AGEDAYS%)){ [pscustomobject]@{ User=$name; Whitelist=$(if($isWhite){'Yes'}else{'No'}); DaysInactive=$days; Loaded=$p.Loaded; Path=$p.LocalPath } } }; if($result){ $result | Sort-Object DaysInactive -Descending | Format-Table -AutoSize } else { 'No old domain profiles found.' }"
echo.
pause
goto :MENU_USERS

:USR_REPORT
cls
echo [*] Creating user report...
for /f %%I in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd_HH-mm-ss"') do set "STAMP=%%I"
set "OUTFILE=%R_USERS%\User_Profile_Report_%STAMP%.txt"
(
echo ============================================================
echo User Account and Profile Report
echo Created: %DATE% %TIME%
echo Computer: %COMPUTERNAME%
echo Threshold for old domain profiles: %AGEDAYS% days
echo Whitelist patterns: ADMP / Admin
echo ============================================================
echo.
echo [1] Local user accounts
net user
echo.
echo [2] User profiles sorted by last use
powershell -NoProfile -ExecutionPolicy Bypass -Command "$profiles = Get-CimInstance Win32_UserProfile | Where-Object { $_.LocalPath -like 'C:\Users\*' -and $_.Special -eq $false } | ForEach-Object { $name = Split-Path $_.LocalPath -Leaf; $last = if($_.LastUseTime){ [Management.ManagementDateTimeConverter]::ToDateTime($_.LastUseTime) } else { $null }; $days = if($last){ [int]((Get-Date) - $last).TotalDays } else { $null }; $state = if($days -ge 180){ 'Old' } elseif($days -ge %AGEDAYS%){ 'Aging' } else { 'Active' }; $sidObj = New-Object System.Security.Principal.SecurityIdentifier($_.SID); $acct = try { $sidObj.Translate([System.Security.Principal.NTAccount]).Value } catch { $null }; $isLocal = $false; if($acct){ $prefix = ($acct -split '\\')[0]; if($prefix -eq $env:COMPUTERNAME){ $isLocal = $true } }; $type = if($isLocal){ 'Local' } else { 'Domain/External' }; $wl = if($name -match 'ADMP|Admin'){ 'Yes' } else { 'No' }; [pscustomobject]@{ User=$name; Type=$type; Whitelist=$wl; LastUse=$last; DaysInactive=$days; State=$state; Loaded=$_.Loaded; Status=$_.Status; Path=$_.LocalPath } }; $profiles | Sort-Object LastUse | Format-Table -AutoSize"
echo.
echo [3] Profile sizes
powershell -NoProfile -ExecutionPolicy Bypass -Command "$profiles = Get-CimInstance Win32_UserProfile | Where-Object { $_.LocalPath -like 'C:\Users\*' -and $_.Special -eq $false }; $result = foreach($p in $profiles){ $name = Split-Path $p.LocalPath -Leaf; $last = if($p.LastUseTime){ [Management.ManagementDateTimeConverter]::ToDateTime($p.LastUseTime) } else { $null }; $sidObj = New-Object System.Security.Principal.SecurityIdentifier($p.SID); $acct = try { $sidObj.Translate([System.Security.Principal.NTAccount]).Value } catch { $null }; $isLocal = $false; if($acct){ $prefix = ($acct -split '\\')[0]; if($prefix -eq $env:COMPUTERNAME){ $isLocal = $true } }; $type = if($isLocal){ 'Local' } else { 'Domain/External' }; $wl = if($name -match 'ADMP|Admin'){ 'Yes' } else { 'No' }; $size = 0; if(Test-Path $p.LocalPath){ try { $size = (Get-ChildItem $p.LocalPath -Force -Recurse -ErrorAction SilentlyContinue | Measure-Object Length -Sum).Sum } catch {} }; [pscustomobject]@{ User=$name; Type=$type; Whitelist=$wl; LastUse=$last; SizeGB=[math]::Round(($size / 1GB),2); Path=$p.LocalPath } }; $result | Sort-Object LastUse | Format-Table -AutoSize"
echo.
echo [4] Local user account details
powershell -NoProfile -ExecutionPolicy Bypass -Command "try { Get-LocalUser | Select-Object Name, Enabled, LastLogon, PasswordLastSet, PasswordExpires, UserMayChangePassword | Sort-Object LastLogon | Format-Table -AutoSize } catch { 'Get-LocalUser not available on this system.' }"
echo.
) > "%OUTFILE%" 2>&1
echo Report created:
echo %OUTFILE%
echo.
pause
goto :MENU_USERS

:USR_DELPROF
if not "%ISADMIN%"=="1" goto :NEEDADMIN_USERS
cls
echo ============================================================
echo Delete selected profile
echo ============================================================
echo.
set /p DELNAME="Enter username for profile deletion: "
if "%DELNAME%"=="" goto :MENU_USERS
echo Target profile: %DELNAME%
set /p CONFIRM="Type YES to confirm: "
if /I not "%CONFIRM%"=="YES" goto :MENU_USERS
powershell -NoProfile -ExecutionPolicy Bypass -Command "$name='%DELNAME%'; $profile = Get-CimInstance Win32_UserProfile | Where-Object { $_.LocalPath -eq ('C:\Users\' + $name) -and $_.Special -eq $false }; if(-not $profile){ Write-Host 'Profile not found.'; exit 1 }; if($profile.Loaded){ Write-Host 'Profile is currently loaded and cannot be deleted.'; exit 2 }; Invoke-CimMethod -InputObject $profile -MethodName Delete | Out-Null; Write-Host 'Profile was deleted.'"
echo.
pause
goto :MENU_USERS

:USR_DELUSER
if not "%ISADMIN%"=="1" goto :NEEDADMIN_USERS
cls
echo ============================================================
echo Delete local user account
echo ============================================================
echo.
set /p DELUSERNAME="Enter local username: "
if "%DELUSERNAME%"=="" goto :MENU_USERS
echo Target account: %DELUSERNAME%
set /p CONFIRM="Type YES to confirm: "
if /I not "%CONFIRM%"=="YES" goto :MENU_USERS
net user "%DELUSERNAME%" /delete
echo.
pause
goto :MENU_USERS

:USR_DELBOTH
if not "%ISADMIN%"=="1" goto :NEEDADMIN_USERS
cls
echo ============================================================
echo Delete profile and local account
echo ============================================================
echo.
set /p DELBOTHNAME="Enter username: "
if "%DELBOTHNAME%"=="" goto :MENU_USERS
echo Target: %DELBOTHNAME%
set /p CONFIRM="Type YES to confirm: "
if /I not "%CONFIRM%"=="YES" goto :MENU_USERS
powershell -NoProfile -ExecutionPolicy Bypass -Command "$name='%DELBOTHNAME%'; $profile = Get-CimInstance Win32_UserProfile | Where-Object { $_.LocalPath -eq ('C:\Users\' + $name) -and $_.Special -eq $false }; if($profile){ if($profile.Loaded){ Write-Host 'Profile is currently loaded and cannot be deleted.'; exit 2 } else { Invoke-CimMethod -InputObject $profile -MethodName Delete | Out-Null; Write-Host 'Profile was deleted.' } } else { Write-Host 'Profile not found or already removed.' }"
net user "%DELBOTHNAME%" /delete
echo.
pause
goto :MENU_USERS

:USR_DELALLDOM
if not "%ISADMIN%"=="1" goto :NEEDADMIN_USERS
cls
echo ============================================================
echo Delete all domain profiles
echo ============================================================
echo.
echo Only domain/external profiles will be removed.
echo Local profiles on this PC will be kept.
echo Loaded profiles will be skipped automatically.
echo Whitelist is not considered in this option.
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "$profiles = Get-CimInstance Win32_UserProfile | Where-Object { $_.LocalPath -like 'C:\Users\*' -and $_.Special -eq $false }; $domainProfiles = foreach($p in $profiles){ $sidObj = New-Object System.Security.Principal.SecurityIdentifier($p.SID); $acct = try { $sidObj.Translate([System.Security.Principal.NTAccount]).Value } catch { $null }; $isLocal = $false; if($acct){ $prefix = ($acct -split '\\')[0]; if($prefix -eq $env:COMPUTERNAME){ $isLocal = $true } }; if(-not $isLocal){ [pscustomobject]@{ User=(Split-Path $p.LocalPath -Leaf); SID=$p.SID; Loaded=$p.Loaded; Path=$p.LocalPath } } }; if(-not $domainProfiles){ Write-Host 'No domain/external profiles found.'; exit 0 }; $domainProfiles | Sort-Object User | Format-Table -AutoSize"
echo.
set /p CONFIRM="Type YES to delete all non-loaded domain profiles: "
if /I not "%CONFIRM%"=="YES" goto :MENU_USERS
powershell -NoProfile -ExecutionPolicy Bypass -Command "$profiles = Get-CimInstance Win32_UserProfile | Where-Object { $_.LocalPath -like 'C:\Users\*' -and $_.Special -eq $false }; $deleted = 0; $skipped = 0; $failed = 0; foreach($p in $profiles){ $sidObj = New-Object System.Security.Principal.SecurityIdentifier($p.SID); $acct = try { $sidObj.Translate([System.Security.Principal.NTAccount]).Value } catch { $null }; $isLocal = $false; if($acct){ $prefix = ($acct -split '\\')[0]; if($prefix -eq $env:COMPUTERNAME){ $isLocal = $true } }; if(-not $isLocal){ if($p.Loaded){ Write-Host ('Skipped, profile loaded: ' + $p.LocalPath); $skipped++ } else { try { Invoke-CimMethod -InputObject $p -MethodName Delete | Out-Null; Write-Host ('Deleted: ' + $p.LocalPath); $deleted++ } catch { Write-Host ('Error on: ' + $p.LocalPath); $failed++ } } } }; Write-Host ''; Write-Host ('Deleted: ' + $deleted); Write-Host ('Skipped: ' + $skipped); Write-Host ('Errors: ' + $failed)"
echo.
pause
goto :MENU_USERS

:USR_DELOLD
if not "%ISADMIN%"=="1" goto :NEEDADMIN_USERS
cls
echo ============================================================
echo Delete old domain profiles only
echo ============================================================
echo.
echo Only domain/external profiles will be checked.
echo Local profiles will be kept.
echo Only profiles older than %AGEDAYS% days will be deleted.
echo Profiles with ADMP or Admin in the name are whitelisted.
echo Loaded profiles will be skipped automatically.
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "$profiles = Get-CimInstance Win32_UserProfile | Where-Object { $_.LocalPath -like 'C:\Users\*' -and $_.Special -eq $false }; $result = foreach($p in $profiles){ $name = Split-Path $p.LocalPath -Leaf; $last = if($p.LastUseTime){ [Management.ManagementDateTimeConverter]::ToDateTime($p.LastUseTime) } else { $null }; $days = if($last){ [int]((Get-Date) - $last).TotalDays } else { 99999 }; $sidObj = New-Object System.Security.Principal.SecurityIdentifier($p.SID); $acct = try { $sidObj.Translate([System.Security.Principal.NTAccount]).Value } catch { $null }; $isLocal = $false; if($acct){ $prefix = ($acct -split '\\')[0]; if($prefix -eq $env:COMPUTERNAME){ $isLocal = $true } }; $isWhite = ($name -match 'ADMP|Admin'); if((-not $isLocal) -and ($days -ge %AGEDAYS%)){ [pscustomobject]@{ User=$name; Whitelist=$(if($isWhite){'Yes'}else{'No'}); DaysInactive=$days; Loaded=$p.Loaded; Path=$p.LocalPath } } }; if($result){ $result | Sort-Object DaysInactive -Descending | Format-Table -AutoSize } else { Write-Host 'No old domain profiles found.' }"
echo.
set /p CONFIRM="Type YES to delete all old domain profiles without whitelist: "
if /I not "%CONFIRM%"=="YES" goto :MENU_USERS
powershell -NoProfile -ExecutionPolicy Bypass -Command "$profiles = Get-CimInstance Win32_UserProfile | Where-Object { $_.LocalPath -like 'C:\Users\*' -and $_.Special -eq $false }; $deleted = 0; $skippedLoaded = 0; $skippedWhitelist = 0; $skippedYoung = 0; $failed = 0; foreach($p in $profiles){ $name = Split-Path $p.LocalPath -Leaf; $last = if($p.LastUseTime){ [Management.ManagementDateTimeConverter]::ToDateTime($p.LastUseTime) } else { $null }; $days = if($last){ [int]((Get-Date) - $last).TotalDays } else { 99999 }; $sidObj = New-Object System.Security.Principal.SecurityIdentifier($p.SID); $acct = try { $sidObj.Translate([System.Security.Principal.NTAccount]).Value } catch { $null }; $isLocal = $false; if($acct){ $prefix = ($acct -split '\\')[0]; if($prefix -eq $env:COMPUTERNAME){ $isLocal = $true } }; $isWhite = ($name -match 'ADMP|Admin'); if($isLocal){ continue }; if($days -lt %AGEDAYS%){ $skippedYoung++; continue }; if($isWhite){ Write-Host ('Skipped, whitelist: ' + $p.LocalPath); $skippedWhitelist++; continue }; if($p.Loaded){ Write-Host ('Skipped, profile loaded: ' + $p.LocalPath); $skippedLoaded++; continue }; try { Invoke-CimMethod -InputObject $p -MethodName Delete | Out-Null; Write-Host ('Deleted: ' + $p.LocalPath); $deleted++ } catch { Write-Host ('Error on: ' + $p.LocalPath); $failed++ } }; Write-Host ''; Write-Host ('Deleted: ' + $deleted); Write-Host ('Skipped young: ' + $skippedYoung); Write-Host ('Skipped whitelist: ' + $skippedWhitelist); Write-Host ('Skipped loaded: ' + $skippedLoaded); Write-Host ('Errors: ' + $failed)"
echo.
pause
goto :MENU_USERS

:NEEDADMIN_USERS
cls
echo Administrator rights are required for this action.
echo.
pause
goto :MENU_USERS

:CLN_QUICK
cls
echo ============================================================
echo Quick junk scan
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "$paths=@(); $paths += [pscustomobject]@{Name='User Temp';Path=$env:TEMP}; $paths += [pscustomobject]@{Name='Windows Temp';Path=$env:windir + '\Temp'}; $paths += [pscustomobject]@{Name='Prefetch';Path=$env:windir + '\Prefetch'}; $paths += [pscustomobject]@{Name='SoftwareDistribution Download';Path=$env:windir + '\SoftwareDistribution\Download'}; $paths += [pscustomobject]@{Name='Thumbnail Cache';Path=$env:LOCALAPPDATA + '\Microsoft\Windows\Explorer'}; foreach($p in $paths){ $size=0; $count=0; if(Test-Path $p.Path){ try { $items=Get-ChildItem $p.Path -Force -Recurse -ErrorAction SilentlyContinue; $count=@($items).Count; $size=($items | Measure-Object Length -Sum).Sum } catch {} }; [pscustomobject]@{Area=$p.Name; Path=$p.Path; Files=$count; SizeGB=[math]::Round(($size/1GB),2)} } | Format-Table -AutoSize"
echo.
pause
goto :MENU_CLEAN

:CLN_DETAIL
cls
echo ============================================================
echo Detailed junk scan
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "$areas=@(); $areas += [pscustomobject]@{Name='User Temp';Path=$env:TEMP}; $areas += [pscustomobject]@{Name='Windows Temp';Path=$env:windir + '\Temp'}; $areas += [pscustomobject]@{Name='Prefetch';Path=$env:windir + '\Prefetch'}; $areas += [pscustomobject]@{Name='SoftwareDistribution Download';Path=$env:windir + '\SoftwareDistribution\Download'}; $areas += [pscustomobject]@{Name='Thumbnail Cache';Path=$env:LOCALAPPDATA + '\Microsoft\Windows\Explorer'}; $areas += [pscustomobject]@{Name='CrashDumps';Path=$env:LOCALAPPDATA + '\CrashDumps'}; $areas += [pscustomobject]@{Name='Windows Error Reporting';Path=$env:PROGRAMDATA + '\Microsoft\Windows\WER'}; foreach($a in $areas){ $size=0; $count=0; $latest=$null; if(Test-Path $a.Path){ try { $items=Get-ChildItem $a.Path -Force -Recurse -ErrorAction SilentlyContinue; $count=@($items).Count; $size=($items | Measure-Object Length -Sum).Sum; $latest=($items | Sort-Object LastWriteTime -Descending | Select-Object -First 1 -ExpandProperty LastWriteTime) } catch {} }; [pscustomobject]@{Area=$a.Name; Path=$a.Path; Files=$count; SizeGB=[math]::Round(($size/1GB),2); LastChange=$latest} } | Sort-Object SizeGB -Descending | Format-Table -AutoSize"
echo.
pause
goto :MENU_CLEAN

:CLN_USERTEMP
cls
echo ============================================================
echo Clean user temp
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "$p=$env:TEMP; if(Test-Path $p){ Get-ChildItem $p -Force -ErrorAction SilentlyContinue | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue; Write-Host ('Cleaned: ' + $p) } else { Write-Host 'Path not found.' }"
echo.
pause
goto :MENU_CLEAN

:CLN_WINTEMP
if not "%ISADMIN%"=="1" goto :NEEDADMIN_CLEAN
cls
echo ============================================================
echo Clean Windows temp
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "$p=$env:windir + '\Temp'; if(Test-Path $p){ Get-ChildItem $p -Force -ErrorAction SilentlyContinue | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue; Write-Host ('Cleaned: ' + $p) } else { Write-Host 'Path not found.' }"
echo.
pause
goto :MENU_CLEAN

:CLN_PREFETCH
if not "%ISADMIN%"=="1" goto :NEEDADMIN_CLEAN
cls
echo ============================================================
echo Clean Prefetch
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "$p=$env:windir + '\Prefetch'; if(Test-Path $p){ Get-ChildItem $p -Force -ErrorAction SilentlyContinue | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue; Write-Host ('Cleaned: ' + $p) } else { Write-Host 'Path not found.' }"
echo.
pause
goto :MENU_CLEAN

:CLN_RECYCLE
cls
echo ============================================================
echo Empty recycle bin
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "try { Clear-RecycleBin -Force -ErrorAction Stop; Write-Host 'Recycle bin was emptied.' } catch { Write-Host 'Recycle bin could not be fully emptied or is already empty.' }"
echo.
pause
goto :MENU_CLEAN

:CLN_WU
if not "%ISADMIN%"=="1" goto :NEEDADMIN_CLEAN
cls
echo ============================================================
echo Clean Windows Update cache
echo ============================================================
echo.
echo Stopping update services briefly...
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
powershell -NoProfile -ExecutionPolicy Bypass -Command "$p=$env:windir + '\SoftwareDistribution\Download'; if(Test-Path $p){ Get-ChildItem $p -Force -ErrorAction SilentlyContinue | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue; Write-Host ('Cleaned: ' + $p) } else { Write-Host 'Path not found.' }"
echo Starting services again...
net start bits >nul 2>&1
net start wuauserv >nul 2>&1
echo.
pause
goto :MENU_CLEAN

:CLN_DNS
cls
echo ============================================================
echo Flush DNS cache
echo ============================================================
echo.
ipconfig /flushdns
echo.
pause
goto :MENU_CLEAN

:CLN_THUMB
cls
echo ============================================================
echo Clean thumbnail cache
echo ============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "$p=$env:LOCALAPPDATA + '\Microsoft\Windows\Explorer'; if(Test-Path $p){ Get-ChildItem $p -Filter 'thumbcache*' -Force -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue; Write-Host ('Cleaned: ' + $p) } else { Write-Host 'Path not found.' }"
echo.
pause
goto :MENU_CLEAN

:CLN_ALL
cls
echo ============================================================
echo All standard cleanups
echo ============================================================
echo.
echo [1/6] User temp
powershell -NoProfile -ExecutionPolicy Bypass -Command "$p=$env:TEMP; if(Test-Path $p){ Get-ChildItem $p -Force -ErrorAction SilentlyContinue | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue; Write-Host ('Cleaned: ' + $p) }"
echo.
echo [2/6] Windows temp
if "%ISADMIN%"=="1" (
  powershell -NoProfile -ExecutionPolicy Bypass -Command "$p=$env:windir + '\Temp'; if(Test-Path $p){ Get-ChildItem $p -Force -ErrorAction SilentlyContinue | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue; Write-Host ('Cleaned: ' + $p) }"
) else (
  echo Skipped - admin rights missing.
)
echo.
echo [3/6] Prefetch
if "%ISADMIN%"=="1" (
  powershell -NoProfile -ExecutionPolicy Bypass -Command "$p=$env:windir + '\Prefetch'; if(Test-Path $p){ Get-ChildItem $p -Force -ErrorAction SilentlyContinue | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue; Write-Host ('Cleaned: ' + $p) }"
) else (
  echo Skipped - admin rights missing.
)
echo.
echo [4/6] Recycle bin
powershell -NoProfile -ExecutionPolicy Bypass -Command "try { Clear-RecycleBin -Force -ErrorAction Stop; Write-Host 'Recycle bin was emptied.' } catch { Write-Host 'Recycle bin could not be fully emptied or is already empty.' }"
echo.
echo [5/6] DNS cache
ipconfig /flushdns
echo.
echo [6/6] Thumbnail cache
powershell -NoProfile -ExecutionPolicy Bypass -Command "$p=$env:LOCALAPPDATA + '\Microsoft\Windows\Explorer'; if(Test-Path $p){ Get-ChildItem $p -Filter 'thumbcache*' -Force -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue; Write-Host ('Cleaned: ' + $p) }"
echo.
if "%ISADMIN%"=="1" (
  echo Extra: Windows Update cache
  net stop wuauserv >nul 2>&1
  net stop bits >nul 2>&1
  powershell -NoProfile -ExecutionPolicy Bypass -Command "$p=$env:windir + '\SoftwareDistribution\Download'; if(Test-Path $p){ Get-ChildItem $p -Force -ErrorAction SilentlyContinue | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue; Write-Host ('Cleaned: ' + $p) }"
  net start bits >nul 2>&1
  net start wuauserv >nul 2>&1
)
echo.
pause
goto :MENU_CLEAN

:CLN_REPORT
cls
echo [*] Creating cleanup report...
for /f %%I in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd_HH-mm-ss"') do set "STAMP=%%I"
set "OUTFILE=%R_CLEAN%\Cleanup_Report_%STAMP%.txt"
(
echo ============================================================
echo Windows Cleanup Report
echo Created: %DATE% %TIME%
echo Computer: %COMPUTERNAME%
echo ============================================================
echo.
echo [1] Quick scan
powershell -NoProfile -ExecutionPolicy Bypass -Command "$paths=@(); $paths += [pscustomobject]@{Name='User Temp';Path=$env:TEMP}; $paths += [pscustomobject]@{Name='Windows Temp';Path=$env:windir + '\Temp'}; $paths += [pscustomobject]@{Name='Prefetch';Path=$env:windir + '\Prefetch'}; $paths += [pscustomobject]@{Name='SoftwareDistribution Download';Path=$env:windir + '\SoftwareDistribution\Download'}; $paths += [pscustomobject]@{Name='Thumbnail Cache';Path=$env:LOCALAPPDATA + '\Microsoft\Windows\Explorer'}; foreach($p in $paths){ $size=0; $count=0; if(Test-Path $p.Path){ try { $items=Get-ChildItem $p.Path -Force -Recurse -ErrorAction SilentlyContinue; $count=@($items).Count; $size=($items | Measure-Object Length -Sum).Sum } catch {} }; [pscustomobject]@{Area=$p.Name; Path=$p.Path; Files=$count; SizeGB=[math]::Round(($size/1GB),2)} } | Format-Table -AutoSize"
echo.
echo [2] Detailed scan
powershell -NoProfile -ExecutionPolicy Bypass -Command "$areas=@(); $areas += [pscustomobject]@{Name='User Temp';Path=$env:TEMP}; $areas += [pscustomobject]@{Name='Windows Temp';Path=$env:windir + '\Temp'}; $areas += [pscustomobject]@{Name='Prefetch';Path=$env:windir + '\Prefetch'}; $areas += [pscustomobject]@{Name='SoftwareDistribution Download';Path=$env:windir + '\SoftwareDistribution\Download'}; $areas += [pscustomobject]@{Name='Thumbnail Cache';Path=$env:LOCALAPPDATA + '\Microsoft\Windows\Explorer'}; $areas += [pscustomobject]@{Name='CrashDumps';Path=$env:LOCALAPPDATA + '\CrashDumps'}; $areas += [pscustomobject]@{Name='Windows Error Reporting';Path=$env:PROGRAMDATA + '\Microsoft\Windows\WER'}; foreach($a in $areas){ $size=0; $count=0; $latest=$null; if(Test-Path $a.Path){ try { $items=Get-ChildItem $a.Path -Force -Recurse -ErrorAction SilentlyContinue; $count=@($items).Count; $size=($items | Measure-Object Length -Sum).Sum; $latest=($items | Sort-Object LastWriteTime -Descending | Select-Object -First 1 -ExpandProperty LastWriteTime) } catch {} }; [pscustomobject]@{Area=$a.Name; Path=$a.Path; Files=$count; SizeGB=[math]::Round(($size/1GB),2); LastChange=$latest} } | Sort-Object SizeGB -Descending | Format-Table -AutoSize"
echo.
echo [3] Disk status
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-CimInstance Win32_LogicalDisk -Filter 'DriveType=3' | ForEach-Object { $size=[math]::Round($_.Size/1GB,2); $free=[math]::Round($_.FreeSpace/1GB,2); $used=[math]::Round($size-$free,2); $pct=if($_.Size -gt 0){[math]::Round((($_.Size-$_.FreeSpace)/$_.Size)*100,1)}else{0}; [pscustomobject]@{Drive=$_.DeviceID; Label=$_.VolumeName; SizeGB=$size; UsedGB=$used; FreeGB=$free; UsedPercent=$pct} } | Format-Table -AutoSize"
echo.
) > "%OUTFILE%" 2>&1
echo Report created:
echo %OUTFILE%
echo.
pause
goto :MENU_CLEAN

:NEEDADMIN_CLEAN
cls
echo Administrator rights are required for this action.
echo.
pause
goto :MENU_CLEAN

:FULLREPORT
cls
echo [*] Creating full health report...
for /f %%I in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd_HH-mm-ss"') do set "STAMP=%%I"
set "OUTFILE=%BASE%\Full_Health_Report_%STAMP%.txt"
(
echo ============================================================
echo Ultimate Windows Admin Full Health Report
echo Created: %DATE% %TIME%
echo Computer: %COMPUTERNAME%
echo User: %USERNAME%
echo Admin: %ISADMIN%
echo Domain target: %DOMAIN_TARGET%
echo Server target: %SERVER_TARGET%
echo ============================================================
echo.
echo [1] System summary
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-CimInstance Win32_ComputerSystem | Select-Object Manufacturer, Model, Domain, SystemType, TotalPhysicalMemory | Format-List; Get-CimInstance Win32_BIOS | Select-Object Manufacturer, SMBIOSBIOSVersion, ReleaseDate, SerialNumber | Format-List; Get-CimInstance Win32_OperatingSystem | Select-Object Caption, Version, BuildNumber, OSArchitecture, LastBootUpTime | Format-List"
echo.
echo [2] CPU
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-CimInstance Win32_Processor | Select-Object Name, Manufacturer, NumberOfCores, NumberOfLogicalProcessors, MaxClockSpeed, CurrentClockSpeed, LoadPercentage | Format-List"
echo.
echo [3] Memory
powershell -NoProfile -ExecutionPolicy Bypass -Command "$cs=Get-CimInstance Win32_ComputerSystem; $os=Get-CimInstance Win32_OperatingSystem; $total=[math]::Round($cs.TotalPhysicalMemory/1GB,2); $free=[math]::Round($os.FreePhysicalMemory*1KB/1GB,2); $used=[math]::Round($total-$free,2); 'Total RAM : ' + $total + ' GB'; 'Used RAM  : ' + $used + ' GB'; 'Free RAM  : ' + $free + ' GB'"
echo.
echo [4] Disks and volumes
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-CimInstance Win32_LogicalDisk -Filter 'DriveType=3' | ForEach-Object { $size=[math]::Round($_.Size/1GB,2); $free=[math]::Round($_.FreeSpace/1GB,2); $used=[math]::Round($size-$free,2); $pct=if($_.Size -gt 0){[math]::Round((($_.Size-$_.FreeSpace)/$_.Size)*100,1)}else{0}; [pscustomobject]@{Drive=$_.DeviceID; SizeGB=$size; UsedGB=$used; FreeGB=$free; UsedPercent=$pct} } | Format-Table -AutoSize"
echo.
echo [5] Network quick status
ipconfig /all
echo.
echo [6] Power plans
powercfg /getactivescheme
echo.
powercfg /list
echo.
echo [7] SQL status
sc query SQLBrowser
echo.
reg query "HKLM\SOFTWARE\Microsoft\Microsoft SQL Server\Instance Names\SQL"
echo.
echo [8] User profile summary
powershell -NoProfile -ExecutionPolicy Bypass -Command "$profiles = Get-CimInstance Win32_UserProfile | Where-Object { $_.LocalPath -like 'C:\Users\*' -and $_.Special -eq $false }; $items = foreach($p in $profiles){ $name = Split-Path $p.LocalPath -Leaf; $last = if($p.LastUseTime){ [Management.ManagementDateTimeConverter]::ToDateTime($p.LastUseTime) } else { $null }; $days = if($last){ [int]((Get-Date) - $last).TotalDays } else { 99999 }; $sidObj = New-Object System.Security.Principal.SecurityIdentifier($p.SID); $acct = try { $sidObj.Translate([System.Security.Principal.NTAccount]).Value } catch { $null }; $isLocal = $false; if($acct){ $prefix = ($acct -split '\\')[0]; if($prefix -eq $env:COMPUTERNAME){ $isLocal = $true } }; $isWhite = ($name -match 'ADMP|Admin'); [pscustomobject]@{ User=$name; Days=$days; Loaded=$p.Loaded; Local=$isLocal; White=$isWhite } }; 'Profiles total: ' + $items.Count; 'Local profiles: ' + (($items | Where-Object { $_.Local -eq $true }).Count); 'Domain/External profiles: ' + (($items | Where-Object { $_.Local -eq $false }).Count); 'Whitelisted profiles: ' + (($items | Where-Object { $_.White -eq $true }).Count); 'Profiles older than %AGEDAYS% days: ' + (($items | Where-Object { $_.Days -ge %AGEDAYS% }).Count)"
echo.
echo [9] Cleanup quick scan
powershell -NoProfile -ExecutionPolicy Bypass -Command "$paths=@(); $paths += [pscustomobject]@{Name='User Temp';Path=$env:TEMP}; $paths += [pscustomobject]@{Name='Windows Temp';Path=$env:windir + '\Temp'}; $paths += [pscustomobject]@{Name='Prefetch';Path=$env:windir + '\Prefetch'}; $paths += [pscustomobject]@{Name='SoftwareDistribution Download';Path=$env:windir + '\SoftwareDistribution\Download'}; foreach($p in $paths){ $size=0; if(Test-Path $p.Path){ try { $size=((Get-ChildItem $p.Path -Force -Recurse -ErrorAction SilentlyContinue | Measure-Object Length -Sum).Sum) } catch {} }; [pscustomobject]@{Area=$p.Name; SizeGB=[math]::Round(($size/1GB),2)} } | Format-Table -AutoSize"
echo.
echo [10] Domain check summary
ping %DOMAIN_TARGET%
echo.
nslookup %DOMAIN_TARGET%
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "Test-NetConnection -ComputerName '%DOMAIN_TARGET%' -Port 443"
echo.
echo [11] Server check summary
ping %SERVER_TARGET%
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "Test-NetConnection -ComputerName '%SERVER_TARGET%' -Port 445"
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "Test-NetConnection -ComputerName '%SERVER_TARGET%' -Port 3389"
echo.
echo [12] Recent system errors
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-WinEvent -LogName System -MaxEvents 100 -ErrorAction SilentlyContinue | Where-Object { $_.LevelDisplayName -in @('Critical','Error') } | Select-Object -First 15 TimeCreated, Id, ProviderName, LevelDisplayName, Message | Format-List"
echo.
) > "%OUTFILE%" 2>&1
echo Full health report created:
echo %OUTFILE%
echo.
pause
goto :MAIN

:END
endlocal
exit /b
