const app = require('./app');


require('dotenv').config();

app.listen(process.env.PORT, () => {
  console.info(`express app running in port ${process.env.PORT}`)
});
