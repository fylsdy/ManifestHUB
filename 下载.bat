@echo off
:: ====================================
:: 脚本作者：BIAO
:: ====================================

echo 作者：BIAO
echo 正在后台下载...
echo.

:: 启动后台下载进程
start /B .\DepotDownloader\ddv20.exe -lu China --use-http -o ".\The Adventures of Elliot_The Millennium Tales" app -p ".\DepotDownloader\depot"

:wait_loop
:: 每2秒检查一次进程是否还在运行
timeout /t 2 /nobreak > nul
tasklist /FI "IMAGENAME eq ddv20.exe" 2>nul | find /I "ddv20.exe" > nul
if not errorlevel 1 goto wait_loop

:: 下载完成提示
echo.
echo 下载已完成，请按回车键退出...
pause > nul
exit