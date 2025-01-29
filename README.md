# Student CRUD API (Dockerized)

This is a Student Management API built with Node.js and MongoDB.

## Features
- **CRUD Operations:** Create, Read, Update, Delete student records.
- **API Versioning:** All endpoints support versioning (`/api/v1/`).
- **Health Check:** Ensure the server is running (`/healthcheck`).
- **Environment Variables:** Configurations like the database URL are managed through environment variables.
- **Logging:** Meaningful logs for monitoring and debugging.
- **Unit Tests:** Automated tests for API endpoints using Jest and Supertest.

## Tech Stack

- **Backend:** Node.js (JavaScript runtime)
- **Database:** MongoDB
- **API Testing:** Postman Collection provided
- **Docker:** Dockerfile to build and run the API container.

## Prerequisites

Ensure the following are installed on your system:
- **Node.js**: JavaScript runtime
- **Express**: Web framework for building RESTful APIs
- **MongoDB**: NoSQL database for data storage
- **Mongoose**: MongoDB object modeling for Node.js
- **Jest**: Unit testing framework
- **Docker**: Containerization for running the app locally in an isolated environment


## Setup and Installation Docker

To run the Student CRUD API locally or inside a Docker container, follow the steps below.


### 1. Clone the Repository

```bash
git clone https://github.com/<your-github-username>/student-crud-api.git
cd student-crud-api

### 2. Set up environment variables

Create a .env file in the root of the project with the following content:

PORT=3000
DB_URL=mongodb://localhost:27017/studentdb
DB_URL=mongodb://host.docker.internal:27017/studentdb

Replace studentdb with your desired MongoDB database name, also replace the mongo connection string to work from inside Docker not localhost. You can set different databases for production and testing, as shown in the sample .env configuration.

    3. Install Dependencies
To install dependencies, run:

npm install

    4. Running the App Locally:
You can start the application locally using Node.js or Nodemon:

node src/server.js


    5. Running Unit Tests:
You can run the tests using the Jest test suite:

npm test


Docker Setup

You can build and run the project using Docker for a containerized environment.

1. Build the Docker image
Use the following command to build the Docker image:

docker build -t student-api:1.0.1 .

This will create a Docker image tagged student-api:1.0.1

2. Run the Docker container
To run the container with the .env file and exposed port, execute:

docker run --rm -p 3000:3000 --env-file .env student-api:1.0.1

This will run the API inside a Docker container on port 3000

Dockerfile Explanation
Multi-stage build is used to separate the build process from the runtime environment, keeping the final image smaller.
The builder stage installs the dependencies and copies the entire source code, while the runtime stage includes only the necessary files (such as the built app, node_modules, etc.) and reduces the image size.

Makefile
The Makefile contains useful commands to automate common tasks.

Makefile Commands

Build Docker image:
make build

Run the app with Docker:
make docker-run

Run unit tests:
make test

Start the development server (with Nodemon):
make dev

These commands help manage the project setup easily.