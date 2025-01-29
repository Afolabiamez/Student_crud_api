# Student CRUD API

This is a simple RESTful API for managing student records using Node.js, Express, and MongoDB. The API allows you to create, read, update, and delete student records.

## Features

- Add a new student
- Get all students
- Get a student by ID
- Update student information
- Delete a student
- API versioning (`/api/v1/students`)
- Health check endpoint (`/healthcheck`)
- Docker support
- Unit tests with Jest
- Postman collection for API testing

---

## 🚀 Getting Started

### Prerequisites

Ensure you have the following installed:

- [Node.js](https://nodejs.org/) (v18 or later)
- [MongoDB](https://www.mongodb.com/) (running locally or in the cloud)
- [Docker](https://www.docker.com/) (if you want to use Docker)
- [Postman](https://www.postman.com/) (optional, for API testing)

---

## ⚙️ Installation & Setup

1. **Clone the repository**
   ```sh
   git clone https://github.com/yourusername/student-crud-api.git
   cd student-crud-api
   ```

2. **Install dependencies**
   ```sh
   npm install
   ```

3. **Create a `.env` file in the root directory and add:**
   ```
   PORT=3000
   DB_URL=mongodb://localhost:27017/studentdb
   ```

4. **Run MongoDB locally (if not already running)**
   ```sh
   mongod
   ```

---

## 🏃 Running the Application

### 1️⃣ Running in Development Mode

```sh
npm start
```
or using Nodemon for automatic restarts:
```sh
npm run dev
```

### 2️⃣ Running Tests

Run unit tests using Jest:
```sh
npm test
```

---

## 📦 Docker Instructions

### 1️⃣ Build Docker Image
```sh
docker build -t student-api:1.0.1 .
```

### 2️⃣ Run Container
```sh
docker run --rm -p 3000:3000 --env-file .env student-api:1.0.1
```

### 3️⃣ Stop Container
Press `Ctrl+C` or run:
```sh
docker stop <container_id>
```

---

## 📜 API Endpoints

| Method | Endpoint                   | Description              |
|--------|----------------------------|--------------------------|
| POST   | `/api/v1/students`         | Add a new student       |
| GET    | `/api/v1/students`         | Get all students        |
| GET    | `/api/v1/students/:id`     | Get student by ID       |
| PUT    | `/api/v1/students/:id`     | Update student details  |
| DELETE | `/api/v1/students/:id`     | Delete a student        |
| GET    | `/healthcheck`             | API health check        |

---

## 🛠 Makefile Commands

| Command    | Description                         |
|------------|-------------------------------------|
| `make install` | Install dependencies          |
| `make start`   | Start the server              |
| `make dev`     | Start the server in dev mode  |
| `make test`    | Run Jest tests                |
| `make build`   | Build the Docker image        |
| `make run`     | Run the Docker container      |

---

## 🎯 Postman Collection

To test the API endpoints using Postman:

1. Import the collection in `postman_collection.json`
2. Update the `base_url` if necessary
3. Run the requests and verify responses

---

## 🚦 Logging & Debugging

- API uses **winston** for structured logging.
- Logs are categorized as:
  - **INFO** → General logs
  - **ERROR** → Error logs
  - **DEBUG** → Debugging logs (only in development)

---


