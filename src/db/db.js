const mongoose = require("mongoose");
require("dotenv").config();

console.log("🔍 MONGO_URI:", process.env.MONGO_URI); // Debugging line

const connectDB = async () => {
  try {
    if (mongoose.connection.readyState !== 1) {
      if (!process.env.MONGO_URI) {
        throw new Error(
          "MONGO_URI is not set. Check your environment variables."
        );
      }
      await mongoose.connect(process.env.MONGO_URI);
      console.log("✅ MongoDB Connected");
    }
  } catch (error) {
    console.error(" MongoDB connection failed:", error.message);
    process.exit(1);
  }
};

module.exports = connectDB;
