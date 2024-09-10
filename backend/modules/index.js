const userRouter = require("./user/user.route");
const express = require('express');

const subApp = express();

subApp.use(userRouter);

module.exports = subApp;
