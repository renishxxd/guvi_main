# Use Node.js base image
FROM node:16

# Set working directory
WORKDIR /app

# Copy all project files into the container
COPY . .

# Optional: If you *do* have a node_modules folder, skip installing anything
RUN echo "No package.json found, skipping npm install"

# Expose the port your server listens on (update if not 3000)
EXPOSE 3000

# Start the server
CMD ["node", "server.js"]
