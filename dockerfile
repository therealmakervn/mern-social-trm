FROM node:14-slim

# Cài đặt Python 3.8
RUN apt-get update && \
    apt-get install -y python3.8 \
    python3-pip \
    build-essential && \
    ln -sf /usr/bin/python3.8 /usr/bin/python && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Thiết lập môi trường
ENV NODE_ENV=production
ENV NPM_CONFIG_LOGLEVEL=error
ENV PYTHON=/usr/bin/python3.8

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
