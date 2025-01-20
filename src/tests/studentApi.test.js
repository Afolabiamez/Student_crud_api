const request = require('supertest');
const mongoose = require('mongoose');
const app = require('../app'); // Import your Express app
const Student = require('../models/studentModel');

// Mock test DB URL
const DB_URL = process.env.TEST_DB_URL || 'mongodb://localhost:27017/studentdb_test';

// Connect to the test database before running tests
beforeAll(async () => {
    await mongoose.connect(DB_URL, {
        useNewUrlParser: true,
        useUnifiedTopology: true,
    });
});

// Clean up the test database after each test
afterEach(async () => {
    await Student.deleteMany();
});

// Close the DB connection after all tests
afterAll(async () => {
    await mongoose.connection.close();
});

describe('Student CRUD API', () => {
    test('POST /api/v1/students - Add a new student', async () => {
        const studentData = { name: 'John Doe', age: 20, class: 'CS101' };

        const res = await request(app)
            .post('/api/v1/students')
            .send(studentData);

        expect(res.statusCode).toBe(201);
        expect(res.body.name).toBe(studentData.name);
    });

    test('GET /api/v1/students - Get all students', async () => {
        await Student.create([{ name: 'Alice', age: 22, class: 'ENG201' }]);

        const res = await request(app).get('/api/v1/students');

        expect(res.statusCode).toBe(200);
        expect(res.body.length).toBeGreaterThan(0);
    });

    test('GET /api/v1/students/:id - Get a student by ID', async () => {
        const student = await Student.create({ name: 'Bob', age: 23, class: 'MATH101' });

        const res = await request(app).get(`/api/v1/students/${student._id}`);

        expect(res.statusCode).toBe(200);
        expect(res.body.name).toBe(student.name);
    });

    test('PUT /api/v1/students/:id - Update student information', async () => {
        const student = await Student.create({ name: 'Eve', age: 21, class: 'CS102' });
        const updatedData = { age: 25 };

        const res = await request(app).put(`/api/v1/students/${student._id}`).send(updatedData);

        expect(res.statusCode).toBe(200);
        expect(res.body.age).toBe(updatedData.age);
    });

    test('DELETE /api/v1/students/:id - Delete a student', async () => {
        const student = await Student.create({ name: 'Charlie', age: 22, class: 'HIST102' });

        const res = await request(app).delete(`/api/v1/students/${student._id}`);

        expect(res.statusCode).toBe(200);
        expect(res.body.message).toBe('Student deleted');
    });
});
