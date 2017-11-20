@echo off

title 各种服务开启、关闭程序

:allstart

cls

echo 此脚本修改自 Laycher's Blog www.laycher.com 的脚本

echo 1.informix 服务开启、关闭

echo 3.MySQL 服务开启、关闭

echo 4.Oracle 11g 服务开启、关闭

echo 7.TeamViewer12 服务开启、关闭

echo 8.一键切换IP地址,显示ip地址

echo 10.VMware 服务开启、关闭

echo e.退出

set in=

set /p in=请输入:

if "%in%"=="1" goto informix

if "%in%"=="3" goto mysql

if "%in%"=="4" goto oraclexe

if "%in%"=="7" goto teamviewer

if "%in%"=="8" goto changeip

if "%in%"=="10" goto vmware

if "%in%"=="e" goto allclose

if "%in%"=="" (goto allstart) else (goto allstart)

rem informix服务开启、关闭

:informix

echo 1.开启informix服务，2.关闭informix服务。3.设置为手动。

echo u.回到上层。e.退出。

set in=

set /p in=请输入：

if "%in%"=="1" goto informixstart

if "%in%"=="2" goto informixstop

if "%in%"=="3" goto informixsd

if "%in%"=="u" goto allstart

if "%in%"=="e" goto allclose

if "%in%"=="" (goto allstart) else (goto allstart)

:informixstart

echo "正在启动informix相关开机服务..."

rem net start informix service

net start demoserver

net start MsgServ

echo 服务启动完毕!

goto informix

:informixstop

echo "正在关闭informix相关开机服务...(三项多余项)"

rem net stop informix service

net stop demoserver

net stop MsgServ

net stop nsrexecd

net stop portmap

net stop nsrd

echo 服务已关闭!

goto informix

:informixsd

echo "切换informix开机启动服务为手动中,请稍候..."

sc config MsgServ start= demand

sc config demoserver start= demand

echo 成功切换为手动模式!

goto informix

rem MySQL服务开启、关闭

:mysql

echo 1.开启mysql服务，2.关闭mysql服务。3.设置为手动。

echo u.回到上层。e.退出。

set in=

set /p in=请输入：

if "%in%"=="1" goto mysqlstart

if "%in%"=="2" goto mysqlstop

if "%in%"=="3" goto mysqlsd

if "%in%"=="u" goto allstart

if "%in%"=="e" goto allclose

if "%in%"=="" (goto allstart) else (goto allstart)

:mysqlstart

echo "正在启动MySQL相关开机服务..."

net start MySQL

echo 服务启动完毕!

goto mysql

:mysqlstop

echo "正在关闭MySQL相关开机服务..."

net stop MySQL

echo 服务已关闭!

goto mysql

:mysqlsd

echo "切换MySQL开机启动服务为手动中,请稍候..."

sc config MySQL start= demand

echo 成功切换为手动模式!

goto mysql

rem Oracle 11g 服务开启、关闭

:oraclexe

echo 1.开启oracle11g必要服务，2.关闭oracle11g必要服务。3.设置为手动。

echo u.回到上层。e.退出。

set in=

set /p in=请输入：

if "%in%"=="1" goto oraclexestart

if "%in%"=="2" goto oraclexestop

if "%in%"=="3" goto oraclexesd

if "%in%"=="u" goto allstart

if "%in%"=="e" goto allclose

if "%in%"=="" (goto allstart) else (goto allstart)

:oraclexestart

echo "正在启动oracle 11g 必要服务..."

net start OracleDBConsoleorcl

net start OracleMTSRecoveryService

net start OracleOraDb11g_home1TNSListener

net start OracleServiceORCL

net start OracleVssWriterORCL

echo 服务启动完毕!

goto oraclexe

:oraclexestop

echo "正在关闭oracle 11g相关开机服务..."

net stop OracleDBConsoleorcl

net stop OracleMTSRecoveryService

net stop OracleOraDb11g_home1TNSListener

net stop OracleServiceORCL

net stop OracleVssWriterORCL

net stop OracleRemExecService

echo 服务已关闭!

goto oraclexe

:oraclexesd

echo "切换oracle 11g开机启动服务为手动中,请稍候..."

sc config OracleDBConsoleorcl start= demand

sc config OracleMTSRecoveryService start= demand

sc config OracleOraDb11g_home1TNSListener start= demand

sc config OracleServiceORCL start= demand

sc config OracleVssWriterORCL start= demand

echo 成功切换为手动模式!

goto oraclexe

rem teamviewer服务开启、关闭

:teamviewer

echo 1.开启teamviewer服务，2.关闭teamviewer服务。3.设置为手动。

echo u.回到上层。e.退出。

set in=

set /p in=请输入：

if "%in%"=="1" goto teamviewerstart

if "%in%"=="2" goto teamviewerstop

if "%in%"=="3" goto teamviewersd

if "%in%"=="u" goto allstart

if "%in%"=="e" goto allclose

if "%in%"=="" (goto allstart) else (goto allstart)

:teamviewerstart

net start TeamViewer

goto teamviewer

:teamviewerstop

net stop TeamViewer

goto teamviewer

:teamviewersd

sc config TeamViewer start= demand

goto teamviewer

rem 一键切换ip地址,显示IP地址

:changeip

echo 1.设置"无线网络连接"为静态ip(192.168.1.70)

echo 2.设置"无线网络连接"为动态ip。

echo 3.显示当前ip地址。

echo u.回到上层。e.退出。

set in=

set /p in=请输入：

if "%in%"=="1" goto changeiptostatic

if "%in%"=="2" goto changeiptoactive

if "%in%"=="3" goto showipaddr

if "%in%"=="u" goto allstart

if "%in%"=="e" goto allclose

if "%in%"=="" (goto allstart) else (goto allstart)

:changeiptostatic

echo 正在设置静态ip(192.168.1.70)，

netsh interface ipv4 set address name="无线网络连接" source=static addr=192.168.1.70 mask=255.255.255.0 gateway=192.168.1.1 gwmetric=0 >nul

echo 正在添加本机主DNS...

netsh interface ipv4 set dnsservers name="无线网络连接" source=static addr=1.2.4.8

echo 正在添加备用DNS...

netsh interface ipv4 add dnsservers name="无线网络连接" addr=10.10.10.10

goto changeip

:changeiptoactive

echo 您选择了 动态DHCP设置

echo 正在设置"无线网络连接"，请稍后......

netsh interface ipv4 set address name="无线网络连接" source=dhcp

echo 正在添加本机主DNS...

netsh interface ipv4 set dnsservers name="无线网络连接" source=dhcp

goto changeip

:showipaddr

ipconfig/all

goto changeip

rem VMware 服务开启、关闭

:vmware

echo 1.开启vmware服务，2.关闭vmware服务。3.设置为手动。

echo u.回到上层。e.退出。

set in=

set /p in=请输入：

if "%in%"=="1" goto vmwarestart

if "%in%"=="2" goto vmwarestop

if "%in%"=="3" goto vmwaresd

if "%in%"=="u" goto allstart

if "%in%"=="e" goto allclose

if "%in%"=="" (goto allstart) else (goto allstart)

:vmwarestart

echo "正在启动vmware相关开机服务..."

net start VMAuthdService

net start VMnetDHCP

net start "VMware NAT Service"

net start VMUSBArbService

net start VMwareHostd

echo 服务启动完毕!

goto vmware

:vmwarestop

echo "正在关闭vmware相关开机服务..."

net stop VMnetDHCP

net stop "VMware NAT Service"

net stop VMwareHostd

net stop VMUSBArbService

net stop VMAuthdService

echo 服务已关闭!

goto vmware

:vmwaresd

echo "切换vmware开机启动服务为手动中,请稍候..."

sc config VMAuthdService start= demand

sc config VMnetDHCP start= demand

sc config "VMware NAT Service" start= demand

sc config VMUSBArbService start= demand

sc config VMwareHostd start= demand

echo 成功切换为手动模式!

goto vmware

:allclose

echo 按任意键退出

pause

exit
