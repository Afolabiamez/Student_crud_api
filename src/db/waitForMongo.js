const mongoose = require('mongoose');

const waitForMongo = async (uri, retries = 10, delay = 5000) => {
  while (retries > 0) {
    try {
      await mongoose.connect(uri);
      console.log('✅ MongoDB Connected');
      return;
    } catch (error) {
      console.log(
        `🔄 MongoDB not ready. Retrying in ${delay / 1000} seconds...`
      );
      retries--;
      await new Promise((res) => setTimeout(res, delay));
    }
  }
  throw new Error('❌ MongoDB connection failed after multiple attempts.');
};

module.exports = waitForMongo;
