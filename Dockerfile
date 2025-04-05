# Use official Node.js image
FROM node:16

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy all project files
COPY . .

# Expose port 3000 (or change if needed)
EXPOSE 3000

# Start the server
CMD ["node", "server.js"]
