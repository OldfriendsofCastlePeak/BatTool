echo off
rem All right reserved, Qing Shan Gu Ren

rem 开始延迟变量
setlocal EnableDelayedExpansion

rem 设置活动代码页，936代表显示中文
chcp 936



rem ################################设置窗口样式Start################################
rem 设置脚本名称
set ManagerName=应用程序管理脚本%date:~0,10%
set TitleName=应用程序管理脚本%date:~0,10%-%time:~0,8%

rem 设置窗口大小
Mode con cols=80 lines=47

rem 设置窗口样式、名字
color 0A
title %TitleName%
rem ################################设置窗口样式End##################################



rem ################################定义功能使用的变量Start################################

rem 设置子菜单返回上一层菜单所用的按键
set Global_ReturnKey=0

rem BlankKey为5个空格,用以调整提示文本样式 
set BlankKey=   



rem 定义全局可执行文件路径
set Globle_ExeFileDirectory=""

rem 定义全局可执行文件名
set Globle_ExeFileName=""

rem 定义全局结束任务名
set Globle_KillTaskName=""

rem 设置是否开启调试,0表示不开启,1表示开启
set bDebug=0

rem 定义全局遍历数组的索引变量
set Global_ArrayIndex=0

rem ################################定义功能使用的变量End#################################



















rem ################################主菜单的子菜单内容Start################################
set Two_Level_Menu_Array[0].TipName=通讯应用管理菜单
set Two_Level_Menu_Array[0].Key=1
set Two_Level_Menu_Array[0].MenuTag=TwoLevel1
set Two_Level_Menu_Array[0].MenuArrayName=TwoLevelMenu1

set Two_Level_Menu_Array[1].TipName=工作应用管理菜单
set Two_Level_Menu_Array[1].Key=2
set Two_Level_Menu_Array[1].MenuTag=TwoLevel2
set Two_Level_Menu_Array[1].MenuArrayName=TwoLevelMenu2

set Two_Level_Menu_Array[2].TipName=娱乐应用管理菜单
set Two_Level_Menu_Array[2].Key=3
set Two_Level_Menu_Array[2].MenuTag=TwoLevel3
set Two_Level_Menu_Array[2].MenuArrayName=TwoLevelMenu3

set Two_Level_Menu_Array[3].TipName=脚本功能管理菜单
set Two_Level_Menu_Array[3].Key=4
set Two_Level_Menu_Array[3].MenuTag=TwoLevel4
set Two_Level_Menu_Array[3].MenuArrayName=TwoLevelMenu4
rem ################################主菜单的子菜单内容End##################################





rem 通讯应用管理菜单
rem ################################第一个二级菜单内容Start################################
rem FileDirectory:表示可执行程序的所在的文件目录
rem FileName:表示可执行程序的文件名
rem KillTaskName:=表示关闭可执行程序所需要的"结束任务名"
rem TipName:在脚本菜单的提示名
rem StartKey:启动可执行程序需要的关键字
rem CloseKey:关闭可执行程序需要的关键字
rem OpenDirectory:打开可执行文件目录的关键字

set TwoLevelMenu1[0].TipName= 钉钉
set TwoLevelMenu1[0].FileDirectory="D:\Tool_Install\Communication_Tool\DingDing\dingding_Install"
set TwoLevelMenu1[0].FileName=DingtalkLauncher.exe
set TwoLevelMenu1[0].KillTaskName="DingTalk.exe"
set TwoLevelMenu1[0].StartKey=1
set TwoLevelMenu1[0].CloseKey=1_1
set TwoLevelMenu1[0].OpenDirectory=1_2

set TwoLevelMenu1[1].TipName= 微信
set TwoLevelMenu1[1].FileDirectory="D:\Tool_Install\Communication_Tool\WeChat\WeChat_Install\WeChat"
set TwoLevelMenu1[1].FileName=WeChat.exe
set TwoLevelMenu1[1].KillTaskName="WeChat.exe"
set TwoLevelMenu1[1].StartKey=2
set TwoLevelMenu1[1].CloseKey=2_1
set TwoLevelMenu1[1].OpenDirectory=2_2

set TwoLevelMenu1[2].TipName= 飞书
set TwoLevelMenu1[2].FileDirectory="D:\Tool_Install\Communication_Tool\FeiShu\FeiShu_Intsall\Feishu"
set TwoLevelMenu1[2].FileName=Feishu.exe
set TwoLevelMenu1[2].KillTaskName="Feishu.exe"
set TwoLevelMenu1[2].StartKey=3
set TwoLevelMenu1[2].CloseKey=3_1
set TwoLevelMenu1[2].OpenDirectory=3_2

set TwoLevelMenu1[3].TipName= QQ
set TwoLevelMenu1[3].FileDirectory="D:\Tool_Install\Communication_Tool\QQ\QQ_Install"
set TwoLevelMenu1[3].FileName=QQ.exe
set TwoLevelMenu1[3].KillTaskName="QQ.exe"
set TwoLevelMenu1[3].StartKey=4
set TwoLevelMenu1[3].CloseKey=4_1
set TwoLevelMenu1[3].OpenDirectory=4_2
rem ################################第一个二级菜单内容End################################




















rem 工作应用管理菜单
rem ################################第二个二级菜单内容Start################################
set TwoLevelMenu2[0].TipName= EpicGame
set TwoLevelMenu2[0].FileDirectory="D:\Epic Games\Launcher\Portal\Binaries\Win64"
set TwoLevelMenu2[0].FileName=EpicGamesLauncher.exe
set TwoLevelMenu2[0].KillTaskName="EpicGamesLauncher.exe"
set TwoLevelMenu2[0].StartKey=1
set TwoLevelMenu2[0].CloseKey=1_1
set TwoLevelMenu2[0].OpenDirectory=1_2

set TwoLevelMenu2[1].TipName= 图集工具
set TwoLevelMenu2[1].FileDirectory="C:\Program Files\CodeAndWeb\TexturePacker\bin"
set TwoLevelMenu2[1].FileName=TexturePackerGUI.exe
set TwoLevelMenu2[1].KillTaskName="TexturePackerGUI.exe"
set TwoLevelMenu2[1].StartKey=2
set TwoLevelMenu2[1].CloseKey=2_1
set TwoLevelMenu2[1].OpenDirectory=2_2

set TwoLevelMenu2[2].TipName= 百度网盘
set TwoLevelMenu2[2].FileDirectory="D:\百度网盘安装\BaiduNetdisk"
set TwoLevelMenu2[2].FileName=BaiduNetdisk.exe
set TwoLevelMenu2[2].KillTaskName="baidunetdisk.exe"
set TwoLevelMenu2[2].StartKey=3
set TwoLevelMenu2[2].CloseKey=3_1
set TwoLevelMenu2[2].OpenDirectory=3_2

set TwoLevelMenu2[3].TipName= ToDesk
set TwoLevelMenu2[3].FileDirectory="D:\Tool_Install\RemoteControl_Tool\ToDesk\ToDesk_Install\ToDesk"
set TwoLevelMenu2[3].FileName=ToDesk.exe
set TwoLevelMenu2[3].KillTaskName="ToDesk.exe"
set TwoLevelMenu2[3].StartKey=4
set TwoLevelMenu2[3].CloseKey=4_1
set TwoLevelMenu2[3].OpenDirectory=4_2

set TwoLevelMenu2[4].TipName= 格式工厂
set TwoLevelMenu2[4].FileDirectory="D:\Tool_Install\Format_Tool\FormatFactory\FormatFactory"
set TwoLevelMenu2[4].FileName=FormatFactory.exe
set TwoLevelMenu2[4].KillTaskName="FormatFactory.exe"
set TwoLevelMenu2[4].StartKey=5
set TwoLevelMenu2[4].CloseKey=5_1
set TwoLevelMenu2[4].OpenDirectory=5_2

set TwoLevelMenu2[5].TipName= 腾讯会议
set TwoLevelMenu2[5].FileDirectory="D:\Tool_Install\Meeting_Tool\TencentMetting_Install\WeMeet"
set TwoLevelMenu2[5].FileName=WeMeetApp.exe
set TwoLevelMenu2[5].KillTaskName="WeMeetApp.exe"
set TwoLevelMenu2[5].StartKey=6
set TwoLevelMenu2[5].CloseKey=6_1
set TwoLevelMenu2[5].OpenDirectory=6_2

set TwoLevelMenu2[6].TipName= Apifox
set TwoLevelMenu2[6].FileDirectory="D:\Tool_Install\WebPoint_Tool\Apifox_Install"
set TwoLevelMenu2[6].FileName=Apifox.exe
set TwoLevelMenu2[6].KillTaskName="Apifox.exe"
set TwoLevelMenu2[6].StartKey=7
set TwoLevelMenu2[6].CloseKey=7_1
set TwoLevelMenu2[6].OpenDirectory=7_2

set TwoLevelMenu2[7].TipName= Typora
set TwoLevelMenu2[7].FileDirectory="D:\Tool_Install\TextReader_Tool\Typora_Install\Typora"
set TwoLevelMenu2[7].FileName=Typora.exe
set TwoLevelMenu2[7].KillTaskName="Typora.exe"
set TwoLevelMenu2[7].StartKey=8
set TwoLevelMenu2[7].CloseKey=8_1
set TwoLevelMenu2[7].OpenDirectory=8_2

set TwoLevelMenu2[8].TipName= PureRef
set TwoLevelMenu2[8].FileDirectory="D:\Tool_Install\Image_Tool\PureRef_Install\PureRef-1.11.1_x64"
set TwoLevelMenu2[8].FileName=PureRef.exe
set TwoLevelMenu2[8].KillTaskName="PureRef.exe"
set TwoLevelMenu2[8].StartKey=9
set TwoLevelMenu2[8].CloseKey=9_1
set TwoLevelMenu2[8].OpenDirectory=9_2

set TwoLevelMenu2[9].TipName= Bypass
set TwoLevelMenu2[9].FileDirectory="D:\Tool_Install\BuyTicket_Tool\ByPass_Install\Bypass"
set TwoLevelMenu2[9].FileName=Bypass.exe
set TwoLevelMenu2[9].KillTaskName="Bypass.exe"
set TwoLevelMenu2[9].StartKey=10
set TwoLevelMenu2[9].CloseKey=10_1
set TwoLevelMenu2[9].OpenDirectory=10_2

set TwoLevelMenu2[10].TipName= 夸克网盘
set TwoLevelMenu2[10].FileDirectory="D:\Tool_Install\CloudStorage_Tool\KuaKe\KuaKe_Install\quark-cloud-drive"
set TwoLevelMenu2[10].FileName=QuarkCloudDrive.exe
set TwoLevelMenu2[10].KillTaskName="QuarkCloudDrive.exe"
set TwoLevelMenu2[10].StartKey=11
set TwoLevelMenu2[10].CloseKey=11_1
set TwoLevelMenu2[10].OpenDirectory=11_2

set TwoLevelMenu2[11].TipName= 有道翻译词典
set TwoLevelMenu2[11].FileDirectory="D:\Tool_Install\Language_Tool\YouDaoDictionary_Install\Dict"
set TwoLevelMenu2[11].FileName=YoudaoDict.exe
set TwoLevelMenu2[11].KillTaskName="YoudaoDict.exe"
set TwoLevelMenu2[11].StartKey=12
set TwoLevelMenu2[11].CloseKey=12_1
set TwoLevelMenu2[11].OpenDirectory=12_2

set TwoLevelMenu2[12].TipName= OBS录屏工具
set TwoLevelMenu2[12].FileDirectory="D:\Tool_Install\Vedio_Tool\OBS_Install\obs-studio\bin\64bit"
set TwoLevelMenu2[12].FileName=obs64.exe
set TwoLevelMenu2[12].KillTaskName="obs64.exe"
set TwoLevelMenu2[12].StartKey=13
set TwoLevelMenu2[12].CloseKey=13_1
set TwoLevelMenu2[12].OpenDirectory=13_2

set TwoLevelMenu2[13].TipName= VPN
set TwoLevelMenu2[13].FileDirectory="D:\Tool_Install\Net_Tool\Clash_For_Windows\Clash.for.Windows-0.19.14"
set TwoLevelMenu2[13].FileName=VPN_Clash.exe
set TwoLevelMenu2[13].KillTaskName="VPN_Clash.exe"
set TwoLevelMenu2[13].StartKey=14
set TwoLevelMenu2[13].CloseKey=14_1
set TwoLevelMenu2[13].OpenDirectory=14_2
rem ################################第二个二级菜单内容End##################################







rem 娱乐应用管理菜单
rem ################################第三个二级菜单内容Start################################

set TwoLevelMenu3[0].TipName= QQ音乐
set TwoLevelMenu3[0].FileDirectory="D:\Tool_Install\Music_Tool\QQ_Music\Install\QQMusic1942.20.06.16"
set TwoLevelMenu3[0].FileName=QQMusic.exe
set TwoLevelMenu3[0].KillTaskName="QQMusic.exe"
set TwoLevelMenu3[0].StartKey=1
set TwoLevelMenu3[0].CloseKey=1_1
set TwoLevelMenu3[0].OpenDirectory=1_2

set TwoLevelMenu3[1].TipName= 喜马拉雅听书
set TwoLevelMenu3[1].FileDirectory="D:\Tool_Install\Music_Tool\XiMaLaYa\XiMaLaYaTingShu_Install"
set TwoLevelMenu3[1].FileName=喜马拉雅.exe
set TwoLevelMenu3[1].KillTaskName="喜马拉雅.exe"
set TwoLevelMenu3[1].StartKey=2
set TwoLevelMenu3[1].CloseKey=2_1
set TwoLevelMenu3[1].OpenDirectory=2_2

set TwoLevelMenu3[2].TipName= Wegame
set TwoLevelMenu3[2].FileDirectory="D:\Tool_Install\Game_Tool\WeGame_Install"
set TwoLevelMenu3[2].FileName=wegame.exe
set TwoLevelMenu3[2].KillTaskName="wegame.exe"
set TwoLevelMenu3[2].StartKey=3
set TwoLevelMenu3[2].CloseKey=3_1
set TwoLevelMenu3[2].OpenDirectory=3_2

set TwoLevelMenu3[3].TipName= Stream
set TwoLevelMenu3[3].FileDirectory="D:\Tool_Install\Game_Tool\Steam_Install"
set TwoLevelMenu3[3].FileName=steam.exe
set TwoLevelMenu3[3].KillTaskName="steam.exe"
set TwoLevelMenu3[3].StartKey=4
set TwoLevelMenu3[3].CloseKey=4_1
set TwoLevelMenu3[3].OpenDirectory=4_2

set TwoLevelMenu3[4].TipName= 雷神加速器
set TwoLevelMenu3[4].FileDirectory="D:\Tool_Install\Game_Tool\LeiGod\LeiGod_Acc"
set TwoLevelMenu3[4].FileName=leigod.exe
set TwoLevelMenu3[4].KillTaskName="leigod.exe"
set TwoLevelMenu3[4].StartKey=5
set TwoLevelMenu3[4].CloseKey=5_1
set TwoLevelMenu3[4].OpenDirectory=5_2


set TwoLevelMenu3[5].TipName= 网易云音乐
set TwoLevelMenu3[5].FileDirectory="D:\Tool_Install\Music_Tool\WYY_Music\CloudMusic_Install\CloudMusic"
set TwoLevelMenu3[5].FileName=cloudmusic.exe
set TwoLevelMenu3[5].KillTaskName="cloudmusic.exe"
set TwoLevelMenu3[5].StartKey=6
set TwoLevelMenu3[5].CloseKey=6_1
set TwoLevelMenu3[5].OpenDirectory=6_2

set TwoLevelMenu3[6].TipName= 小说阅读器
set TwoLevelMenu3[6].FileDirectory="D:\Tool_Install\TextReader_Tool\TextReader\Koodo Reader"
set TwoLevelMenu3[6].FileName=KoodoReader.exe
set TwoLevelMenu3[6].KillTaskName="KoodoReader.exe"
set TwoLevelMenu3[6].StartKey=7
set TwoLevelMenu3[6].CloseKey=7_1
set TwoLevelMenu3[6].OpenDirectory=7_2
rem ################################第三个二级菜单内容End##################################


rem 脚本功能管理菜单
rem 这一部分不要随便更改,除非你熟悉DOS命令
rem ################################第四个二级菜单内容Start################################
set TwoLevelMenu4[0].TipName= 批量重命名功能
set TwoLevelMenu4[0].Key=1
set TwoLevelMenu4[0].Tag=Function_RenameFile

rem ################################第二个二级菜单内容End##################################
















rem ################################主菜单流程Start################################
rem 进入主菜单选择
:Mian_Menu
set Global_EnterMainMenuTag=Mian_Menu
cls
echo ###################################################
echo ###################################################
echo ############%ManagerName%#############
echo ###################################################
echo ###################################################

rem 开始生成主菜单提示文本内容
call :Function_CreateMainMenuTipMessage
rem 结束生成主菜单提示文本内容

rem 开始进行输入操作,传入变量名,当该方法执行完毕之后,就确定了执行的数组
set Global_ArrayMenuName=
set Global_TagName=
call :Function_SelectTwoLevelMenu Global_ArrayMenuName Global_TagName

echo Global_TagName为:%Global_ArrayMenuName%
goto :%Global_TagName%
rem ################################主菜单流程End################################



















rem ################################应用程序管理菜单流程Start################################
:TwoLevel1
:TwoLevel2
:TwoLevel3
cls
rem 开始生成应用程序管理菜单图像注释内容
call:Function_CreateImageTip
rem 结束生成应用程序管理菜单图像注释内容

rem 开始生成应用程序管理菜单提示文本内容
call:Function_CreateTipMessage Global_ArrayMenuName 1
rem 结束生成应用程序管理菜单提示文本内容

rem 开始监听输入内容,准备处理对应信息,当方法执行完毕之后,必要的信息已经设置
rem OperationNum为0表示返回主菜单,为1表示打开程序,为2表示关闭程序
set OperationNum=
call:Function_ProcessExe Global_ArrayMenuName OperationNum

if "%OperationNum%"=="0" (
    goto :%Global_EnterMainMenuTag%
)

if "%OperationNum%"=="1" (
    echo 启动程序
    call:Function_LauncherAPP
)

if "%OperationNum%"=="2" (
    echo 关闭程序
    call:Function_CloseAPP
)

if "%OperationNum%"=="3" (
    echo 打开目录
    call:Function_OpenDirectory
)

rem 流程执行完毕,再次调到该二级菜单开始位置
goto :TwoLevel3
rem ################################应用程序管理菜单流程End################################














rem ################################脚本功能管理菜单流程Start################################
:TwoLevel4
cls
rem 开始生成脚本功能管理菜单图像注释内容
call:Function_CreateImageTip
rem 结束生成脚本功能管理菜单图像注释内容

rem 开始生成应用程序管理菜单提示文本内容
call:Function_CreateJSTipMessage Global_ArrayMenuName 1
rem 结束生成应用程序管理菜单提示文本内容

rem 开始监听输入内容,准备处理对应信息,当方法执行完毕之后,必要的信息已经设置
rem OperationNum为0表示返回主菜单,为1表示执行脚本
set OperationNum=
set Global_JSTag=
call:Function_ProcessJS Global_ArrayMenuName OperationNum Global_JSTag

rem 输入不能为0
if "%OperationNum%"=="0" (
    goto :%Global_EnterMainMenuTag%
)

rem 输入不能为空
if "%Global_JSTag%" NEQ "" (
    call:%Global_JSTag%
)

rem 流程执行完毕,再次调到该二级菜单其实位置
goto :TwoLevel4
rem ################################脚本功能管理菜单流程End################################


























rem ################################主菜单提示内容################################
rem ################################主菜单提示内容################################
rem ################################主菜单提示内容################################
rem 生成提示文本菜单内容
rem 语法:
rem 第一步:使用call :Function_CreateMainMenuTipMessage
:Function_CreateMainMenuTipMessage

rem 设置起始索引为0
set Global_ArrayIndex=0

echo Tip:

rem 检查是否有定义
:Function_CreateMainMenuTipMessage0
if defined Two_Level_Menu_Array[%Global_ArrayIndex%].TipName (
    goto :Function_CreateMainMenuTipMessage1
) else (
    goto :Function_CreateMainMenuTipMessage2
)

:Function_CreateMainMenuTipMessage1

call, echo %BlankKey%按%%Two_Level_Menu_Array[%Global_ArrayIndex%].Key%%键 进入 %%Two_Level_Menu_Array[%Global_ArrayIndex%].TipName%%

rem 索引加1
set /a Global_ArrayIndex+=1

rem 返回继续去判断
goto :Function_CreateMainMenuTipMessage0



:Function_CreateMainMenuTipMessage2
echo Tip:输入对应指令即可进入对应菜单
if "%bDebug%"=="1" (
    echo 二级菜单提示内容生成完成
    pause
)
goto :eof
rem ################################主菜单生成二级菜单提示内容End################################












































































rem ##############################主菜单根据输入选择要进入的二级菜单##############################
rem ##############################主菜单根据输入选择要进入的二级菜单##############################
rem ##############################主菜单根据输入选择要进入的二级菜单##############################
rem 根据输入选择要跳转的二级菜单
rem 语法:
rem 第一步:使用call::Function_SelectTwoLevelMenu 参数1,参数2
rem 参数1:查找出的数组名
rem 参数2:要跳转的标签名

:Function_SelectTwoLevelMenu
set Local_TemArrayName=%1
set Local_TemTagName=%2

echo 请输入指令数,按Enter键确认:
goto :MainMenuInput1

:MainMenuInput2
echo 上一次输入有误,请重新输入指令数,按Enter键确认:

:MainMenuInput1
rem 先清空一下,不然FirstInputName会储存前一次内容
set MianMenuInputValue=
set /p MianMenuInputValue=

echo 您输入指令数：%MianMenuInputValue%,即将进入对应菜单.....

rem 排除空内容输入
if "%MianMenuInputValue%"=="" (
    echo 输入空
    goto :MainMenuInput2
)

rem 开始检查进入哪一个二级菜单


rem 设置起始索引为0
set Global_ArrayIndex=0

:Function_SelectTwoLevelMenu_1

rem 检查对应索引有无定义
if defined Two_Level_Menu_Array[%Global_ArrayIndex%].TipName (
    goto :Function_SelectTwoLevelMenu_2
) else (
    goto :Function_SelectTwoLevelMenu_3
)

rem 数组有对应定义,检查输入按键是否相等
:Function_SelectTwoLevelMenu_2

rem 获取数组的Key值
call, set %Local_TemArrayName%=%%Two_Level_Menu_Array[%Global_ArrayIndex%].MenuArrayName%%
call, set %Local_TemTagName%=%%Two_Level_Menu_Array[%Global_ArrayIndex%].MenuTag%%
call, set Local_TemTwoLevelMenuKeyValue=%%Two_Level_Menu_Array[%Global_ArrayIndex%].Key%%

if %Local_TemTwoLevelMenuKeyValue%==%MianMenuInputValue% (
    goto :Function_SelectTwoLevelMenu_4
) else (
    goto :Function_SelectTwoLevelMenu_5
)


rem 没有定义则返回,重新开始输入
:Function_SelectTwoLevelMenu_3
goto :MainMenuInput2


rem 输入指令相等,改变传入的实参值
:Function_SelectTwoLevelMenu_4
goto :eof


rem 不等,索引+1,进行下一次判断,
:Function_SelectTwoLevelMenu_5
set /a Global_ArrayIndex+=1
goto :Function_SelectTwoLevelMenu_1
rem #####################################################################################
rem #####################################################################################
rem #####################################################################################




























































rem ################################生成程序管理菜单提示文本内容Start################################
rem 生成提示文本菜单内容
rem 语法:
rem 第一步:使用call::Function_CreateTipMessage 参数1
rem 参数1:存有程序启动关闭信息的数组名称
rem 参数2:用于设置是否要显示返回主菜单提示,取指1为显示,0为不显示

:Function_CreateTipMessage
call,set Local_TemTwoLevelMenuName=%%%1%%
set Local_ShowMainMenuTip=%2

rem 设置起始索引为0
set Global_ArrayIndex=0


echo Tip:
rem 是否显示 返回主菜单提示文本
if "%Local_ShowMainMenuTip%"=="1" (
    echo %BlankKey%按%Global_ReturnKey%键返回主菜单
)

rem //检测是否有定义其元素
:Function_CreateTipMessage0
if defined %Local_TemTwoLevelMenuName%[%Global_ArrayIndex%].TipName (
    goto :Function_CreateTipMessage1
) else (
    goto :Function_CreateTipMessage2
)

:Function_CreateTipMessage1
call,set Local_StartKeyValue=%%%Local_TemTwoLevelMenuName%[%Global_ArrayIndex%].StartKey%%
call,set Local_CloseKeyValue=%%%Local_TemTwoLevelMenuName%[%Global_ArrayIndex%].CloseKey%%
call,set Local_TipNameValue=%%%Local_TemTwoLevelMenuName%[%Global_ArrayIndex%].TipName%%
rem echo 值为:%Local_StartKeyValue%  %Local_CloseKeyValue%  %Local_TipNameValue%
echo %BlankKey%按%Local_StartKeyValue%键启动 按%Local_CloseKeyValue%键关闭%Local_TipNameValue%

rem 索引加1
set /a Global_ArrayIndex+=1

rem 返回继续去判断
goto :Function_CreateTipMessage0

:Function_CreateTipMessage2
echo Tip:输入对应指令即可打开或关闭应用
if "%bDebug%"=="1" (
    echo 应用程序管理菜单提示文本内容生成完成
    pause
)

goto :eof
rem ################################生成应用程序管理菜单提示文本内容Start################################




















rem ##############################二菜单根据输入选择要进入的操作##############################
rem ##############################二菜单根据输入选择要进入的操作##############################
rem ##############################二菜单根据输入选择要进入的操作##############################
rem 二菜单根据输入选择要进入的操作
rem 语法:
rem 第一步:使用call::Function_ProcessExe 参数1,参数2
rem 参数1:查找出的数组名
rem 参数2:可选的操作数
:Function_ProcessExe

call,set Local_Value1=%%%1%%
set Local_Value2=%2

rem 第一次输入
:Function_ProcessExe1
echo 请输入指令数,按Enter键确认:

goto :Function_ProcessExe3

rem 非第一次输入的指令数
:Function_ProcessExe2
echo 上一次输入有误,请重新输入指令数,按Enter键确认:

:Function_ProcessExe3
rem 先置为空是为了初始化APP_Manager_Menu_Input_Num,不然第二次输入空值将为第一次输入的值
set Local_InputValue=
set /p Local_InputValue=

rem 输入不能为空.为空则需要重新输入
if "%Local_InputValue%"=="" (
    goto:Function_ProcessExe2
)

rem 输入值为定义的返回主菜单按键时,返回到主菜单
if "%Local_InputValue%"=="%Global_ReturnKey%" (
    set %Local_Value2%=0
    goto:eof
)


rem 开始获取属性对应的索引
rem 设置起始索引为0
set Global_ArrayIndex=0

:Function_ProcessExe4
rem 检查对应元素有没有定义
if defined %Local_Value1%[%Global_ArrayIndex%].StartKey (
    goto :Function_ProcessExe5
) else (
    goto :Function_ProcessExe6
)

rem 没有定义表示输入有问题,需要重新输入
:Function_ProcessExe6
goto:Function_ProcessExe2

rem 有定义,则继续判断
:Function_ProcessExe5

rem 临时获取数组对应索引的启动指令和关闭指令
call, Set Local_StartKey=%%%Local_Value1%[%Global_ArrayIndex%].StartKey%%
call, Set Local_CloseKey=%%%Local_Value1%[%Global_ArrayIndex%].CloseKey%%
call, set Local_OpenDirectory=%%%Local_Value1%[%Global_ArrayIndex%].OpenDirectory%%

rem 判断输入指令是否与程序启动指令相同
if %Local_InputValue%==%Local_StartKey% (
    set %Local_Value2%=1
    goto :Function_ProcessExe11

) else if %Local_InputValue%==%Local_CloseKey% (
    set %Local_Value2%=2
    goto :Function_ProcessExe11

) else if %Local_InputValue%==%Local_OpenDirectory% (
    set %Local_Value2%=3
    goto :Function_ProcessExe11

) else (
    goto :Function_ProcessExe10
)

rem 不等,索引数加1,进行下一轮判断
:Function_ProcessExe10
rem 索引加1
set /a Global_ArrayIndex+=1
goto :Function_ProcessExe4


:Function_ProcessExe11
rem 结束获取属性对应的索引
call, set Globle_ExeFileDirectory=%%%Local_Value1%[%Global_ArrayIndex%].FileDirectory%%
call, set Globle_ExeFileName=%%%Local_Value1%[%Global_ArrayIndex%].FileName%%
call, set Globle_KillTaskName=%%%Local_Value1%[%Global_ArrayIndex%].KillTaskName%%
call, set Local_TipName=%%%Local_Value1%[%Global_ArrayIndex%].TipName%%
echo Globle_ExeFileDirectory:%Globle_ExeFileDirectory%
echo Globle_ExeFileName:%Globle_ExeFileName%
echo Globle_KillTaskName:%Globle_KillTaskName%
echo Local_TipName:%Local_TipName%
goto:eof

rem #####################################################################################
rem #####################################################################################
rem #####################################################################################
























rem ################################生成脚本功能管理菜单提示文本内容Start################################
rem ################################生成脚本功能管理菜单提示文本内容Start################################
rem ################################生成脚本功能管理菜单提示文本内容Start################################
rem 生成提示文本菜单内容
rem 语法:
rem 第一步:使用call:Function_CreateJSTipMessage 参数1,参数2
rem 参数2:包含脚本功能信息的数组
rem 参数2:用于设置是否要显示返回主菜单提示
:Function_CreateJSTipMessage
call, set Local_Value1=%%%1%%
set Local_Value2=%2

rem 设置起始索引为0
set Global_ArrayIndex=0


echo Tip:
if "%Local_Value2%"=="1" (
    echo %BlankKey%按%Global_ReturnKey%键返回主菜单
)

rem 检测是否有对应的元素
:Function_CreateJSTipMessage1
if defined %Local_Value1%[%Global_ArrayIndex%].TipName (
    goto :Function_CreateJSTipMessage2
) else (
    goto :Function_CreateJSTipMessage3
)

:Function_CreateJSTipMessage2
call, echo %BlankKey%按%%%Local_Value1%[%Global_ArrayIndex%].Key%%键启动%%%Local_Value1%[%Global_ArrayIndex%].TipName%%
rem 索引加1
set /a Global_ArrayIndex+=1
goto :Function_CreateJSTipMessage1

:Function_CreateJSTipMessage3
echo Tip:输入对应指令即可执行对应脚本功能
if "%bDebug%"=="1" (
    echo 脚本功能管理菜单提示文本内容生成完成
    pause
)

goto :eof
rem #####################################################################################
rem #####################################################################################
rem #####################################################################################






















rem ##############################脚本菜单根据输入选择要进入的操作##############################
rem ##############################脚本菜单根据输入选择要进入的操作##############################
rem ##############################脚本菜单根据输入选择要进入的操作##############################
rem 第一步:使用call::Function_ProcessJS 参数1,参数2,参数3
rem 参数1:查找出的数组名
rem 参数2:可选的操作数
rem 参数3:执行脚本需要跳转的标签名
:Function_ProcessJS
call,set Local_Value1=%%%1%%
set Local_Value2=%2
set Local_Value3=%3

rem 第一次输入
:Function_ProcessJS1
echo 请输入指令数,按Enter键确认:
goto :Function_ProcessJS3


rem 非第一次输入的指令数
:Function_ProcessJS2
echo 上一次输入有误,请重新输入指令数,按Enter键确认:

:Function_ProcessJS3
rem 先置为空是为了初始化JS_Manager_Menu_Input_Num,不然第二次输入空值将为第一次输入的值
set Local_InputValue=
set /p Local_InputValue=


rem 输入值为定义的返回主菜单按键时，返回到主菜单
if "%Local_InputValue%"=="%Global_ReturnKey%" (
    set %Local_Value2%=0
    goto :eof
)

rem 输入不能为空
if "%Local_InputValue%"=="" (
    goto :Function_ProcessJS2
)


rem 开始获取属性对应的索引
rem 设置起始索引为0
set Global_ArrayIndex=0

:Function_ProcessJS4
if defined %Local_Value1%[%Global_ArrayIndex%].Key (
    rem 定义
    goto :Function_ProcessJS5
) else (
    rem 未定义
    goto :Function_ProcessJS6
)

rem 有定义则进行检查判断
:Function_ProcessJS5

rem 获取数组Key值
call, Set Local_KeyValue=%%%Local_Value1%[%Global_ArrayIndex%].Key%%
if %Local_KeyValue%==%Local_InputValue% (
    gotO :Function_ProcessJS7
) else (
    gotO :Function_ProcessJS8
)


rem 相等,则跳到获取索引结束标签
:Function_ProcessJS7
goto :Function_ProcessJS9

rem 不等,则进行下一次判断
:Function_ProcessJS8
rem 索引加1
set /a Global_ArrayIndex+=1
goto :Function_ProcessJS4


rem 没有定义则返回
:Function_ProcessJS6
goto :Function_ProcessJS2


:Function_ProcessJS9
rem 结束获取属性对应的索引
call,set %Local_Value3%=%%%Local_Value1%[%Global_ArrayIndex%].Tag%%
set %Local_Value2%=1
goto :eof
rem #####################################################################################
rem #####################################################################################
rem #####################################################################################


























rem #######################启动应用程序Start##########################
rem 启动应用程序
rem 语法:
rem 第一步:使用call:Function_LauncherAPP
:Function_LauncherAPP
if exist %Globle_ExeFileDirectory% (
    rem 文件夹路径存在
    goto :Function_LauncherAPP1
)else (
    rem 文件夹路径不存在
    goto :Function_LauncherAPP2
)

rem 文件夹路径存在将切到对应目录
:Function_LauncherAPP1
cd /d %Globle_ExeFileDirectory%

if exist %Globle_ExeFileName% (
    rem 文件存在
    goto :Function_LauncherAPP3
)else (
    rem 文件不存在
    goto :Function_LauncherAPP4
)

rem 文件目录不存在,结束该方法
:Function_LauncherAPP2
if "%bDebug%"=="1" (
    echo 文件目录不存在:%Globle_ExeFileDirectory%
    pause
)

rem 清空
set Globle_ExeFileDirectory=""
set Globle_ExeFileName=""
set Globle_KillTaskName=""
goto :eof


rem 文件存在,启动程序
:Function_LauncherAPP3
if "%bDebug%"=="1" (
    echo 对应目录存在对应文件,准备启动:"目录":%Globle_ExeFileDirectory%  "文件":%Globle_ExeFileName%
    pause
)
rem 启动程序
start %Globle_ExeFileName%

rem 清空
set Globle_ExeFileDirectory=""
set Globle_ExeFileName=""
set Globle_KillTaskName=""

rem 返回到前一个目录
popd
goto :eof

rem 文件不存在,结束该方法
:Function_LauncherAPP4
if "%bDebug%"=="1" (
    echo 对应目录不存在对应文件:"目录":%Globle_ExeFileDirectory%  "文件":%Globle_ExeFileName%
    pause
)

rem 清空
set Globle_ExeFileDirectory=""
set Globle_ExeFileName=""
set Globle_KillTaskName=""

rem 返回到前一个目录
popd
goto :eof
rem #######################启动应用程序End##########################



















rem ###################关闭应用程序Start##############################
rem 关闭应用程序
rem 语法:
rem 第一步:使用call:Function_CloseAPP
:Function_CloseAPP

if "%bDebug%"=="1" (
    echo 准备关闭应用程序:%Globle_KillTaskName%
    pause
)

taskkill /F /T /IM %Globle_KillTaskName%

rem 调用taskkill命令之后将"Globle_KillTaskName"变量清空
set Globle_ExeFileDirectory=""
set Globle_ExeFileName=""
set Globle_KillTaskName=""
goto :eof
rem ###################关闭应用程序End################################








rem ###################打开文件目录Start##############################
rem 打开文件目录
rem 用法:
rem 第一步:使用call:Function_OpenDirectory
:Function_OpenDirectory

if "%bDebug%"=="1" (
    echo 打开文件目录方法:文件目录为:%Globle_ExeFileDirectory%
    pause
)

if exist %Globle_ExeFileDirectory% (
    rem 存在对应目录
    explorer %Globle_ExeFileDirectory%
)

rem 调用explorer之后,清空
set Globle_ExeFileDirectory=""
set Globle_ExeFileName=""
set Globle_KillTaskName=""
goto :eof
rem ###################打开文件目录End################################










rem ##############################图像注释Start#################################
rem ##############################图像注释Start#################################
rem ##############################图像注释Start#################################
rem 打印图像注释
rem 语法:
rem 第一步:使用call:Function_CreateImageTip

:Function_CreateImageTip

rem 存入一周中的日期,例如周一、周二...周日
Set Week_Day=%Date:~-2%

set Mark_Tag=############################################################################

echo %Mark_Tag%
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
echo %Mark_Tag%

goto :eof
rem ###################################图像注释End#################################################





























rem ###################################查找字符串是否包含Start######################################
rem 查找字符串是否包含指定字符串
rem 语法:
rem 第一步:使用call:Contb_Is_Contain_Sub_String_MainainSubString_Main 参数1,参数2,参数3
rem 参数1:要查找的字符串
rem 参数2:要查找的子字符串
rem 参数3:查找完要跳转的标签
rem 将返回true和false的字符,注意使用%1来接收
:b_Is_Contain_Sub_String_Main
set MainStr=%1
set SubStr=%2
set WillGotoTag=%3

echo %MainStr%| findstr /c:%SubStr% && set FindResult=true ||set FindResult=false
call :%WillGotoTag% %FindResult%
rem ###################################查找字符串是否包含End#########################################


























rem ######################################文件重命名Start#####################################
rem ######################################文件重命名Start#####################################
rem ######################################文件重命名Start#####################################
rem ######################################文件重命名Start#####################################
:Function_RenameFile

rem 第一次输入文件夹路径
:Batch_Files_Rename_First_Input_Directory
echo 请输入文件夹路径:
goto :Batch_Files_Rename_Input_File_Dirctory_Complete

rem 第二次输入文件夹路径
:Batch_Files_Rename_Second_Input_Directory
echo 文件夹路径错误,请重新输入文件夹路径:

:Batch_Files_Rename_Input_File_Dirctory_Complete
rem 先置为空是为了初始化FolderDirectory,不然第二次输入空值将为第一次输入的值
set Batch_Files_Rename_Folder_Directory=
set /p Batch_Files_Rename_Folder_Directory=

rem 检测文件夹是否为有效路径
if exist "%Batch_Files_Rename_Folder_Directory%" (
    echo 文件夹路径存在
    rem echo %FolderDirectory%
) else (
    rem 如果文件路径不存在,则需要第二次输入文件路径
    echo 文件夹路径不存在
    goto :Batch_Files_Rename_Second_Input_Directory
) 

rem 把当前路径切换到输入的文件夹路径
cd /d %Batch_Files_Rename_Folder_Directory%


rem 开始文件名前缀设置
echo 请输入新文件名前缀:
set Batch_Files_Rename_prefix=
set /p Batch_Files_Rename_prefix=

rem 开始文件名后缀设置
echo 请输入后缀名,仅支持数字,默认为1,后续文件名将为(前缀名+后缀名+文件格式后缀)
:Batch_Files_Rename_Suffix_Re_Input
set TemSuffix=
set /p TemSuffix=

rem echo 输入:%TemSuffix%

if "%TemSuffix%"=="" (
    echo 输入后缀名为空,将默认为1
    set Batch_Files_Rename_Suffix=1
) else (
    rem echo 后缀名非空,进行检测
    set Batch_Files_Rename_Suffix=%TemSuffix%
)

rem #######################开始检查后缀名是否全为数字##################
rem 默认开始的检查数目为0
rem 设置临时的后缀变量，该变量会进行分割字符
set Batch_Files_Rename_Will_Check_Content=%Batch_Files_Rename_Suffix%

rem 先假设全为数字
set Batch_Files_Rename_Check_Result_Is_Num=true

rem 检查当前首字符
:Batch_Files_Rename_Check_Start


rem 当前要检查的内容是否为空
if "%Batch_Files_Rename_Will_Check_Content%"=="" (
    rem 字符为空,表示所有字符已经检查完毕
    goto :Batch_Files_Rename_Check_End
)

set Will_Check_First_Char=%Batch_Files_Rename_Will_Check_Content:~0,1%
set Batch_Files_Rename_Will_Check_Content=%Batch_Files_Rename_Will_Check_Content:~1%

rem Batch_Files_Rename_Will_Check_Content为:%Batch_Files_Rename_Will_Check_Content%
rem Will_Check_First_Char为:%Will_Check_First_Char%

rem 开始进行字符检测
rem 是否为0
:Batch_Files_Rename_check_0

if "%Will_Check_First_Char%"=="0" (
    rem 字符%Will_Check_First_Char%为数字0,检查下一个字符
    goto :Batch_Files_Rename_Check_Start
) else (
    rem echo 字符%Will_Check_First_Char%不为数字0,进行下一个判断
    goto :Batch_Files_Rename_check_1
)

rem 是否为1
:Batch_Files_Rename_check_1

if "%Will_Check_First_Char%"=="1" (
    rem 字符%Will_Check_First_Char%为数字1,检查下一个字符
    goto :Batch_Files_Rename_Check_Start
) else (
    rem echo 字符%Will_Check_First_Char%不为数字1,进行下一个判断
    goto :Batch_Files_Rename_check_2
)

rem 是否为2
:Batch_Files_Rename_check_2

if "%Will_Check_First_Char%"=="2" (
    rem echo 字符%Will_Check_First_Char%为数字2,检查下一个字符
    goto :Batch_Files_Rename_Check_Start
) else (
    rem echo 字符%Will_Check_First_Char%不为数字2,进行下一个判断
    goto :Batch_Files_Rename_check_3   
)

rem 是否为3
:Batch_Files_Rename_check_3

if "%Will_Check_First_Char%"=="3" (
    rem echo 字符%Will_Check_First_Char%为数字3,检查下一个字符
    goto :Batch_Files_Rename_Check_Start
) else (
    rem echo 字符%Will_Check_First_Char%不为数字3,进行下一个判断
    goto :Batch_Files_Rename_check_4
)

rem 是否为4
:Batch_Files_Rename_check_4

if "%Will_Check_First_Char%"=="4" (
    rem echo 字符%Will_Check_First_Char%为数字4,检查下一个字符
    goto :Batch_Files_Rename_Check_Start
) else (
    rem echo 字符%Will_Check_First_Char%不为数字4,进行下一个判断
    goto :Batch_Files_Rename_check_5
)

rem 是否为5
:Batch_Files_Rename_check_5

if "%Will_Check_First_Char%"=="5" (
    rem echo 字符%Will_Check_First_Char%为数字5,检查下一个字符
    goto :Batch_Files_Rename_Check_Start
) else (
    rem echo 字符%Will_Check_First_Char%不为数字5,进行下一个判断
    goto :Batch_Files_Rename_check_6
)

rem 是否为6
:Batch_Files_Rename_check_6

if "%FirstChar%"=="6" (
    rem echo 字符%FirstChar%为数字6,检查下一个字符
    goto :Batch_Files_Rename_Check_Start
) else (
    rem echo 字符%FirstChar%不为数字6,进行下一个判断
    goto :Batch_Files_Rename_check_7
)

rem 是否为7
:Batch_Files_Rename_check_7

if "%Will_Check_First_Char%"=="7" (
    rem echo 字符%Will_Check_First_Char%为数字7,检查下一个字符
    goto :Batch_Files_Rename_Check_Start
) else (
    rem echo 字符%Will_Check_First_Char%不为数字7,进行下一个判断
    goto :Batch_Files_Rename_check_8
)

rem 是否为8
:Batch_Files_Rename_check_8

if "%Will_Check_First_Char%"=="8" (
    rem echo 字符%Will_Check_First_Char%为数字8,检查下一个字符
    goto :Batch_Files_Rename_Check_Start
) else (
    rem echo 字符%Will_Check_First_Char%不为数字8,进行下一个判断
    goto :Batch_Files_Rename_check_9
)

rem 是否为9
:Batch_Files_Rename_check_9

if "%Will_Check_First_Char%"=="9" (
    rem echo 字符%Will_Check_First_Char%为数字9,检查下一个字符
    goto :Batch_Files_Rename_Check_Start
) else (
    rem echo 字符%Will_Check_First_Char%不为数字9,进行下一个判断
    set Batch_Files_Rename_Check_Result_Is_Num=false
    goto :Batch_Files_Rename_Check_End
)


:Batch_Files_Rename_Check_End
rem Batch_Files_Rename_Check_Result_Is_Num的值为%Batch_Files_Rename_Check_Result_Is_Num%

if "%Batch_Files_Rename_Check_Result_Is_Num%"=="true" (
    goto :Batch_Files_Rename_Set_File_Format
) else if "%Batch_Files_Rename_Check_Result_Is_Num%"=="false" (
    echo 输入含有非数字字符,请重新输入:
    goto :Batch_Files_Rename_Suffix_Re_Input
)

rem #######################结束检查后缀名是否全为数字##################

:Batch_Files_Rename_Set_File_Format
rem 设置文件的后缀格式
rem echo 设置文件的后缀格式,例如.png:
rem set Batch_Files_Rename_File_Suffix=
rem set /p Batch_Files_Rename_File_Suffix=




for %%n in (*.*) do (
    call :Batch_Files_Rename_For_Exe %%n
rem ren "%%n" "!Batch_Files_Rename_prefix!!Batch_Files_Rename_Suffix!!Batch_Files_Rename_File_Suffix!"
set /a Batch_Files_Rename_Suffix+=1
)
goto :eof

rem 使用标签,因为在for循环中未能获取变量的值给另一个变量赋值
:Batch_Files_Rename_For_Exe

rem #############################开始获取文件后缀名#############################
set Current_File_Name=%1
set Tem_File_Name=%1
rem echo Current_File_Name:%Current_File_Name%
rem echo Tem_File_Name:%Tem_File_Name%

rem 设置开始查找文件后缀的索引为1
set Find_File_Suffiex_Index=1

rem 继续获取文件索引
:Batch_Files_Rename_For_Get_File_Suffiex_Name_Go_On

rem 检查最后一个字符是否为"."
set Current_Last_Char=%Tem_File_Name:~-1%
rem echo 当前最后一个字符为:%Current_Last_Char%


if "%Current_Last_Char%"=="." (
    goto :Batch_Files_Rename_For_Get_File_Suffiex_Name_Last_Char_Is_Dot
) else if "%Current_Last_Char%"=="" (
    goto :Batch_Files_Rename_For_Get_File_Suffiex_Name_Last_Char_Is_Empty
) else (
    goto :Batch_Files_Rename_For_Get_File_Suffiex_Name_Last_Char_Not_Is_Dot
)

rem 检测当前最后一个字符为"."
:Batch_Files_Rename_For_Get_File_Suffiex_Name_Last_Char_Is_Dot
rem echo 找到"."字符,Num为:%FileSuffiexIndex%
call, set Fiel_Suffiex=%%Current_File_Name:~-%Find_File_Suffiex_Index%%%
goto :Batch_Files_Rename_For_File_Is_Have_Suffix



rem 检测当前最后一个字符不是"."
:Batch_Files_Rename_For_Get_File_Suffiex_Name_Last_Char_Not_Is_Dot
set Tem_File_Name=%Tem_File_Name:~0,-1%

rem 当去掉最后一个字符时为空时
if "%Tem_File_Name%"=="" (
    goto :Batch_Files_Rename_For_File_Is_Not_Suffix
)

rem echo TemValue减1的值为:%TemFileName%
set /a Find_File_Suffiex_Index+=1
goto :Batch_Files_Rename_For_Get_File_Suffiex_Name_Go_On

rem 检测当前最后一个字符为空
:Batch_Files_Rename_For_Get_File_Suffiex_Name_Last_Char_Is_Empty
rem 未检测出后缀,按无后缀名文件处理
gotO :Batch_Files_Rename_For_File_Is_Not_Suffix

rem #############################结束获取文件后缀名#############################


:Batch_Files_Rename_For_File_Is_Not_Suffix
echo 文件%Current_File_Name%的后缀名为空
ren %Current_File_Name% %Batch_Files_Rename_prefix%%Batch_Files_Rename_Suffix%


gotO :eof

:Batch_Files_Rename_For_File_Is_Have_Suffix
echo 文件%Current_File_Name%的后缀名为:%Fiel_Suffiex%
if "%bDebug%"=="1" (
    echo 将%Current_File_Name% 重命名为 %Batch_Files_Rename_prefix%%Batch_Files_Rename_Suffix%%Fiel_Suffiex%
    pause
)

ren %Current_File_Name% %Batch_Files_Rename_prefix%%Batch_Files_Rename_Suffix%%Fiel_Suffiex%
gotO :eof

rem ######################################文件重命名End#####################################










