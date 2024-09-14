import { Router } from 'express';
import * as controller from './user.controller.js';

const router = Router()

router.route('/users')
  .get((req, res, next) => {
    /* #swagger.parameters['$ref'] = [
      '#/components/parameters/BaseQuerySearch',
      '#/components/parameters/BaseQueryPage',
      '#/components/parameters/BaseQuerySize',
    ] */
    /* #swagger.responses[200] = {
        content: {
          "application/json": {
            schema: {
              $ref: "#/components/schemas/BasePagiResponse",
              type: "object",
              properties: {
                data: {
                  $ref: "#/components/schemas/UserListResponse"
                }
              }
            }
          }
        }
    } */
    next();
  }, controller.getUsersHandler)
  .post((req, res, next) => {
    /*  #swagger.requestBody = {
        required: true,
        content: {
          "application/json": {
            schema: {
              $ref: "#/components/schemas/UserCreateBody"
            }
          }
        }
    }
    */
    /* #swagger.responses[201] = {
        content: {
          "application/json": {
            schema: {
              $ref: "#/components/schemas/UserResponse"
            }
          }
        }
      }
    */
    next();
  }, controller.createUsersHandler)

router.route('/users/:id')
  .get((req, res, next) => {
    /* #swagger.responses[200] = {
        content: {
          "application/json": {
            schema: {
              $ref: "#/components/schemas/UserResponse"
            }
          }
        }
      }
    */
    next();
  }, controller.getUserByIdHandler)
  .patch((req, res, next) => {
    /*  #swagger.requestBody = {
        required: true,
        content: {
          "application/json": {
            schema: {
                $ref: "#/components/schemas/UserUpdateBody"
            }
          }
        }
    }
    */
    /* #swagger.responses[200] = {
        content: {
          "application/json": {
            schema: {
              $ref: "#/components/schemas/UserResponse"
            }
          }
        }
      }
    */
    next();
  }, controller.updateUsersHandler)
  .delete((req, res, next) => {
    /* #swagger.responses[200] = {
        content: {
          "application/json": {
            schema: {
              $ref: "#/components/schemas/BaseMessageResponse"
            }
          }
        }
      }
    */
    next();
  }, controller.deleteUsersHandler)

export default router;
