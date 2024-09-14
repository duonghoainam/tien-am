import logger from './winston.js';
import app from './express.js';
import { connectToDatabase } from './mongoose.js';
import { swaggerUi, swaggerOutputFile } from './swagger-ui-express.js';
import { hashText } from './bcrypt.js';
import { admin, adminRouter } from './admin.js';

const dbLib = { connectToDatabase };
const swaggerLib = { swaggerUi, swaggerOutputFile };
const hashLib = { hashText };
const adminLib = { router: adminRouter, instance: admin };

export { logger, app, dbLib, swaggerLib, hashLib, adminLib };
