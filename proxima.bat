@echo off
rem Proxima    ver 1.0
rem Copyright 2018 Abhishek Kumar. Licensed under GNU GPL v3.

if "%~1"=="help" (
	echo Proxima    ver 1.0	
	echo Copyright 2018 Abhishek Kumar. Licensed under GNU GPL v3.
	echo.
	echo Usage:
	echo  proxima [username] [password]
	echo.
	echo Example:
	echo  proxima kumarab abc123
	echo  proxima kumarab abc_123
	echo.
	echo Note:
	echo  Avoid using @ or : in your password
	echo  Using _ would be most suitable for password
	echo.
	goto end
) else if "%~1"=="" (
	set isCredentialsAvailable=false
	goto setproxyurl
) else (
	if "%~2"=="" (
		set isCredentialsAvailable=false
	) else (
		set isCredentialsAvailable=true
		set username=%~1
		set password=%~2
	)
	goto setproxyurl
)

:setproxyurl
	if "%isCredentialsAvailable%"=="true" (
		echo Setting up proxy with your account credentials
		set proxyUrl=http://hcltech\%username%:%password%@10.112.62.78:8080
	) else (
		echo Setting up proxy without your account credentials
		set proxyUrl=http://10.112.62.78:8080
	)
	goto setproxy

:setproxy
	echo Setting up http and https proxy as %proxyUrl%
	set HTTP_PROXY=%proxyUrl%
	set HTTPS_PROXY=%proxyUrl%
	goto end

:end
	echo Done!