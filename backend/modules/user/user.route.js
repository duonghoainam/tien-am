const { Router } = require('express');
const controller = require('./user.controller');

const router = Router()

router.route('/users')
  .get(controller.getUsersHandler)
  .post(controller.createUsersHandler)

router.route('/users/:id')
  .get(controller.getUserByIdHandler)
  .patch(controller.updateUsersHandler)
  .delete(controller.deleteUsersHandler)

module.exports = router;
