import { app, swaggerLib, adminLib } from './lib/index.js';
import subApp from './modules/index.js';

const { default: swaggerOutputJson } = await import(swaggerLib.swaggerOutputFile, {
  with: { type: 'json' },
});

app.use('/api/v1', subApp);
app.use('/docs', swaggerLib.swaggerUi.serve, swaggerLib.swaggerUi.setup(swaggerOutputJson));
app.use(adminLib.instance.options.rootPath, adminLib.router);

export default app;
