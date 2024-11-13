FROM node:14

# Cài đặt Python 3.8 và các dependencies cần thiết
RUN apt-get update && \
    apt-get install -y \
    python3.8 \
    python3.8-dev \
    python3-pip \
    build-essential && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1

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
