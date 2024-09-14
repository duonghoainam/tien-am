import userRouter from './user/user.route.js';
import chapterRouter from './chapter/chapter.route.js';
import express from 'express';

const subApp = express();

subApp.use(express.json());
subApp.use(userRouter);
subApp.use(chapterRouter);

export default subApp;
