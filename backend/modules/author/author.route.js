const { Router } = require('express');
const controller = require('./author.controller');

const router = Router();

router
  .route('/authors')
  .get((req, res, next) => {
    /* #swagger.tags = ['Author'] */
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
                  $ref: "#/components/schemas/AuthorListResponse"
                }
              }
            }
          }
        }
    } */
    next();
  }, controller.getAuthorsHandler)
  .post((req, res, next) => {
    /* #swagger.tags = ['Author'] */
    /*  #swagger.requestBody = {
        required: true,
        content: {
          "application/json": {
            schema: {
              $ref: "#/components/schemas/AuthorCreateBody"
            }
          }
        }
    }
    */
    /* #swagger.responses[201] = {
        content: {
          "application/json": {
            schema: {
              $ref: "#/components/schemas/AuthorResponse"
            }
          }
        }
      }
    */
    next();
  }, controller.createAuthorHandler);

router
  .route('/authors/:id')
  .get((req, res, next) => {
    /* #swagger.tags = ['Author'] */
    /* #swagger.responses[200] = {
        content: {
          "application/json": {
            schema: {
              $ref: "#/components/schemas/AuthorResponse"
            }
          }
        }
      }
    */
    next();
  }, controller.getAuthorByIdHandler)
  .patch((req, res, next) => {
    /* #swagger.tags = ['Author'] */
    /*  #swagger.requestBody = {
        required: true,
        content: {
          "application/json": {
            schema: {
                $ref: "#/components/schemas/AuthorUpdateBody"
            }
          }
        }
    }
    */
    /* #swagger.responses[200] = {
        content: {
          "application/json": {
            schema: {
              $ref: "#/components/schemas/AuthorResponse"
            }
          }
        }
      }
    */
    next();
  }, controller.updateAuthorHandler)
  .delete((req, res, next) => {
    /* #swagger.tags = ['Author'] */
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
  }, controller.deleteAuthorHandler);

module.exports = router;
