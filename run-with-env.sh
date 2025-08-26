#!/bin/bash

# Load environment variables from .env file and start the application

# Check if .env file exists
if [ -f ".env" ]; then
    echo "Loading environment variables from .env file..."
    export $(cat .env | grep -v '^#' | xargs)
    echo "✅ Environment variables loaded"
else
    echo "⚠️  .env file not found. Please create one from .env.example"
    echo "   cp .env.example .env"
    exit 1
fi

# Display loaded environment variables (hide sensitive data)
echo ""
echo "Loaded Environment Variables:"
echo "MONGODB_URI: [HIDDEN - MongoDB Atlas connection]"
echo "MONGODB_DATABASE: ${MONGODB_DATABASE}"
echo "SERVER_PORT: ${SERVER_PORT}"
echo "SPRING_PROFILES_ACTIVE: ${SPRING_PROFILES_ACTIVE}"
echo ""

echo "Starting Spring Boot application..."
mvn spring-boot:run
