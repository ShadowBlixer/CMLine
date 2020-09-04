@echo off
@Title ~~ClixOS CMLine~~
:startup
set drive=%cd%
cls
echo                       ~~ClixOS CMLine~~
echo.
echo.
echo.
echo.
:menu1
set/p input="%drive%> "
if %input% == help goto c1
if %input% == print goto c2
if %input% == exit goto c3
if %input% == cls goto cls
if %input% == dir-change goto c4
if %input% == dir goto dir
if %input% == start goto str
if %input% == %input% goto c-check
goto menu1

:c-invalid
echo.
type bad-command.txt
echo.
goto menu1

:c1
echo.
echo Commands Called: help
echo.
echo Command List: help, cls, print, exit, dir-change, dir
echo.
goto menu1

:c2
echo.
echo Command Called: print
echo.
set/p print="Type words to print in the console> "
echo ---------------------------------------------
echo.
echo %print%
echo.
goto menu1

:c3
exit

:c-check
set com=%input%
if exist "%com%.cmline" goto output
if not exist "%com%.cmline" goto c-invalid

:output
echo.
type %com%.cmline
echo.
goto menu1

:cls
cls
goto menu1

:c4
echo.
echo Commands Called: dir-change
set/p change="Type a directory to change the folder> "
if %change% == C:\ C:
if %change% == .. cd..
if %change% == %change% cd %change%
set drive=%change%
echo.
goto menu1

:dir
echo.
dir
echo.
goto menu1

:str
echo.
set/p str="Program: "
start %str%
echo.
goto menu1
