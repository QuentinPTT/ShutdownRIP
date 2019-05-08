@shift /0
@echo off
title V.l.a.d.o.f
mkdir %APPDATA%\Vladof >NUL
:debut
cls
mode con cols=70 lines=18
echo.
echo    S h u t d o w n R I P  [33mV1[0m
echo.
:CHECKPERMISSION
        ATTRIB %windir%\system32 -h | FINDSTR /I "system32" >nul
        IF %ERRORLEVEL% NEQ 1 (
                ECHO     - Relancez le script en [33mAdministrateur[0m -
                ECHO.
				pause >NUL
                exit 
        )
echo   [[7;33m Scanning system - Please wait [0m]
echo.
echo     PC-Name             =  [[102;97m %ComputerName% [0m]
echo     Date                =  [[102;97m %date% [0m]
echo     SystemDrive         =  [[102;97m %SystemDrive% [0m]
echo     Processeurs         =  [[102;97m %NUMBER_OF_PROCESSORS% [0m]
if exist %APPDATA%\Vladof\shutdownrip.txt echo     ShutdownRIP         =  [[102;97m ACTIVATED [0m]
if not exist %APPDATA%\Vladof\shutdownrip.txt echo     ShutdownRIP         =  [[101;97m DESACTIVATED [0m]
echo.
echo      [ [102;97m - [0m ] Press 1 to schedule a shutdown.
echo      [ [106;97m - [0m ] Press 2 to delete a shutdown.
echo      [ [43;97m - [0m ] Press 3 to quit the App Manager.
echo.
set /p choix=" <-> Press any key to apply [33mShutdownRIP[0m to your computer: "

( 
if %choix%==1 goto shutdown 
if %choix%==2 goto cancel
if %choix%==3 goto end 
)
echo %choix% n'est pas bon.
goto debut 

:cancel
cls
echo.
echo    S h u t d o w n R I P  [33mV1[0m
echo.
echo   [[7;33m You have chosen to cancel a Shutdown [0m]
echo.
set /p cancel="<-> Are you sure ([102;97m Y [0m/[101;97m S [0m): "
(
if %cancel%==Y goto cancel2
if %cancel%==y goto cancel2
if %cancel%==S goto debut
if %cancel%==s goto debut
)
goto cancel

:cancel2
shutdown /a>NUL
echo.
echo     You have cancelled[33m the programmed shutdown[0m.
del /s %APPDATA%\Vladof\shutdownrip.txt >NUL
timeout /T 5 >NUL
goto debut
 
:shutdown 
cls
echo.
echo    S h u t d o w n R I P  [33mV1[0m
echo.
echo   [[7;33m You have chosen to schedule a Shutdown [0m]
echo.
set /p seconde="<-> When you want to [33mturn off[0m your computer (IN HOURS): "
echo.
echo   - You'll be disconnected in [33m%seconde% hours[0m.
set /a seconde=(%seconde%*3600)
shutdown -s -t %seconde% >NUL
echo This is file has been created by ShutdownRIP>%APPDATA%\Vladof\shutdownrip.txt
echo We use it to check if you have run our software>>%APPDATA%\Vladof\shutdownrip.txt
echo Don't pay attention to it>>%APPDATA%\Vladof\shutdownrip.txt
timeout /T 5 >NUL
goto debut 

:end
exit



