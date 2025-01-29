# Variables
IMAGE_NAME=student_crud_api
VERSION=1.0.0

# Install dependencies
install:
	@npm install

# Start the development server
start:
	@node src/server.js

# Build the Docker image
docker-build:
	@docker build -t $(IMAGE_NAME):$(VERSION) .

# Run the Docker container with environment variables
docker-run:
	@docker run --rm -p 3000:3000 --env-file .env $(IMAGE_NAME):$(VERSION)


# Remove dangling images
docker-clean:
	@docker system prune -f


# Run the app in development with Nodemon
dev:
	@nodemon src/server.js

# Run Jest tests
test:
	@npx jest --runInBand

# Build the application (if there is a build step, e.g., TypeScript)
build:
	@echo "No build step required for this project"



# Run migrations (for schema setup, e.g., using Mongoose hooks or external tools)
migrate:
	@echo "MongoDB doesn't require migrations. Make sure your model files define the schema."

# Run API locally
run:
	@node src/server.js
