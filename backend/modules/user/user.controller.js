const service = require('./user.service');

async function getUsersHandler(req, res, next) {
  try {
    const users = await service.getUsers();

    res.status(200).json({
      data: users
    })
  } catch (error) {
    return next(error);
  }
}

async function createUsersHandler(req, res, next) {
  res.send("POST users")
}

async function getUserByIdHandler(req, res, next) {
  try {
    const { id } = req.params;
    const user = await service.getUserById(id)

    res.status(200).json(user);
  } catch (error) {
    return next(error);
  }
}

async function updateUsersHandler(req, res, next) {
  res.send("PATCH users")
}

async function deleteUsersHandler(req, res, next) {
  res.send("DELETE users")
}

module.exports = {
  getUsersHandler,
  createUsersHandler,
  getUserByIdHandler,
  updateUsersHandler,
  deleteUsersHandler
}
