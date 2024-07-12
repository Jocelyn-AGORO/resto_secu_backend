# Use an official Node.js runtime as the base image
FROM node:20-alpine

# Install sqlite3
RUN apk add --no-cache sqlite

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port your app runs on
EXPOSE 3000

# Start the app
CMD ["npm", "run", "start"]
