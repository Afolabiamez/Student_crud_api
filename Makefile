# Variables
# IMAGE_NAME=student_crud_api
# VERSION=1.0.0
CONTAINER_NAME=student_crud_api_container
MONGO_CONTAINER_NAME=mongo_test
MONGO_IMAGE=mongo:latest
MONGO_PORT=27017

# Install dependencies
install:
	@npm install

# Start the development server
start:
	@node src/app.js

# # Build the Docker image
# docker-build:
# 	@docker build -t $(IMAGE_NAME):$(VERSION) .

# Run the MongoDB container
mongo-start:
	@docker run -d --name $(MONGO_CONTAINER_NAME) -p $(MONGO_PORT):27017 $(MONGO_IMAGE)


# Run the Docker container with MongoDB connection
docker-run:
	@docker run --rm -p 3000:3000 --env-file .env --name $(CONTAINER_NAME) --network="host" $(IMAGE_NAME):$(VERSION)

# Run Jest tests inside Docker container (after starting MongoDB)
docker-test: mongo-start
	@docker run --rm --network="host" --env MONGO_URI=mongodb://localhost:$(MONGO_PORT)/student_crud_api $(IMAGE_NAME):$(VERSION) npm test
	@make mongo-stop

# Stop and remove the MongoDB container
mongo-stop:
	@docker stop $(MONGO_CONTAINER_NAME) && docker rm $(MONGO_CONTAINER_NAME)


# Perform code linting inside Docker container
docker-lint:
	@docker run --rm $(IMAGE_NAME):$(VERSION) npm run lint

# Remove dangling images
docker-clean:
	@docker system prune -f

# Run the app in development with Nodemon
dev:
	@nodemon src/app.js

# Run API locally
run:
	@node src/app.js


# docker-push:
# 	@docker tag $(IMAGE_NAME):$(VERSION) $(DOCKER_USERNAME)/$(IMAGE_NAME):$(VERSION)
# 	@docker push $(DOCKER_USERNAME)/$(IMAGE_NAME):$(VERSION)
