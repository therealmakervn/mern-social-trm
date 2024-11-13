const config = {
  env: process.env.NODE_ENV || 'development',
  port: process.env.PORT || 3000,
  jwtSecret: process.env.JWT_SECRET || "YOUR_secret_key", 
  mongoUri: process.env.MONGODB_URI || 'mongodb://localhost:27017/mern-social',
  socket: {
    serverPort: process.env.SOCKET_PORT || 3001
  }
}

export default config