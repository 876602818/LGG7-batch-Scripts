@echo off
����bl����
color 3e
mode con cols=90 lines=40
cd %cd%
:STARTS
CLS
ECHO.����G7Ⱥʸ�ɣ����LINEAGEOS 0729ˢд���ߣ�
ECHO.����bl����(�����ְ汾��ʹ��)
ECHO.
ECHO.���԰汾��������ϵȺ����ʸ��
ECHO.���԰汾��������ϵȺ����ʸ��
ECHO.���԰汾��������ϵȺ����ʸ��
ECHO.======================================================================================
ECHO. ע�⣺
ECHO.      1.��ȷ����ǰ�ֻ��汾Ϊulm11g�汾,�Ҵ���usb�����Լ�OEM
ECHO.      2.�ֻ����������ӵ��� 
ECHO.      3.�����Ѿ���װ��LG������

ECHO.==========================����: LG G7 ThinQȺ:275250706====================
ECHO.
ECHO.       ��ѡ����Ĳ���?
ECHO.
ECHO.                    ȷ���Ѿ�Ϊulm11g
ECHO.
ECHO.                    1.��0��ʼ����bl��
ECHO.   
ECHO.                    2.��ϵͳ��Ҫ��fastboot
ECHO.
ECHO.                    3.ж��magisk����װ�°汾���
ECHO.
ECHO.                    4.ˢ��ulm11g��rootedboot(���⿪bl�Ҵ�OEM������ã����3Ч�����)
ECHO.    
ECHO.                    5.��ϵͳ�ڻָ�abl_a(�Ѵ�usb�����Լ���rootȨ��)
ECHO.          
ECHO.                    6.��������滻abl_a���ʱ��Ͽ��ˣ���ѡ�����ѡ��
ECHO.       
ECHO.                    0.�˳�
ECHO.                          
ECHO.=======================================================================================
:CHO
set choice=
set /p choice= �����Ӧ���֣�Ȼ�󰴻س���:
if /i "%choice%"=="1" goto devices
if /i "%choice%"=="2" goto adbreboot
if /i "%choice%"=="3" goto magisk1
if /i "%choice%"=="4" goto rootedboot1
if /i "%choice%"=="5" goto abl-b
if /i "%choice%"=="6" goto oem
if /i "%choice%"=="0" goto SECEDE
echo ѡ����Ч������������
echo.
GOTO STARTS

:devices
CLS
ECHO ***************************************************************************************
ECHO *                                                                                     *
ECHO *                              ���ڼ���ֻ��Ƿ���������,���Ժ�...                             *
ECHO *                                                                                     *
ECHO ***************************************************************************************
ECHO.
ECHO.����ֻ��Ƿ���������
ECHO.Running
adb  devices
set /p choice= ����ʾ LMG710***********      device������1�����س���:
if /i "%choice%"=="1" goto adbreboot
if /i "%choice%"=="0" goto SECEDE
ECHO.OFF

:adbreboot
CLS
ECHO ***************************************************************************************
ECHO *                                                                                     *
ECHO *                            ����������fastboot,���Ժ�...                             *
ECHO *                                                                                     *
ECHO ***************************************************************************************
ECHO.
ECHO.����������fastboot...
ECHO.Running
adb reboot bootloader 
set /p=�ȴ�����bootloader��,�������������һ��
ECHO.OFF
set /p choice= ����1������һ��������2�������˵�:
if /i "%choice%"=="1" goto rootedboot
if /i "%choice%"=="2" goto STARTS

:rootedboot
CLS
ECHO ***************************************************************************************
ECHO *                                                                                     *
ECHO *                              ��������ulm11gRootedboot,���Ժ�...                             *
ECHO *                                                                                     *
ECHO ***************************************************************************************
ECHO.

ECHO ***************************************************************************************
ECHO *                 ��ȷˢ�뽫��ʾ                                                                    
ECHO *                fastboot devicesDownloading 'boot.img'                  OKAY [  0.506s]
ECHO *                booting                                            OKAY [  0.052s]
ECHO *                Finished. Total time: 0.639s
ECHO *                ��������˵���Ѿ������ˣ�������ɶ���˸�MagiskManager��  
ECHO *                                                                                 
ECHO ***************************************************************************************
ECHO.����ˢ��ulm11gRootedboot...
ECHO.Running
fastboot boot rootedboot.img
set /p=�ȴ�����ϵͳ�󣬰������������һ��
ECHO.OFF
goto magisk

:rootedboot1
CLS
ECHO ***************************************************************************************
ECHO *                                                                                     *
ECHO *                              ����ˢ��ulm11gRootedboot,���Ժ�...                             *
ECHO *                                                                                     *
ECHO ***************************************************************************************
ECHO.

ECHO.����ˢ��ulm11gRootedboot...
ECHO.Running
fastboot flash boot_a rootedboot.img
fastboot flash boot_b rootedboot.img
set /p=�ȴ�����ϵͳ�󣬰������������һ��
ECHO.OFF
goto magisk1

:magisk 
CLS
ECHO
ECHO ***************************************************************************************
ECHO *                                                                                     
ECHO *              ����ж�ؾɰ汾magiskmanager����װ7.3.3�汾magisk manager           
ECHO *              ��װ�ɹ�������ʾ
ECHO *              Sucess
ECHO *              Sucess                                                                  
ECHO ***************************************************************************************
ECHO.

ECHO ***************************************************************************************
ECHO *                 ���ڵ���abl_a�Լ�abl-a��Ŀ¼��
ECHO *                 ��ȷ���뽫��ʾ                                                                    
ECHO *                adb push abl_a/abl-a.bin /sdcard/
ECHO *                ****\abl_a  14.6 MB/s (1048576 bytes in 0.068s)
ECHO *                                                                                                 
ECHO ***************************************************************************************
ECHO.Running
adb devices
adb uninstall com.topjohnwu.magisk
adb install MagiskManager-v7.5.1.apk
adb push abl_a /sdcard/
adb push abl-a.bin /sdcard/
set /p=�������������һ��
ECHO.OFF
goto adbshell

:magisk1
CLS
ECHO
ECHO ***************************************************************************************
ECHO *                                                                                     
ECHO *              ����ж�ؾɰ汾magiskmanager����װ7.3.3�汾magisk manager           
ECHO *              ��װ�ɹ�������ʾ
ECHO *              Sucess
ECHO *              Sucess                                                                  
ECHO ***************************************************************************************
ECHO.
ECHO.Running
adb devices
adb uninstall com.topjohnwu.magisk
adb install MagiskManager-v7.5.1.apk
set /p=����������������˵�
ECHO.OFF
goto STARTS

:adbshell
CLS
ECHO
ECHO ***************************************************************************************
ECHO * 
ECHO *                          1.��MagiskManager                                                       
ECHO *                          2.�ȴ���Ȩadb shellȨ��
ECHO *                          3.���û�е�����ʾ�����ֶ�����su�������Ͻǳ����û�
ECHO *                          4.��Ȩadb shell�ĳ����û�Ȩ��
ECHO *                          5.��ȷ������Ȩadb shell ���ٽ�����һ��             
ECHO *                          6.��Ȩ��ɺ���Թر�ҳ������������  
ECHO *                          7.����exitֱ��������һ��                                                 
ECHO ***************************************************************************************
ECHO.
ECHO.Running
adb shell " su -c "
set /p=�������������һ��
ECHO.OFF
goto abl

:abl
CLS
ECHO
ECHO ***************************************************************************************
ECHO *
ECHO *                     �����滻ϵͳ��abl_a....
ECHO *          
ECHO *        
ECHO *             �滻�ɹ���-����exitֱ��������һ��
ECHO ***************************************************************************************
ECHO.

ECHO ***************************************************************************************
ECHO *                          ��ȷ�滻����ʾ
ECHO *      adb shell " su -c 'dd if=/sdcard/abl_a of=/dev/block/bootdevice/by-name/abl_a '"
ECHO *      2048+0 records in
ECHO *      2048+0 records out
ECHO *      1048576 bytes transferred in 0.094 secs (11155063 bytes/sec)
ECHO *                                                                                                
ECHO ***************************************************************************************
ECHO.Running
adb shell " su -c 'dd if=/sdcard/abl_a of=/dev/block/bootdevice/by-name/abl_a'"
exit
ECHO.
set /p=�������������һ��
ECHO.OFF
goto oem

:abl-b
CLS
ECHO
ECHO ***************************************************************************************
ECHO *
ECHO *                     �����滻ϵͳ��abl_a
ECHO * 
ECHO * 
ECHO ***************************************************************************************
ECHO.

ECHO ***************************************************************************************
ECHO *                          ��ȷ�滻����ʾ
ECHO *      adb shell " su -c 'dd if=/dev/block/bootdevice/by-name/abl_b of=/dev/block/bootdevice/by-name/abl_a'"
ECHO *      2048+0 records in
ECHO *      2048+0 records out
ECHO *      1048576 bytes transferred in 0.094 secs (11155063 bytes/sec)
ECHO *                                                                                                
ECHO ***************************************************************************************
ECHO.Running
adb shell " su -c 'dd if=/dev/block/bootdevice/by-name/abl_b of=/dev/block/bootdevice/by-name/abl_a'"
exit
ECHO.
set /p=�������������һ��
ECHO.OFF
goto STARTS

:oem
CLS
ECHO
ECHO ***************************************************************************************
ECHO *                       ����������fastboot......
ECHO *                       
ECHO *
ECHO ***************************************************************************************
ECHO.
ECHO.Running
adb reboot bootloader
set /p=����fastboot��,�������������һ��

ECHO ***************************************************************************************
ECHO *                   ���ڽ���BL��.......
ECHO *                   ��ȷ��������ʾ
ECHO *                   fastboot oem unlock
ECHO *                  (bootloader) Erasing userdata and cache
ECHO *                  OKAY [  4.073s]
ECHO *                   Finished. Total time: 4.075s
ECHO ***************************************************************************************
ECHO.Running
fastboot devices
fastboot oem unlock
ECHO.
set /p=�������������һ��
ECHO.Running
fastboot flash boot_a rootedboot.img
fastboot flash boot_b rootedboot.img
fastboot flash frp frp.frp
fastboot flash abl_a abl-a.bin
fastboot reboot
CLS
ECHO ***************************************************************************************
ECHO *                             ��ע������ʱ�Ƿ��л�ɫ��̾��
ECHO *
ECHO ***************************************************************************************
set /p=�������������һ��
ECHO.OFF
goto END

:END
CLS
ECHO ***************************************************************************************
ECHO *
ECHO *                    ���һ��˳��
ECHO *                   ��ô���Ѿ��⿪��bl��
ECHO *                   
ECHO ***************************************************************************************
ECHO.Running
adb devices
adb uninstall com.topjohnwu.magisk
adb install MagiskManager-v7.5.1.apk
set /p=�������������һ��
ECHO.OFF
goto SECEDE
