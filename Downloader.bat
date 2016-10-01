@echo off
SETLOCAL
rem Oh hey welcome to my shitty batch file. As you can see I'm bad at things
if not exist youtube-dl.exe goto nothere
if not exist ffmpeg.exe goto nothere
if not exist ffprobe.exe goto nothere
goto start
:nothere
echo You either dont have, renamed, or moved the youtube-dl, ffprobe or ffmpeg executable. Please leave it in the same folder as this batch file
pause
exit
:start
cls
echo _____________________________________
echo Waz's youtube downloader thing
echo This is nothing new I'm just trying to make it easier to use the youtube-dl executable
echo Youtube-dl Version:
youtube-dl --version
echo 1) Download a video/playlist (video)
echo 2) Download a video/playlist (mp3)
echo 3) View the main youtube-dl help (bit useuless here)
echo 4) Update the youtube-dl executable
echo 5) Close this thing
echo MAKE SURE THERE ARE NO AMPERSAND SYMBOLS IN THE URL! NO ^&'S OK? IT BREAKS IT
echo READ THE README
echo _____________________________________
choice /c 12345
if errorlevel 5 exit
if errorlevel 4 goto update
if errorlevel 3 goto help
if errorlevel 2 goto downloadaud
if errorlevel 1 goto downloadvid
set /p menuopt=Tpe your selection and press enter: 


echo Please enter a valid number or just dont screw up typing it in it's not that hard ffs
echo No idea how you even got here
pause
goto start

:downloadvid
ECHO __     _____ ____  _____ ___
echo \ \   / /_ _^|  _ \^| ____/ _ \
echo  \ \ / / ^| ^|^| ^| ^| ^|  _^|^| ^| ^| ^|
echo   \ V /  ^| ^|^| ^|_^| ^| ^|__^| ^|_^| ^|
echo    \_/  ^|___^|____/^|_____\___/
echo Please enter the video/playlist URL
echo IF THE URL CONTAINST "LIST=" OR IS PART OF A PLAYLIST IT WILL DOWNLOAD THE ENTIRE PLAYLIST. MAKE SURE YOU ONLY HAVE THE DIRECT URL IF YOU'RE DOWNLOADING ONLY 1 VIDEO
echo NO ^& SYMBOLS IN THE URL PLEASE OR IT WILL BREAK, USE THE SHARE BUTTON FOR A GOOD URL
set /p URL=Please paste the url: 
echo Will now download the video or video and playlist located at the above url, is this correct?
choice
if errorlevel 2 goto start
youtube-dl -f mp4  %URL% -o "./Downloads/%%(title)s.%%(ext)s"
echo   ____ ___  __  __ ____  _     _____ _____ _____
echo  / ___/ _ \^|  \/  ^|  _ \^| ^|   ^| ____^|_   _^| ____^|
echo ^| ^|  ^| ^| ^| ^| ^|\/^| ^| ^|_) ^| ^|   ^|  _^|   ^| ^| ^|  _^|
echo ^| ^|__^| ^|_^| ^| ^|  ^| ^|  __/^| ^|___^| ^|___  ^| ^| ^| ^|___
echo  \____\___/^|_^|  ^|_^|_^|   ^|_____^|_____^| ^|_^| ^|_____^|
echo Unless there was an error...
pause
goto start

:downloadaud
echo     _   _   _ ____ ___ ___
echo    / \ ^| ^| ^| ^|  _ \_ _/ _ \
echo   / _ \^| ^| ^| ^| ^| ^| ^| ^| ^| ^| ^|
echo  / ___ \ ^|_^| ^| ^|_^| ^| ^| ^|_^| ^|
echo /_/   \_\___/^|____/___\___/
echo Please enter the video/playlist URL
echo IF THE URL CONTAINST "LIST=" OR IS PART OF A PLAYLIST IT WILL DOWNLOAD THE ENTIRE PLAYLIST. MAKE SURE YOU ONLY HAVE THE DIRECT URL IF YOU'RE DOWNLOADING ONLY 1 VIDEO
echo NO ^& SYMBOLS IN THE URL PLEASE OR IT WILL BREAK, USE THE SHARE BUTTON FOR A GOOD URL
set /p URL=Please paste the url: 
echo Will now download the video or video and playlist located at the above url as mp3 files, is this correct?
choice
if errorlevel 2 goto start
youtube-dl --extract-audio --audio-format mp3 %URL% -o "./Downloads/%%(title)s.%%(ext)s"
echo   ____ ___  __  __ ____  _     _____ _____ _____
echo  / ___/ _ \^|  \/  ^|  _ \^| ^|   ^| ____^|_   _^| ____^|
echo ^| ^|  ^| ^| ^| ^| ^|\/^| ^| ^|_) ^| ^|   ^|  _^|   ^| ^| ^|  _^|
echo ^| ^|__^| ^|_^| ^| ^|  ^| ^|  __/^| ^|___^| ^|___  ^| ^| ^| ^|___
echo  \____\___/^|_^|  ^|_^|_^|   ^|_____^|_____^| ^|_^| ^|_____^|
echo Unless there was an error...
pause
goto start


:help
youtube-dl --help	
echo ____________________
echo If it didnt display properly try running help again.
echo Press any key to return to the menu
pause >nul
goto start
:update

echo Please dont cancel this or close the file while it's updating as it might break something
youtube-dl --update
ping localhost >nul
pause
goto start

