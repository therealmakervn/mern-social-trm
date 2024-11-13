FROM node:16

WORKDIR /app

# Copy package files
COPY package.json ./

# Install dependencies
RUN npm install --legacy-peer-deps

# Copy source code
COPY . .

# Set NODE_OPTIONS for OpenSSL
ENV NODE_ENV=production
ENV NODE_OPTIONS=--openssl-legacy-provider

# Build the app
RUN npm ci

# Start the app
CMD ["npm", "start"]
