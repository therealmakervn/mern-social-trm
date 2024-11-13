FROM node:13.12.0

WORKDIR /app

# Copy package files
COPY package*.json ./

# Cài đặt dependencies
RUN npm install --legacy-peer-deps

# Copy source code
COPY . .

# Build
RUN npm run build

# Start app
CMD ["npm", "start"]
