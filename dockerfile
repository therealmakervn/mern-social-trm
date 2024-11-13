FROM node:14

# Thêm các biến môi trường
ENV NODE_ENV=production
ENV NPM_CONFIG_LOGLEVEL=error

WORKDIR /app

# Copy package files
COPY package*.json ./

# Cài đặt dependencies trong development mode
ENV NPM_CONFIG_PRODUCTION=false
RUN npm install --legacy-peer-deps

# Copy source code
COPY . .

# Tạo thư mục images trong dist
RUN mkdir -p dist/images

# Build
RUN npm run build

# Chuyển sang production mode
ENV NPM_CONFIG_PRODUCTION=true

# Start app
CMD ["npm", "start"]
