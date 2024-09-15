import * as authorService from './author.service.js';
import { BaseQuery, BaseParam } from '../base/base.dto.js';
import { AuthorCreateBody, AuthorUpdateBody } from './author.dto.js';

async function getAuthorsHandler(req, res, next) {
  try {
    const { error, value: query } = BaseQuery.validate(req.query);
    if (error) {
      return res.status(422).json({ message: error.details[0].message });
    }

    const { count, authors } = await authorService.getAuthors(
      query.search,
      query.page,
      query.size
    );

    return res.status(200).json({
      total: count,
      page: query.page,
      size: query.size,
      data: authors,
    });
  } catch (error) {
    return next(error);
  }
}

async function createAuthorHandler(req, res, next) {
  try {
    const { error, value: payload } = AuthorCreateBody.validate(req.body);
    if (error) {
      return res.status(422).json({ message: error.details[0].message });
    }

    const author = await authorService.createAuthor(payload.name);

    return res.status(201).json(author);
  } catch (error) {
    if (error.errorResponse.code === 11000) {
      return res.status(409).json({
        message: error.errorResponse.errmsg,
      });
    }
    return next(error);
  }
}

async function getAuthorByIdHandler(req, res, next) {
  try {
    const {
      error,
      value: { id },
    } = BaseParam.validate(req.params);
    if (error) {
      return res.status(422).json({ message: error.details[0].message });
    }

    const author = await authorService.getAuthorById(id);
    if (!author) {
      return res.status(404).json({ message: `Author not found: id=${id}` });
    }

    return res.status(200).json(author);
  } catch (error) {
    return next(error);
  }
}

async function updateAuthorHandler(req, res, next) {
  try {
    const {
      error: paramErr,
      value: { id },
    } = BaseParam.validate(req.params);
    if (paramErr) {
      return res.status(422).json({ message: paramErr.details[0].message });
    }

    const { error: bodyErr, value: payload } = AuthorUpdateBody.validate(
      req.body
    );
    if (bodyErr) {
      return res.status(422).json({ message: bodyErr.details[0].message });
    }

    const author = await authorService.getAuthorById(id);
    if (!author) {
      return res.status(404).json({ message: `Author not found: id=${id}` });
    }

    const updatedAuthor = await authorService.updateAuthor(id, payload.name);

    return res.status(200).json(updatedAuthor);
  } catch (error) {
    return next(error);
  }
}

async function deleteAuthorHandler(req, res, next) {
  try {
    const {
      error,
      value: { id },
    } = BaseParam.validate(req.params);
    if (error)
      return res.status(422).json({ message: error.details[0].message });

    const author = await authorService.getAuthorById(id);
    if (!author)
      return res.status(404).json({ message: `Author not found: id=${id}` });

    await authorService.deleteAuthor(id);

    return res.status(200).json({ message: 'Success' });
  } catch (error) {
    return next(error);
  }
}

export {
  getAuthorByIdHandler,
  getAuthorsHandler,
  createAuthorHandler,
  updateAuthorHandler,
  deleteAuthorHandler,
};
