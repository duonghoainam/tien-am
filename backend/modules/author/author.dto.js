import Joi from 'joi';
import j2s from 'joi-to-swagger';

//#region ---------- Path Parameter ----------
//#endregion

//#region ---------- Query Parameter ----------
//#endregion

//#region ---------- Body ----------
const AuthorCreateBody = Joi.object().keys({
  name: Joi.string().required(),
});
const { swagger: AuthorCreateBodySwagger } = j2s(AuthorCreateBody);

const AuthorUpdateBody = Joi.object().keys({
  name: Joi.string().required(),
});
const { swagger: AuthorUpdateBodySwagger } = j2s(AuthorUpdateBody);
//#endregion

//#region ---------- Response ----------
const AuthorResponse = AuthorUpdateBody.append({
  _id: Joi.string().required(),
  slug: Joi.string().required(),
  updatedAt: Joi.string().required(),
  createdAt: Joi.string().required(),
});
const { swagger: AuthorResponseSwagger } = j2s(AuthorResponse);

const AuthorListResponse = Joi.array().items(AuthorResponse);
const { swagger: AuthorListResponseSwagger } = j2s(AuthorListResponse);
//#endregion

//#region ---------- Exports ----------
export {
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
