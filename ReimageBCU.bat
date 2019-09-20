:: What it does:
:: dump bios contents to biosdump.txt
:: Set each line in bcusettings.txt as variable %%A,
:: read the part in the first set of quotes and make it variable %%B,
:: then perform a find operation for %%B in BIOSDUMP.txt, 
:: if found, perform biosconfigutility.exe /setvalue:%%A.
::
:: FOR EXAMPLE.
:: Line 1 of bcusettings.txt is "Audio Alerts During Boot","Enable". 
:: We echo this into a text file temp.txt
:: we read temp.txt for everything before the , (note the delims=, tokens=1)
:: The result is "Audio Alerts During Boot". Now we search for "Audio Alerts During Boot" in BIOSDUMP.txt
:: if we find it, perform biosconfigutility.exe /setvalue:"Audio Alerts During Boot","Enable"

pushd "%~dp0"
setlocal enabledelayedexpansion
if not exist C:\temp mkdir C:\Temp
BiosConfigUtility.exe /get:"C:\Temp\BIOSDUMP.txt"
for /F "tokens=*" %%A in ( reimagebcusettings.txt ) do (
echo %%A > temp.txt
for /F "delims=, tokens=1" %%B in ( temp.txt ) do (
find %%B C:\Temp\BIOSDUMP.txt 
if errorlevel 0 if not errorlevel 1 biosconfigutility.exe /setvalue:%%A )
)
del temp.txt /q
popd