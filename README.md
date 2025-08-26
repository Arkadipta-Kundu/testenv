# Minimal Spring Boot Project for Azure Environment Variable Testing (MongoDB)

This is a bare minimum Spring Boot project designed to test Azure environment variable setup with MongoDB Atlas connections.

## Project Structure

- **Entity**: `Note` - Simple MongoDB document with id and message
- **Repository**: `NoteRepository` - MongoDB repository for database operations
- **Controllers**:
  - `HealthController` - Simple health check endpoint
  - `NoteController` - CRUD operations for notes

## Required Environment Variables

The application expects these environment variables:

- `MONGODB_URI` - MongoDB connection string (e.g., `mongodb+srv://user:pass@cluster.mongodb.net/`)
- `MONGODB_DATABASE` - Database name (optional, defaults to 'testdb')

## Local Testing

### Option 1: Using Environment Files (Recommended)

1. **Setup environment variables:**

   ```bash
   # Copy the example file
   cp .env.example .env

   # Edit .env with your values (already configured with your MongoDB Atlas connection)
   ```

2. **Run with environment loader:**

   ```bash
   # Windows
   run-with-env.bat

   # Linux/Mac
   ./run-with-env.sh
   ```

📖 **See [DEVELOPMENT.md](DEVELOPMENT.md) for detailed setup instructions**

### Option 2: Using the legacy scripts

**Windows:**

```bash
run-local.bat
```

**Linux/Mac:**

```bash
chmod +x run-local.sh
./run-local.sh
```

### Option 2: Manual setup

Set environment variables:

```bash
export MONGODB_URI="mongodb+srv://votingsystem:zpC3Y8bB6ZOP9Z00@arkadev.prmhb.mongodb.net/?retryWrites=true&w=majority&appName=arkadev"
export MONGODB_DATABASE="testdb"
```

Run the application:

```bash
mvn spring-boot:run
```

## Testing the Application

Once running, test these endpoints:

1. **Health Check:**

   ```
   GET http://localhost:8080/health
   Expected response: "OK"
   ```

2. **Create a Note:**

   ```
   POST http://localhost:8080/api/notes
   Content-Type: application/json
   Body: {"message":"Hello from Azure MongoDB test!"}
   ```

3. **Get All Notes:**
   ```
   GET http://localhost:8080/api/notes
   Expected response: Array of notes
   ```

## Azure Deployment

1. Push this project to GitHub
2. Deploy to Azure Web App
3. In Azure → Web App → Configuration → Application settings, add:
   - `MONGODB_URI` = `mongodb+srv://votingsystem:zpC3Y8bB6ZOP9Z00@arkadev.prmhb.mongodb.net/?retryWrites=true&w=majority&appName=arkadev`
   - `MONGODB_DATABASE` = `testdb` (optional)
4. Restart the application
5. Test the endpoints using your Azure app URL

## What This Tests

- ✅ Environment variable pickup from Azure configuration
- ✅ MongoDB Atlas connection using environment variables
- ✅ Basic CRUD operations with MongoDB
- ✅ Application health status

If all endpoints work in Azure, your environment variable setup is correct!

## Running Tests

The project includes tests that use embedded MongoDB for testing:

```bash
# Run all tests
mvn test

# Run tests with verbose output
mvn test -X
```

**Test Configuration:**

- Uses embedded MongoDB (no external database required)
- Tests run independently of environment variables
- Includes health endpoint test

## MongoDB Benefits

- ✅ No need for separate database hosting (using MongoDB Atlas)
- ✅ Simplified connection string (no separate user/password variables)
- ✅ Auto-scaling and managed service
- ✅ Works great with Azure Web Apps
- ✅ Tests use embedded MongoDB (no external dependencies)

## Troubleshooting

**Azure Build Failures:**

- Make sure `MONGODB_URI` is set in Azure Application Settings
- Tests use embedded MongoDB and should pass without external database
- Check that Java 21 is configured in Azure

**Local Testing Issues:**

- Ensure MongoDB Atlas connection string is correct
- Check network connectivity to MongoDB Atlas
- Verify that the database name exists or can be created
