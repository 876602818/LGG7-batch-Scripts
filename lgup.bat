@echo off
SET RUNPATH=%~dp0

echo ��鰲װ��ַ�С���
if exist "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe" (echo �ɹ�) else (
echo ����δ��⵽LGUP��
echo ���鰲װ��ַ�Ƿ���ڻ��ֶ����ơ�
goto :end)

echo ��鱸��LGUP�Ƿ�����С���
if exist "%RUNPATH%\R\LGUP.exe" (
echo ���� ��������
goto star ) 
echo ������
goto backuping

:backuping
echo LG UP.exe������
copy "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe"  "%RUNPATH%\R\LGUP.exe"
if not errorlevel 1 goto star
cls
echo.
echo ����:lG UP.exe���Ʋ��ɹ�
echo ���Թ��������иýű���������Ʋ��ɹ����ֶ����ơ�
goto :end

:backup
echo dll ������
copy "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\LGUP_Common.dll" "%RUNPATH%\R\LGUP_Common.dll" 
goto star

:star
cls 
echo LG G7 ThinQ �����п��Ⱥר��
echo.
echo     LG UP�޸��� (G7)
echo     ================
echo     -  ˢ���з���  -
echo     -  ˢ�������  -
echo     ================
echo     -1.������ģʽ  -
echo      - -��ˢѡ��-  -
echo     ----------------
echo     - 2. ��ͨģʽ  -
echo     -  -ԭζLGUP-  -
echo     ----------------
echo     -  3.�ָ�ģʽ  -
echo     - �ָ�LGUP���� -
echo     ----------------
echo     -  4.һ����dll -
echo     - �����ø��ư� -
echo     ================ 
echo.
echo ��ѡһ���ɣ�С�ϵܡ�
set /p command=^(1-4^) %=%
if "%command%"=="1" goto developer
if "%command%"=="2" goto usermode
if "%command%"=="3" goto recover
if "%command%"=="4" goto justdll

:developer
cls
mkdir "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common"
echo.
echo ����common�ļ��гɹ�
echo.
copy "%RUNPATH%\D\LGUP_CommonD.dll" "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\LGUP_Common.dll"
if not errorlevel 1 ( 
echo.
echo dll���Ƴɹ�
echo.
goto developers
)
echo ����dll���ɹ�
echo ���Թ��������иýű���������Ʋ��ɹ����ֶ����ơ�
goto developers

:developers
copy "%RUNPATH%\D\LGUPD.exe" "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe"
if not errorlevel 1 ( 
echo.
echo LGUP.exe���Ƴɹ�
echo.
goto done
)
cls
echo.
echo ����:lG UP.exe���Ʋ��ɹ�
echo ���Թ��������иýű���������Ʋ��ɹ����ֶ����ơ�
goto :end



:usermode
cls
mkdir "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common"
echo.
echo ����common�ļ��гɹ�
echo.
copy "%RUNPATH%\U\LGUP_CommonU.dll" "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\LGUP_Common.dll"
if not errorlevel 1 ( 
echo.
echo dll���Ƴɹ�
echo.
goto developers
)
echo ����dll���ɹ�
echo ���Թ��������иýű���������Ʋ��ɹ����ֶ����ơ�
goto usersmode

:usersmode
copy "%RUNPATH%\U\LGUPU.exe" "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe"
if not errorlevel 1 ( 
echo.
echo LGUP.exe���Ƴɹ�
echo.
goto done
)
cls
echo.
echo ����:lG UP.exe���Ʋ��ɹ�
echo ���Թ��������иýű���������Ʋ��ɹ����ֶ����ơ�
goto :end


:recover
cls
echo.
echo ��һ�δ򿪱��ű�ʱ�ű��ᱸ��һ��LGUP.exe
echo �������ڻ�ԭ��
goto recovery

:recovery
copy "%RUNPATH%\R\LGUPR.exe" "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe"
if not errorlevel 1 ( 
echo.
echo LGUP.exe���Ƴɹ�
echo.
echo ��������/��ʼ�˵�/�����ط��Ŀ�ݷ�ʽ���ɣ���Ȼ��Ҳ����ȥ��װĿ¼���ң�
)
cls
echo.
echo ����:lG UP.exe���Ʋ��ɹ�
echo ���Թ��������иýű���������Ʋ��ɹ����ֶ����ơ�
goto :end


:justdll


SET RUNPATH=%~dp0
mkdir "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common"
copy "%RUNPATH%LGUP_CommonU.dll" "%ProgramFiles(x86)%\LG Electronics\LGUP\model\common\LGUP_Common.dll"
if not errorlevel 1 goto CPYEXE
echo �ļ����Ʋ��ɹ������Թ��������иýű���������Ʋ��ɹ����ֶ����ơ�
choice /T 1 /C ync /CS /D y /n
cls
goto :end

:CPYEXE
copy "%RUNPATH%LGUPU.exe" "%ProgramFiles(x86)%\LG Electronics\LGUP\LGUP.exe"
if not errorlevel 1 goto :end
echo �ļ����Ʋ��ɹ������Թ��������иýű���������Ʋ��ɹ����ֶ����ơ�
pause

:endd
echo ����:δ���ҵ�LG UP�����鰲װ��ַ���ֶ����ơ�
echo 

:done
cls
echo ���Ƴɹ�
echo ��������/��ʼ�˵�/�����ط��Ŀ�ݷ�ʽ���ɣ���Ȼ��Ҳ����ȥ��װĿ¼���ң�

:end
echo.
echo �����ϵܣ���ɶ�أ�
pause
echo �����ű��޸���https://forum.xda-developers.com/android/general/tecknights-aristo-2-tutorials-t3805141/page3�� 
echo ���ߣ����֣���Ⱥ���ҳ������£�
pause