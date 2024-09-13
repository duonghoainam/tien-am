const Chapter = require('./chapter.model');
const config = require('../../config');

/**
 * Get list chapters of an audio book
 *
 * @async
 * @param {string} search
 * @param {string} audioBookId
 * @param {number} [page=config.appEnv.DEFAULT_PAGE]
 * @param {number} [size=config.appEnv.DEFAULT_SIZE]
 * @returns {Promise<{count: number, chapters: Chapter[]}>}
 */
async function getChaptersInBook(
  search,
  audioBookId,
  page = config.appEnv.DEFAULT_PAGE,
  size = config.appEnv.DEFAULT_SIZE
) {
  const filters = {
    $and: [
      { title: { $regex: search, $options: 'i' } },
      { audioBookId: audioBookId },
    ],
  };

  const count = await Chapter.where(filters).countDocuments();
  const chapters = await Chapter.find(filters, null, {
    skip: (page - 1) * size,
    limit: size,
    sort: { chapterIndex: 1 },
  });

  return { count, chapters };
}

/**
 * Create a chapter
 *
 * @async
 * @param {string} title
 * @param {string} audioBookId
 * @param {number} [duration]
 * @param {string} [audioId]
 * @returns {Promise<Chapter>}
 */
async function createChapter(title, audioBookId, duration, audioId) {
  const lastChapter = await Chapter.findOne({ audioBookId }, null, {
    sort: { chapterIndex: -1 },
  });

  const chapterIndex = lastChapter ? lastChapter.chapterIndex + 1 : 1;

  const chapter = await Chapter.create({
    audioBookId,
    chapterIndex,
    audioId,
    duration,
    title,
  });

  return chapter;
}

/**
 * Update a chapter
 *
 * @async
 * @param {string} id
 * @param {string} [title]
 * @param {string} [audioBookId]
 * @param {number} [duration]
 * @param {string} [audioId]
 * @param {number} [chapterIndex]
 *
 * @returns {Promise<Chapter>}
 */
async function updateChapter(
  id,
  title,
  audioBookId,
  duration,
  audioId,
  chapterIndex
) {
  const payload = {};
  if (title) payload['title'] = title;
  if (audioBookId) payload['audioBookId'] = audioBookId;
  if (duration) payload['duration'] = duration;
  if (audioId) payload['audioId'] = audioId;
  if (chapterIndex) payload['chapterIndex'] = chapterIndex;

  const updatedChapter = await Chapter.findOneAndUpdate({ _id: id }, payload, {
    new: true,
  });
  return updateChapter;
}
