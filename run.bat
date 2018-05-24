@echo off
nimble build --debug && move smoke.exe >nul .\bin && bin\smoke.exe
