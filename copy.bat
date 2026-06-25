@echo off
setlocal enabledelayedexpansion

if "%~1"=="" (
    set "SOURCE=%CD%"
) else (
    set "SOURCE=%~1"
)

if "%~2"=="" (
    set "DEST=%CD%\Output"
) else (
    set "DEST=%~2"
)

if "%~3"=="" (
    echo NO FILE TYPE SPECIFIED
    pause
    exit /b 1
) else (
    set "TYPE=%~3"
)

set "EXTENSIONS="
if /i "%TYPE%"=="-all_music" (
    set "EXTENSIONS=mp3 flac aac wav wma ogg m4a aiff opus alac m4p"
)
if /i "%TYPE%"=="-all_video" (
    set "EXTENSIONS=mp4 mkv avi mov wmv flv webm m4v mpeg mpg 3gp"
)
if /i "%TYPE%"=="-all_immage" (
    set "EXTENSIONS=jpg jpeg png gif bmp tiff webp"
)
if "!EXTENSIONS!"=="" (
    :: Not a group flag — treat as a literal extension
    set "EXTENSIONS=%TYPE:.=%"
)

if not exist "%DEST%" (
    mkdir "%DEST%"
    echo Created destination folder: %DEST%
)

echo.
echo Source      : %SOURCE%
echo Destination : %DEST%
echo Scanning for: !EXTENSIONS!
echo.
echo ----------------------------------------

set "COUNT=0"
set "SKIPPED=0"

for %%E in (!EXTENSIONS!) do (
    echo [TYPE] Searching for *.%%E ...
    for /r "%SOURCE%" %%F in (*.%%E) do (
        echo %%~dpF | findstr /i /c:"%DEST%" >nul
        if errorlevel 1 (
            if exist "%DEST%\%%~nxF" (
                echo [SKIP] %%~nxF  ^(already exists^)
                set /a SKIPPED+=1
            ) else (
                echo [COPY] %%~nxF
                copy "%%F" "%DEST%\" >nul
                set /a COUNT+=1
            )
        )
    )
)

echo ----------------------------------------
echo Done!
echo   Copied  : !COUNT! file(s)
echo   Skipped : !SKIPPED! file(s)  (already existed in destination)
echo   Output  : %DEST%
echo.
pause
