# ---- Build Stage ----
FROM node:18-alpine AS builder
WORKDIR /app

# Copy only package.json and package-lock.json to leverage Docker caching
COPY package*.json ./
RUN npm install --omit=optional

# Copy source code
COPY . .



# ---- Runtime Stage ----
FROM node:18-alpine
WORKDIR /app

# Copy only necessary files from builder stage
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/src ./src


# Expose port
EXPOSE 3000

# Set environment variables
ENV NODE_ENV=production

# Command to start the application
CMD ["node", "src/server.js"]
