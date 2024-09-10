const swaggerAutogen = require('swagger-autogen')({openapi: '3.0.0'});
const { swaggerOutputFile } = require('./lib');
const config = require('./config');

const swaggerOptions = {
  info: {
    title: 'TinYin API',
    description: 'TinYin API Information',
    version: '1.0.0',
  },
  servers: [
    {
      url: `http://localhost:${config.appEnv.PORT}`,
      description: 'Local Environment'
    },
  ],
  components: {
    securitySchemes:{
      bearerAuth: {
        type: 'http',
        scheme: 'bearer'
      }
    }
  }
};

const routes = ['./app.js'];
const distDir = "./dist"

var fs = require('fs');
if (!fs.existsSync(distDir)){
  fs.mkdirSync(distDir);
}

swaggerAutogen(swaggerOutputFile, routes, swaggerOptions)
