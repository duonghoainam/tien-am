const joi = require('joi');
const j2s = require('joi-to-swagger');

//#region ---------- Path Parameter ----------
//#endregion

//#region ---------- Query Parameter ----------
//#endregion

//#region ---------- Body ----------
const AuthorCreateBody = joi.object().keys({
  name: joi.string().required(),
});
const { swagger: AuthorCreateBodySwagger } = j2s(AuthorCreateBody);

const AuthorUpdateBody = joi.object().keys({
  name: joi.string().required(),
});
const { swagger: AuthorUpdateBodySwagger } = j2s(AuthorUpdateBody);
//#endregion

//#region ---------- Response ----------
const AuthorResponse = AuthorUpdateBody.append({
  _id: joi.string().required(),
  slug: joi.string().required(),
  updatedAt: joi.string().required(),
  createdAt: joi.string().required(),
});
const { swagger: AuthorResponseSwagger } = j2s(AuthorResponse);

const AuthorListResponse = joi.array().items(AuthorResponse);
const { swagger: AuthorListResponseSwagger } = j2s(AuthorListResponse);
//#endregion

//#region ---------- Exports ----------
module.exports = {
  AuthorCreateBody,
  AuthorCreateBodySwagger,
  AuthorUpdateBody,
  AuthorUpdateBodySwagger,

  AuthorResponse,
  AuthorResponseSwagger,
  AuthorListResponse,
  AuthorListResponseSwagger,
};
//#endregion
