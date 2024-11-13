# Stage 1: Cài đặt Python
FROM python:3.8-slim as python-base

# Stage 2: Build ứng dụng
FROM node:14

# Copy Python từ stage 1
COPY --from=python-base /usr/local/bin/python3.8 /usr/local/bin/python3.8
COPY --from=python-base /usr/local/lib/python3.8 /usr/local/lib/python3.8
COPY --from=python-base /usr/local/lib/libpython3.8.so* /usr/local/lib/
RUN ln -sf /usr/local/bin/python3.8 /usr/local/bin/python

# Thiết lập môi trường
ENV NODE_ENV=production
ENV NPM_CONFIG_LOGLEVEL=error
ENV PYTHON=/usr/local/bin/python3.8

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
