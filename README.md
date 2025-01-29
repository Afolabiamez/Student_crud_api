# Student CRUD REST API

A simple REST API for managing student records built with Node.js, Express, and MongoDB. This API supports creating, retrieving, updating, and deleting student information, along with additional features like health checks, meaningful logs, and unit tests.

## Features

- **CRUD Operations:** Create, Read, Update, Delete student records.
- **API Versioning:** All endpoints support versioning (`/api/v1/`).
- **Health Check:** Ensure the server is running (`/healthcheck`).
- **Environment Variables:** Configurations like the database URL are managed through environment variables.
- **Logging:** Meaningful logs for monitoring and debugging.
- **Unit Tests:** Automated tests for API endpoints using Jest and Supertest.

## Prerequisites

Ensure the following are installed on your system:
- **Node.js** (>= 16.0.0)
- **npm** (>= 8.0.0)
- **MongoDB** (running locally)

## Project Structure

├── src │ ├── config │ │ └── db.js # MongoDB connection logic │ ├── controllers │ │ └── studentController.js # API business logic │ ├── models │ │ └── studentModel.js # MongoDB schema │ ├── routes │ │ └── studentRoutes.js # Routes for the API │ └── server.js # Express app and middleware setup ├── tests │ └── studentApi.test.js # Jest tests ├── .env # Environment variables ├── Makefile # Commands for building and running the project ├── Postman_Collection.json # Postman Collection ├── README.md # Documentation ├── package.json # npm dependencies


## Setup and Installation

### 1. Clone the Repository
```bash
git clone https://github.com/<your-github-username>/student-crud-api.git
cd student-crud-api
