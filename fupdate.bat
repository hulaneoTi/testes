::@echo off
SET /A aleatorio=%RANDOM% * 300 / 32768 + 10
timeout %aleatorio% >nul
start msedge.exe --kiosk https://fakeupdate.net/win10ue/