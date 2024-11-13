const config = {
  env: process.env.NODE_ENV || 'development',
  port: process.env.PORT || 3000,
  jwtSecret: process.env.JWT_SECRET || "YOUR_secret_key", 
  mongoUri: process.env.MONGODB_URI || 'mongodb://mongo:xnOzmpwYwqMkPVUJKPeCzKPaiCcAgqPJ@autorack.proxy.rlwy.net:41344',
  socket: {
    serverPort: process.env.SOCKET_PORT || 3001
  }
}

export default config