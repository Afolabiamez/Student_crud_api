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

