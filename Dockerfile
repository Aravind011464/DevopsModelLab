# Use the Node.js base image
FROM node:18

# Set the working directory
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the application port (change as needed)
EXPOSE 3000

# Define the command to run the application
CMD ["node", "server.js"]
