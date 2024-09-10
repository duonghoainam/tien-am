const { app } = require('./lib');
const { userRouter } = require('./modules');

app.use(userRouter);

module.exports = app;
