import app from './app.js';
import { logger, dbLib, adminLib } from './lib/index.js';
import config from './config/index.js';

// const app = require('./app');
// const { logger, connectToDatabase } = require('./lib');
// const config = require("./config");

app.listen(config.appEnv.PORT, async () => {
  logger.info(`express app running in port ${config.appEnv.PORT}`);
  logger.info(
    `swagger docs url: access http://localhost:${config.appEnv.PORT}/docs`
  );
  logger.info(
    `admin panel url: access http://localhost:${config.appEnv.PORT}${adminLib.instance.options.rootPath}`
  );
  await dbLib.connectToDatabase();
});
