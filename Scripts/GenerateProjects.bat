@echo off
pushd ..
call Dependencies\premake\premake5.exe vs2022
popd
for %%x in (%cmdcmdline%) do if /i "%%~x"=="/c" set DOUBLECLICKED=1
if defined DOUBLECLICKED pause
