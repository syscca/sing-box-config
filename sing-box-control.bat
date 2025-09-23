@echo off
chcp 65001 > nul
cd /d %~dp0

:: 检查是否以管理员运行
net session >nul 2>&1
if %errorLevel% == 0 (
    echo 已以管理员身份运行。
) else (
    echo 请求管理员权限...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~dpnx0' -Verb RunAs"
    exit /b
)

:: 启动 sing-box
sing-box.exe run -c config.json
pause