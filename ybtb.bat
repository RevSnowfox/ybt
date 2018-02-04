rem YBT (Youtube-dl Batch Tools) v1 by Rev Snowfox
@echo off & cls
setlocal
echo ********************************
echo * Youtube-dl Batch Tool [Bulk] *
echo ********************************
echo Input batch file:
echo [%*]
echo Generated checklist file:
echo [%*.checklist.txt]
echo:
echo Enter preferred format code(s),
echo e.g. 22, 137+140 or bestvideo[ext=mp4]+bestaudio[ext=m4a]:
echo (press Enter to accept, leave it blank for default)
echo:
set /p formatcode="FORMAT CODE(S): "
cls
if not exist .\download\ mkdir download > NUL
echo  > .\bell
if "%formatcode%"=="" goto :default
youtube-dl.exe -f "%formatcode%" -o "download/[%%(uploader)s] %%(title)s [%%(height)sp] [YT].%%(ext)s" -R 30 -i --write-sub --sub-lang en --convert-subs srt --embed-subs --write-description --write-thumbnail --sleep-interval 10 --max-sleep-interval 90 --fragment-retries 30 --abort-on-unavailable-fragment --socket-timeout 30 --download-archive "%*.checklist.txt" --console-title -a "%*" --exec "type bell & cls & echo {} has been downloaded. & echo:" & goto :end
:default
youtube-dl.exe -f "(137/mp4[height<=1080]/136/mp4[height<=720])+(140/m4a/bestaudio)" -o "download/[%%(uploader)s] %%(title)s [%%(height)sp] [YT].%%(ext)s" -R 30 -i --write-sub --sub-lang en --convert-subs srt --embed-subs --write-description --write-thumbnail --sleep-interval 10 --max-sleep-interval 90 --fragment-retries 30 --abort-on-unavailable-fragment --socket-timeout 30 --download-archive "%*.checklist.txt" --console-title -a "%*" --exec "type bell & cls & echo {} has been downloaded. & echo:"
:end
del .\bell
ping -n 6 localhost > NUL
echo:Script done. Output directory:
echo [%~dp0download]
echo Press any key to quit... & pause > NUL
endlocal
cls