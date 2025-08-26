# Local Development Setup Guide

This guide helps you set up the project for local development using environment variables.

## Quick Start

### 1. Copy Environment File

```bash
# Copy the example environment file
cp .env.example .env

# Or on Windows
copy .env.example .env
```

### 2. Update Environment Variables

Edit the `.env` file with your specific values:

```bash
MONGODB_URI=mongodb+srv://your-username:your-password@your-cluster.mongodb.net/?retryWrites=true&w=majority&appName=your-app
MONGODB_DATABASE=testdb
SERVER_PORT=8080
SPRING_PROFILES_ACTIVE=dev
```

### 3. Run the Application

**Using the environment loader scripts:**

```bash
# Linux/Mac
./run-with-env.sh

# Windows
run-with-env.bat
```

**Or manually:**

```bash
# Load environment variables from .env file
source .env  # Linux/Mac
# OR
set -a; source .env; set +a  # Linux/Mac alternative

# Then run the application
mvn spring-boot:run
```

## Environment Files

| File              | Purpose                           | Git Tracked     |
| ----------------- | --------------------------------- | --------------- |
| `.env.example`    | Template file with dummy values   | ✅ Yes          |
| `.env`            | Your actual environment variables | ❌ No (ignored) |
| `.env.local`      | Local overrides                   | ❌ No (ignored) |
| `.env.production` | Production values                 | ❌ No (ignored) |

## Development Features

When running with `SPRING_PROFILES_ACTIVE=dev`:

- ✅ Detailed logging enabled
- ✅ MongoDB query logging
- ✅ Pretty-printed JSON responses
- ✅ Debug information in console

## Security Notes

⚠️ **Important**: Never commit your actual `.env` file to Git!

- The `.env` file is automatically ignored by Git
- Always use `.env.example` as a template
- Share only the `.env.example` file with your team

## Troubleshooting

**Environment variables not loading?**

1. Check that `.env` file exists in the project root
2. Ensure no spaces around the `=` sign in variable definitions
3. Don't use quotes unless they're part of the value

**MongoDB connection issues?**

1. Verify your MongoDB Atlas connection string
2. Check network connectivity
3. Ensure your IP is whitelisted in MongoDB Atlas
4. Verify username/password in the connection string

## Testing

Tests use embedded MongoDB and don't require the `.env` file:

```bash
mvn test
```
