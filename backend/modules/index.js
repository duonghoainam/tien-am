import userRouter from './user/user.route.js';
import chapterRouter from './chapter/chapter.route.js';
import authorRouter from './author/author.route.js';
import express from 'express';

const subApp = express();

subApp.use(express.json());
subApp.use(userRouter);
subApp.use(chapterRouter);
subApp.use(authorRouter);

export default subApp;
