@echo off
setlocal

set "JENKINS_NODE_COOKIE=dontKillMe"
set "BUILD_ID=dontKillMe"

cd /d "%~dp0"

if not exist "node_modules\http-server\bin\http-server" (
    echo ERROR: http-server is not installed.
    exit /b 1
)

start "" /b "C:\Program Files\nodejs\node.exe" "node_modules\http-server\bin\http-server" src -p 8081 -a 127.0.0.1 -c-1 > deployment.log 2>&1

echo Calculator server started at http://localhost:8081
exit /b 0