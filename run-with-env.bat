@echo off

REM Load environment variables from .env file and start the application

if exist ".env" (
    echo Loading environment variables from .env file...
    
    REM Read .env file and set variables
    for /f "usebackq tokens=1,2 delims==" %%i in (".env") do (
        if not "%%i"=="" if not "%%i:~0,1%"=="#" (
            set "%%i=%%j"
        )
    )
    
    echo ✓ Environment variables loaded
) else (
    echo ⚠ .env file not found. Please create one from .env.example
    echo    copy .env.example .env
    pause
    exit /b 1
)

REM Display loaded environment variables (hide sensitive data)
echo.
echo Loaded Environment Variables:
echo MONGODB_URI: [HIDDEN - MongoDB Atlas connection]
echo MONGODB_DATABASE: %MONGODB_DATABASE%
echo SERVER_PORT: %SERVER_PORT%
echo SPRING_PROFILES_ACTIVE: %SPRING_PROFILES_ACTIVE%
echo.

echo Starting Spring Boot application...
mvn spring-boot:run
