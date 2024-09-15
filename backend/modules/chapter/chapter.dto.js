import joi from 'joi';
import j2s from 'joi-to-swagger';
import { BaseQuery } from '../base/base.dto.js';

// const joi = require('joi');
// const j2s = require('joi-to-swagger');
// const { BaseQuery } = require('../base/base.dto');

//#region ---------- Path Parameter ----------
//#endregion

//#region ---------- Query Parameter ----------
const ChapterQuery = BaseQuery.append({
  audioBookId: joi.string().optional(),
});
const { swagger: ChapterQuerySwagger } = j2s(ChapterQuery);
//#endregion

//#region ---------- Body ----------
const ChapterCreateBody = joi.object().keys({
  title: joi.string().required(),
  audioBookId: joi.string().hex().length(24).required(),
  duration: joi.number().optional(),
  audioId: joi.string().hex().length(24).required(),
});
const { swagger: ChapterCreateBodySwagger } = j2s(ChapterCreateBody);

const ChapterUpdateBody = joi.object().keys({
  title: joi.string().optional(),
  audioBookId: joi.string().hex().length(24).required(),
  duration: joi.number().optional(),
  audioId: joi.string().hex().length(24).required(),
  chapterIndex: joi.number().optional(),
});
const { swagger: ChapterUpdateBodySwagger } = j2s(ChapterUpdateBody);
//#endregion

//#region ---------- Response ----------
const ChapterResponse = ChapterUpdateBody.append({
  _id: joi.string().required(),
  updatedAt: joi.date().required(),
  createdAt: joi.date().required(),
});
const { swagger: ChapterResponseSwagger } = j2s(ChapterResponse);

const ChapterListResponse = joi.array().items(ChapterResponse);
const { swagger: ChapterListResponseSwagger } = j2s(ChapterListResponse);
//#endregion

//#region ---------- Exports ----------
export {
  ChapterQuery,
  ChapterQuerySwagger,

  ChapterCreateBody,
  ChapterCreateBodySwagger,
  ChapterUpdateBody,
  ChapterUpdateBodySwagger,

  ChapterResponse,
  ChapterResponseSwagger,
  ChapterListResponse,
  ChapterListResponseSwagger,
};
//#endregion
