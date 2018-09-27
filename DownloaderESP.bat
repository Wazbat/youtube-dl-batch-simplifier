@echo off
SETLOCAL
if not exist youtube-dl.exe goto nothere
if not exist ffmpeg.exe goto nothere
if not exist ffprobe.exe goto nothere
goto start
:nothere
echo No tienes, has borrado o has movido el archivo youtube-dl, ffprobe or ffmpeg. Por favor asegura que esten en la misma carpeta que este archivo bat
pause
exit
:start
cls
echo _____________________________________
echo Esto no es nada nuevo, simplemente quiero hacer mas facil utilizar el programa youtube-dl
echo Version Youtube-dl:
youtube-dl --version
echo 1) Descargar un video/lista de reproducion (video)
echo 2) Descargar un video/lista de reproducion (mp3)
echo 3) Ver la ayuda de youtube-dl help (no sirve de mucho)
echo 4) Actualiza el programa youtube-dl
echo 5) Cerrar esto
echo _____________________________________
echo NO PUEDE ESTAR EL SIMBOLO DE AMPERSAND EN LA URL. NINGUN DE ESTOS: ^&'S OK? ROMPE EL PROGRAMA
echo Lee el README
echo _____________________________________
choice /c 12345
if errorlevel 5 exit
if errorlevel 4 goto update
if errorlevel 3 goto help
if errorlevel 2 goto downloadaud
if errorlevel 1 goto downloadvid


echo Por favor elige algo valido
echo Ni idea como llegastes aqui
pause
goto start

:downloadvid
ECHO __     _____ ____  _____ ___
echo \ \   / /_ _^|  _ \^| ____/ _ \
echo  \ \ / / ^| ^|^| ^| ^| ^|  _^|^| ^| ^| ^|
echo   \ V /  ^| ^|^| ^|_^| ^| ^|__^| ^|_^| ^|
echo    \_/  ^|___^|____/^|_____\___/
echo Por favor mete la URL de un video o lista de reproducion
echo SI LA URL CONTIENE "LIST=" O ES PARTE DE UNA LISTA DE REPRODUCCION SE DESCARGARA LA LISTA ENTERA. ASEGURATE QUE TANGAS LA URL DIRECTA SI VAS A DESCARGAR ESE VIDEO SOLO
echo NO METES SIMBOLOS ^& EN LA URL O SE ROMPE, USA EL BOTON "compartir" PARA OBTENER UNA URL BUENA
set /p URL=Por favor pega la url: 
echo Ahora se va a descargar el video/lista de reproducion localizado en la URL: %URL%
echo Es esto correcto?
choice
if errorlevel 2 goto start
youtube-dl -i -f mp4  %URL% -o "./Downloads/%%(title)s.%%(ext)s"
echo   ____ ___  __  __ ____  _     _____ _____ _____
echo  / ___/ _ \^|  \/  ^|  _ \^| ^|   ^| ____^|_   _^| ____^|
echo ^| ^|  ^| ^| ^| ^| ^|\/^| ^| ^|_) ^| ^|   ^|  _^|   ^| ^| ^|  _^|
echo ^| ^|__^| ^|_^| ^| ^|  ^| ^|  __/^| ^|___^| ^|___  ^| ^| ^| ^|___
echo  \____\___/^|_^|  ^|_^|_^|   ^|_____^|_____^| ^|_^| ^|_____^|
echo Aunque puede haber tenido algun error
pause
goto start

:downloadaud
echo     _   _   _ ____ ___ ___
echo    / \ ^| ^| ^| ^|  _ \_ _/ _ \
echo   / _ \^| ^| ^| ^| ^| ^| ^| ^| ^| ^| ^|
echo  / ___ \ ^|_^| ^| ^|_^| ^| ^| ^|_^| ^|
echo /_/   \_\___/^|____/___\___/
echo Por favor mete la URL de un video o lista de reproducion
echo SI LA URL CONTIENE "LIST=" O ES PARTE DE UNA LISTA DE REPRODUCCION SE DESCARGARA LA LISTA ENTERA. ASEGURATE QUE TANGAS LA URL DIRECTA SI VAS A DESCARGAR ESE VIDEO SOLO
echo NO METES SIMBOLOS ^& EN LA URL O SE ROMPE, USA EL BOTON "compartir" PARA OBTENER UNA URL BUENA
set /p URL=Por favor pega la url: 
echo Ahora se va a descargar y convertir a MP3 el video/lista de reproducion localizado en la URL: %URL%
echo Es esto correcto?
choice
if errorlevel 2 goto start
youtube-dl -i --extract-audio --audio-format mp3 %URL% -o "./Downloads/%%(title)s.%%(ext)s"
echo   ____ ___  __  __ ____  _     _____ _____ _____
echo  / ___/ _ \^|  \/  ^|  _ \^| ^|   ^| ____^|_   _^| ____^|
echo ^| ^|  ^| ^| ^| ^| ^|\/^| ^| ^|_) ^| ^|   ^|  _^|   ^| ^| ^|  _^|
echo ^| ^|__^| ^|_^| ^| ^|  ^| ^|  __/^| ^|___^| ^|___  ^| ^| ^| ^|___
echo  \____\___/^|_^|  ^|_^|_^|   ^|_____^|_____^| ^|_^| ^|_____^|
echo Aunque puede haber tenido algun error
pause
goto start


:help
youtube-dl --help	
echo ____________________
echo Si no salio bien dale otra vez
echo Pulse cualquier tecla para volver al menu
pause >nul
goto start
:update

echo Por favor intenta no cancelar esto mientras se esta actualizando porque podra romper algo.
youtube-dl --update
ping localhost >nul
pause
goto start
