const express = require("express");
const bodyParser = require("body-parser");
const morgan = require("morgan");
const cors = require("cors");
require("dotenv").config();
const errorHandler = require("./middlewares/errorHandler");
const studentRoutes = require("./routes/studentRoutes");
const connectDB = require("./db/db");

const app = express();
const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  connectDB();
  console.log(`server started at http://localhost:${PORT}`);
});

// Middleware
app.use(morgan("dev"));
app.use(cors());
app.use(bodyParser.json());

app.use(studentRoutes);

// Error handling middleware
app.use(errorHandler);

// Health Check, checks health
app.get("/healthcheck", (req, res) => {
  res.status(200).json({ status: "API is healthy!" });
});

// Error Handling Middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ error: "Internal Server Error" });
});

module.exports = app;
