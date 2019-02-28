@echo off
mode con:cols=160

@echo ###############################################################################################################################################################
@echo #                                                                                                                                                             #
@echo # aaaaaa      aaaaaa                    aa                            aaaaaaaaaaaa                                         aaaaaa                             # 
@echo #  aaaaaa    aaaaaa                    aaa                             aaaaaa  aa                                          aaaaa                              #
@echo #  aaaaaa   aaaaaaa      aaaaa    aaaaaaaa  aaaaa  aaa     aaaaaa      aaaaaa   aa aaaaaaaa aaaaa     aaaaaaa        aaaaaaaaaaa   aaaaaa  aaaaaa    aaaa aa  #
@echo #  aaaaaaa  aaaaaaa    aaaa  aaa   aaaaaa    aaaa aaaa   aaaa  aaaa    aaaaaa       aaaaaa   aaa    aaaa  aaaaa     aaaaaaaaaaaa    aaaaa  aaaaaa  aaaa  aaa  #
@echo #  aaaaaaaaaaaaaaaa   aaaa   aaaa  aaaaaa    aaaaaaaaa  aaaa   aaaaa   aaaaaa        aaaaaa aaa    aaaaa   aaaaa   aaaaa   aaaaa    aaaaa  aaaaaa  aaaa   aa  #
@echo #  aa aaaaaaaaaaaaa  aaaaa   aaaaa aaaaaa    aaaaa     aaaaa   aaaaaa  aaaaaa  aa     aaaaaaaa    aaaaaa   aaaaa  aaaaaa   aaaaa    aaaaa  aaaaaa  aaaaaa     #
@echo #  aa aaaaaa aaaaaa  aaaaa   aaaaa aaaaaa    aaaaa     aaaaa   aaaaaa  aaaaaaaaaa     aaaaaaa     aaaaaa   aaaaa  aaaaaa   aaaaa    aaaaa  aaaaaa   aaaaaa    #
@echo #  aa  aaaaa aaaaaa  aaaaaaaaaaaaa aaaaaa    aaaaa     aaaaa   aaaaaa  aaaaaa  aa      aaaaaa     aaaaaa   aaaaa  aaaaaa   aaaaa    aaaaa  aaaaaa    aaaaaa   #
@echo #  aa  aaaa  aaaaaa  aaaaa         aaaaaa    aaaaa     aaaaa   aaaaaa  aaaaaa           aaaaa     aaaaaa   aaaaa  aaaaaa   aaaaa    aaaaa  aaaaaa     aaaaaa  #
@echo #  aa   aaa  aaaaaa  aaaaa         aaaaaa    aaaaa     aaaaa   aaaaaa  aaaaaa          aaaaaaa    aaaaaa   aaaaa  aaaaaa   aaaaa    aaaaa  aaaaaa      aaaaa  #
@echo #  aa    a   aaaaaa  aaaaa     aaa aaaaaa    aaaaa     aaaaa   aaaaa   aaaaaa   aa    aaaaaaaaa   aaaaaa   aaaaa  aaaaaa   aaaaa    aaaaa  aaaaaa   a   aaaaa #
@echo #  aa        aaaaaa   aaaaa    aa  aaaaaa    aaaaa      aaaa   aaaaa   aaaaaa   aa   aaa  aaaaa    aaaa   aaaaa    aaaaa   aaaaa    aaaaa  aaaaaa   aa   aaaa #
@echo # aaaa      aaaaaaaa   aaaaaaaaa   aaaaaa   aaaaaaa      aaaa aaaa    aaaaaaaaaaaa  aaaa aaaaaaaa    aaaaaaaaa      aaaaaaaaaaaaa   aaaaaaaaaaaaa   aaaaaaaa  #
@echo #                                                                                                                                                             #
@echo ###############################################################################################################################################################
@echo #                          aaaaa         aaaaa      aaaaa   aaaaaaaaa         aaaaaa         aaaaa      aaaa     aaaa   aaaa       aaaaa       aaaa     aaaa  #
@echo #                       aaaaaaaaaaa     aaaaaaa     aaaaa  aaaaaaaaaaaa    aaaaaaaaaaa      aaaaaaa     aaaaaa   aaaa   aaaa    aaaaaaaaaaa    aaaaa    aaaa  #
@echo # aaaa                  aaaa   aaaa     aaaaaaa     aaaaa  aaaaa   aaaaa  aaaaa    aaa      aaaaaaa     aaaaaaa  aaaa   aaaa   aaaaa   aaaaa   aaaaaaa  aaaa  #
@echo # aaaaaaaa  aaaa  aaaa  aaaaaaaaa      aaaa aaaa    aaaaa  aaaaaaaaaaaa  aaaaa             aaaa aaaa    aaaaaaaa aaaa   aaaa   aaaa     aaaaa  aaaaaaaa aaaa  #
@echo # aaaa aaaa  aaa  aaa       aaaaaaaa  aaaa   aaaa   aaaaa  aaaaaaaaaaa   aaaaa   aaaaaa   aaaa  aaaaa   aaaa aaaaaaaa   aaaa   aaaa     aaaaa  aaaa aaaaaaaa  #
@echo # aaaa  aaa   aaaaaa   aaaaa   aaaaa aaaaaaaaaaaaa  aaaaa  aaaaa  aaaaa   aaaaa    aaaa  aaaaaaaaaaaaa  aaaa   aaaaaa   aaaa   aaaaa   aaaaa   aaaa  aaaaaaa  #
@echo # aaaaaaaaa   aaaaa     aaaaaaaaaaa  aaaa     aaaa  aaaaa  aaaaa   aaaaa   aaaaaaaaaaaa aaaaa     aaaa  aaaa    aaaaa   aaaa    aaaaaaaaaaa    aaaa    aaaaa  #
@echo #     aa      aaaa        aaaaaaa                                             aaaaaa                                              aaaaaaa                     #
@echo #         aaaaaa                                                                                                                                              #
@echo ###############################################################################################################################################################


title Metro exodus auto saving v0.9.3

call :read_settings %~dp0Metroexodus_config_start_bat.ini || exit /b 1

set /a i=0
IF NOT EXIST "%GAME_SAVE%\%AUTO%" ( 
echo missing m3_auto_save file 
set /a i = 1
)

IF NOT EXIST "%GAME_SAVE%\%QUICK%" (  
echo missing m3_quick_save file 
set /a i = 1
)

IF %I% == 1 ( 
pause
exit /b 1 
 )

IF NOT EXIST "%~dp0\save_backup\auto\" (  MD .\save_backup\auto\ )
IF NOT EXIST "%~dp0\save_backup\quick\" (  MD .\save_backup\quick\ )


IF %GAME_START% == yes (  
echo status: Game start - yes  
IF NOT EXIST "%GAME_FOLDER%\" ( 
echo Game folder does not exist 
pause
exit /b 1 
)
IF NOT EXIST "%GAME_FOLDER%\%EXE_FILE%" ( 
echo Game exe file does not exist 
pause
exit /b 1 
)

echo Game running .....
cd %GAME_FOLDER%
start /HIGH %EXE_FILE%

) ELSE IF %GAME_START% == no ( 
echo status: Without running Game
 ) ELSE (
echo GAME_START - only yes/no
pause
exit /b 1 
 )
 
%rem% echo  GAME_SAVE folder= %GAME_SAVE%
%rem% echo  TIME OUT=%TIME_OUT%
%rem% echo  Name auto save file - %AUTO%
%rem% echo  Name quick save file - %QUICK%

call :X
call :X2
set curdate_y=0
set curdate_y2=0

For /R "%~dp0\save_backup\auto\" %%i In (%CURDATE_X%) Do (
For /R "%~dp0\save_backup\quick\" %%n In (%CURDATE_X2%) Do (
 	IF Exist %%n (
		SET CURDATE_Y2=%CURDATE_X2%
	    echo Auto quick_save scan in progress.... timeout %TIME_OUT% sec
	) ELSE (
	echo no file in quick save backup
	)
)
 	IF Exist %%i (
		SET CURDATE_Y=%CURDATE_X%
		echo Auto auto_save scan in progress.... timeout %TIME_OUT% sec
	) ELSE (
	echo no file in auto save backup
	)
)

:Main loop
call :X
call :X2
IF NOT %CURDATE_X% == %CURDATE_Y% (
echo %date% %time% - Copy File auto save
copy "%GAME_SAVE%"\%AUTO% %~dp0\save_backup\auto\%CURDATE_X%
SET CURDATE_Y=%CURDATE_X%
echo %CURDATE_X% Copy File auto save>>%~dp0\log.txt
)
IF NOT %CURDATE_X2% == %CURDATE_Y2% (
echo %date% %time% - Copy File quick save
copy "%GAME_SAVE%"\%QUICK% %~dp0\save_backup\quick\%CURDATE_X2%
SET CURDATE_Y2=%CURDATE_X2%
echo %CURDATE_X2% Copy File quick save>>%~dp0\log.txt
)
timeout %TIME_OUT% > NUL
%rem% echo %TIME% Auto quick_save scan in progress.... timeout %TIME_OUT% sec
%rem% echo %TIME% Auto auto_save scan in progress.... timeout %TIME_OUT% sec
goto Main loop 

rem /******************************************************/

:read_settings
set SETTINGSFILE=%1
if not exist %SETTINGSFILE% (
echo FAIL: missing configuration file
pause
exit /b 1
)
for /f "eol=# delims== tokens=1,2" %%i in (%SETTINGSFILE%) do (
set %%i=%%j
)
goto :eof

:X
for %%t in ("%GAME_SAVE%\%AUTO%") do set X=%%~tt
set dd=%X:~0,2%
set mm=%X:~3,2%
set yyyy=%X:~6,4%
set h=%X:~11,2%
IF "%h:~11,1%" == " " SET h=0%h:~11,1%
set m=%X:~14,2%
set curdate_x=%dd%%mm%%yyyy%%h%%m%
goto :eof

:X2
for %%t in ("%GAME_SAVE%\%QUICK%") do set X=%%~tt
set dd=%X:~0,2%
set mm=%X:~3,2%
set yyyy=%X:~6,4%
set h=%X:~11,2%
IF "%h:~11,1%" == " " SET h=0%h:~11,1%
set m=%X:~14,2%
set curdate_x2=%dd%%mm%%yyyy%%h%%m%
goto :eof









