require('@dotenvx/dotenvx').config()

module.exports = {
  appEnv: {
    TZ: process.env.TZ || "Asia/Ho_Chi_Minh",
    PORT: process.env.PORT || "3001",
    NODE_ENV: process.env.NODE_ENV || "development",
    MONGODB_URI: process.env.MONGODB_URI || "mongodb://root:example@127.0.0.1:27017",
    DB_NAME: process.env.DB_NAME || "tinyin"
  },
  auth: {
    secret: process.env.SECRET_KEY
  }
}
