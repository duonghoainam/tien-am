const { Router } = require('express');
const chapterController = require('./chapter.controller');

const router = Router();

router
  .route('/chapters')
  .get((req, res, next) => {
    /* #swagger.parameters['$ref'] = [
      '#/components/parameters/ChapterQuerySearch',
      '#/components/parameters/ChapterQueryPage',
      '#/components/parameters/ChapterQuerySize',
      '#/components/parameters/ChapterQueryAudioBookId',
    ] */
    /* #swagger.responses[200] = {
        content: {
          "application/json": {
            schema: {
              $ref: "#/components/schemas/BasePagiResponse",
              type: "object",
              properties: {
                data: {
                  $ref: "#/components/schemas/ChapterListResponse"
                }
              }
            }
          }
        }
    } */
    next();
  }, chapterController.getChaptersHandler)
  .post((req, res, next) => {
    /*  #swagger.requestBody = {
        required: true,
        content: {
          "application/json": {
            schema: {
              $ref: "#/components/schemas/ChapterCreateBody"
            }
          }
        }
    }
    */
    /* #swagger.responses[201] = {
        content: {
          "application/json": {
            schema: {
              $ref: "#/components/schemas/ChapterResponse"
            }
          }
        }
      }
    */
    next();
  }, chapterController.createChapterHanlder);

router
  .route('/chapters/:id')
  .get((req, res, next) => {
    /* #swagger.responses[200] = {
        content: {
          "application/json": {
            schema: {
              $ref: "#/components/schemas/ChapterResponse"
            }
          }
        }
      }
    */
    next();
  }, chapterController.getChapterByIdHandler)
  .patch((req, res, next) => {
    /*  #swagger.requestBody = {
        required: true,
        content: {
          "application/json": {
            schema: {
                $ref: "#/components/schemas/ChapterUpdateBody"
            }
          }
        }
    }
    */
    /* #swagger.responses[200] = {
        content: {
          "application/json": {
            schema: {
              $ref: "#/components/schemas/ChapterResponse"
            }
          }
        }
      }
    */
    next();
  }, chapterController.updateChapterHandler)
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
  }, chapterController.deleteChapterHandler);

module.exports = router;
