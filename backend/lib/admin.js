import AdminJS from 'adminjs';
import AdminJSExpress from '@adminjs/express';
import * as AdminJSMongoose from '@adminjs/mongoose';
import * as model from '../modules/adminModel.js';
import { hashText } from './bcrypt.js';

AdminJS.registerAdapter(AdminJSMongoose);

const admin = new AdminJS({
  resources: [
    {
      resource: model.User,
      options: {
        properties: {
          hashedPassword: {
            isVisible: false,
          },
          password: {
            type: 'string',
            isVisible: {
              // Make password visible in the edit mode.
              list: false,
              edit: true,
              filter: false,
              show: false,
            },
          },
        },
        actions: {
          new: {
            // Hash the password.
            before: async (request) => {
              if (request?.payload?.password) {
                request.payload = {
                  ...request.payload,
                  encryptedPassword: await hashText(request.payload.password),
                  password: undefined,
                };
              }
              return request;
            },
          },
        },
      },
    },
    {
      resource: model.Chapter,
    },
    {
      resource: model.Author,
    },
  ],
  rootPath: '/admin', // Path to the AdminJS dashboard.
});

const adminRouter = AdminJSExpress.buildRouter(admin);

export { admin, adminRouter };
