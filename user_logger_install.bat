chcp 65001
@echo off
if not "%1"=="am_admin" (
    set local_path=%cd%\user_logger 
    if not exist "C:\user_logger\" mkdir C:\user_logger 
    robocopy %local_path% C:\user_logger /E 
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'" 
    exit /b
)
set startup_path="C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\user_logger_start.bat"
echo @echo off > %startup_path%
echo start C:\user_logger\user_logger.bat >> %startup_path%
echo exit >> %startup_path%