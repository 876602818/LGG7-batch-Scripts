@echo off
title="Lafɱ��"
color f0
set rf=%~dp0
:check-exist-adb.exe
echo ���adb.exe�Ƿ�����С���
if not exist "%rf%adb\adb.exe" (
echo.
echo ����:
echo δ�ҵ�adb.exe����������������
goto r-a
) 
echo �ɹ��ҵ�adb.exe
set adb="%rf%adb\adb.exe"
goto home
:r-a
echo �뽫adb.exe���뱾������
set /p adb= 
:home
%adb% kill-server
set number=%random%%random%_%time%
cls
echo PowerBy-HEIZI %number%
echo ע��: ��ȷ������LG�豸��װ��Magisk����USB���Ժ����ӵ��ԡ�
echo.
echo Ŀǰ�Ѿ�ʶ�𵽵��豸��:
%adb% devices
echo ��ѡ��
echo 1.Ĭ��ģʽ^(����^+ɾ��laf_a^)
echo 2.�߼�ģʽ^(������ѡ����A������B^)



:end
set /p powerbyheizi=ִ�����
goto home