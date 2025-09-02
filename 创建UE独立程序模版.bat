echo off
rem All right reserved, Qing Shan Gu Ren

rem ��ʼ�ӳٱ���
setlocal EnableDelayedExpansion

rem ���û����ҳ��936������ʾ����
chcp 936


rem ################################���ô�����ʽStart################################
rem ���ýű�����
set ManagerName=UE�������򹤾߽ű�%date:~0,10%
set TitleName=%ManagerName%

rem ���ô��ڴ�С
Mode con cols=80 lines=47

rem ���ô�����ʽ������
color 0A
title %TitleName%
rem ################################���ô�����ʽEnd##################################

rem ################################��Ҫ�û���ǰ���������Start#######################
rem ����Դ����·��,����UE5.sln�ļ���·��,����:"xxxxx\UnrealEngine-5.1"
rem ��������洢��:xxxxx\UE_5.1_SourceCode\UnrealEngine-5.1\Engine\Source\Programs\Custom_Programs
set EngineSourceBasePath=D:\TemEngineInstall\UE_5.1_SourceCode\UnrealEngine-5.1

rem �ڴ�����������ģ��֮���Ƿ�����ִ��UBT,���������������Ŀ
set AutoRunUBT=1

rem TipName:�ڽű��˵�����ʾ��
rem StartKey:������ִ�г�����Ҫ�Ĺؼ���
set MainMenuItem[1].TipName= ������������ģ��
set MainMenuItem[1].Key=1
set MainMenuItem[1].Tag=Create_TemplateFile


set MainMenuItem[2].TipName= ���ɽ������
set MainMenuItem[2].Key=2
set MainMenuItem[2].Tag=General_Sln
rem ################################��Ҫ�û���ǰ���������End#########################



rem ################################���幦��ʹ�õı���Start###########################
rem BlankKeyΪ5���ո�,���Ե�����ʾ�ı���ʽ 
set BlankKey=   

rem ģ�������ico�ļ�,���ڸ��Ʋ���
set TemplateIcoImagePath=%~dp0Template.ico

rem ���ɽ�������������UBT.exe��ִ��·��
set UnrealBuildToolPath=%EngineSourceBasePath%\Engine\Binaries\DotNET\UnrealBuildTool\UnrealBuildTool.exe

rem ################################���幦��ʹ�õı���End#################################



rem ################################���˵�����Start################################
rem �������˵�ѡ��
:Mian_Menu

cls

rem ��ʼ���ͼ��ע������
call :Function_CreateImageTip
rem �������ͼ��ע������

rem ��ʼ�������˵���ʾ�ı�����
call :Function_CreateMainMenuTipMessage MainMenuItem
rem �����������˵���ʾ�ı�����

rem ��ʼ�����������,�����ÿ�,���������,���÷���ִ�����֮��,��ȷ����ִ�е�����
set Global_ArrayName=MainMenuItem
set Global_TagName=
call :Function_MainMenuInput Global_ArrayName Global_TagName

rem echo Global_TagNameΪ:%Global_TagName%
call :%Global_TagName%

rem ���½�����һ�δ���
goto :Mian_Menu
rem ################################���˵�����End################################







rem ################################��:����ģ�� Start################################
rem ʹ�÷���:   call :Create_TemplateFile
:Create_TemplateFile

rem ��������
echo ������Ӣ������:
:ReInput_StandaloneApplicationName
set /p StandaloneApplicationName=
rem set StandaloneApplicationName=T1

if "%StandaloneApplicationName%"=="" (
    echo ���벻��Ϊ��,����������
    goto :ReInput_StandaloneApplicationName
)

cd /d %EngineSourceBasePath%
set ProgramsPath=%cd%\Engine\Source\Programs\Custom_Programs\%StandaloneApplicationName%

rem �����ж��ļ����Ƿ����
if exist %ProgramsPath% (
    echo %ProgramsPath%�ļ��д���,�������ļ���,Ϊ�����ͻ,����������ģ����
    goto :ReInput_StandaloneApplicationName
) else (
    echo %ProgramsPath%�ļ��в�����,�����ļ���
    mkdir %ProgramsPath%
)

rem ����Build.cs�ļ�
    set Local_BuildcsPath=%ProgramsPath%\%StandaloneApplicationName%.Build.cs
    call :Create_BuildCSFileTemplate %StandaloneApplicationName% %Local_BuildcsPath%

rem ����Target.cs�ļ�
    set Local_TargetcsPath=%ProgramsPath%\%StandaloneApplicationName%.Target.cs
    call :Create_TargetCSFileTemplate %StandaloneApplicationName% %Local_TargetcsPath%

rem ����Ico�ļ�
    set Local_IcoDirectoryPath=%ProgramsPath%\Resources\Windows
    set Local_IcoPath=%ProgramsPath%\Resources\Windows\%StandaloneApplicationName%.ico

    rem �����ж��ļ����Ƿ����
    if exist %Local_IcoDirectoryPath% (
        echo %Local_IcoDirectoryPath%�ļ��д���,�������ļ���
    ) else (
        echo %Local_IcoDirectoryPath%�ļ��в�����,�����ļ���
        mkdir %Local_IcoDirectoryPath%
    )

    call :Copy_IcoFile %TemplateIcoImagePath% %Local_IcoPath%

rem ����Rivate�ļ��е�����
    set Local_PrivateDirectoryPath=%ProgramsPath%\Private

    if exist %Local_PrivateDirectoryPath% (
        echo �ļ��д���,�������ļ���
    ) else (
        echo �ļ��в�����,�����ļ���
        mkdir %Local_PrivateDirectoryPath%
    )

    rem ��������������.h�ļ�
    set Local_PrivateHFilePath=%ProgramsPath%\Private\%StandaloneApplicationName%.h
    call :Create_hFileTemplate %StandaloneApplicationName% %Local_PrivatehFilePath%

    rem ��������������.cpp�ļ�
    set Local_PrivateCppFilePath=%ProgramsPath%\Private\%StandaloneApplicationName%.cpp
    call :Create_cppileTemplate %StandaloneApplicationName% %Local_PrivateCppFilePath%

    rem ����PlatformWorkarounds.cpp�ļ�
    set Local_PrivatePlatformWorkaroundscppFilePath=%ProgramsPath%\Private\PlatformWorkarounds.cpp
    call :Create_PlatformWorkaroundscppFile %Local_PrivatePlatformWorkaroundscppFilePath%

rem

echo �����������

if "%AutoRunUBT%"=="1" (
    echo ���ɶ�������Ľ������
    call :Run_UBT %ProgramsPath%
)

goto :eof
rem ################################��:����ģ�� End################################







rem ################################���ɽ������ Start################################
rem ʹ�÷���:   call :General_Sln
:General_Sln

rem ��������
echo ������·������:
:ReInput_StandaloneApplicationPath
set /p StandaloneApplicationPath=

if "%StandaloneApplicationPath%"=="" (
    echo ���벻��Ϊ��,����������
    goto :ReInput_StandaloneApplicationPath
)

rem �����ж��ļ����Ƿ����
if not exist %StandaloneApplicationPath% (
    echo %StandaloneApplicationPath%�ļ��д���,����������·��
    goto :ReInput_StandaloneApplicationPath
)

call :Run_UBT %StandaloneApplicationPath%
goto:eof
rem ################################���ɽ������ End################################











rem ################################����Build.cs�ļ�ģ�� Start################################
rem ʹ�÷���:   call :Create_BuildCSFileTemplate ����1 ����2
rem ����1:      ģ�������
rem ����2:      ������Build.CS���ļ�·��
:Create_BuildCSFileTemplate

rem ��ȡ����
set Local_TemplateName=%1
set Local_TemplateFilePath=%2

echo %Local_TemplateFilePath%ģ�濪ʼ����

rem ��1��
echo // Copyright Epic Games, Inc. All Rights Reserved.>%Local_TemplateFilePath%
rem ��2��
echo.>>%Local_TemplateFilePath%
rem ��3��
echo using UnrealBuildTool;>>%Local_TemplateFilePath%
rem ��4��
echo.>>%Local_TemplateFilePath%
rem ��5��
echo public class %Local_TemplateName% : ModuleRules>>%Local_TemplateFilePath%
rem ��6��
echo {>>%Local_TemplateFilePath%
rem ��7��
echo 	public %Local_TemplateName%(ReadOnlyTargetRules Target) : base(Target)>>%Local_TemplateFilePath%
rem ��8��
echo 	{>>%Local_TemplateFilePath%
rem ��9��
echo 		PublicIncludePaths.Add("Runtime/Launch/Public");>>%Local_TemplateFilePath%
rem ��10��
echo.>>%Local_TemplateFilePath%
rem ��11��
echo 		PrivateIncludePaths.Add("Runtime/Launch/Private");		// For LaunchEngineLoop.cpp include>>%Local_TemplateFilePath%
rem ��12��
echo.>>%Local_TemplateFilePath%
rem ��13��
echo 		PrivateDependencyModuleNames.Add("Core");>>%Local_TemplateFilePath%
rem ��14��
echo 		PrivateDependencyModuleNames.Add("Projects");>>%Local_TemplateFilePath%
rem ��15��
echo 	}>>%Local_TemplateFilePath%
rem ��16��
echo }>>%Local_TemplateFilePath%

echo %Local_TemplateFilePath%ģ���������
goto:eof
rem ################################����Build.cs�ļ�ģ�� End################################




rem ################################����Target.cs�ļ�ģ�� Start#############################
rem ʹ�÷���:   call :Create_TargetCSFileTemplate ����1 ����2
rem ����1:      ģ�������
rem ����2:      ������Build.CS���ļ�·��
:Create_TargetCSFileTemplate

rem ��ȡ����
set Local_TemplateName=%1
set Local_TemplateFilePath=%2

echo %Local_TemplateFilePath%ģ�濪ʼ����

rem ��1��
echo // Copyright Epic Games, Inc. All Rights Reserved.>%Local_TemplateFilePath%
rem ��2��
echo.>>%Local_TemplateFilePath%
rem ��3��
echo using UnrealBuildTool;>>%Local_TemplateFilePath%
rem ��4��
echo using System.Collections.Generic;>>%Local_TemplateFilePath%
rem ��5��
echo.>>%Local_TemplateFilePath%
rem ��6��
echo [SupportedPlatforms(UnrealPlatformClass.All)]>>%Local_TemplateFilePath%
rem ��7��
echo public class %Local_TemplateName%Target : TargetRules>>%Local_TemplateFilePath%
rem ��8��
echo {>>%Local_TemplateFilePath%
rem ��9��
echo 	public %Local_TemplateName%Target(TargetInfo Target) : base(Target)>>%Local_TemplateFilePath%
rem ��10��
echo 	{>>%Local_TemplateFilePath%
rem ��11��
echo 		Type = TargetType.Program;>>%Local_TemplateFilePath%
rem ��12��
echo 		IncludeOrderVersion = EngineIncludeOrderVersion.Latest;>>%Local_TemplateFilePath%
rem ��13��
echo 		LinkType = TargetLinkType.Monolithic;>>%Local_TemplateFilePath%
rem ��14��
echo 		LaunchModuleName = "%Local_TemplateName%";>>%Local_TemplateFilePath%
rem ��15��
echo.>>%Local_TemplateFilePath%
rem ��16��
echo 		// Lean and mean>>%Local_TemplateFilePath%
rem ��17��
echo 		bBuildDeveloperTools = false;>>%Local_TemplateFilePath%
rem ��18��
echo.>>%Local_TemplateFilePath%
rem ��19��
echo 		// Never use malloc profiling in Unreal Header Tool.  We set this because often UHT is compiled right before the engine>>%Local_TemplateFilePath%
rem ��20��
echo 		// automatically by Unreal Build Tool, but if bUseMallocProfiler is defined, UHT can operate incorrectly.>>%Local_TemplateFilePath%
rem ��21��
echo 		bUseMallocProfiler = false;>>%Local_TemplateFilePath%
rem ��22��
echo.>>%Local_TemplateFilePath%
rem ��23��
echo 		// Editor-only is enabled for desktop platforms to run unit tests that depend on editor-only data>>%Local_TemplateFilePath%
rem ��24��
echo 		// It's disabled in test and shipping configs to make profiling similar to the game>>%Local_TemplateFilePath%
rem ��25��
echo 		bool bDebugOrDevelopment = Target.Configuration == UnrealTargetConfiguration.Debug ^|^| Target.Configuration == UnrealTargetConfiguration.Development;>>%Local_TemplateFilePath%
rem ��26��
echo 		bBuildWithEditorOnlyData = Target.Platform.IsInGroup(UnrealPlatformGroup.Desktop) ^&^& bDebugOrDevelopment; >>%Local_TemplateFilePath%
rem ��27��
echo.>>%Local_TemplateFilePath%
rem ��28��
echo 		// Currently this app is not linking against the engine, so we'll compile out references from Core to the rest of the engine>>%Local_TemplateFilePath%
rem ��29��
echo 		bCompileAgainstEngine = false;>>%Local_TemplateFilePath%
rem ��30��
echo 		bCompileAgainstCoreUObject = false;>>%Local_TemplateFilePath%
rem ��31��
echo 		bCompileAgainstApplicationCore = false;>>%Local_TemplateFilePath%
rem ��32��
echo 		bCompileICU = false;>>%Local_TemplateFilePath%
rem ��33��
echo.>>%Local_TemplateFilePath%
rem ��34��
echo 		// UnrealHeaderTool is a console application, not a Windows app (sets entry point to main(), instead of WinMain())>>%Local_TemplateFilePath%
rem ��35��
echo 		bIsBuildingConsoleApplication = true;>>%Local_TemplateFilePath%
rem ��36��
echo 	}>>%Local_TemplateFilePath%
rem ��37��
echo }>>%Local_TemplateFilePath%

echo %Local_TemplateFilePath%ģ���������
goto:eof
rem ################################����Target.cs�ļ�ģ�� End################################





rem ################################����ico�ļ� Start################################
rem ʹ�÷���:   call :Copy_IcoFile ����1 ����2
rem ����1:      Դ�ļ����ڵ�
rem ����2:      Ҫ���Ƶ��ĵط�
:Copy_IcoFile
echo %1
echo %2
copy %1 %2
goto :eof
rem ################################����ico�ļ� End##################################


rem ################################����PlatformWorkarounds.cpp�ļ� Start################################
rem ʹ�÷���:   call :Create_PlatformWorkaroundscppFile ����1
rem ����1:      ������PlatformWorkarounds.cpp�ļ����ļ�·��
:Create_PlatformWorkaroundscppFile
set Local_TemplateFilePath=%1

echo %Local_TemplateFilePath%ģ�濪ʼ����

rem ��1��
echo // Copyright Epic Games, Inc. All Rights Reserved.>%Local_TemplateFilePath%
rem ��2��
echo.>>%Local_TemplateFilePath%
rem ��3��
echo #include "CoreMinimal.h">>%Local_TemplateFilePath%
rem ��4��
echo.>>%Local_TemplateFilePath%
rem ��5��
echo // Hack for missing Launch module dependency that causes link error on a certain platform>>%Local_TemplateFilePath%
rem ��6��
echo FString GFileRootDirectory;>>%Local_TemplateFilePath%
rem ��7��
echo FString GSandboxName;>>%Local_TemplateFilePath%

echo %Local_TemplateFilePath%ģ���������
goto:eof

rem ################################����PlatformWorkarounds.cpp�ļ� End################################





rem ################################���ƶ���������.h�ļ� Start################################
rem ʹ�÷���:   call :Create_hFileTemplate ����1 ����2
rem ����1:      ģ�������
rem ����2:      ������.h���ļ�·��
:Create_hFileTemplate

rem ��ȡ����
set Local_TemplateName=%1
set Local_TemplateFilePath=%2

echo %Local_TemplateFilePath%ģ�濪ʼ����

rem ��1��
echo // Copyright Epic Games, Inc. All Rights Reserved.>%Local_TemplateFilePath%
rem ��2��
echo.>>%Local_TemplateFilePath%
rem ��3��
echo #pragma once>>%Local_TemplateFilePath%
rem ��4��
echo.>>%Local_TemplateFilePath%
rem ��5��
echo #include "CoreMinimal.h">>%Local_TemplateFilePath%

echo %Local_TemplateFilePath%ģ���������
goto:eof

rem ################################���ƶ���������.h�ļ� End################################





rem ################################���ƶ���������.cpp�ļ� Start################################
rem ʹ�÷���:   call :Create_cppileTemplate ����1 ����2
rem ����1:      ģ�������
rem ����2:      ������.cpp���ļ�·��
:Create_cppileTemplate

rem ��ȡ����
set Local_TemplateName=%1
set Local_TemplateFilePath=%2

echo %Local_TemplateFilePath%ģ�濪ʼ����

rem ��1��
echo // Copyright Epic Games, Inc. All Rights Reserved.>%Local_TemplateFilePath%
rem ��2��
echo.>>%Local_TemplateFilePath%
rem ��3��
echo.>>%Local_TemplateFilePath%
rem ��4��
echo #include "%Local_TemplateName%.h">>%Local_TemplateFilePath%
rem ��5��
echo.>>%Local_TemplateFilePath%
rem ��6��
echo #include "RequiredProgramMainCPPInclude.h">>%Local_TemplateFilePath%
rem ��7��
echo.>>%Local_TemplateFilePath%
rem ��8��
echo DEFINE_LOG_CATEGORY_STATIC(Log%Local_TemplateName%, Log, All);>>%Local_TemplateFilePath%
rem ��9��
echo.>>%Local_TemplateFilePath%
rem ��10��
echo IMPLEMENT_APPLICATION(%Local_TemplateName%, "%Local_TemplateName%");>>%Local_TemplateFilePath%
rem ��11��
echo.>>%Local_TemplateFilePath%
rem ��12��
echo INT32_MAIN_INT32_ARGC_TCHAR_ARGV()>>%Local_TemplateFilePath%
rem ��13��
echo {>>%Local_TemplateFilePath%
rem ��14��
echo 	GEngineLoop.PreInit(ArgC, ArgV);>>%Local_TemplateFilePath%
rem ��15��
echo 	UE_LOG(Log%Local_TemplateName%, Display, TEXT("Hello World"));>>%Local_TemplateFilePath%
rem ��16��
echo 	FEngineLoop::AppExit();>>%Local_TemplateFilePath%
rem ��17��
echo 	return 0;>>%Local_TemplateFilePath%
rem ��18��
echo }>>%Local_TemplateFilePath%

echo %Local_TemplateFilePath%ģ���������
goto:eof
rem ################################���ƶ���������.cpp�ļ� End################################






rem ##############################ͼ��ע��Start#################################
rem ʹ�÷���:   call :Function_CreateImageTip
:Function_CreateImageTip

rem ����һ���е�����,������һ���ܶ�...����
Set Week_Day=%Date:~-2%

echo ############################################################################
echo "              ,----------------,              ,---------,                 "
echo "         ,-----------------------,          ,'        ,'|                 "
echo "       ,'                      ,'|        ,'        ,'  |                 "
echo "      +-----------------------+  |      ,'        ,'    |                 "
echo "      |  .-----------------.  |  |     +---------+      |                 "
echo "      |  |%Week_Day%:            |  |  |     | -==----'|      |                 "
echo "      |  |                 |  |  |     |         |      |                 "
echo "      |  |  I LOVE DOS!     |  |  |     |         |      |                 "
echo "      |  |  Bad command or |  |  |/----|`---=    |      |                 "
echo "      |  |  C:\>_          |  |  |   ,/|==== ooo |      ;                 "
echo "      |  |                 |  |  |  // |(((( [33]|    ,'                  "
echo "      |  `-----------------'  |,' .;'| |((((     |  ,'                    "
echo "      +-----------------------+  ;;  | |         |,'                      "
echo "         /_)______________(_/  //'   | +---------+                        "
echo "    ___________________________/___  `,                                   "
echo "   /  oooooooooooooooo  .o.  oooo /,   \,'-----------                     "
echo "  / ==ooooooooooooooo==.o.  ooo= //   ,`\--{)B     ,'                     "
echo " /_==__==========__==_ooo__ooo=_/'   /___________,'                       "
echo "                                                                          "
echo ############################################################################

goto :eof
rem ###################################ͼ��ע��End#################################################




rem ################################���˵���ʾ����################################
rem ������ʾ�ı��˵�����
rem ʹ�÷���:   call::Function_CreateMainMenuTipMessage ����1
rem ����1:      �ṩ������
:Function_CreateMainMenuTipMessage

rem ��ȡ��������
call, set Local_Array=%%1%

rem ������ʼ����Ϊ0
set Local_ArrayIndex=1

echo Tip:

rem ����Ƿ��ж���
:Function_CreateMainMenuTipMessage0
if defined %Local_Array%[%Local_ArrayIndex%].TipName (
    goto :Function_CreateMainMenuTipMessage1
) else (
    goto :Function_CreateMainMenuTipMessage2
)


rem �ж���
:Function_CreateMainMenuTipMessage1
call, echo %BlankKey%��%%%Local_Array%[%Local_ArrayIndex%].Key%%�� %%%Local_Array%[%Local_ArrayIndex%].TipName%%

rem ������1
set /a Local_ArrayIndex+=1

rem ���ؼ���ȥ�ж�
goto :Function_CreateMainMenuTipMessage0

rem �޶���
:Function_CreateMainMenuTipMessage2
echo Tip:�����Ӧָ��ɽ����Ӧ�˵�


if "%bDebug%"=="1" (
    echo �����˵���ʾ�����������
    pause
)
goto :eof
rem ################################���˵����ɶ����˵���ʾ����End################################







rem ##############################���˵���������ѡ��Ҫִ�еĹ���##############################
rem ��������ѡ��Ҫִ�еĹ���
rem ʹ�÷���:   call::Function_MainMenuInput ����1 ����2
rem ����1:      �ṩ������
rem ����2:      Ҫ��ת�ı�ǩ������
:Function_MainMenuInput
call, set Local_Array=%%%1%%
call, set Local_TagName=%2

echo ������ָ����,��Enter��ȷ��:
goto :MainMenuInput1

rem ���������ʾ
:MainMenuInput2
echo ��һ����������,����������ָ����,��Enter��ȷ��:

:MainMenuInput1
rem �����һ��,����MianMenuInputValue�ᴢ��ǰһ����������
set Local_MianMenuInputValue=
set /p Local_MianMenuInputValue=

rem echo ������ָ������%Local_MianMenuInputValue%,׼�������Ӧ�˵�...

rem �ų�����������
if "%Local_MianMenuInputValue%"=="" (
    echo �����
    goto :MainMenuInput2
)

rem ������ʼ����Ϊ0
set Local_ArrayIndex=1

:Function_MainMenuInput_1

rem ����Ӧ�������޶���
if defined %Local_Array%[%Local_ArrayIndex%].TipName (
    goto :Function_MainMenuInput_2
) else (
    goto :Function_MainMenuInput_3
)

rem �ж���,������밴���Ƿ����
:Function_MainMenuInput_2

    rem ��ȡ�����Keyֵ,�����ж�,���������һ��ѭ�ж�
    call, set Local_TemKeyValue=%%%Local_Array%[%Local_ArrayIndex%].Key%%
    call, set %Local_TagName%=%%%Local_Array%[%Local_ArrayIndex%].Tag%%

    if %Local_TemKeyValue%==%Local_MianMenuInputValue% (
        goto :Function_MainMenuInput_4
    ) else (
        goto :Function_MainMenuInput_5
    )

rem û�ж����򷵻�,���¿�ʼ����
:Function_MainMenuInput_3
goto :MainMenuInput2

rem ����ָ�����,�ı䴫���ʵ��ֵ
:Function_MainMenuInput_4
goto :eof

rem ����,����+1,������һ���ж�,
:Function_MainMenuInput_5
set /a Local_ArrayIndex+=1
goto :Function_MainMenuInput_1
rem #####################################################################################





rem ##############################���ɽ������Start##############################
rem ʹ�÷���:   call::Run_UBT ����1 ����2
rem ����1:      Ҫ���ɵĽ�������Ķ�������·��,����build.cs��Target.cs�ļ���·��
:Run_UBT
%UnrealBuildToolPath% -ProjectFiles %1

goto :eof
rem ##############################���ɽ������End##############################
