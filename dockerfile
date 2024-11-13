FROM cimg/python:3.8-node

# Thiết lập môi trường
ENV NODE_ENV=production
ENV NPM_CONFIG_LOGLEVEL=error

WORKDIR /app

# Copy package files
COPY package*.json ./

# Cài đặt dependencies
RUN npm install --legacy-peer-deps

# Copy source code
COPY . .

# Build
RUN npm run build

# Expose port
EXPOSE 3000

# Start app
CMD ["npm", "start"]
