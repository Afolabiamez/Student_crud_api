const winston = require('winston');

const { combine, timestamp, json, printf } = winston.format;

// Custom log format
const logFormat = printf(({ level, message, timestamp }) => {
    return `${timestamp} ${level}: ${message}`;
});

// Create a logger instance
const logger = winston.createLogger({
    level: 'info', // Default log level can be set to 'info', 'warn', 'error', etc.
    format: combine(
        timestamp({ format: 'YYYY-MM-DD HH:mm:ss' }), // Adds timestamp to logs
        logFormat
    ),
    transports: [
        // Log to console
        new winston.transports.Console({
            format: combine(winston.format.colorize(), logFormat),
        }),
        // Optionally log to a file
        new winston.transports.File({ filename: 'logs/app.log' })
    ]
});

module.exports = logger;
