@echo off
title LAFɱ��
mode con cols=80 lines=30
color f0
set rf=%~dp0
set number=%random%%random%%random%%random%
%rf%other/1.jpg
cls
echo PowerBy-HEIZI %number%
echo -------------------------------------------------------------------------------
:check-exist-adb.exe
echo ���adb.exe�Ƿ�����С���
echo -------------------------------------------------------------------------------
if not exist "%rf%adb\adb.exe" (
echo ����:
echo δ��Ŀ¼���ҵ�adb.exe�������������������¶���adb.exe��
goto r-a
) 
echo �ɹ��ҵ�adb.exe
:: set adb=echo
set adb=%rf%adb\adb.exe
echo -------------------------------------------------------------------------------
goto pre-home
:r-a
echo -------------------------------------------------------------------------------
echo ���Լ�׼����adb.exe���뱾�����ڣ�û����رա�
set /p adb= 
echo -------------------------------------------------------------------------------
:pre-home
echo 	��ʼ��adb��
%adb% kill-server
%adb% start-server
echo -------------------------------------------------------------------------------
:home
cls
echo PowerBy-HEIZI %number%
echo -------------------------------------------------------------------------------
echo ע��: ��ȷ������LG�豸��װ��Magisk����USB���Ժ����ӵ��ԡ�
echo -------------------------------------------------------------------------------
echo Ŀǰ�Ѿ�ʶ�𵽵��豸��:
%adb% wait-for-device
%adb% devices
echo -------------------------------------------------------------------------------
echo.
echo.
echo 	1. Ĭ��ģʽ^(����^+ɾ��laf_a^)
echo.
echo 	2. �߼�ģʽ^(������ѡ������֮������A����ɱB^)
echo.
echo.
echo -------------------------------------------------------------------------------
choice /m "��ѡ��ģʽ(������Զ���תĬ��)" /c 12 /d 1 /t 0005
if %errorlevel%==1 goto easymode
if %errorlevel%==2 goto hardmode
goto end
goto end-wrong
:easymode
title LAFɱ�� -Ĭ��ģʽ
cls
echo PowerBy-HEIZI %number%
echo -------------------------------------------------------------------------------
echo ע��: ��ȷ������LG�豸��װ��Magisk����USB���Ժ����ӵ��ԡ�
echo -------------------------------------------------------------------------------
echo 	���rootȨ���С����������ֻ��ڵ�Ȩ�����롣
for /f %%i in ('%adb% shell "su -c 'echo success'"') do set suckess=%%i 
if not %suckess%==success (
echo 	��ȡRootȨ��ʧ�ܣ������MagiskManager����Shell RootȨ�޺󰴻س���������
echo 	û��Magisk���˳�^(�ϻ�^)
set /p powerbyheizi= 
 for /f %%i in ('%adb% shell "su -c 'echo success'"') do set suckess=%%i 
 if not %suckess%==success ( 
 echo 	�㻹��û����ȨRootȨ�ޣ��ټ���
 echo -------------------------------------------------------------------------------
 goto end
 )
)
echo 	��ȡRootȨ�޳ɹ�
echo -------------------------------------------------------------------------------
echo 	���ڱ���laf_a��laf_b���ֻ�/sdcard/Download/lafBackup/�С���
%adb% shell mkdir /sdcard/Download/lafBackup/
%adb% shell "su -c 'cp /dev/block/bootdevice/by-name/laf_a /sdcard/Download/lafBackup/laf_a_%number%.img'"
%adb% shell "su -c 'cp /dev/block/bootdevice/by-name/laf_b /sdcard/Download/lafBackup/laf_b_%number%.img'"
echo -------------------------------------------------------------------------------
echo 	���ڸ��Ʊ����ļ����ļ��ű�Ŀ¼lafBackup�ļ������
%adb% pull /sdcard/Download/lafBackup/laf_a_%number%.img %rf%lafBackup\laf_a_%number%.img
%adb% pull /sdcard/Download/lafBackup/laf_b_%number%.img %rf%lafBackup\laf_b_%number%.img
echo -------------------------------------------------------------------------------
echo 	����ɾ��laf_a����
%adb% shell "su -c 'dd if=/dev/zero of=/sdcard/laf_a bs=512 count=98304 '"
%adb% shell "su -c 'dd if=/sdcard/laf_a of=/dev/block/bootdevice/by-name/laf_a bs=512 count=98304 '"
echo -------------------------------------------------------------------------------
goto end
goto end-wrong
:hardmode
set number=%random%%random%%random%%random%
title LAFɱ�� -�߼�ģʽ
cls
echo PowerBy-HEIZI %number%
echo -------------------------------------------------------------------------------
echo ע��: ��ȷ������LG�豸��װ��Magisk����USB���Ժ����ӵ��ԡ�
echo -------------------------------------------------------------------------------
echo Ŀǰ�Ѿ�ʶ�𵽵��豸��:
%adb% devices
echo -------------------------------------------------------------------------------
echo.
echo.
echo       1. ����laf_a      2. ����laf_b
echo.
echo       3. ɾ��laf_a      4. ɾ��laf_b
echo.
echo       5. д��laf_a      6. д��laf_b
echo.
echo.
echo -------------------------------------------------------------------------------
set /p mode=��ѡ����� ^[1,2,3,4,5,6^]

cls
echo PowerBy-HEIZI %number%
echo -------------------------------------------------------------------------------
echo ע��: ��ȷ������LG�豸��װ��Magisk����USB���Ժ����ӵ��ԡ�
echo -------------------------------------------------------------------------------
echo Ŀǰ�Ѿ�ʶ�𵽵��豸��:
%adb% devices
echo -------------------------------------------------------------------------------
echo 	���rootȨ���С����������ֻ��ڵ�Ȩ�����롣
for /f %%i in ('%adb% shell "su -c 'echo success'"') do set suckess=%%i 
if not %suckess%==success (
echo 	��ȡRootȨ��ʧ�ܣ������MagiskManager����Shell RootȨ�޺��ٴ򿪸ó���
set /p powerbyheizi=��������������˵ɶ����ɱ���������������ɱ^(ָ�����˳�����^)��
goto endd
  )
echo 	��ȡRootȨ�޳ɹ�
echo -------------------------------------------------------------------------------
if %mode%==1 (
set laf=laf_a
goto laf-backup
)

if %mode%==2 (
set laf=laf_b
goto laf-backup
)

if %mode%==3 (
set laf=laf_a
goto laf-delete
)

if %mode%==4 (
set laf=laf_b
goto laf-delete
)

if %mode%==5 (
set laf=laf_a
goto laf-restore
)

if %mode%==6 (
set laf=laf_b
goto laf-restore
)
goto end
goto end-wrong
:laf-backup
echo 	���ڱ���%laf%�ֻ�/sdcard/Download/lafBackup/�С���
%adb% shell mkdir /sdcard/Download/lafBackup/
%adb% shell "su -c 'dd if=/dev/block/bootdevice/by-name/%laf% of=/sdcard/Download/lafBackup/%laf%_%number%.img'"
echo -------------------------------------------------------------------------------
echo 	���ڸ��Ʊ����ļ����ļ��ű�Ŀ¼lafBackup�ļ������
%adb% pull /sdcard/Download/lafBackup/%laf%_%number%.img %rf%lafBackup\%laf%_%number%.img
echo -------------------------------------------------------------------------------
goto end
goto end-wrong
:laf-delete
echo 	����ɾ��%laf%����
%adb% shell "su -c 'dd if=/dev/zero of=/sdcard/%laf% bs=512 count=98304 '"
%adb% shell "su -c 'dd if=/sdcard/%laf% of=/dev/block/bootdevice/by-name/%laf% bs=512 count=98304 '"
echo -------------------------------------------------------------------------------
goto end
goto end-wrong
:laf-restore
echo 	�뽫Ҫд���%laf%�ļ�����ô��ڣ�������ı����ļ���lafBackup�ļ����ڡ�
set /p lafaf=
%adb% push %lafaf% /sdcard/%laf%
%adb% shell "su -c 'dd if=/sdcard/%laf% of=/dev/block/bootdevice/by-name/%laf%'"
echo -------------------------------------------------------------------------------
goto end
goto end-wrong
goto end-wrong
:end-wrong
set /p powerbyheizi=����BUG,�ύ��ɻ��һ���߸�С���ˡ�
:end
set /p powerbyheizi=ִ�����,�������������ҳ��
goto home
goto home
goto home
goto home
goto home
goto home