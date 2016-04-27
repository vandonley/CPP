@ECHO OFF
REM Setup CryptoPrevent Portable
REM Created:  Van Donley - 04/26/2016
REM Updated:  


REM set the software name.
SET "INSTALL_NAME=CryptoPrevent Portable"

REM Set the install point.
SET "INSTALL_POINT=\\[SomeServer]\ClientApps\CryptoPrevent-7\CryptoPreventPortable"

REM Set install folder for this version of Document Locator.
SET "INSTALL_FOLDER=C:\Program Files\CryptoPreventPortable"

REM Set the result folder to report to.
SET "RESULT_FOLDER=\\[SomeServer]\ClientApps\Client_Deployment_Results"

REM Set install file.
SET "INSTALL_FILE=CryptoPrevent_Settings.bat"

REM Set post install file to check for.
SET "RESULT_FILE=%COMPUTERNAME%.txt"

REM Check to see if post install file exists.
IF EXIST "%INSTALL_FOLDER%\%COMPUTERNAME%_v1.txt" GOTO END

REM Check to see if install folder exists.
IF NOT EXIST "%INSTALL_FOLDER%" MKDIR "%INSTALL_FOLDER%"

REM Copy files from install point.
COPY "%INSTALL_POINT%\*.*" "%INSTALL_FOLDER%" /z /y

REM Write result files in case reboot is invoked by install.
ECHO %INSTALL_NAME% successfully installed on %COMPUTERNAME% at %DATE% %TIME% >> "%INSTALL_FOLDER%\%COMPUTERNAME%_v1.txt"
ECHO %INSTALL_NAME% successfully installed on %COMPUTERNAME% at %DATE% %TIME% >> "%SYSTEMROOT%\%RESULT_FILE%"
ECHO %INSTALL_NAME% successfully installed on %COMPUTERNAME% at %DATE% %TIME% >> "%RESULT_FOLDER%\%RESULT_FILE%"

REM Run the settings file.
"%INSTALL_FOLDER%\%INSTALL_FILE%"

GOTO END

:END
EXIT
