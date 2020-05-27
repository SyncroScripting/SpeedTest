# This is based on https://github.com/zpeters/speedtest/releases
# download speedtest.exe for your platform from https://github.com/zpeters/speedtest/releases
# Will run a command line internet speed test and save the value in the log and a custom field if you add one. 
# Add an Asset Custom Field with the name "Internet Speed".

$WarningPreference = 'SilentlyContinue'
Import-Module $env:SyncroModule
$WarningPreference = 'Continue'

$tester = "C:\temp\speedtest.exe"
$result = "C:\temp\speed.txt"

C:\temp\speedtest.exe > $result

get-content $result
$speed = get-content $result

Set-Asset-Field -Subdomain "test" -Name "Internet Speed" -Value ($speed -match "Ping" | Out-String)
