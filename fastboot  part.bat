@echo off
mode con: cols=50 lines=40
color 70
set rf=%~dp0


:check
cls
echo ==================================================
echo powerBy-
echo .##.....##....########....####....########....####
echo .##.....##....##...........##..........##......##.
echo .##.....##....##...........##.........##.......##.
echo .#########....######.......##........##........##.
echo .##.....##....##...........##.......##.........##.
echo .##.....##....##...........##......##..........##.
echo .##.....##....########....####....########....####
echo ==================================================

if not exist "%rf%\pt\adb.exe" (
echo.
echo ����:
echo δ�ҵ�adb.exe����������������
) else (
echo �ɹ��ҵ�adb.exe
set adb="%rf%\pt\adb.exe")
if not exist "%rf%\pt\fastboot.exe" (
echo.
echo ����:
echo δ�ҵ�fastboot.exe����������������
goto aname
) else (
echo �ɹ��ҵ�fastboot.exe
set fastboot="%rf%\pt\fastboot.exe"
goto start)

:aname
echo �������adb���߰�������A��û����رձ����ڡ�
set /p check=
if check==A goto ref

:ref
echo �뽫adb.exe���뱾������
set /p adb=
echo �뽫fastboot.exe���뱾������
set /p fastboot= 

:start
cls
echo ==================================================
echo powerBy-
echo .##.....##....########....####....########....####
echo .##.....##....##...........##..........##......##.
echo .##.....##....##...........##.........##.......##.
echo .#########....######.......##........##........##.
echo .##.....##....##...........##.......##.........##.
echo .##.....##....##...........##......##..........##.
echo .##.....##....########....####....########....####
echo ==================================================
echo δ���а汾
echo ����ȥ��NMSL
echo ˢboot1���л�����2��ˢgsi3 ��
set /p mode=^(1-3^)
if %mode%==1 goto flash-boot
if %mode%==2 goto ActiveSLOT
if %mode%==3 goto Flash-GSI


:flash-boot
cls
echo ==================================================
echo powerBy-
echo .##.....##....########....####....########....####
echo .##.....##....##...........##..........##......##.
echo .##.....##....##...........##.........##.......##.
echo .#########....######.......##........##........##.
echo .##.....##....##...........##.......##.........##.
echo .##.....##....##...........##......##..........##.
echo .##.....##....########....####....########....####
echo ==================================================

echo ����ˢbootģʽ
echo ���Ҫˢ��boot.img�Ͻ�������
set /p bootfile=
echo ����ˢ��boot_a
echo on
%fastboot% flash boot_a %bootfile%
@echo ����ˢ��boot_b
%fastboot% flash boot_b %bootfile%
@echo off
echo.
echo ������������ͼ����
goto end

:ActiveSLOT
cls
echo ==================================================
echo powerBy-
echo .##.....##....########....####....########....####
echo .##.....##....##...........##..........##......##.
echo .##.....##....##...........##.........##.......##.
echo .#########....######.......##........##........##.
echo .##.....##....##...........##.......##.........##.
echo .##.....##....##...........##......##..........##.
echo .##.....##....########....####....########....####
echo ==================================================
echo ��Ҫ�����ĸ�������
choice /c ab
if %errorlevel%==1 %fastboot% --set-active=a
if %errorlevel%==2 %fastboot% --set-active=b
echo ���
echo �Ƿ�������
choice /c yn
if %errorlevel%==1 %fastboot% reboot
if %errorlevel%==2 goto end
goto end

:Flash-GSI
cls
echo ==================================================
echo powerBy-
echo .##.....##....########....####....########....####
echo .##.....##....##...........##..........##......##.
echo .##.....##....##...........##.........##.......##.
echo .#########....######.......##........##........##.
echo .##.....##....##...........##.......##.........##.
echo .##.....##....##...........##......##..........##.
echo .##.....##....########....####....########....####
echo ==================================================
echo ����ˢGSIģʽ
echo =============
echo 1.ֻˢSystem����
echo 2.ֻˢVendor����
echo 3.��������ȫ��Ҫ(�Ƽ�)
set /p svbm=^(1-3^)%=%
if %svbm%==1 goto flash-gsi-boot
if %svbm%==2 goto flash-gsi-boot
if %svbm%==3 goto flash-gsi-boot


:flash-gsi-boot
echo ==================================================
echo ���Ҫˢ��boot.img�Ͻ�������
echo ==================================================
set /p bootfile=
echo ����ˢ��boot_a
echo on
%fastboot%  --set-active=a flash boot_a %bootfile%
@echo off
echo ==================================================
goto flash-vbmeta


:flash-vbmeta 
echo ���Ҫˢ��vbmeta.img�Ͻ�������
echo ==================================================
set /p vbmetafile=
echo ����ˢ��vbmeta
echo on
%fastboot%  --disable-verity --disable-verification flash vbmeta_a %vbmetafile%
@echo off
echo ==================================================
if %svbm%==1 goto flash-system
if %svbm%==2 goto flash-vandor
if %svbm%==3 goto flash-vandor

:flash-vandor
echo ���Ҫˢ��vandor.img�Ͻ�������
echo ==================================================
set /p vendorfile=
echo ����ˢ��vandor
echo on
%fastboot%  --disable-verity --disable-verification flash vendor_a %vendorfile%
@echo off
echo ==================================================
if %svbm%==2 goto end
if %svbm%==3 goto flash-system
:flash-system
echo ���Ҫˢ��system.img�Ͻ�������
echo ==================================================
set /p systemfile=
echo ����ˢ��system
echo on
%fastboot%  --disable-verity --disable-verification flash system_a %systemfile%
@echo off
echo ==================================================
goto end







:end
echo ==================================================
echo ָ��ִ�����
set /p=��������˳�