const { ref, required } = require('joi');
const mongoose = require('mongoose');
const { Schema } = mongoose;

const chapterSchema = new Schema(
  {
    audioBookId: {
      type: Schema.Types.ObjectId,
      ref: 'AudioBook',
      required: true,
    },
    title: {
      type: String,
      required: true,
    },
    duration: {
      type: Number,
    },
    audioId: {
      type: Schema.Types.ObjectId,
      ref: 'Audio',
    },
    chapterIndex: {
      type: Number,
      required: true,
    },
  },
  {
    timestamps: true,
  }
);

chapterSchema.index({ audioBookId: 1, chapterIndex: 1 }, { unique: true });

const Chapter = mongoose.model('Chapter', chapterSchema);

module.exports = Chapter;
