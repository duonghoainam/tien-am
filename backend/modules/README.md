# modules Folder

This is the place to develop the main features and list the use-cases of the application.

A typical use-case will have a template as follows:

- `controller`: Handle logic for RESTful API.
- `service`: Process data, interact with the database.
- `model`: Define Entity schema.
- `route`: Define API route and API document.
- `test` (Optional): Create test case here.
- `dto` (Optional): Validate API payload, response,...
- `enum` (Optional): Define Enum Variable.
- `constant` (Optional): Define Constant Variable.

## Convention

Each use-case will be a directory containing code within this folder.
The name of the directory will be the name of the use-case, following the camel case convention.

- `modules/<<use-case_name>>`

In the use-case directory, the files will follow the naming convention as follows:

- `modules/<<use-case_name>>/<<use-case_name>>.controller.js`
- `modules/<<use-case_name>>/<<use-case_name>>.model.js`
- `modules/<<use-case_name>>/<<use-case_name>>.route.js`
- `modules/<<use-case_name>>/<<use-case_name>>.abcxyz.js`

Right in the `modules` directory, we will have the `index.js` file.
This is where we import all the routes defined in the use-cases into the application.

```js
import <<use-case_name>>Router from './<<use-case_name>>/<<use-case_name>>.route.js';
import express from 'express';

const subApp = express();

subApp.use(<<use-case_name>>Router);
```

In addition, we have the `adminModel.js` file,
which is where we export the models for the use-cases that need to be registered on
the admin panel of the [AdminJs](https://docs.adminjs.co/installation/plugins/express) library.

```js
import <<Use-case>> from "./<<use-case>>/<<use-case>>.model.js";

export { <<Use-case>> }
```

At the same level as the `modules` directory, locate the `app.js` file and load it into the Express application.

```js
import { app } from './lib/index.js';
import subApp from './modules/index.js';

app.use('/api/v1', subApp);

export default app;
```

**We have a directory named `base` inside the `modules`, which contains functions/modules that can be reused for other use cases. You should check whether the feature you are about to work on needs to use these features to avoid creating duplicate code.**

### Controller

By default, each function of the controller takes `request`, `response` and `next` as input,
and using either regular functions or arrow functions is **acceptable**.

However, we will have naming conventions for functions responsible for handling the logic for APIs as follows.

Regular functions:

```js
async function <<action>>Handler(req, res) {
  res.send("data");
}
```

Arrow functions:

```js
<<action>>Handler = async (req, res) => {
  res.send("data");
}
```

### Service

Using either regular functions or arrow functions is **acceptable**.

Naming conventions should clearly reflect the specific action of the function.
Instead of trying to come up with the shortest name possible, aim for the clearest name possible.

In cases where the name is too long to describe, use a shorter name and add a description right above it.
Refer to [JSDoc](https://jsdoc.app/howto-commonjs-modules) for guidance.

```js
/**
 * Do something.
 * @param {string} field1 - The first field.
 * @param {string} field2 - The second field.
 * @return {string} The result.
 */
async function doSomething(field1, field2) {
  // TODO
  return field1 + field2
}
```

### Model

If this is the use-case of a specific entity,
this will be the place where the schema for that entity is defined (including nested schemas of that entity).

This is also where the hooks of this object are defined.

```js
import mongoose from 'mongoose';
const { Schema } = mongoose;

const <<entity>>Schema = new Schema(
  {
    field1: {
      type: String,
    },
  }
);

<<entity>>Schema.pre('save', function(next) {
  // TODO
});

const <<Entity>> = mongoose.model('<<Entity>>', <<entity>>Schema);

export default <<Entity>>;
```

### Route

Define the possible routes here. Add middleware and controller handler functions to the corresponding routes.

Routes must adhere to **OpenAPI** standards.
Because we use [Swagger Autogen](https://github.com/swagger-autogen/swagger-autogen) to automatically read the existing routes in Express and generate the Swagger UI.

```js
import { Router } from 'express';
import * as controller from './<<use-case_name>>.controller.js';

const router = Router();

router.route('/<<use-case_name_plural>>')
  .get((req, res, next) => {
    /* #swagger.responses[200] = {
        content: {
          "application/json": {
            schema: {
              type: "array",
              items: {
                type: "object",
                $ref: "#/components/schemas/<<use-case_name>>Response"
              }
            }
          }
        }
      }
    */
    next();
  }, controller.get)
  .post(controller.create)
```

### Test

TODO

### DTO

This is where we define some data structures using [Joi](https://joi.dev/api/?v=17.13.3).
We use it to validate and specify the structure of the request body and response model of the API.

Additionally, we will get support from [joi-to-swagger](https://github.com/Twipped/joi-to-swagger)
and [Swagger Autogen](https://github.com/swagger-autogen/swagger-autogen) to automatically generate schemas in Swagger.
However, it's not omnipotent; you need to name variables correctly so that the system can detect them and include them in Swagger.

There will be 5 main sections in this file.

1. Path Parameter: define and export path parameter schema.
2. Query Parameter: define and export query parameter schema.
3. Body: define and export request body schema.
4. Response: define and export response schema.
5. Exports: export all schemas.


The variable naming rules will follow as below:

- `<<use-case>>Param`: path parameter schema. Actually, Swagger Autogen automatically adds the corresponding path parameters when we define them on the router.
Therefore, here we only need to define the schema to validate the input data.
- `<<use-case>>Query`: query parameter schema. The corresponding Swagger variable name is `<<use-case>>QuerySwagger`.
- `<<use-case>>Body`: request body schema. The corresponding Swagger variable name is `<<use-case>>BodySwagger`.
- `<<use-case>>Response`: response schema. This is only used to represent the response structure of the API. The corresponding Swagger variable name is `<<use-case>>ResponseSwagger`.

If you have a variable that needs to break this naming convention,
please discuss it with your Team Leader/Manager to get guidance,
and provide thorough documentation using [JSDoc](https://jsdoc.app/howto-commonjs-modules).

```js
const <<use-case>>Response = joi.object().keys({
  _id: joi.string().required(),
});
const { swagger: <<use-case>>ResponseSwagger } = j2s(<<use-case>>Response);
```

### Enum

Enums should be created using the `Object.freeze` function, with the Enum name following these conventions:

- `<<enum_name>>Enum`

The keys of the enum should be written in all uppercase.

```js
export const <<enum_name>>Enum = Object.freeze({
  ENUM1: 'enum1',
  ENUM2: 'enum2',
});
```

### Constant

Constants are used to define values that do not change throughout the application's runtime.
Their names should be written in all uppercase and follow the snake_case convention.

```js
export const CONSTANT_VARIABLE = "constant variable"
```

## Example

With the user use-case, we will have the use-case directory as follows.

- `modules/user`

Inside user use-case:

- `modules/user/user.controller.js`
- `modules/user/user.service.js`
- `modules/user/user.model.js`
- `modules/user/user.dto.js`
- `modules/user/user.route.js`
- etc.

Now, import user route into `index.js` file:

```js
import userRouter from './user/user.route.js';
import express from 'express';

const subApp = express();

subApp.use(userRouter);

export default subApp;
```

If it needs to be interacted with on the Admin Panel,
export it in `adminModel.js` and add it to the resources of AdminJS.

```js
import User from "./user/user.model.js";

export { User }
```

Load it into AdminJS.

```js
import AdminJS from 'adminjs';
import AdminJSExpress from '@adminjs/express';
import * as AdminJSMongoose from '@adminjs/mongoose';
import * as model from '../modules/adminModel.js';

AdminJS.registerAdapter(AdminJSMongoose);

const admin = new AdminJS({
  resources: [
    ...,
    {
      resource: model.User,
    },
  ]
});

const adminRouter = AdminJSExpress.buildRouter(admin);

export { admin, adminRouter };
```


Load it into the Express application.

```js
import { app, adminLib } from './lib/index.js';
import subApp from './modules/index.js';

app.use(subApp);
app.use(adminLib.instance.options.rootPath, adminLib.router);

module.exports = app;
```
