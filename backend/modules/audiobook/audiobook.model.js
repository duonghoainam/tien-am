const mongoose = require('mongoose');
const { Schema } = mongoose;

const chapterSchema = new Schema(
  { _id: false },
  {
    name: {
      type: String,
    },
  },
  {
    lengthInSecond: {
      type: Number,
    },
  },
  {
    audioPath: {
      type: String,
    },
  }
);

const bookStatsSchema = new Schema(
  { _id: false },
  {
    imagePath: {
      type: String,
    },
  },
  {
    name: {
      type: String,
    },
  },
  {
    description: {
      type: String,
    },
  }
);
