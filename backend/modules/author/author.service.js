const Author = require('./author.model');
const config = require('../../config');
const stringUtils = require('../../utils/stringUtils');

/**
 * Get list authors
 *
 * @async
 * @param {string} search
 * @param {number} [page=config.appEnv.DEFAULT_PAGE]
 * @param {number} [size=config.appEnv.DEFAULT_SIZE]
 * @returns {Promise<{ count: number, authors: Author[]}>}
 */
async function getAuthors(
  search,
  page = config.appEnv.DEFAULT_PAGE,
  size = config.appEnv.DEFAULT_SIZE
) {
  const filters = {
    $or: [
      { name: { $regex: search, $options: 'i' } },
      { slug: { $regex: stringUtils.generateSlug(search), $options: 'i' } },
    ],
  };

  const count = await Author.where(filters).countDocuments();
  const authors = await Author.find(filters, null, {
    skip: (page - 1) * size,
    limit: size,
  });

  return { count, authors };
}

/**
 * Create author
 *
 * @async
 * @param {string} name
 * @returns {Promise<Author>}
 */
async function createAuthor(name) {
  const slug = stringUtils.generateSlug(name);

  const author = await Author.create({
    name,
    slug,
  });

  return author;
}

/**
 * Get author by ID
 *
 * @async
 * @param {string} id
 * @returns {Promise<Author>}
 */
async function getAuthorById(id) {
  return await Author.findById(id);
}

/**
 * Update author
 *
 * @async
 * @param {string} id
 * @param {string} [name]
 * @returns {Promise<Author>}
 */
async function updateAuthor(id, name) {
  const payload = {};
  if (name) {
    payload['name'] = name;
    payload['slug'] = stringUtils.generateSlug(name);
  }

  const author = await Author.findOneAndUpdate(
    { _id: id },
    payload,
    { new: true } // return updated document
  );
  return author;
}

/**
 * Delete author
 *
 * @async
 * @param {string} id
 * @returns {Promise<void>}
 */
async function deleteAuthor(id) {
  return await Author.deleteOne({ _id: id });
}

module.exports = {
  getAuthorById,
  getAuthors,
  createAuthor,
  updateAuthor,
  deleteAuthor,
};
