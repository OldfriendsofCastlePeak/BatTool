echo off
rem All right reserved, Qing Shan Gu Ren

rem 开始延迟变量
setlocal EnableDelayedExpansion

rem 设置活动代码页，936代表显示中文
chcp 936


rem ################################设置窗口样式Start################################
rem 设置脚本名称
set ManagerName=UE独立程序工具脚本%date:~0,10%
set TitleName=%ManagerName%

rem 设置窗口大小
Mode con cols=80 lines=47

rem 设置窗口样式、名字
color 0A
title %TitleName%
rem ################################设置窗口样式End##################################

rem ################################需要用户提前定义的配置Start#######################
rem 引擎源代码路径,包含UE5.sln文件的路径,例如:"xxxxx\UnrealEngine-5.1"
rem 独立程序存储在:xxxxx\UE_5.1_SourceCode\UnrealEngine-5.1\Engine\Source\Programs\Custom_Programs
set EngineSourceBasePath=D:\TemEngineInstall\UE_5.1_SourceCode\UnrealEngine-5.1

rem 在创建独立程序模版之后是否立即执行UBT,向解决方案里添加项目
set AutoRunUBT=1

rem TipName:在脚本菜单的提示名
rem StartKey:启动可执行程序需要的关键字
set MainMenuItem[1].TipName= 创建独立程序模版
set MainMenuItem[1].Key=1
set MainMenuItem[1].Tag=Create_TemplateFile


set MainMenuItem[2].TipName= 生成解决方案
set MainMenuItem[2].Key=2
set MainMenuItem[2].Tag=General_Sln
rem ################################需要用户提前定义的配置End#########################



rem ################################定义功能使用的变量Start###########################
rem BlankKey为5个空格,用以调整提示文本样式 
set BlankKey=   

rem 模版所需的ico文件,用于复制操作
set TemplateIcoImagePath=%~dp0Template.ico

rem 生成解决方案的所需的UBT.exe的执行路径
set UnrealBuildToolPath=%EngineSourceBasePath%\Engine\Binaries\DotNET\UnrealBuildTool\UnrealBuildTool.exe

rem ################################定义功能使用的变量End#################################



rem ################################主菜单流程Start################################
rem 进入主菜单选择
:Mian_Menu

cls

rem 开始输出图像注释内容
call :Function_CreateImageTip
rem 结束输出图像注释内容

rem 开始生成主菜单提示文本内容
call :Function_CreateMainMenuTipMessage MainMenuItem
rem 结束生成主菜单提示文本内容

rem 开始进行输入操作,首先置空,传入变量名,当该方法执行完毕之后,就确定了执行的数组
set Global_ArrayName=MainMenuItem
set Global_TagName=
call :Function_MainMenuInput Global_ArrayName Global_TagName

rem echo Global_TagName为:%Global_TagName%
call :%Global_TagName%

rem 重新进入下一次处理
goto :Mian_Menu
rem ################################主菜单流程End################################







rem ################################总:创建模版 Start################################
rem 使用方法:   call :Create_TemplateFile
:Create_TemplateFile

rem 输入名称
echo 请输入英文名称:
:ReInput_StandaloneApplicationName
set /p StandaloneApplicationName=
rem set StandaloneApplicationName=T1

if "%StandaloneApplicationName%"=="" (
    echo 输入不能为空,请重新输入
    goto :ReInput_StandaloneApplicationName
)

cd /d %EngineSourceBasePath%
set ProgramsPath=%cd%\Engine\Source\Programs\Custom_Programs\%StandaloneApplicationName%

rem 首先判断文件夹是否存在
if exist %ProgramsPath% (
    echo %ProgramsPath%文件夹存在,不创建文件夹,为避免冲突,请重新输入模块名
    goto :ReInput_StandaloneApplicationName
) else (
    echo %ProgramsPath%文件夹不存在,创建文件夹
    mkdir %ProgramsPath%
)

rem 创建Build.cs文件
    set Local_BuildcsPath=%ProgramsPath%\%StandaloneApplicationName%.Build.cs
    call :Create_BuildCSFileTemplate %StandaloneApplicationName% %Local_BuildcsPath%

rem 创建Target.cs文件
    set Local_TargetcsPath=%ProgramsPath%\%StandaloneApplicationName%.Target.cs
    call :Create_TargetCSFileTemplate %StandaloneApplicationName% %Local_TargetcsPath%

rem 创建Ico文件
    set Local_IcoDirectoryPath=%ProgramsPath%\Resources\Windows
    set Local_IcoPath=%ProgramsPath%\Resources\Windows\%StandaloneApplicationName%.ico

    rem 首先判断文件夹是否存在
    if exist %Local_IcoDirectoryPath% (
        echo %Local_IcoDirectoryPath%文件夹存在,不创建文件夹
    ) else (
        echo %Local_IcoDirectoryPath%文件夹不存在,创建文件夹
        mkdir %Local_IcoDirectoryPath%
    )

    call :Copy_IcoFile %TemplateIcoImagePath% %Local_IcoPath%

rem 创建Rivate文件夹的内容
    set Local_PrivateDirectoryPath=%ProgramsPath%\Private

    if exist %Local_PrivateDirectoryPath% (
        echo 文件夹存在,不创建文件夹
    ) else (
        echo 文件夹不存在,创建文件夹
        mkdir %Local_PrivateDirectoryPath%
    )

    rem 创建独立程序名.h文件
    set Local_PrivateHFilePath=%ProgramsPath%\Private\%StandaloneApplicationName%.h
    call :Create_hFileTemplate %StandaloneApplicationName% %Local_PrivatehFilePath%

    rem 创建独立程序名.cpp文件
    set Local_PrivateCppFilePath=%ProgramsPath%\Private\%StandaloneApplicationName%.cpp
    call :Create_cppileTemplate %StandaloneApplicationName% %Local_PrivateCppFilePath%

    rem 创建PlatformWorkarounds.cpp文件
    set Local_PrivatePlatformWorkaroundscppFilePath=%ProgramsPath%\Private\PlatformWorkarounds.cpp
    call :Create_PlatformWorkaroundscppFile %Local_PrivatePlatformWorkaroundscppFilePath%

rem

echo 总体生成完成

if "%AutoRunUBT%"=="1" (
    echo 生成独立程序的解决方案
    call :Run_UBT %ProgramsPath%
)

goto :eof
rem ################################总:创建模版 End################################







rem ################################生成解决方案 Start################################
rem 使用方法:   call :General_Sln
:General_Sln

rem 输入名称
echo 请输入路径名称:
:ReInput_StandaloneApplicationPath
set /p StandaloneApplicationPath=

if "%StandaloneApplicationPath%"=="" (
    echo 输入不能为空,请重新输入
    goto :ReInput_StandaloneApplicationPath
)

rem 首先判断文件夹是否存在
if not exist %StandaloneApplicationPath% (
    echo %StandaloneApplicationPath%文件夹存在,请重新输入路径
    goto :ReInput_StandaloneApplicationPath
)

call :Run_UBT %StandaloneApplicationPath%
goto:eof
rem ################################生成解决方案 End################################











rem ################################创建Build.cs文件模版 Start################################
rem 使用方法:   call :Create_BuildCSFileTemplate 参数1 参数2
rem 参数1:      模版的名称
rem 参数2:      完整的Build.CS的文件路径
:Create_BuildCSFileTemplate

rem 获取参数
set Local_TemplateName=%1
set Local_TemplateFilePath=%2

echo %Local_TemplateFilePath%模版开始生成

rem 第1行
echo // Copyright Epic Games, Inc. All Rights Reserved.>%Local_TemplateFilePath%
rem 第2行
echo.>>%Local_TemplateFilePath%
rem 第3行
echo using UnrealBuildTool;>>%Local_TemplateFilePath%
rem 第4行
echo.>>%Local_TemplateFilePath%
rem 第5行
echo public class %Local_TemplateName% : ModuleRules>>%Local_TemplateFilePath%
rem 第6行
echo {>>%Local_TemplateFilePath%
rem 第7行
echo 	public %Local_TemplateName%(ReadOnlyTargetRules Target) : base(Target)>>%Local_TemplateFilePath%
rem 第8行
echo 	{>>%Local_TemplateFilePath%
rem 第9行
echo 		PublicIncludePaths.Add("Runtime/Launch/Public");>>%Local_TemplateFilePath%
rem 第10行
echo.>>%Local_TemplateFilePath%
rem 第11行
echo 		PrivateIncludePaths.Add("Runtime/Launch/Private");		// For LaunchEngineLoop.cpp include>>%Local_TemplateFilePath%
rem 第12行
echo.>>%Local_TemplateFilePath%
rem 第13行
echo 		PrivateDependencyModuleNames.Add("Core");>>%Local_TemplateFilePath%
rem 第14行
echo 		PrivateDependencyModuleNames.Add("Projects");>>%Local_TemplateFilePath%
rem 第15行
echo 	}>>%Local_TemplateFilePath%
rem 第16行
echo }>>%Local_TemplateFilePath%

echo %Local_TemplateFilePath%模版结束生成
goto:eof
rem ################################创建Build.cs文件模版 End################################




rem ################################创建Target.cs文件模版 Start#############################
rem 使用方法:   call :Create_TargetCSFileTemplate 参数1 参数2
rem 参数1:      模版的名称
rem 参数2:      完整的Build.CS的文件路径
:Create_TargetCSFileTemplate

rem 获取参数
set Local_TemplateName=%1
set Local_TemplateFilePath=%2

echo %Local_TemplateFilePath%模版开始生成

rem 第1行
echo // Copyright Epic Games, Inc. All Rights Reserved.>%Local_TemplateFilePath%
rem 第2行
echo.>>%Local_TemplateFilePath%
rem 第3行
echo using UnrealBuildTool;>>%Local_TemplateFilePath%
rem 第4行
echo using System.Collections.Generic;>>%Local_TemplateFilePath%
rem 第5行
echo.>>%Local_TemplateFilePath%
rem 第6行
echo [SupportedPlatforms(UnrealPlatformClass.All)]>>%Local_TemplateFilePath%
rem 第7行
echo public class %Local_TemplateName%Target : TargetRules>>%Local_TemplateFilePath%
rem 第8行
echo {>>%Local_TemplateFilePath%
rem 第9行
echo 	public %Local_TemplateName%Target(TargetInfo Target) : base(Target)>>%Local_TemplateFilePath%
rem 第10行
echo 	{>>%Local_TemplateFilePath%
rem 第11行
echo 		Type = TargetType.Program;>>%Local_TemplateFilePath%
rem 第12行
echo 		IncludeOrderVersion = EngineIncludeOrderVersion.Latest;>>%Local_TemplateFilePath%
rem 第13行
echo 		LinkType = TargetLinkType.Monolithic;>>%Local_TemplateFilePath%
rem 第14行
echo 		LaunchModuleName = "%Local_TemplateName%";>>%Local_TemplateFilePath%
rem 第15行
echo.>>%Local_TemplateFilePath%
rem 第16行
echo 		// Lean and mean>>%Local_TemplateFilePath%
rem 第17行
echo 		bBuildDeveloperTools = false;>>%Local_TemplateFilePath%
rem 第18行
echo.>>%Local_TemplateFilePath%
rem 第19行
echo 		// Never use malloc profiling in Unreal Header Tool.  We set this because often UHT is compiled right before the engine>>%Local_TemplateFilePath%
rem 第20行
echo 		// automatically by Unreal Build Tool, but if bUseMallocProfiler is defined, UHT can operate incorrectly.>>%Local_TemplateFilePath%
rem 第21行
echo 		bUseMallocProfiler = false;>>%Local_TemplateFilePath%
rem 第22行
echo.>>%Local_TemplateFilePath%
rem 第23行
echo 		// Editor-only is enabled for desktop platforms to run unit tests that depend on editor-only data>>%Local_TemplateFilePath%
rem 第24行
echo 		// It's disabled in test and shipping configs to make profiling similar to the game>>%Local_TemplateFilePath%
rem 第25行
echo 		bool bDebugOrDevelopment = Target.Configuration == UnrealTargetConfiguration.Debug ^|^| Target.Configuration == UnrealTargetConfiguration.Development;>>%Local_TemplateFilePath%
rem 第26行
echo 		bBuildWithEditorOnlyData = Target.Platform.IsInGroup(UnrealPlatformGroup.Desktop) ^&^& bDebugOrDevelopment; >>%Local_TemplateFilePath%
rem 第27行
echo.>>%Local_TemplateFilePath%
rem 第28行
echo 		// Currently this app is not linking against the engine, so we'll compile out references from Core to the rest of the engine>>%Local_TemplateFilePath%
rem 第29行
echo 		bCompileAgainstEngine = false;>>%Local_TemplateFilePath%
rem 第30行
echo 		bCompileAgainstCoreUObject = false;>>%Local_TemplateFilePath%
rem 第31行
echo 		bCompileAgainstApplicationCore = false;>>%Local_TemplateFilePath%
rem 第32行
echo 		bCompileICU = false;>>%Local_TemplateFilePath%
rem 第33行
echo.>>%Local_TemplateFilePath%
rem 第34行
echo 		// UnrealHeaderTool is a console application, not a Windows app (sets entry point to main(), instead of WinMain())>>%Local_TemplateFilePath%
rem 第35行
echo 		bIsBuildingConsoleApplication = true;>>%Local_TemplateFilePath%
rem 第36行
echo 	}>>%Local_TemplateFilePath%
rem 第37行
echo }>>%Local_TemplateFilePath%

echo %Local_TemplateFilePath%模版结束生成
goto:eof
rem ################################创建Target.cs文件模版 End################################





rem ################################复制ico文件 Start################################
rem 使用方法:   call :Copy_IcoFile 参数1 参数2
rem 参数1:      源文件所在地
rem 参数2:      要复制到的地方
:Copy_IcoFile
echo %1
echo %2
copy %1 %2
goto :eof
rem ################################复制ico文件 End##################################


rem ################################复制PlatformWorkarounds.cpp文件 Start################################
rem 使用方法:   call :Create_PlatformWorkaroundscppFile 参数1
rem 参数1:      完整的PlatformWorkarounds.cpp文件的文件路径
:Create_PlatformWorkaroundscppFile
set Local_TemplateFilePath=%1

echo %Local_TemplateFilePath%模版开始生成

rem 第1行
echo // Copyright Epic Games, Inc. All Rights Reserved.>%Local_TemplateFilePath%
rem 第2行
echo.>>%Local_TemplateFilePath%
rem 第3行
echo #include "CoreMinimal.h">>%Local_TemplateFilePath%
rem 第4行
echo.>>%Local_TemplateFilePath%
rem 第5行
echo // Hack for missing Launch module dependency that causes link error on a certain platform>>%Local_TemplateFilePath%
rem 第6行
echo FString GFileRootDirectory;>>%Local_TemplateFilePath%
rem 第7行
echo FString GSandboxName;>>%Local_TemplateFilePath%

echo %Local_TemplateFilePath%模版结束生成
goto:eof

rem ################################复制PlatformWorkarounds.cpp文件 End################################





rem ################################复制独立程序名.h文件 Start################################
rem 使用方法:   call :Create_hFileTemplate 参数1 参数2
rem 参数1:      模版的名称
rem 参数2:      完整的.h的文件路径
:Create_hFileTemplate

rem 获取参数
set Local_TemplateName=%1
set Local_TemplateFilePath=%2

echo %Local_TemplateFilePath%模版开始生成

rem 第1行
echo // Copyright Epic Games, Inc. All Rights Reserved.>%Local_TemplateFilePath%
rem 第2行
echo.>>%Local_TemplateFilePath%
rem 第3行
echo #pragma once>>%Local_TemplateFilePath%
rem 第4行
echo.>>%Local_TemplateFilePath%
rem 第5行
echo #include "CoreMinimal.h">>%Local_TemplateFilePath%

echo %Local_TemplateFilePath%模版结束生成
goto:eof

rem ################################复制独立程序名.h文件 End################################





rem ################################复制独立程序名.cpp文件 Start################################
rem 使用方法:   call :Create_cppileTemplate 参数1 参数2
rem 参数1:      模版的名称
rem 参数2:      完整的.cpp的文件路径
:Create_cppileTemplate

rem 获取参数
set Local_TemplateName=%1
set Local_TemplateFilePath=%2

echo %Local_TemplateFilePath%模版开始生成

rem 第1行
echo // Copyright Epic Games, Inc. All Rights Reserved.>%Local_TemplateFilePath%
rem 第2行
echo.>>%Local_TemplateFilePath%
rem 第3行
echo.>>%Local_TemplateFilePath%
rem 第4行
echo #include "%Local_TemplateName%.h">>%Local_TemplateFilePath%
rem 第5行
echo.>>%Local_TemplateFilePath%
rem 第6行
echo #include "RequiredProgramMainCPPInclude.h">>%Local_TemplateFilePath%
rem 第7行
echo.>>%Local_TemplateFilePath%
rem 第8行
echo DEFINE_LOG_CATEGORY_STATIC(Log%Local_TemplateName%, Log, All);>>%Local_TemplateFilePath%
rem 第9行
echo.>>%Local_TemplateFilePath%
rem 第10行
echo IMPLEMENT_APPLICATION(%Local_TemplateName%, "%Local_TemplateName%");>>%Local_TemplateFilePath%
rem 第11行
echo.>>%Local_TemplateFilePath%
rem 第12行
echo INT32_MAIN_INT32_ARGC_TCHAR_ARGV()>>%Local_TemplateFilePath%
rem 第13行
echo {>>%Local_TemplateFilePath%
rem 第14行
echo 	GEngineLoop.PreInit(ArgC, ArgV);>>%Local_TemplateFilePath%
rem 第15行
echo 	UE_LOG(Log%Local_TemplateName%, Display, TEXT("Hello World"));>>%Local_TemplateFilePath%
rem 第16行
echo 	FEngineLoop::AppExit();>>%Local_TemplateFilePath%
rem 第17行
echo 	return 0;>>%Local_TemplateFilePath%
rem 第18行
echo }>>%Local_TemplateFilePath%

echo %Local_TemplateFilePath%模版结束生成
goto:eof
rem ################################复制独立程序名.cpp文件 End################################






rem ##############################图像注释Start#################################
rem 使用方法:   call :Function_CreateImageTip
:Function_CreateImageTip

rem 存入一周中的日期,例如周一、周二...周日
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
rem ###################################图像注释End#################################################




rem ################################主菜单提示内容################################
rem 生成提示文本菜单内容
rem 使用方法:   call::Function_CreateMainMenuTipMessage 参数1
rem 参数1:      提供的数组
:Function_CreateMainMenuTipMessage

rem 获取数组名称
call, set Local_Array=%%1%

rem 设置起始索引为0
set Local_ArrayIndex=1

echo Tip:

rem 检查是否有定义
:Function_CreateMainMenuTipMessage0
if defined %Local_Array%[%Local_ArrayIndex%].TipName (
    goto :Function_CreateMainMenuTipMessage1
) else (
    goto :Function_CreateMainMenuTipMessage2
)


rem 有定义
:Function_CreateMainMenuTipMessage1
call, echo %BlankKey%按%%%Local_Array%[%Local_ArrayIndex%].Key%%键 %%%Local_Array%[%Local_ArrayIndex%].TipName%%

rem 索引加1
set /a Local_ArrayIndex+=1

rem 返回继续去判断
goto :Function_CreateMainMenuTipMessage0

rem 无定义
:Function_CreateMainMenuTipMessage2
echo Tip:输入对应指令即可进入对应菜单


if "%bDebug%"=="1" (
    echo 二级菜单提示内容生成完成
    pause
)
goto :eof
rem ################################主菜单生成二级菜单提示内容End################################







rem ##############################主菜单根据输入选择要执行的功能##############################
rem 根据输入选择要执行的功能
rem 使用方法:   call::Function_MainMenuInput 参数1 参数2
rem 参数1:      提供的数组
rem 参数2:      要跳转的标签变量名
:Function_MainMenuInput
call, set Local_Array=%%%1%%
call, set Local_TagName=%2

echo 请输入指令数,按Enter键确认:
goto :MainMenuInput1

rem 输入错误提示
:MainMenuInput2
echo 上一次输入有误,请重新输入指令数,按Enter键确认:

:MainMenuInput1
rem 先清空一下,否则MianMenuInputValue会储存前一次输入内容
set Local_MianMenuInputValue=
set /p Local_MianMenuInputValue=

rem echo 您输入指令数：%Local_MianMenuInputValue%,准备进入对应菜单...

rem 排除空内容输入
if "%Local_MianMenuInputValue%"=="" (
    echo 输入空
    goto :MainMenuInput2
)

rem 设置起始索引为0
set Local_ArrayIndex=1

:Function_MainMenuInput_1

rem 检查对应索引有无定义
if defined %Local_Array%[%Local_ArrayIndex%].TipName (
    goto :Function_MainMenuInput_2
) else (
    goto :Function_MainMenuInput_3
)

rem 有定义,检查输入按键是否相等
:Function_MainMenuInput_2

    rem 获取数组的Key值,用于判断,否则进行下一次循判断
    call, set Local_TemKeyValue=%%%Local_Array%[%Local_ArrayIndex%].Key%%
    call, set %Local_TagName%=%%%Local_Array%[%Local_ArrayIndex%].Tag%%

    if %Local_TemKeyValue%==%Local_MianMenuInputValue% (
        goto :Function_MainMenuInput_4
    ) else (
        goto :Function_MainMenuInput_5
    )

rem 没有定义则返回,重新开始输入
:Function_MainMenuInput_3
goto :MainMenuInput2

rem 输入指令相等,改变传入的实参值
:Function_MainMenuInput_4
goto :eof

rem 不等,索引+1,进行下一次判断,
:Function_MainMenuInput_5
set /a Local_ArrayIndex+=1
goto :Function_MainMenuInput_1
rem #####################################################################################





rem ##############################生成解决方案Start##############################
rem 使用方法:   call::Run_UBT 参数1 参数2
rem 参数1:      要生成的解决方案的独立程序路径,包含build.cs和Target.cs文件的路径
:Run_UBT
%UnrealBuildToolPath% -ProjectFiles %1

goto :eof
rem ##############################生成解决方案End##############################
