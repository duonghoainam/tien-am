const userRouter = require('./user/user.route');
const chapterRouter = require('./chapter/chapter.route');
const authorRouter = require('./author/author.route');
const express = require('express');

const subApp = express();

subApp.use(express.json());
subApp.use(userRouter);
subApp.use(chapterRouter);
subApp.use(authorRouter);

module.exports = subApp;
