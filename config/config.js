const config = {
  env: process.env.NODE_ENV || 'development',
  port: process.env.PORT || 3000,
  jwtSecret: process.env.JWT_SECRET || "YOUR_secret_key",
  mongoUri: 'mongodb+srv://doadmin:caQJA315R6XC4789@db-mongodb-sgp1-40734-d82ef568.mongo.ondigitalocean.com/admin?replicaSet=db-mongodb-sgp1-40734&tls=true&authSource=admin'
}

export default config
