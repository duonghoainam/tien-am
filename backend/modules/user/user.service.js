const User = require('./user.model');
const config = require('../../config');

async function getUsers(
  skip = config.appEnv.DEFAULT_SKIP,
  limit = config.appEnv.DEFAULT_LIMIT
) {
  const user = await User.find({
    skip,
    limit,
  });
  return user;
}

async function getUserById(id) {
  const user = await User.findById(id);
  return user;
}

module.exports = {
  getUsers,
  getUserById,
};
