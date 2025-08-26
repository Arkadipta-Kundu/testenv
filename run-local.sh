#!/bin/bash

# Set environment variables for local testing with MongoDB
export MONGODB_URI="mongodb+srv://votingsystem:zpC3Y8bB6ZOP9Z00@arkadev.prmhb.mongodb.net/?retryWrites=true&w=majority&appName=arkadev"
export MONGODB_DATABASE="testdb"

echo "Environment variables set:"
echo "MONGODB_URI: [HIDDEN - MongoDB Atlas connection]"
echo "MONGODB_DATABASE: $MONGODB_DATABASE"
echo ""

echo "Starting Spring Boot application with MongoDB..."
mvn spring-boot:run
