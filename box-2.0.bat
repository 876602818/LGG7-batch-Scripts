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
echo       4. ˢ��GSI          9. �߼�ģʽ
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
if %mode%==stock goto adb-devices
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
if %mode%==boot goto flash-boot
if %mode%==slot goto slot-active
if %mode%==GSI goto GSI-flasher
goto end-wrong
:adb-devices
echo �ȴ��豸�С����뽫�����豸������ԡ���
echo -------------------------------------------------------------------------------
::%adb% wait-for-device
for /f %%i in ('adb devices') do set device=%%i
echo ��⵽�豸"%device%" 
echo -------------------------------------------------------------------------------
if %mode%==stock goto adb-ntps
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
:adb-hide

:adb-ntps
if %mode%==stock ( title ���˹��ߺ� - һ��ʽ�Ż��ٷ�ϵͳ - ʱ��ͬ�� ) else ( title ���˹��ߺ� - ʱ��ͬ�� )
echo ʱ��ͬ��
echo -------------------------------------------------------------------------------
if %mode%==stock (
	choice /m "	Ҫִ��ʱ��ͬ����^(ִ��/��ִ��^)" /c dn
	echo -------------------------------------------------------------------------------
	) else (
		set errorlevel=3
		%adb% shell settings put global ntp_server ntp1.aliyun.com
		echo 	ִ�����
		echo -------------------------------------------------------------------------------
		goto end
)
if %errorlevel%==3 goto end
if %errorlevel%==1 (
	echo 	ִ���С�������
	echo -------------------------------------------------------------------------------
	%adb% shell settings put global ntp_server ntp1.aliyun.com
	echo 	ִ�����
	echo -------------------------------------------------------------------------------
	goto adb-shitappkiller
	)
if %errorlevel%==2 (
	echo 	��������
	echo -------------------------------------------------------------------------------
	goto adb-shitappkiller
	)
:adb-shitappkiller
if %mode%==stock ( title ���˹��ߺ� - һ��ʽ�Ż��ٷ�ϵͳ - ����ϵͳӦ�� ) else ( title ���˹��ߺ� - ����ϵͳӦ��)
echo ����ϵͳӦ��
echo -------------------------------------------------------------------------------
echo.
echo.
if %mode%==stock ( 
choice /m "	Ҫ���ỹ�ǽⶳ����������^(����/�ⶳ/����^)" /c FUN
echo.
echo.
echo -------------------------------------------------------------------------------
) else (
choice /m "	^(����/�ⶳ^)" /c DJ
echo -------------------------------------------------------------------------------
)
if %errorlevel%==1 set frozen=disable-user
if %errorlevel%==2 set frozen=enable
if %errorlevel%==3 (
echo ��������
echo -------------------------------------------------------------------------------
goto adb-navbar
)
%adb% shell pm %frozen% com.lge.quicktools
%adb% shell pm %frozen% com.lge.clock
%adb% shell pm %frozen% com.lge.hifirecorder
%adb% shell pm %frozen% com.lge.cic.eden.service
%adb% shell pm %frozen% com.lge.provider.yellowpage
%adb% shell pm %frozen% com.lge.cnas.main
%adb% shell pm %frozen% com.lge.cnas.terms
%adb% shell pm %frozen% com.lge.iuc
%adb% shell pm %frozen% com.lge.lms
%adb% shell pm %frozen% com.lge.qlens
%adb% shell pm %frozen% com.lge.eulaprovider
%adb% shell pm %frozen% com.lge.eula
%adb% shell pm %frozen% com.lge.floatingbar
%adb% shell pm %frozen% com.lge.cinemagraph
%adb% shell pm %frozen% com.lguplus.oemsearch
%adb% shell pm %frozen% com.lge.updatecenter
%adb% shell pm %frozen% com.lge.lgassistant
%adb% shell pm %frozen% com.lguplus.mobile.cs
%adb% shell pm %frozen% com.skt.skaf.OA00018282
%adb% shell pm %frozen% com.lguplus.appstore
%adb% shell pm %frozen% com.lge.lgpay
%adb% shell pm %frozen% com.android.bips
%adb% shell pm %frozen% com.lge.lgassistant
%adb% shell pm %frozen% com.android.bookmarkprovider
%adb% shell pm %frozen% com.android.calendar
%adb% shell pm %frozen% com.android.calllogbackup
%adb% shell pm %frozen% com.android.chrome
%adb% shell pm %frozen% com.android.egg
%adb% shell pm %frozen% com.android.emergency
%adb% shell pm %frozen% com.android.hotwordenrollment.okgoogle
%adb% shell pm %frozen% com.android.hotwordenrollment.tgoogle
%adb% shell pm %frozen% com.android.hotwordenrollment.xgoogle
%adb% shell pm %frozen% com.android.printspooler
%adb% shell pm %frozen% com.android.providers.partnerbookmarks
%adb% shell pm %frozen% com.crucialsoft.asm
%adb% shell pm %frozen% com.crucialsoft.fido.client
%adb% shell pm %frozen% com.crucialtec.uaf
%adb% shell pm %frozen% com.facebook.appmanager
%adb% shell pm %frozen% com.facebook.system
%adb% shell pm %frozen% com.google.android.apps.docs
%adb% shell pm %frozen% com.google.android.apps.docs.editors.docs
%adb% shell pm %frozen% com.google.android.apps.docs.editors.sheets
%adb% shell pm %frozen% com.google.android.apps.docs.editors.slides
%adb% shell pm %frozen% com.google.android.apps.maps
%adb% shell pm %frozen% com.google.android.apps.photos
%adb% shell pm %frozen% com.google.android.apps.tachyon
%adb% shell pm %frozen% com.google.android.calculator
%adb% shell pm %frozen% com.google.android.configupdater
%adb% shell pm %frozen% com.google.android.gm
%adb% shell pm %frozen% com.google.android.googlequicksearchbox
%adb% shell pm %frozen% com.google.android.ims
%adb% shell pm %frozen% com.google.android.marvin.talkback
%adb% shell pm %frozen% com.google.android.music
%adb% shell pm %frozen% com.google.android.onetimeinitializer
%adb% shell pm %frozen% com.google.android.partnersetup
%adb% shell pm %frozen% com.google.android.printservice.recommendation
%adb% shell pm %frozen% com.google.android.tts
%adb% shell pm %frozen% com.google.android.videos
%adb% shell pm %frozen% com.google.android.youtube
%adb% shell pm %frozen% com.google.ar.core
%adb% shell pm %frozen% com.google.ar.lens
%adb% shell pm %frozen% com.ipsec.profile
%adb% shell pm %frozen% com.lge.bnr
%adb% shell pm %frozen% com.lge.bnr.launcher
%adb% shell pm %frozen% com.lge.briefing
%adb% shell pm %frozen% com.lge.cloudhub
%adb% shell pm %frozen% com.lge.exchange
%adb% shell pm %frozen% com.lge.gallery.collagewallpaper
%adb% shell pm %frozen% com.lge.gallery.vr.wallpaper
%adb% shell pm %frozen% com.lge.ia.task.smartsetting
%adb% shell pm %frozen% com.lge.iftttmanager
%adb% shell pm %frozen% com.lge.leccp
%adb% shell pm %frozen% com.lge.lgaccount
%adb% shell pm %frozen% com.lge.lgmapui
%adb% shell pm %frozen% com.lge.lifetracker
%adb% shell pm %frozen% com.lge.livewallpaper.multiphoto
%adb% shell pm %frozen% com.lge.mirroringhead
%adb% shell pm %frozen% com.lge.myplace
%adb% shell pm %frozen% com.lge.myplace.engine
%adb% shell pm %frozen% com.lge.qhelp
%adb% shell pm %frozen% com.lge.qhelp.application
%adb% shell pm %frozen% com.lge.remote.lgairdrive
%adb% shell pm %frozen% com.lge.remote.setting
%adb% shell pm %frozen% com.lge.smartshare
%adb% shell pm %frozen% com.lge.smartshare.provider
%adb% shell pm %frozen% com.lge.smartsharepush
%adb% shell pm %frozen% com.lge.smartsuggestion
%adb% shell pm %frozen% com.lge.sync
%adb% shell pm %frozen% com.lge.task
%adb% shell pm %frozen% com.lge.touchcontrol
%adb% shell pm %frozen% com.lge.video.vr.wallpaper
%adb% shell pm %frozen% com.lge.videostudio
%adb% shell pm %frozen% com.lge.vrplayer
%adb% shell pm %frozen% com.rsupport.rs.activity.lge.allinone
%adb% shell pm %frozen% com.google.android.syncadapters.calendar
%adb% shell pm %frozen% com.android.vending
%adb% shell pm %frozen% com.google.android.gsf
%adb% shell pm %frozen% com.google.android.gms
%adb% shell pm %frozen% com.google.android.feedback
%adb% shell pm %frozen% com.google.android.backuptransport
:adb-navbar
if %mode%==stock ( title ���˹��ߺ� - һ��ʽ�Ż��ٷ�ϵͳ - ���ص����� ) else ( title ���˹��ߺ� - ���ص�����)
echo ���ص�����
echo -------------------------------------------------------------------------------
echo.
echo.
echo 	C:����ģʽ�������ڡ�ȫ������Ч����
echo.
echo	X:�����������õ���ʾ����֮�⣬��������������֮�����Ҫ���ص�����������Ӧ�á�
echo.
if %mode%==stock ( 
echo 	K:ȡ������		N:���� 
) else (
echo 	K:ȡ������
)
echo.
echo.
echo -------------------------------------------------------------------------------
if %mode%==stock ( choice  /c cxknmsl /m "�����Ǽ���ѡ����" ) else ( choice /c cxk )
if %errorlevel%==1 %adb% shell settings put global policy_control immersive.navigation=*
if %errorlevel%==2 %adb% shell settings put global policy_control null
if %errorlevel%==3 goto adb-overscan
goto adb-reboot
:adb-overscan
if %mode%==stock ( title ���˹��ߺ� - һ��ʽ�Ż��ٷ�ϵͳ - �����͵��������� ) else ( title ���˹��ߺ� - �����͵��������� )
echo �����͵���������
echo -------------------------------------------------------------------------------
echo ��ͬ�ķֱ��ʶ�Ӧ�Ų�ͬ����ֵ
echo -------------------------------------------------------------------------------
echo.
echo.
echo 	1. 1080p	2. 1440p^(2k^)	3. ���������³���ֵ 	4.�ָ�
echo.
echo.
echo -------------------------------------------------------------------------------
choice /m "��ѡ��" /c 1234 
if %errorlevel%==1 %adb% shell wm overscan 0,0,0,-143
if %errorlevel%==2 %adb% shell wm overscan 0,0,0,-191
if %errorlevel%==3 goto adb-overscan-loop
if %errorlevel%==4 %adb% shell wm overscan reset
:adb-overscan-loop
if %loop%==off (
echo ��ֵ�����⣿������һ�Σ�
echo -------------------------------------------------------------------------------
choice /c NY /m "	��������/����һ��"
echo -------------------------------------------------------------------------------
if %errorlevel%==2 goto adb-overscan-unloop
)
echo �����³���ֵ  
echo -------------------------------------------------------------------------------
set /p overscan=
%adb% shell wm overscan 0,0,0,-%overscan%
set loop=off
goto adb-overscan-loop
:adb-overscan-unloop
if %mode%==stock ( goto adb-reboot ) else ( goto end )


:adb-reboot
if %mode%==stock ( title ���˹��ߺ� - һ��ʽ�Ż��ٷ�ϵͳ - ���� ) else ( title ���˹��ߺ� - �߼����� )
if %mode%==stock ( echo ���� ) else ( echo �߼����� )
echo -------------------------------------------------------------------------------
echo ��ͬ�ķֱ��ʶ�Ӧ�Ų�ͬ����ֵ
echo -------------------------------------------------------------------------------
echo.
echo.
echo 	1. 1080p	2. 1440p^(2k^)	3. ���������³���ֵ 	4.�ָ�
echo.
echo.
echo -------------------------------------------------------------------------------
choice /m "��ѡ��" /c 1234 
if %errorlevel%==1 %adb% shell wm overscan 0,0,0,-143
if %errorlevel%==2 %adb% shell wm overscan 0,0,0,-191
if %errorlevel%==3 goto adb-overscan-loop
if %errorlevel%==4 %adb% shell wm overscan reset

goto end
goto end-wrong

:end-wrong
set /p poweredbyheizi=�����������!�������ύ���bug�ɣ�
goto home
:end
set /p poweredbyheizi=ִ�����,�������������ҳ��
goto home