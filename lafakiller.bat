
@echo off
title LAFɱ��
mode con cols=80 lines=30
color f0
set rf=%~dp0
set number=%random%%random%_%time%
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
set adb="%rf%adb\adb.exe"
echo -------------------------------------------------------------------------------
goto home
:r-a
echo -------------------------------------------------------------------------------
echo ���Լ�׼����adb.exe���뱾�����ڣ�û����رա�
set /p adb= 
:home
%adb% kill-server
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
echo 	���rootȨ�ޣ��������ֻ��ڵ�Ȩ�����롣
%adb% shell "su -c 'echo %number%'"
echo -------------------------------------------------------------------------------
echo 	���ڱ���laf_a��laf_b���ֻ�/sdcard/Download/lafBackup/�С���
%adb% shell "su -c 'dd if=/dev/block/platform/soc/1d84000.ufshc/by-name/laf_a of=/sdcard/Download/lafBackup/laf_a_%number%.img'"
%adb% shell "su -c 'dd if=/dev/block/platform/soc/1d84000.ufshc/by-name/laf_b of=/sdcard/Download/lafBackup/laf_b_%number%.img'"
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
choice /m "��ѡ�����" /c 12456
set number=%random%%random%_%date%%time%
cls
echo PowerBy-HEIZI %number%
echo -------------------------------------------------------------------------------
echo ע��: ��ȷ������LG�豸��װ��Magisk����USB���Ժ����ӵ��ԡ�
echo -------------------------------------------------------------------------------
echo Ŀǰ�Ѿ�ʶ�𵽵��豸��:
%adb% devices
echo -------------------------------------------------------------------------------
echo 	���rootȨ�ޣ��������ֻ��ڵ�Ȩ�����롣
%adb% shell "su -c 'echo %number%'"
echo -------------------------------------------------------------------------------
if %errorlevel%==1 (
set laf=laf_a
goto laf-backup
)
if %errorlevel%==2 goto laf_b-backup
if %errorlevel%==3 goto laf_a-delete
if %errorlevel%==4 goto laf_b-delete
if %errorlevel%==5 goto laf_a-restore
if %errorlevel%==6 goto laf_b-restore
goto end
goto end-wrong
:laf-backup
echo 	���ڱ���%laf%�ֻ�/sdcard/Download/lafBackup/�С���
%adb% shell "su -c 'dd if=/dev/block/platform/soc/1d84000.ufshc/by-name/%laf% of=/sdcard/Download/lafBackup/%laf%_%number%.img'"
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

:laf_a-backup
echo 	���ڱ���laf_a�ֻ�/sdcard/Download/lafBackup/�С���
%adb% shell "su -c 'dd if=/dev/block/platform/soc/1d84000.ufshc/by-name/laf_a of=/sdcard/Download/lafBackup/laf_a_%number%.img'"
echo -------------------------------------------------------------------------------
echo 	���ڸ��Ʊ����ļ����ļ��ű�Ŀ¼lafBackup�ļ������
%adb% pull /sdcard/Download/lafBackup/laf_a_%number%.img %rf%lafBackup\laf_a_%number%.img
echo -------------------------------------------------------------------------------
goto end
goto end-wrong
:laf_b-backup
echo 	���ڱ���laf_b�ֻ�/sdcard/Download/lafBackup/�С���
%adb% shell "su -c 'dd if=/dev/block/platform/soc/1d84000.ufshc/by-name/laf_b of=/sdcard/Download/lafBackup/laf_b_%number%.img'"
echo -------------------------------------------------------------------------------
echo 	���ڸ��Ʊ����ļ����ļ��ű�Ŀ¼lafBackup�ļ������
%adb% pull /sdcard/Download/lafBackup/laf_b_%number%.img %rf%lafBackup\laf_b_%number%.img
echo -------------------------------------------------------------------------------
goto end
goto end-wrong
:laf_a-delete
echo 	����ɾ��laf_a����
%adb% shell "su -c 'dd if=/dev/zero of=/sdcard/laf_a bs=512 count=98304 '"
%adb% shell "su -c 'dd if=/sdcard/laf_a of=/dev/block/bootdevice/by-name/laf_a bs=512 count=98304 '"
echo -------------------------------------------------------------------------------
goto end
goto end-wrong
:laf_b-delete
echo 	����ɾ��laf_b����
%adb% shell "su -c 'dd if=/dev/zero of=/sdcard/laf_b bs=512 count=98304 '"
%adb% shell "su -c 'dd if=/sdcard/laf_b of=/dev/block/bootdevice/by-name/laf_b bs=512 count=98304 '"
echo -------------------------------------------------------------------------------
goto end
goto end-wrong
:laf_a-restore
echo 	�뽫Ҫд���laf_a�ļ�����ô��ڣ�������ı����ļ���lafBackup�ļ����ڡ�
set /p lafaf=
%adb% push %lafaf% /sdcard/laf_a
%adb% shell "su -c 'dd if=/sdcard/laf_a of=/dev/block/bootdevice/by-name/laf_a'"
echo -------------------------------------------------------------------------------
goto end
goto end-wrong
:laf_b-restore
echo 	�뽫Ҫд���laf_b�ļ�����ô��ڣ�������ı����ļ���lafBackup�ļ����ڡ�
set /p lafbf=
%adb% push %lafbf% /sdcard/laf_b
%adb% shell "su -c 'dd if=/sdcard/laf_b of=/dev/block/bootdevice/by-name/laf_b'"
echo -------------------------------------------------------------------------------
goto end
goto end-wrong

set /p powerbyheizi=����BUG,�ύ��ɻ��һ���߸�С���ˡ�
::test-backuplaf-and-change
set /p powerbyheizi=����BUG,�ύ��ɻ��һ���߸�С���ˡ�
::������һ������л�Laf_a Laf_b��
goto end-wrong
:end-wrong
set /p powerbyheizi=����BUG,�ύ��ɻ��һ���߸�С���ˡ�
:end
set /p powerbyheizi=ִ�����,�������������ҳ��
goto home