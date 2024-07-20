# Use an official Node runtime as a parent image
FROM node:18-slim

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget gnupg ca-certificates

# Add Google's official GPG key
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -

# Add the Google Chrome repository
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'

# Install Google Chrome
RUN apt-get update && \
    apt-get install -y google-chrome-stable

# Set up Puppeteer to not download Chromium as it will use the one installed
ENV PUPPETEER_SKIP_DOWNLOAD=true

# Install Puppeteer
RUN npm install puppeteer

# Copy the application code
WORKDIR /usr/src/app
COPY . .

# Install dependencies for your application
RUN npm install

# Command to run your application
CMD ["node", "index.js"]
