@echo off
set rf=%~dp0
title ���˹��ߺ�
mode con cols=80 lines=30
color f0
set number=%random%%random%%random%%random%
:start
if exist %rf%lgup.off goto home-check
if exist %rf%lgup.on goto start-lgup-checks
cls
echo PowerBy-HEIZI ���˹��ߺ� V2.0.%number% 
echo -------------------------------------------------------------------------------
echo �ƽ�LGUPֻ����һ�Σ���������ٴ��ƽ�lgup����ɾ�����ļ����µġ�lgup.off���ļ���
echo -------------------------------------------------------------------------------
echo.
echo.
echo       1. �ƽ�LGUP	^|	ʹ�ø�ѡ����رսű����Թ���������
echo.
echo       2. ����		^|	��ˢ��boot��GSI��һ�����á��л�ab������
echo.
echo.
echo -------------------------------------------------------------------------------
choice /m "��ѡ��" /c 12
echo poweredbyheizi>lgup.off
if %errorlevel%==1 goto start-lgup-check
if %errorlevel%==2 goto home-check
goto end
goto end-wrong
:start-lgup-check
del %rf%lgup.off
@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
echo -------------------------------------------------------------------------------
echo �����������ԱȨ��...
echo -------------------------------------------------------------------------------
echo ���ű��޸���https://forum.xda-developers.com/android/general/tecknights-aristo-2-tutorials-t3805141/page3
echo -------------------------------------------------------------------------------
echo poweredbyheizi>%rf%lgup.on
goto UACPrompt
) else ( goto start-lgup-checks )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:start-lgup-checks
del %rf%lgup.on
echo ���LGUP��װ״̬�С���
echo -------------------------------------------------------------------------------
if exist "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe" (
echo �ɹ�
echo -------------------------------------------------------------------------------
goto start-lgup-checkses
) else (
rem ���У���������һ��ҪȥGitub���Ҹ��ˣ�л�ˡ�����ִ�д����Ұ����Ŷ�ɾ�ˣ��ĳ����ͷ����档
  rem echo ʧ��
  rem echo -------------------------------------------------------------------------------
  rem echo ���¶�����
  rem echo -------------------------------------------------------------------------------
  rem set "ProgramFiles��x86��"="C:\Program Files ��x86��"
	  rem echo " %ProgramFiles��x86��%\LG Electronics\LGUP\LGUP.exe "
      rem if exist "%ProgramFiles��x86��%\LG Electronics\LGUP\LGUP.exe" ��A
	  rem echo "%ProgramFiles��x86��\LG Electronics\LGUP\LGUP.exe"
      rem echo ����ɹ�
      rem echo -------------------------------------------------------------------------------
      rem goto start-lgup-checkses
      rem ��A else ��B
        echo ������δ��⵽LGUP��������ת������ҳ�桭��
        echo -------------------------------------------------------------------------------
        %rf%file\other\help.url
        goto lgup-end-error
		rem ��B 
)
:start-lgup-checkses
echo ���LGUP����״̬�С���
echo -------------------------------------------------------------------------------
if exist "%rf%file\lgup\LGUPR.exe" (
echo ���ڣ�����Ϊ���������ݡ�
echo -------------------------------------------------------------------------------
goto start-lgup
) else (
echo �����ڣ�������
echo -------------------------------------------------------------------------------
copy "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe"  "%rf%file\lgup\LGUPR.exe"
if not errorlevel 1 goto start-lgup
echo �����󣡱���ʧ�ܣ�������ת������ҳ�桭��
echo -------------------------------------------------------------------------------
%rf%file\other\help.url
goto lgup-end-error
)
:start-lgup
echo poweredbyheizi>%rf%lgup.off
title ���˹��ߺ� - �ƽ�LGUP
cls
echo PowerBy-HEIZI ���˹��ߺ� V2.0.%number% 
echo -------------------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo       1. �ƽ�LGUP
echo.
echo.
echo.
echo       2. ��ԭLGUP
echo.
echo.
echo.
echo.
echo -------------------------------------------------------------------------------
choice /m "��ѡ��" /c 12
if %errorlevel%==1 goto setdev
if %errorlevel%==2 goto setrec
:setdev
title ���˹��ߺ� - �ƽ�LGUP - �ƽ�ģʽ
cls
echo PowerBy-HEIZI ���˹��ߺ� V2.0.%number% 
echo -------------------------------------------------------------------------------
echo ����Common�ļ��У����޸�DLL�С���
if not exist "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\" md "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\"
if not errorlevel 1 ( 
echo �������޸�ʧ�ܣ�������ת������ҳ�桭��
echo -------------------------------------------------------------------------------
%rf%file\other\help.u
goto lgup-end-error
)
copy /Y "%rf%file\lgup\LGUP_CommonD.dll" "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\LGUP_Common.dll"
echo -------------------------------------------------------------------------------
echo �޸�LGUP�С���
copy "%rf%file\lgup\LGUPD.exe" "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe"
if errorlevel 1 ( 
echo �������޸�ʧ�ܣ�������ת������ҳ�桭��
echo -------------------------------------------------------------------------------
%rf%file\other\help.url
goto lgup-end-error
)
echo -------------------------------------------------------------------------------
echo ���
echo -------------------------------------------------------------------------------
goto lgup-end
:setrec
title ���˹��ߺ� - �ƽ�LGUP - �ָ�ģʽ
cls
echo PowerBy-HEIZI ���˹��ߺ� V2.0.%number% 
echo -------------------------------------------------------------------------------
echo ɾ��Common�ļ��С�DLL�С���
del "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\LGUP_Common.dll"
rd "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\"
if errorlevel 1 ( 
echo �������޸�ʧ�ܣ�������ת������ҳ�桭��
echo -------------------------------------------------------------------------------
%rf%file\other\help.url
goto lgup-end-error
)
echo -------------------------------------------------------------------------------
echo �޸�LGUP�С���
copy "%rf%file\lgup\LGUPR.exe" "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe"
if errorlevel 1 ( 
echo �������޸�ʧ�ܣ�������ת������ҳ�桭��
echo -------------------------------------------------------------------------------
%rf%file\other\help.url
goto lgup-end-error
)
echo -------------------------------------------------------------------------------
echo ���
echo -------------------------------------------------------------------------------
goto lgup-end
:lgup-end-error
title ����
echo ����״̬��
if exist %rf%lgup.off del %rf%lgup.off
if exist %rf%lgup.on del %rf%lgup.on
echo -------------------------------------------------------------------------------
:lgup-end
set /p poweredbyheizi=���������˳��ű�
exit /B 
:home-check
title ���˹��ߺ� - ����ļ� adb 
cls
echo PowerBy-HEIZI ���˹��ߺ� V2.0.%number% 
echo -------------------------------------------------------------------------------
echo ���adb.exe�Ƿ�����С���
echo -------------------------------------------------------------------------------
if not exist "%rf%\file\adb\adb.exe" (
echo ������δ��⵽adb����رճ���ѽ�ѹ����ѹ����ĵط����������������ԣ�������������¶���adb.exe���������adb.exe���뱾���򴰿��ں� ���»س���ȷ�ϡ�
echo -------------------------------------------------------------------------------
set /p adb= 
) else (
echo �ɹ��ҵ�adb.exe
set adb=%rf%file\adb\adb.exe
echo -------------------------------------------------------------------------------
)
title ���˹��ߺ� - ����ļ� fastboot
echo ���fastboot.exe�Ƿ�����С���
echo -------------------------------------------------------------------------------
if not exist "%rf%\file\adb\fastboot.exe" (
echo ������δ��⵽fastboot����رճ���ѽ�ѹ����ѹ����ĵط����������������ԣ�������������¶���fastboot.exe���������fastboot.exe���뱾���򴰿��ں� ���»س���ȷ�ϡ�
echo -------------------------------------------------------------------------------
set /p fastboot= 
)
echo �ɹ��ҵ�fastboot.exe
set fastboot=%rf%file\adb\fastboot.exe
echo -------------------------------------------------------------------------------
echo ��ʼ��adb��
echo -------------------------------------------------------------------------------
::%adb% kill-server
::%adb% start-server
echo -------------------------------------------------------------------------------

:home 
title ���˹��ߺ� 
cls
echo PowerBy-HEIZI ���˹��ߺ� V2.0.%number% 
echo -------------------------------------------------------------------------------
echo �ƽ�LGUPֻ����һ�Σ���������ٴ��ƽ�lgup����ɾ�����ļ����µġ�lgup.off���ļ���
echo -------------------------------------------------------------------------------
echo.
echo.
echo       1. һ��ʽ�Ż��ٷ�ϵͳ ^������ϵͳӦ�á�ʱ��ͬ�������ص�������������^��
echo.
echo       2. ˢ��BOOT         3. �л�AB����
echo.
echo       4. ˢ��GSI          9. �߼��˵�
echo.
echo.
echo -------------------------------------------------------------------------------
choice /m "��ѡ��" /c 12349
if %errorlevel%==1 set mode=stock
if %errorlevel%==2 set mode=boot
if %errorlevel%==3 set mode=slot
if %errorlevel%==4 set mode=GSI
if %errorlevel%==5 goto hide
cls
title ���˹��ߺ� 
cls
echo PowerBy-HEIZI ���˹��ߺ� V2.0.%number% 
echo -------------------------------------------------------------------------------
if mode=stock goto adb-devices
:fastboot-devices
if exist "%rf%0" del 0
for /f %%i in ('%fastboot% devices -l') do echo %%i>0
if not exist 0 (
set /p  poweredbyheizi=�ȴ��豸�С����뽫�����豸������fastbootģʽ���������������
echo -------------------------------------------------------------------------------
%fastboot% devices
goto fastboot-devices
) else (
for /f %%i in (0) do set device=%%i 
del 0
)
echo ��⵽�豸"%device%" 
echo -------------------------------------------------------------------------------
if mode=boot goto flash-boot
if mode=slot goto slot-active
if mode=GSI goto GSI-flasher
goto end-wrong
:adb-devices
echo �ȴ��豸�С����뽫�����豸������ԡ���
echo -------------------------------------------------------------------------------
%adb% wait-for-device
for /f %%i in ('adb devices') do set device=%%i
echo ��⵽�豸"%device%" 
goto end-wrong
echo -------------------------------------------------------------------------------
if mode=stock goto adb-devices
goto end-wrong
:hide
title ���˹��ߺ� - �߼�ģʽ
cls
echo PowerBy-HEIZI ���˹��ߺ� V2.0.%number% 
echo -------------------------------------------------------------------------------
echo ��������������ǳ�geek��
echo -------------------------------ADB-����----------------------------------------
echo.
echo 		1.ʱ��ͬ��		2.���ص�����		3.�������		4.ADB����
echo.
echo -------------------------------TWRP-����---------------------------------------
echo.
echo 				1.����TWRPѭ��				2.��ˢZIP��
echo.
echo -----------------------------Fastboot-����-------------------------------------
echo.
echo 			1.�л�ϵͳ��	2.ˢ���������	3.����û�����
echo.
echo -------------------------------------------------------------------------------
choice /m "��ѡ����� ^(ADB/TWRP/Fastboot^)" /c ATF
if %errorlevel%==1 goto path-a
if %errorlevel%==2 goto path-t
if %errorlevel%==3 goto path-f
echo -------------------------------------------------------------------------------
:path-a
choice /m "��ѡ��ָ��" /c 1234
if %errorlevel%==1 goto
if %errorlevel%==2 goto
if %errorlevel%==3 goto
if %errorlevel%==4 goto
:path-t
choice /m "��ѡ��ָ��" /c 1234
if %errorlevel%==1 goto
if %errorlevel%==2 goto
if %errorlevel%==3 goto
if %errorlevel%==4 goto
:path-f
choice /m "��ѡ��ָ��" /c 1234
if %errorlevel%==1 goto
if %errorlevel%==2 goto
if %errorlevel%==3 goto
if %errorlevel%==4 goto


goto end
goto end-wrong

:end-wrong
set /p poweredbyheizi=�����������!�������ύ���bug�ɣ�
goto edddddddddd
:end
set /p poweredbyheizi=ִ�����,�������������ҳ��
goto home