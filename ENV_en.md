
##1.Download & Install
###(1)MSYS2
>http://repo.msys2.org/distrib/i686/msys2-i686-20160921.exe

After installing MSYS2, create a folder named "mingw32" in his installation directory(default naming is "msys32").
###(2)Qt5.6.1
>http://download.qt.io/archive/qt/5.6/5.6.1-1/qt-opensource-windows-x86-mingw492-5.6.1-1.exe

In the installation, you can just choose "Qt 5.6\MinGW 4.9.2 32 bit".
###(3)devkitARM_r45
>https://sourceforge.net/projects/devkitpro/files/devkitARM/devkitARM_r45/devkitARM_r45-win32.exe/download

##2.Edit ".bashrc" file and add path
This file can be found in the MSYS2 installation directory\home\\< YourName >\\.bashrc.  
And then add the following to the end of the file.
>\# QTDIR eventually point to a folder called "mingw49_32" in the Qt installation directory, using the absolute path of the Linux format.  
export QTDIR=/G/Qt/Qt5.6.1/5.6/mingw49_32  
export PATH=$PATH:$QTDIR/bin  
\# DEVKITARM principle is same as above.  
export DEVKITARM=/G/devkitARM  
export PATH=$PATH:$DEVKITARM/bin

##3.Update and install the necessary software packages
Start mingw32.exe in the MSYS2 installation directory.  
(Or in the start menu to find "MSYS2 32bit\MSYS2 MinGW 32-bit")  
Then run the following command.
>pacman -Syu  
pacman -S git make perl mingw-w64-i686-gcc mingw-w64-i686-readline

##4.Clone my folk
(Default save to the current directory. Maybe it was "...\home\\< YourName >")
>git clone https://github.com/menshiyun/proxmark3.git  
cd proxmark3  
git checkout -b local origin/local

(My branch named "local")
##5.Clean and Compile
>make clean && make all

## (Optional)
### Run client without the MSYS2

copy follwing file in "...\msys32\mingw32\bin\\..." to "...\proxmark\client\\..."
>libgcc_s_dw2-1.dll  
libreadline6.dll  
libstdc++-6.dll  
libtermcap-0.dll  
libwinpthread-1.dll

copy follwing file in "...\mingw49_32\bin\\..." to "...\proxmark\client\\..."
>Qt5Core.dll  
Qt5Gui.dll  
Qt5Widgets.dll

copy follwing file in "...\mingw49_32\plugins\platforms\\..." to "...\proxmark\client\platforms\\..."

>qwindows.dll
