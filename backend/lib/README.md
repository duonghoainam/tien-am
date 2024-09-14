# lib Folder

This directory is used to integrate npm packages/libraries into the application.

Set up packages/libraries configuration here.

## Convention

All integrations should export and import into `index.js` file.
Other modules will use the integration by strictly importing from the `lib` module.

The file name must be the package/library name.
If we encounter duplicate names, please notify your Team Leader/Manager for solution.

- `lib/<<package_name>>.js`

For `index.js`, we will follow the following rule.

```js
import A from './<<package_name1>>.js';
import { B, C } from './<<package_name2>>.js';

const <<name2>>Lib = { B, C };

export { A, <<name2>>Lib };
```

As you can see, for `A`, we export it directly.
Direct export is used when it represents an **instance that exists globally** within the system
(ensuring that no additional functions/features are exported from it).
A typical example is an Express app or a logger.

For `B` and `C`, we group them into an instance called `<<name2>>Lib`.
Since one library can export many functions and features,
and they may have the same names as functions from other libraries,
grouping them helps us easily identify the source of the function when reviewing the code.

`<<name2>>` can be a general name for that group of functions and **doesn't necessarily** have to be the name of the package.
Here, we name it **based on its feature or use-case** within the system.

If an exception occurs, discuss it with your Team Leader/Manager to get guidance.

## Example

`express.js` file:
```js
import express from 'express';

const app = express();

export default app;
```

`index.js` file:
```js
import app from './express.js';

export { app }
```

Other modules:
```js
import { app } from './lib/index.js';
```
