const express = require('express');
const router = express.Router();
const studentController = require('../controllers/studentController');

router.post('/api/v1/students', studentController.addStudent);
router.get('/api/v1/students', studentController.getAllStudents);
router.get('/api/v1/students/:id', studentController.getStudentById);
router.put('/api/v1/students/:id', studentController.updateStudent);
router.delete('/api/v1/students/:id', studentController.deleteStudent);

module.exports = router;

