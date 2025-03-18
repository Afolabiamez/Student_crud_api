# ---- Build Stage ----
    FROM node:18-alpine AS builder
    WORKDIR /app
    
    # Copy package.json and package-lock.json
    COPY package*.json ./
    
    # Install dependencies (including dev dependencies)
    RUN npm install 
    
    # Copy source codee
    COPY . .
    
    # # ---- Runtime Stage ----
    # FROM node:18-alpine
    # WORKDIR /app
    
    # # Copy only necessary files from builder stage
    # COPY --from=builder /app/package*.json ./
    # COPY --from=builder /app/node_modules ./node_modules
    # COPY --from=builder /app/src ./src
    
    # Expose application port
    EXPOSE 3000
    
    # Set environment variables (NO HARDCODED MongoDB URL)
    ENV NODE_ENV=production
    
    # Default command for running the app
    CMD ["npm", "start"]
  
    