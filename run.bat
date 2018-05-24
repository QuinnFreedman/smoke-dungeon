@echo off
nimble build && move smoke.exe >nul .\bin && bin\smoke.exe
