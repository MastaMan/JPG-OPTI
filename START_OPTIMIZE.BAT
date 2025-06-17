@echo off
setlocal enabledelayedexpansion
cls

rem ----------------------------------------
rem configuration
rem ----------------------------------------
set "out=output\"
set "engine=engine\"

rem create output folder if needed
if not exist "%out%" (
    mkdir "%out%"
)

cls
echo ----------------------------------------
echo Image converter and optimizer
echo ----------------------------------------
echo 1. Copy .jpg or .png files to this folder
echo 2. Enter quality (Recommended: 95)
echo 3. Choose if resize to max width 2048px
echo 4. Press enter to start
echo ----------------------------------------
echo.

rem ask for quality
set /p "quality=Quality (0-100, default: 85): "
if "%quality%"=="" set "quality=85"

rem ask for resize
set /p "resize=Resize to max width 2048px? (y/n): "
set "resize=%resize:~0,1%"
set "resize=%resize:y=Y%"
if /i "%resize%"=="Y" (
    set "doresize=1"
) else (
    set "doresize=0"
)

rem move images to output folder
move *.jpg %out% >nul 2>&1
move *.png %out% >nul 2>&1

cls

rem convert png to jpg
echo Converting png to jpg...
for %%k in (%out%*.png) do (
    %engine%convert.exe "%%k" "%%~dpk%%~nk.jpg"
    del "%%k"
)

rem convert hdr to jpg
echo Converting hdr to jpg...
for %%k in (*.hdr) do (
    %engine%convert.exe "%%k" "%out%%%~nk.jpg"
    del "%%k"
)

rem resize if selected
if "%doresize%"=="1" (
    echo Resizing images to max width 2048px...
    for %%k in (%out%*.jpg) do (
        %engine%convert.exe "%%k" -resize "2048x>" "%%k"
    )
)

rem optimize jpgs
echo Optimizing jpg images...
for %%k in (%out%*.jpg) do (
    %engine%jpegoptim.exe --strip-all -f --all-progressive -m%quality% "%%k"
)

start %out%
echo.
echo Done.
pause >nul