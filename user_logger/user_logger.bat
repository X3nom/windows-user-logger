@echo off
cd C:\user_logger
set minutes=%time:~0,2%
set /a minutes *= 60
set /a minutes += %time:~3,2%
set class=-1
:: find during which class has user logged in, usefull for school PCs, classes times can be adjusted in classes.txt (end of each class on new row in minutes since midnight)
for /F "tokens=*" %%A in (.\classes.txt) do set /a class += 1 & if %minutes% LSS %%A ( goto a )
:a
::                   \/ %class% can be switched to simple %time%
echo %date:~0,5% ^| %class% ^| %username% > temp.txt & type usersLog.txt >> temp.txt & move /y temp.txt usersLog.txt >nul