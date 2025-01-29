const mongoose = require('mongoose');
require('dotenv').config();

const connectDB = async () => {
    try {
        if (mongoose.connection.readyState !== 1) {
            await mongoose.connect(process.env.DB_URL);
            console.log('MongoDB Connected');
        }
    } catch (error) {
        console.error('MongoDB connection failed:', error.message);
        process.exit(1);
    }
};

module.exports = connectDB;

