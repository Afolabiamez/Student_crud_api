# Variables
IMAGE_NAME=student_crud_api
VERSION=1.0.0
CONTAINER_NAME=student_crud_api_container

# Install dependencies
install:
	@npm install

# Start the development server
start:
	@node src/server.js

# Build the Docker image
docker-build:
	@docker build -t $(IMAGE_NAME):$(VERSION) .

# Run the Docker container
docker-run:
	@docker run --rm -p 3000:3000 --env-file .env --name $(CONTAINER_NAME) $(IMAGE_NAME):$(VERSION)

# Run Jest tests inside Docker container
docker-test:
	@docker run --rm --env-file .env $(IMAGE_NAME):$(VERSION) npm test

# Perform code linting inside Docker container
docker-lint:
	@docker run --rm $(IMAGE_NAME):$(VERSION) npm run lint

# Remove dangling images
docker-clean:
	@docker system prune -f

# Run the app in development with Nodemon
dev:
	@nodemon src/server.js

# Run API locally
run:
	@node src/server.js


