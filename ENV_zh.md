
##1.下载和安装
###(1)MSYS2
>http://repo.msys2.org/distrib/i686/msys2-i686-20160921.exe

安装好MSYS2之后，在它的安装目录(默认名是msys32)下创建一个名为mingw32的文件夹。
###(2)Qt5.6.1
>http://download.qt.io/archive/qt/5.6/5.6.1-1/qt-opensource-windows-x86-mingw492-5.6.1-1.exe

在安装时，你可以只选择"Qt 5.6\MinGW 4.9.2 32 bit"。
###(3)devkitARM_r45
>https://sourceforge.net/projects/devkitpro/files/devkitARM/devkitARM_r45/devkitARM_r45-win32.exe/download

##2.编辑.bashrc添加路径
这个文件在MSYS2的安装目录下\home\\<你的名字>\\.bashrc，然后添加以下内容到文件末尾。
>\# QTDIR最终指向Qt安装目录下名为"mingw49_32"的文件夹，使用Linux格式的绝对路径  
export QTDIR=/G/Qt/Qt5.6.1/5.6/mingw49_32  
export PATH=$PATH:$QTDIR/bin  
\# DEVKITARM的原理同上  
export DEVKITARM=/G/devkitARM  
export PATH=$PATH:$DEVKITARM/bin

##3.更新安装必要软件包
在MSYS2安装目录下运行mingw32.exe。  
（或者在开始菜单中找到"MSYS2 32bit\MSYS2 MinGW 32-bit"）  
然后运行以下命令。  
>pacman -Syu  
pacman -S git make perl mingw-w64-i686-gcc mingw-w64-i686-readline

##4.克隆代码库到本地
（默认储存到当前目录。也许是"...\home\\<你的名字>"）
>git clone https://github.com/menshiyun/proxmark3.git  
cd proxmark3  
git checkout -b local origin/local

（我的分支名字是"local"）
##5.清理和编译
>make clean && make all

##(可选)
###不用MSYS2运行客户端

把以下文件从 "...\msys32\mingw32\bin\\..." 复制到 "...\proxmark\client\\..."
>libgcc_s_dw2-1.dll  
libreadline6.dll  
libstdc++-6.dll  
libtermcap-0.dll  
libwinpthread-1.dll  

把以下文件从 "...\mingw49_32\bin\\..." 复制到 "...\proxmark\client\\..."
>Qt5Core.dll  
Qt5Gui.dll  
Qt5Widgets.dll

把以下文件从 "...\mingw49_32\plugins\platforms\\..." 复制到 "...\proxmark\client\platforms\\..."

>qwindows.dll
