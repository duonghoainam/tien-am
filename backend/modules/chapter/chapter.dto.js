const joi = require('joi');
const j2s = require('joi-to-swagger');
const { BaseQuery } = require('../base/base.dto');

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
  audioBookId: joi.string().required(),
  duration: joi.number().optional(),
  audioId: joi.string().optional(),
});
const { swagger: ChapterCreateBodySwagger } = j2s(ChapterCreateBody);

const ChapterUpdateBody = joi.object().keys({
  title: joi.string().optional(),
  audioBookId: joi.string().optional(),
  duration: joi.number().optional(),
  audioId: joi.string().optional(),
  chapterIndex: joi.number().optional(),
});
const { swagger: ChapterUpdateBodySwagger } = j2s(ChapterUpdateBody);
//#endregion

//#region ---------- Response ----------
const ChapterResponse = ChapterUpdateBody.append({
  _id: joi.string().required(),
  updatedAt: joi.date(),
  createdAt: joi.date(),
});
const { swagger: ChapterResponseSwagger } = j2s(ChapterResponse);

const ChapterListResponse = joi.array().items(ChapterResponse);
const { swagger: ChapterListResponseSwagger } = j2s(ChapterListResponse);
//#endregion

//#region ---------- Exports ----------
module.exports = {
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
