echo off
rem All right reserved, Qing Shan Gu Ren

rem ��ʼ�ӳٱ���
setlocal EnableDelayedExpansion

rem ���û����ҳ��936������ʾ����
chcp 936



rem ################################���ô�����ʽStart################################
rem ���ýű�����
set ManagerName=Ӧ�ó������ű�%date:~0,10%
set TitleName=Ӧ�ó������ű�%date:~0,10%-%time:~0,8%

rem ���ô��ڴ�С
Mode con cols=80 lines=47

rem ���ô�����ʽ������
color 0A
title %TitleName%
rem ################################���ô�����ʽEnd##################################



rem ################################���幦��ʹ�õı���Start################################

rem �����Ӳ˵�������һ��˵����õİ���
set Global_ReturnKey=0

rem BlankKeyΪ5���ո�,���Ե�����ʾ�ı���ʽ 
set BlankKey=   



rem ����ȫ�ֿ�ִ���ļ�·��
set Globle_ExeFileDirectory=""

rem ����ȫ�ֿ�ִ���ļ���
set Globle_ExeFileName=""

rem ����ȫ�ֽ���������
set Globle_KillTaskName=""

rem �����Ƿ�������,0��ʾ������,1��ʾ����
set bDebug=0

rem ����ȫ�ֱ����������������
set Global_ArrayIndex=0

rem ################################���幦��ʹ�õı���End#################################



















rem ################################���˵����Ӳ˵�����Start################################
set Two_Level_Menu_Array[0].TipName=ͨѶӦ�ù���˵�
set Two_Level_Menu_Array[0].Key=1
set Two_Level_Menu_Array[0].MenuTag=TwoLevel1
set Two_Level_Menu_Array[0].MenuArrayName=TwoLevelMenu1

set Two_Level_Menu_Array[1].TipName=����Ӧ�ù���˵�
set Two_Level_Menu_Array[1].Key=2
set Two_Level_Menu_Array[1].MenuTag=TwoLevel2
set Two_Level_Menu_Array[1].MenuArrayName=TwoLevelMenu2

set Two_Level_Menu_Array[2].TipName=����Ӧ�ù���˵�
set Two_Level_Menu_Array[2].Key=3
set Two_Level_Menu_Array[2].MenuTag=TwoLevel3
set Two_Level_Menu_Array[2].MenuArrayName=TwoLevelMenu3

set Two_Level_Menu_Array[3].TipName=�ű����ܹ���˵�
set Two_Level_Menu_Array[3].Key=4
set Two_Level_Menu_Array[3].MenuTag=TwoLevel4
set Two_Level_Menu_Array[3].MenuArrayName=TwoLevelMenu4
rem ################################���˵����Ӳ˵�����End##################################





rem ͨѶӦ�ù���˵�
rem ################################��һ�������˵�����Start################################
rem FileDirectory:��ʾ��ִ�г�������ڵ��ļ�Ŀ¼
rem FileName:��ʾ��ִ�г�����ļ���
rem KillTaskName:=��ʾ�رտ�ִ�г�������Ҫ��"����������"
rem TipName:�ڽű��˵�����ʾ��
rem StartKey:������ִ�г�����Ҫ�Ĺؼ���
rem CloseKey:�رտ�ִ�г�����Ҫ�Ĺؼ���
rem OpenDirectory:�򿪿�ִ���ļ�Ŀ¼�Ĺؼ���

set TwoLevelMenu1[0].TipName= ����
set TwoLevelMenu1[0].FileDirectory="D:\Tool_Install\Communication_Tool\DingDing\dingding_Install"
set TwoLevelMenu1[0].FileName=DingtalkLauncher.exe
set TwoLevelMenu1[0].KillTaskName="DingTalk.exe"
set TwoLevelMenu1[0].StartKey=1
set TwoLevelMenu1[0].CloseKey=1_1
set TwoLevelMenu1[0].OpenDirectory=1_2

set TwoLevelMenu1[1].TipName= ΢��
set TwoLevelMenu1[1].FileDirectory="D:\Tool_Install\Communication_Tool\WeChat\WeChat_Install\WeChat"
set TwoLevelMenu1[1].FileName=WeChat.exe
set TwoLevelMenu1[1].KillTaskName="WeChat.exe"
set TwoLevelMenu1[1].StartKey=2
set TwoLevelMenu1[1].CloseKey=2_1
set TwoLevelMenu1[1].OpenDirectory=2_2

set TwoLevelMenu1[2].TipName= ����
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
rem ################################��һ�������˵�����End################################




















rem ����Ӧ�ù���˵�
rem ################################�ڶ��������˵�����Start################################
set TwoLevelMenu2[0].TipName= EpicGame
set TwoLevelMenu2[0].FileDirectory="D:\Epic Games\Launcher\Portal\Binaries\Win64"
set TwoLevelMenu2[0].FileName=EpicGamesLauncher.exe
set TwoLevelMenu2[0].KillTaskName="EpicGamesLauncher.exe"
set TwoLevelMenu2[0].StartKey=1
set TwoLevelMenu2[0].CloseKey=1_1
set TwoLevelMenu2[0].OpenDirectory=1_2

set TwoLevelMenu2[1].TipName= ͼ������
set TwoLevelMenu2[1].FileDirectory="C:\Program Files\CodeAndWeb\TexturePacker\bin"
set TwoLevelMenu2[1].FileName=TexturePackerGUI.exe
set TwoLevelMenu2[1].KillTaskName="TexturePackerGUI.exe"
set TwoLevelMenu2[1].StartKey=2
set TwoLevelMenu2[1].CloseKey=2_1
set TwoLevelMenu2[1].OpenDirectory=2_2

set TwoLevelMenu2[2].TipName= �ٶ�����
set TwoLevelMenu2[2].FileDirectory="D:\�ٶ����̰�װ\BaiduNetdisk"
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

set TwoLevelMenu2[4].TipName= ��ʽ����
set TwoLevelMenu2[4].FileDirectory="D:\Tool_Install\Format_Tool\FormatFactory\FormatFactory"
set TwoLevelMenu2[4].FileName=FormatFactory.exe
set TwoLevelMenu2[4].KillTaskName="FormatFactory.exe"
set TwoLevelMenu2[4].StartKey=5
set TwoLevelMenu2[4].CloseKey=5_1
set TwoLevelMenu2[4].OpenDirectory=5_2

set TwoLevelMenu2[5].TipName= ��Ѷ����
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

set TwoLevelMenu2[10].TipName= �������
set TwoLevelMenu2[10].FileDirectory="D:\Tool_Install\CloudStorage_Tool\KuaKe\KuaKe_Install\quark-cloud-drive"
set TwoLevelMenu2[10].FileName=QuarkCloudDrive.exe
set TwoLevelMenu2[10].KillTaskName="QuarkCloudDrive.exe"
set TwoLevelMenu2[10].StartKey=11
set TwoLevelMenu2[10].CloseKey=11_1
set TwoLevelMenu2[10].OpenDirectory=11_2

set TwoLevelMenu2[11].TipName= �е�����ʵ�
set TwoLevelMenu2[11].FileDirectory="D:\Tool_Install\Language_Tool\YouDaoDictionary_Install\Dict"
set TwoLevelMenu2[11].FileName=YoudaoDict.exe
set TwoLevelMenu2[11].KillTaskName="YoudaoDict.exe"
set TwoLevelMenu2[11].StartKey=12
set TwoLevelMenu2[11].CloseKey=12_1
set TwoLevelMenu2[11].OpenDirectory=12_2

set TwoLevelMenu2[12].TipName= OBS¼������
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
rem ################################�ڶ��������˵�����End##################################







rem ����Ӧ�ù���˵�
rem ################################�����������˵�����Start################################

set TwoLevelMenu3[0].TipName= QQ����
set TwoLevelMenu3[0].FileDirectory="D:\Tool_Install\Music_Tool\QQ_Music\Install\QQMusic1942.20.06.16"
set TwoLevelMenu3[0].FileName=QQMusic.exe
set TwoLevelMenu3[0].KillTaskName="QQMusic.exe"
set TwoLevelMenu3[0].StartKey=1
set TwoLevelMenu3[0].CloseKey=1_1
set TwoLevelMenu3[0].OpenDirectory=1_2

set TwoLevelMenu3[1].TipName= ϲ����������
set TwoLevelMenu3[1].FileDirectory="D:\Tool_Install\Music_Tool\XiMaLaYa\XiMaLaYaTingShu_Install"
set TwoLevelMenu3[1].FileName=ϲ������.exe
set TwoLevelMenu3[1].KillTaskName="ϲ������.exe"
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

set TwoLevelMenu3[4].TipName= ���������
set TwoLevelMenu3[4].FileDirectory="D:\Tool_Install\Game_Tool\LeiGod\LeiGod_Acc"
set TwoLevelMenu3[4].FileName=leigod.exe
set TwoLevelMenu3[4].KillTaskName="leigod.exe"
set TwoLevelMenu3[4].StartKey=5
set TwoLevelMenu3[4].CloseKey=5_1
set TwoLevelMenu3[4].OpenDirectory=5_2


set TwoLevelMenu3[5].TipName= ����������
set TwoLevelMenu3[5].FileDirectory="D:\Tool_Install\Music_Tool\WYY_Music\CloudMusic_Install\CloudMusic"
set TwoLevelMenu3[5].FileName=cloudmusic.exe
set TwoLevelMenu3[5].KillTaskName="cloudmusic.exe"
set TwoLevelMenu3[5].StartKey=6
set TwoLevelMenu3[5].CloseKey=6_1
set TwoLevelMenu3[5].OpenDirectory=6_2

set TwoLevelMenu3[6].TipName= С˵�Ķ���
set TwoLevelMenu3[6].FileDirectory="D:\Tool_Install\TextReader_Tool\TextReader\Koodo Reader"
set TwoLevelMenu3[6].FileName=KoodoReader.exe
set TwoLevelMenu3[6].KillTaskName="KoodoReader.exe"
set TwoLevelMenu3[6].StartKey=7
set TwoLevelMenu3[6].CloseKey=7_1
set TwoLevelMenu3[6].OpenDirectory=7_2
rem ################################�����������˵�����End##################################


rem �ű����ܹ���˵�
rem ��һ���ֲ�Ҫ������,��������ϤDOS����
rem ################################���ĸ������˵�����Start################################
set TwoLevelMenu4[0].TipName= ��������������
set TwoLevelMenu4[0].Key=1
set TwoLevelMenu4[0].Tag=Function_RenameFile

rem ################################�ڶ��������˵�����End##################################
















rem ################################���˵�����Start################################
rem �������˵�ѡ��
:Mian_Menu
set Global_EnterMainMenuTag=Mian_Menu
cls
echo ###################################################
echo ###################################################
echo ############%ManagerName%#############
echo ###################################################
echo ###################################################

rem ��ʼ�������˵���ʾ�ı�����
call :Function_CreateMainMenuTipMessage
rem �����������˵���ʾ�ı�����

rem ��ʼ�����������,���������,���÷���ִ�����֮��,��ȷ����ִ�е�����
set Global_ArrayMenuName=
set Global_TagName=
call :Function_SelectTwoLevelMenu Global_ArrayMenuName Global_TagName

echo Global_TagNameΪ:%Global_ArrayMenuName%
goto :%Global_TagName%
rem ################################���˵�����End################################



















rem ################################Ӧ�ó������˵�����Start################################
:TwoLevel1
:TwoLevel2
:TwoLevel3
cls
rem ��ʼ����Ӧ�ó������˵�ͼ��ע������
call:Function_CreateImageTip
rem ��������Ӧ�ó������˵�ͼ��ע������

rem ��ʼ����Ӧ�ó������˵���ʾ�ı�����
call:Function_CreateTipMessage Global_ArrayMenuName 1
rem ��������Ӧ�ó������˵���ʾ�ı�����

rem ��ʼ������������,׼�������Ӧ��Ϣ,������ִ�����֮��,��Ҫ����Ϣ�Ѿ�����
rem OperationNumΪ0��ʾ�������˵�,Ϊ1��ʾ�򿪳���,Ϊ2��ʾ�رճ���
set OperationNum=
call:Function_ProcessExe Global_ArrayMenuName OperationNum

if "%OperationNum%"=="0" (
    goto :%Global_EnterMainMenuTag%
)

if "%OperationNum%"=="1" (
    echo ��������
    call:Function_LauncherAPP
)

if "%OperationNum%"=="2" (
    echo �رճ���
    call:Function_CloseAPP
)

if "%OperationNum%"=="3" (
    echo ��Ŀ¼
    call:Function_OpenDirectory
)

rem ����ִ�����,�ٴε����ö����˵���ʼλ��
goto :TwoLevel3
rem ################################Ӧ�ó������˵�����End################################














rem ################################�ű����ܹ���˵�����Start################################
:TwoLevel4
cls
rem ��ʼ���ɽű����ܹ���˵�ͼ��ע������
call:Function_CreateImageTip
rem �������ɽű����ܹ���˵�ͼ��ע������

rem ��ʼ����Ӧ�ó������˵���ʾ�ı�����
call:Function_CreateJSTipMessage Global_ArrayMenuName 1
rem ��������Ӧ�ó������˵���ʾ�ı�����

rem ��ʼ������������,׼�������Ӧ��Ϣ,������ִ�����֮��,��Ҫ����Ϣ�Ѿ�����
rem OperationNumΪ0��ʾ�������˵�,Ϊ1��ʾִ�нű�
set OperationNum=
set Global_JSTag=
call:Function_ProcessJS Global_ArrayMenuName OperationNum Global_JSTag

rem ���벻��Ϊ0
if "%OperationNum%"=="0" (
    goto :%Global_EnterMainMenuTag%
)

rem ���벻��Ϊ��
if "%Global_JSTag%" NEQ "" (
    call:%Global_JSTag%
)

rem ����ִ�����,�ٴε����ö����˵���ʵλ��
goto :TwoLevel4
rem ################################�ű����ܹ���˵�����End################################


























rem ################################���˵���ʾ����################################
rem ################################���˵���ʾ����################################
rem ################################���˵���ʾ����################################
rem ������ʾ�ı��˵�����
rem �﷨:
rem ��һ��:ʹ��call :Function_CreateMainMenuTipMessage
:Function_CreateMainMenuTipMessage

rem ������ʼ����Ϊ0
set Global_ArrayIndex=0

echo Tip:

rem ����Ƿ��ж���
:Function_CreateMainMenuTipMessage0
if defined Two_Level_Menu_Array[%Global_ArrayIndex%].TipName (
    goto :Function_CreateMainMenuTipMessage1
) else (
    goto :Function_CreateMainMenuTipMessage2
)

:Function_CreateMainMenuTipMessage1

call, echo %BlankKey%��%%Two_Level_Menu_Array[%Global_ArrayIndex%].Key%%�� ���� %%Two_Level_Menu_Array[%Global_ArrayIndex%].TipName%%

rem ������1
set /a Global_ArrayIndex+=1

rem ���ؼ���ȥ�ж�
goto :Function_CreateMainMenuTipMessage0



:Function_CreateMainMenuTipMessage2
echo Tip:�����Ӧָ��ɽ����Ӧ�˵�
if "%bDebug%"=="1" (
    echo �����˵���ʾ�����������
    pause
)
goto :eof
rem ################################���˵����ɶ����˵���ʾ����End################################












































































rem ##############################���˵���������ѡ��Ҫ����Ķ����˵�##############################
rem ##############################���˵���������ѡ��Ҫ����Ķ����˵�##############################
rem ##############################���˵���������ѡ��Ҫ����Ķ����˵�##############################
rem ��������ѡ��Ҫ��ת�Ķ����˵�
rem �﷨:
rem ��һ��:ʹ��call::Function_SelectTwoLevelMenu ����1,����2
rem ����1:���ҳ���������
rem ����2:Ҫ��ת�ı�ǩ��

:Function_SelectTwoLevelMenu
set Local_TemArrayName=%1
set Local_TemTagName=%2

echo ������ָ����,��Enter��ȷ��:
goto :MainMenuInput1

:MainMenuInput2
echo ��һ����������,����������ָ����,��Enter��ȷ��:

:MainMenuInput1
rem �����һ��,��ȻFirstInputName�ᴢ��ǰһ������
set MianMenuInputValue=
set /p MianMenuInputValue=

echo ������ָ������%MianMenuInputValue%,���������Ӧ�˵�.....

rem �ų�����������
if "%MianMenuInputValue%"=="" (
    echo �����
    goto :MainMenuInput2
)

rem ��ʼ��������һ�������˵�


rem ������ʼ����Ϊ0
set Global_ArrayIndex=0

:Function_SelectTwoLevelMenu_1

rem ����Ӧ�������޶���
if defined Two_Level_Menu_Array[%Global_ArrayIndex%].TipName (
    goto :Function_SelectTwoLevelMenu_2
) else (
    goto :Function_SelectTwoLevelMenu_3
)

rem �����ж�Ӧ����,������밴���Ƿ����
:Function_SelectTwoLevelMenu_2

rem ��ȡ�����Keyֵ
call, set %Local_TemArrayName%=%%Two_Level_Menu_Array[%Global_ArrayIndex%].MenuArrayName%%
call, set %Local_TemTagName%=%%Two_Level_Menu_Array[%Global_ArrayIndex%].MenuTag%%
call, set Local_TemTwoLevelMenuKeyValue=%%Two_Level_Menu_Array[%Global_ArrayIndex%].Key%%

if %Local_TemTwoLevelMenuKeyValue%==%MianMenuInputValue% (
    goto :Function_SelectTwoLevelMenu_4
) else (
    goto :Function_SelectTwoLevelMenu_5
)


rem û�ж����򷵻�,���¿�ʼ����
:Function_SelectTwoLevelMenu_3
goto :MainMenuInput2


rem ����ָ�����,�ı䴫���ʵ��ֵ
:Function_SelectTwoLevelMenu_4
goto :eof


rem ����,����+1,������һ���ж�,
:Function_SelectTwoLevelMenu_5
set /a Global_ArrayIndex+=1
goto :Function_SelectTwoLevelMenu_1
rem #####################################################################################
rem #####################################################################################
rem #####################################################################################




























































rem ################################���ɳ������˵���ʾ�ı�����Start################################
rem ������ʾ�ı��˵�����
rem �﷨:
rem ��һ��:ʹ��call::Function_CreateTipMessage ����1
rem ����1:���г��������ر���Ϣ����������
rem ����2:���������Ƿ�Ҫ��ʾ�������˵���ʾ,ȡָ1Ϊ��ʾ,0Ϊ����ʾ

:Function_CreateTipMessage
call,set Local_TemTwoLevelMenuName=%%%1%%
set Local_ShowMainMenuTip=%2

rem ������ʼ����Ϊ0
set Global_ArrayIndex=0


echo Tip:
rem �Ƿ���ʾ �������˵���ʾ�ı�
if "%Local_ShowMainMenuTip%"=="1" (
    echo %BlankKey%��%Global_ReturnKey%���������˵�
)

rem //����Ƿ��ж�����Ԫ��
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
rem echo ֵΪ:%Local_StartKeyValue%  %Local_CloseKeyValue%  %Local_TipNameValue%
echo %BlankKey%��%Local_StartKeyValue%������ ��%Local_CloseKeyValue%���ر�%Local_TipNameValue%

rem ������1
set /a Global_ArrayIndex+=1

rem ���ؼ���ȥ�ж�
goto :Function_CreateTipMessage0

:Function_CreateTipMessage2
echo Tip:�����Ӧָ��ɴ򿪻�ر�Ӧ��
if "%bDebug%"=="1" (
    echo Ӧ�ó������˵���ʾ�ı������������
    pause
)

goto :eof
rem ################################����Ӧ�ó������˵���ʾ�ı�����Start################################




















rem ##############################���˵���������ѡ��Ҫ����Ĳ���##############################
rem ##############################���˵���������ѡ��Ҫ����Ĳ���##############################
rem ##############################���˵���������ѡ��Ҫ����Ĳ���##############################
rem ���˵���������ѡ��Ҫ����Ĳ���
rem �﷨:
rem ��һ��:ʹ��call::Function_ProcessExe ����1,����2
rem ����1:���ҳ���������
rem ����2:��ѡ�Ĳ�����
:Function_ProcessExe

call,set Local_Value1=%%%1%%
set Local_Value2=%2

rem ��һ������
:Function_ProcessExe1
echo ������ָ����,��Enter��ȷ��:

goto :Function_ProcessExe3

rem �ǵ�һ�������ָ����
:Function_ProcessExe2
echo ��һ����������,����������ָ����,��Enter��ȷ��:

:Function_ProcessExe3
rem ����Ϊ����Ϊ�˳�ʼ��APP_Manager_Menu_Input_Num,��Ȼ�ڶ��������ֵ��Ϊ��һ�������ֵ
set Local_InputValue=
set /p Local_InputValue=

rem ���벻��Ϊ��.Ϊ������Ҫ��������
if "%Local_InputValue%"=="" (
    goto:Function_ProcessExe2
)

rem ����ֵΪ����ķ������˵�����ʱ,���ص����˵�
if "%Local_InputValue%"=="%Global_ReturnKey%" (
    set %Local_Value2%=0
    goto:eof
)


rem ��ʼ��ȡ���Զ�Ӧ������
rem ������ʼ����Ϊ0
set Global_ArrayIndex=0

:Function_ProcessExe4
rem ����ӦԪ����û�ж���
if defined %Local_Value1%[%Global_ArrayIndex%].StartKey (
    goto :Function_ProcessExe5
) else (
    goto :Function_ProcessExe6
)

rem û�ж����ʾ����������,��Ҫ��������
:Function_ProcessExe6
goto:Function_ProcessExe2

rem �ж���,������ж�
:Function_ProcessExe5

rem ��ʱ��ȡ�����Ӧ����������ָ��͹ر�ָ��
call, Set Local_StartKey=%%%Local_Value1%[%Global_ArrayIndex%].StartKey%%
call, Set Local_CloseKey=%%%Local_Value1%[%Global_ArrayIndex%].CloseKey%%
call, set Local_OpenDirectory=%%%Local_Value1%[%Global_ArrayIndex%].OpenDirectory%%

rem �ж�����ָ���Ƿ����������ָ����ͬ
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

rem ����,��������1,������һ���ж�
:Function_ProcessExe10
rem ������1
set /a Global_ArrayIndex+=1
goto :Function_ProcessExe4


:Function_ProcessExe11
rem ������ȡ���Զ�Ӧ������
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
























rem ################################���ɽű����ܹ���˵���ʾ�ı�����Start################################
rem ################################���ɽű����ܹ���˵���ʾ�ı�����Start################################
rem ################################���ɽű����ܹ���˵���ʾ�ı�����Start################################
rem ������ʾ�ı��˵�����
rem �﷨:
rem ��һ��:ʹ��call:Function_CreateJSTipMessage ����1,����2
rem ����2:�����ű�������Ϣ������
rem ����2:���������Ƿ�Ҫ��ʾ�������˵���ʾ
:Function_CreateJSTipMessage
call, set Local_Value1=%%%1%%
set Local_Value2=%2

rem ������ʼ����Ϊ0
set Global_ArrayIndex=0


echo Tip:
if "%Local_Value2%"=="1" (
    echo %BlankKey%��%Global_ReturnKey%���������˵�
)

rem ����Ƿ��ж�Ӧ��Ԫ��
:Function_CreateJSTipMessage1
if defined %Local_Value1%[%Global_ArrayIndex%].TipName (
    goto :Function_CreateJSTipMessage2
) else (
    goto :Function_CreateJSTipMessage3
)

:Function_CreateJSTipMessage2
call, echo %BlankKey%��%%%Local_Value1%[%Global_ArrayIndex%].Key%%������%%%Local_Value1%[%Global_ArrayIndex%].TipName%%
rem ������1
set /a Global_ArrayIndex+=1
goto :Function_CreateJSTipMessage1

:Function_CreateJSTipMessage3
echo Tip:�����Ӧָ���ִ�ж�Ӧ�ű�����
if "%bDebug%"=="1" (
    echo �ű����ܹ���˵���ʾ�ı������������
    pause
)

goto :eof
rem #####################################################################################
rem #####################################################################################
rem #####################################################################################






















rem ##############################�ű��˵���������ѡ��Ҫ����Ĳ���##############################
rem ##############################�ű��˵���������ѡ��Ҫ����Ĳ���##############################
rem ##############################�ű��˵���������ѡ��Ҫ����Ĳ���##############################
rem ��һ��:ʹ��call::Function_ProcessJS ����1,����2,����3
rem ����1:���ҳ���������
rem ����2:��ѡ�Ĳ�����
rem ����3:ִ�нű���Ҫ��ת�ı�ǩ��
:Function_ProcessJS
call,set Local_Value1=%%%1%%
set Local_Value2=%2
set Local_Value3=%3

rem ��һ������
:Function_ProcessJS1
echo ������ָ����,��Enter��ȷ��:
goto :Function_ProcessJS3


rem �ǵ�һ�������ָ����
:Function_ProcessJS2
echo ��һ����������,����������ָ����,��Enter��ȷ��:

:Function_ProcessJS3
rem ����Ϊ����Ϊ�˳�ʼ��JS_Manager_Menu_Input_Num,��Ȼ�ڶ��������ֵ��Ϊ��һ�������ֵ
set Local_InputValue=
set /p Local_InputValue=


rem ����ֵΪ����ķ������˵�����ʱ�����ص����˵�
if "%Local_InputValue%"=="%Global_ReturnKey%" (
    set %Local_Value2%=0
    goto :eof
)

rem ���벻��Ϊ��
if "%Local_InputValue%"=="" (
    goto :Function_ProcessJS2
)


rem ��ʼ��ȡ���Զ�Ӧ������
rem ������ʼ����Ϊ0
set Global_ArrayIndex=0

:Function_ProcessJS4
if defined %Local_Value1%[%Global_ArrayIndex%].Key (
    rem ����
    goto :Function_ProcessJS5
) else (
    rem δ����
    goto :Function_ProcessJS6
)

rem �ж�������м���ж�
:Function_ProcessJS5

rem ��ȡ����Keyֵ
call, Set Local_KeyValue=%%%Local_Value1%[%Global_ArrayIndex%].Key%%
if %Local_KeyValue%==%Local_InputValue% (
    gotO :Function_ProcessJS7
) else (
    gotO :Function_ProcessJS8
)


rem ���,��������ȡ����������ǩ
:Function_ProcessJS7
goto :Function_ProcessJS9

rem ����,�������һ���ж�
:Function_ProcessJS8
rem ������1
set /a Global_ArrayIndex+=1
goto :Function_ProcessJS4


rem û�ж����򷵻�
:Function_ProcessJS6
goto :Function_ProcessJS2


:Function_ProcessJS9
rem ������ȡ���Զ�Ӧ������
call,set %Local_Value3%=%%%Local_Value1%[%Global_ArrayIndex%].Tag%%
set %Local_Value2%=1
goto :eof
rem #####################################################################################
rem #####################################################################################
rem #####################################################################################


























rem #######################����Ӧ�ó���Start##########################
rem ����Ӧ�ó���
rem �﷨:
rem ��һ��:ʹ��call:Function_LauncherAPP
:Function_LauncherAPP
if exist %Globle_ExeFileDirectory% (
    rem �ļ���·������
    goto :Function_LauncherAPP1
)else (
    rem �ļ���·��������
    goto :Function_LauncherAPP2
)

rem �ļ���·�����ڽ��е���ӦĿ¼
:Function_LauncherAPP1
cd /d %Globle_ExeFileDirectory%

if exist %Globle_ExeFileName% (
    rem �ļ�����
    goto :Function_LauncherAPP3
)else (
    rem �ļ�������
    goto :Function_LauncherAPP4
)

rem �ļ�Ŀ¼������,�����÷���
:Function_LauncherAPP2
if "%bDebug%"=="1" (
    echo �ļ�Ŀ¼������:%Globle_ExeFileDirectory%
    pause
)

rem ���
set Globle_ExeFileDirectory=""
set Globle_ExeFileName=""
set Globle_KillTaskName=""
goto :eof


rem �ļ�����,��������
:Function_LauncherAPP3
if "%bDebug%"=="1" (
    echo ��ӦĿ¼���ڶ�Ӧ�ļ�,׼������:"Ŀ¼":%Globle_ExeFileDirectory%  "�ļ�":%Globle_ExeFileName%
    pause
)
rem ��������
start %Globle_ExeFileName%

rem ���
set Globle_ExeFileDirectory=""
set Globle_ExeFileName=""
set Globle_KillTaskName=""

rem ���ص�ǰһ��Ŀ¼
popd
goto :eof

rem �ļ�������,�����÷���
:Function_LauncherAPP4
if "%bDebug%"=="1" (
    echo ��ӦĿ¼�����ڶ�Ӧ�ļ�:"Ŀ¼":%Globle_ExeFileDirectory%  "�ļ�":%Globle_ExeFileName%
    pause
)

rem ���
set Globle_ExeFileDirectory=""
set Globle_ExeFileName=""
set Globle_KillTaskName=""

rem ���ص�ǰһ��Ŀ¼
popd
goto :eof
rem #######################����Ӧ�ó���End##########################



















rem ###################�ر�Ӧ�ó���Start##############################
rem �ر�Ӧ�ó���
rem �﷨:
rem ��һ��:ʹ��call:Function_CloseAPP
:Function_CloseAPP

if "%bDebug%"=="1" (
    echo ׼���ر�Ӧ�ó���:%Globle_KillTaskName%
    pause
)

taskkill /F /T /IM %Globle_KillTaskName%

rem ����taskkill����֮��"Globle_KillTaskName"�������
set Globle_ExeFileDirectory=""
set Globle_ExeFileName=""
set Globle_KillTaskName=""
goto :eof
rem ###################�ر�Ӧ�ó���End################################








rem ###################���ļ�Ŀ¼Start##############################
rem ���ļ�Ŀ¼
rem �÷�:
rem ��һ��:ʹ��call:Function_OpenDirectory
:Function_OpenDirectory

if "%bDebug%"=="1" (
    echo ���ļ�Ŀ¼����:�ļ�Ŀ¼Ϊ:%Globle_ExeFileDirectory%
    pause
)

if exist %Globle_ExeFileDirectory% (
    rem ���ڶ�ӦĿ¼
    explorer %Globle_ExeFileDirectory%
)

rem ����explorer֮��,���
set Globle_ExeFileDirectory=""
set Globle_ExeFileName=""
set Globle_KillTaskName=""
goto :eof
rem ###################���ļ�Ŀ¼End################################










rem ##############################ͼ��ע��Start#################################
rem ##############################ͼ��ע��Start#################################
rem ##############################ͼ��ע��Start#################################
rem ��ӡͼ��ע��
rem �﷨:
rem ��һ��:ʹ��call:Function_CreateImageTip

:Function_CreateImageTip

rem ����һ���е�����,������һ���ܶ�...����
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
rem ###################################ͼ��ע��End#################################################





























rem ###################################�����ַ����Ƿ����Start######################################
rem �����ַ����Ƿ����ָ���ַ���
rem �﷨:
rem ��һ��:ʹ��call:Contb_Is_Contain_Sub_String_MainainSubString_Main ����1,����2,����3
rem ����1:Ҫ���ҵ��ַ���
rem ����2:Ҫ���ҵ����ַ���
rem ����3:������Ҫ��ת�ı�ǩ
rem ������true��false���ַ�,ע��ʹ��%1������
:b_Is_Contain_Sub_String_Main
set MainStr=%1
set SubStr=%2
set WillGotoTag=%3

echo %MainStr%| findstr /c:%SubStr% && set FindResult=true ||set FindResult=false
call :%WillGotoTag% %FindResult%
rem ###################################�����ַ����Ƿ����End#########################################


























rem ######################################�ļ�������Start#####################################
rem ######################################�ļ�������Start#####################################
rem ######################################�ļ�������Start#####################################
rem ######################################�ļ�������Start#####################################
:Function_RenameFile

rem ��һ�������ļ���·��
:Batch_Files_Rename_First_Input_Directory
echo �������ļ���·��:
goto :Batch_Files_Rename_Input_File_Dirctory_Complete

rem �ڶ��������ļ���·��
:Batch_Files_Rename_Second_Input_Directory
echo �ļ���·������,�����������ļ���·��:

:Batch_Files_Rename_Input_File_Dirctory_Complete
rem ����Ϊ����Ϊ�˳�ʼ��FolderDirectory,��Ȼ�ڶ��������ֵ��Ϊ��һ�������ֵ
set Batch_Files_Rename_Folder_Directory=
set /p Batch_Files_Rename_Folder_Directory=

rem ����ļ����Ƿ�Ϊ��Ч·��
if exist "%Batch_Files_Rename_Folder_Directory%" (
    echo �ļ���·������
    rem echo %FolderDirectory%
) else (
    rem ����ļ�·��������,����Ҫ�ڶ��������ļ�·��
    echo �ļ���·��������
    goto :Batch_Files_Rename_Second_Input_Directory
) 

rem �ѵ�ǰ·���л���������ļ���·��
cd /d %Batch_Files_Rename_Folder_Directory%


rem ��ʼ�ļ���ǰ׺����
echo ���������ļ���ǰ׺:
set Batch_Files_Rename_prefix=
set /p Batch_Files_Rename_prefix=

rem ��ʼ�ļ�����׺����
echo �������׺��,��֧������,Ĭ��Ϊ1,�����ļ�����Ϊ(ǰ׺��+��׺��+�ļ���ʽ��׺)
:Batch_Files_Rename_Suffix_Re_Input
set TemSuffix=
set /p TemSuffix=

rem echo ����:%TemSuffix%

if "%TemSuffix%"=="" (
    echo �����׺��Ϊ��,��Ĭ��Ϊ1
    set Batch_Files_Rename_Suffix=1
) else (
    rem echo ��׺���ǿ�,���м��
    set Batch_Files_Rename_Suffix=%TemSuffix%
)

rem #######################��ʼ����׺���Ƿ�ȫΪ����##################
rem Ĭ�Ͽ�ʼ�ļ����ĿΪ0
rem ������ʱ�ĺ�׺�������ñ�������зָ��ַ�
set Batch_Files_Rename_Will_Check_Content=%Batch_Files_Rename_Suffix%

rem �ȼ���ȫΪ����
set Batch_Files_Rename_Check_Result_Is_Num=true

rem ��鵱ǰ���ַ�
:Batch_Files_Rename_Check_Start


rem ��ǰҪ���������Ƿ�Ϊ��
if "%Batch_Files_Rename_Will_Check_Content%"=="" (
    rem �ַ�Ϊ��,��ʾ�����ַ��Ѿ�������
    goto :Batch_Files_Rename_Check_End
)

set Will_Check_First_Char=%Batch_Files_Rename_Will_Check_Content:~0,1%
set Batch_Files_Rename_Will_Check_Content=%Batch_Files_Rename_Will_Check_Content:~1%

rem Batch_Files_Rename_Will_Check_ContentΪ:%Batch_Files_Rename_Will_Check_Content%
rem Will_Check_First_CharΪ:%Will_Check_First_Char%

rem ��ʼ�����ַ����
rem �Ƿ�Ϊ0
:Batch_Files_Rename_check_0

if "%Will_Check_First_Char%"=="0" (
    rem �ַ�%Will_Check_First_Char%Ϊ����0,�����һ���ַ�
    goto :Batch_Files_Rename_Check_Start
) else (
    rem echo �ַ�%Will_Check_First_Char%��Ϊ����0,������һ���ж�
    goto :Batch_Files_Rename_check_1
)

rem �Ƿ�Ϊ1
:Batch_Files_Rename_check_1

if "%Will_Check_First_Char%"=="1" (
    rem �ַ�%Will_Check_First_Char%Ϊ����1,�����һ���ַ�
    goto :Batch_Files_Rename_Check_Start
) else (
    rem echo �ַ�%Will_Check_First_Char%��Ϊ����1,������һ���ж�
    goto :Batch_Files_Rename_check_2
)

rem �Ƿ�Ϊ2
:Batch_Files_Rename_check_2

if "%Will_Check_First_Char%"=="2" (
    rem echo �ַ�%Will_Check_First_Char%Ϊ����2,�����һ���ַ�
    goto :Batch_Files_Rename_Check_Start
) else (
    rem echo �ַ�%Will_Check_First_Char%��Ϊ����2,������һ���ж�
    goto :Batch_Files_Rename_check_3   
)

rem �Ƿ�Ϊ3
:Batch_Files_Rename_check_3

if "%Will_Check_First_Char%"=="3" (
    rem echo �ַ�%Will_Check_First_Char%Ϊ����3,�����һ���ַ�
    goto :Batch_Files_Rename_Check_Start
) else (
    rem echo �ַ�%Will_Check_First_Char%��Ϊ����3,������һ���ж�
    goto :Batch_Files_Rename_check_4
)

rem �Ƿ�Ϊ4
:Batch_Files_Rename_check_4

if "%Will_Check_First_Char%"=="4" (
    rem echo �ַ�%Will_Check_First_Char%Ϊ����4,�����һ���ַ�
    goto :Batch_Files_Rename_Check_Start
) else (
    rem echo �ַ�%Will_Check_First_Char%��Ϊ����4,������һ���ж�
    goto :Batch_Files_Rename_check_5
)

rem �Ƿ�Ϊ5
:Batch_Files_Rename_check_5

if "%Will_Check_First_Char%"=="5" (
    rem echo �ַ�%Will_Check_First_Char%Ϊ����5,�����һ���ַ�
    goto :Batch_Files_Rename_Check_Start
) else (
    rem echo �ַ�%Will_Check_First_Char%��Ϊ����5,������һ���ж�
    goto :Batch_Files_Rename_check_6
)

rem �Ƿ�Ϊ6
:Batch_Files_Rename_check_6

if "%FirstChar%"=="6" (
    rem echo �ַ�%FirstChar%Ϊ����6,�����һ���ַ�
    goto :Batch_Files_Rename_Check_Start
) else (
    rem echo �ַ�%FirstChar%��Ϊ����6,������һ���ж�
    goto :Batch_Files_Rename_check_7
)

rem �Ƿ�Ϊ7
:Batch_Files_Rename_check_7

if "%Will_Check_First_Char%"=="7" (
    rem echo �ַ�%Will_Check_First_Char%Ϊ����7,�����һ���ַ�
    goto :Batch_Files_Rename_Check_Start
) else (
    rem echo �ַ�%Will_Check_First_Char%��Ϊ����7,������һ���ж�
    goto :Batch_Files_Rename_check_8
)

rem �Ƿ�Ϊ8
:Batch_Files_Rename_check_8

if "%Will_Check_First_Char%"=="8" (
    rem echo �ַ�%Will_Check_First_Char%Ϊ����8,�����һ���ַ�
    goto :Batch_Files_Rename_Check_Start
) else (
    rem echo �ַ�%Will_Check_First_Char%��Ϊ����8,������һ���ж�
    goto :Batch_Files_Rename_check_9
)

rem �Ƿ�Ϊ9
:Batch_Files_Rename_check_9

if "%Will_Check_First_Char%"=="9" (
    rem echo �ַ�%Will_Check_First_Char%Ϊ����9,�����һ���ַ�
    goto :Batch_Files_Rename_Check_Start
) else (
    rem echo �ַ�%Will_Check_First_Char%��Ϊ����9,������һ���ж�
    set Batch_Files_Rename_Check_Result_Is_Num=false
    goto :Batch_Files_Rename_Check_End
)


:Batch_Files_Rename_Check_End
rem Batch_Files_Rename_Check_Result_Is_Num��ֵΪ%Batch_Files_Rename_Check_Result_Is_Num%

if "%Batch_Files_Rename_Check_Result_Is_Num%"=="true" (
    goto :Batch_Files_Rename_Set_File_Format
) else if "%Batch_Files_Rename_Check_Result_Is_Num%"=="false" (
    echo ���뺬�з������ַ�,����������:
    goto :Batch_Files_Rename_Suffix_Re_Input
)

rem #######################��������׺���Ƿ�ȫΪ����##################

:Batch_Files_Rename_Set_File_Format
rem �����ļ��ĺ�׺��ʽ
rem echo �����ļ��ĺ�׺��ʽ,����.png:
rem set Batch_Files_Rename_File_Suffix=
rem set /p Batch_Files_Rename_File_Suffix=




for %%n in (*.*) do (
    call :Batch_Files_Rename_For_Exe %%n
rem ren "%%n" "!Batch_Files_Rename_prefix!!Batch_Files_Rename_Suffix!!Batch_Files_Rename_File_Suffix!"
set /a Batch_Files_Rename_Suffix+=1
)
goto :eof

rem ʹ�ñ�ǩ,��Ϊ��forѭ����δ�ܻ�ȡ������ֵ����һ��������ֵ
:Batch_Files_Rename_For_Exe

rem #############################��ʼ��ȡ�ļ���׺��#############################
set Current_File_Name=%1
set Tem_File_Name=%1
rem echo Current_File_Name:%Current_File_Name%
rem echo Tem_File_Name:%Tem_File_Name%

rem ���ÿ�ʼ�����ļ���׺������Ϊ1
set Find_File_Suffiex_Index=1

rem ������ȡ�ļ�����
:Batch_Files_Rename_For_Get_File_Suffiex_Name_Go_On

rem ������һ���ַ��Ƿ�Ϊ"."
set Current_Last_Char=%Tem_File_Name:~-1%
rem echo ��ǰ���һ���ַ�Ϊ:%Current_Last_Char%


if "%Current_Last_Char%"=="." (
    goto :Batch_Files_Rename_For_Get_File_Suffiex_Name_Last_Char_Is_Dot
) else if "%Current_Last_Char%"=="" (
    goto :Batch_Files_Rename_For_Get_File_Suffiex_Name_Last_Char_Is_Empty
) else (
    goto :Batch_Files_Rename_For_Get_File_Suffiex_Name_Last_Char_Not_Is_Dot
)

rem ��⵱ǰ���һ���ַ�Ϊ"."
:Batch_Files_Rename_For_Get_File_Suffiex_Name_Last_Char_Is_Dot
rem echo �ҵ�"."�ַ�,NumΪ:%FileSuffiexIndex%
call, set Fiel_Suffiex=%%Current_File_Name:~-%Find_File_Suffiex_Index%%%
goto :Batch_Files_Rename_For_File_Is_Have_Suffix



rem ��⵱ǰ���һ���ַ�����"."
:Batch_Files_Rename_For_Get_File_Suffiex_Name_Last_Char_Not_Is_Dot
set Tem_File_Name=%Tem_File_Name:~0,-1%

rem ��ȥ�����һ���ַ�ʱΪ��ʱ
if "%Tem_File_Name%"=="" (
    goto :Batch_Files_Rename_For_File_Is_Not_Suffix
)

rem echo TemValue��1��ֵΪ:%TemFileName%
set /a Find_File_Suffiex_Index+=1
goto :Batch_Files_Rename_For_Get_File_Suffiex_Name_Go_On

rem ��⵱ǰ���һ���ַ�Ϊ��
:Batch_Files_Rename_For_Get_File_Suffiex_Name_Last_Char_Is_Empty
rem δ������׺,���޺�׺���ļ�����
gotO :Batch_Files_Rename_For_File_Is_Not_Suffix

rem #############################������ȡ�ļ���׺��#############################


:Batch_Files_Rename_For_File_Is_Not_Suffix
echo �ļ�%Current_File_Name%�ĺ�׺��Ϊ��
ren %Current_File_Name% %Batch_Files_Rename_prefix%%Batch_Files_Rename_Suffix%


gotO :eof

:Batch_Files_Rename_For_File_Is_Have_Suffix
echo �ļ�%Current_File_Name%�ĺ�׺��Ϊ:%Fiel_Suffiex%
if "%bDebug%"=="1" (
    echo ��%Current_File_Name% ������Ϊ %Batch_Files_Rename_prefix%%Batch_Files_Rename_Suffix%%Fiel_Suffiex%
    pause
)

ren %Current_File_Name% %Batch_Files_Rename_prefix%%Batch_Files_Rename_Suffix%%Fiel_Suffiex%
gotO :eof

rem ######################################�ļ�������End#####################################










