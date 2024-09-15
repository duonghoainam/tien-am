import * as chapterService from './chapter.service.js';
import {
  ChapterCreateBody,
  ChapterQuery,
  ChapterResponse,
  ChapterUpdateBody,
} from './chapter.dto.js';
import { BaseParam } from '../base/base.dto.js';

// const chapterService = require('./chapter.service');
// const {
//   ChapterCreateBody,
//   ChapterQuery,
//   ChapterResponse,
//   ChapterUpdateBody,
// } = require('./chapter.dto');
// const { BaseParam } = require('../base/base.dto');

async function getChaptersHandler(req, res, next) {
  try {
    const { error, value: query } = ChapterQuery.validate(req.query);
    if (error) {
      return res.status(422).json({ message: error.details[0].message });
    }

    const { count, chapters } = await chapterService.getChapters(
      query.search,
      query.audioBookId,
      query.page,
      query.size
    );

    return res.status(200).json({
      total: count,
      page: query.page,
      size: query.size,
      data: chapters,
    });
  } catch (error) {
    return next(error);
  }
}

async function createChapterHanlder(req, res, next) {
  try {
    const { error, value: payload } = ChapterCreateBody.validate(req.body);
    if (error) {
      return res.status(422).json({ message: error.details[0].message });
    }

    const chapter = await chapterService.createChapter(
      payload.title,
      payload.audioBookId,
      payload.duration,
      payload.audioId
    );

    return res.status(201).json(chapter);
  } catch (error) {
    if (error.errorResponse?.code === 11000) {
      return res.status(409).json({
        message: error.errorResponse.errmsg,
      });
    }
    return next(error);
  }
}

async function getChapterByIdHandler(req, res, next) {
  try {
    const {
      error,
      value: { id },
    } = BaseParam.validate(req.params);
    if (error) {
      return res.status(422).json({ message: error.details[0].message });
    }

    const chapter = await chapterService.getChapterById(id, true);
    if (!chapter) {
      return res.status(404).json({ message: `Chapter not found: id=${id}` });
    }

    return res.status(200).json(chapter);
  } catch (error) {
    return next(error);
  }
}

async function updateChapterHandler(req, res, next) {
  try {
    const {
      paramErr,
      value: { id },
    } = BaseParam.validate(req.params);
    if (paramErr) {
      return res.status(422).json({ message: paramErr.details[0].message });
    }

    const { bodyErr, value: payload } = ChapterUpdateBody.validate(req.body);
    if (bodyErr) {
      return res.status(422).json({ message: bodyErr.details[0].message });
    }

    const chapter = await chapterService.getChapterById(id);
    if (!chapter) {
      return res.status(404).json({ message: `Chapter not found: id=${id}` });
    }

    const updatedChapter = await chapterService.updateChapter(
      id,
      payload.title,
      payload.audioBookId,
      payload.duration,
      payload.audioId,
      payload.chapterIndex
    );

    return res.status(200).json(updatedChapter);
  } catch (error) {
    return next(error);
  }
}

async function deleteChapterHandler(req, res, next) {
  try {
    const {
      paramErr,
      value: { id },
    } = BaseParam.validate(req.params);
    if (paramErr) {
      return res.status(422).json({ message: paramErr.details[0].message });
    }

    const chapter = await chapterService.getChapterById(id);
    if (!chapter) {
      return res.status(404).json({ message: `Chapter not found: id=${id}` });
    }

    await chapterService.deleteChapter(id);

    return res.status(200).json({ message: 'Success' });
  } catch (error) {
    return next(error);
  }
}

export {
  getChapterByIdHandler,
  getChaptersHandler,
  createChapterHanlder,
  updateChapterHandler,
  deleteChapterHandler,
};
