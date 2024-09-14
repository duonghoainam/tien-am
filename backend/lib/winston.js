import { createLogger, format, transports, config } from 'winston';

const { combine, timestamp } = format;

const logger = createLogger({
  levels: config.npm.levels,
  transports: [
    new transports.Console({
      format: combine(format.colorize(), timestamp(), format.simple()),
    }),
    new transports.File({
      filename: './log/error.log',
      level: 'error',
      format: combine(timestamp(), format.simple()),
    }),
    new transports.File({
      filename: './log/combined.log',
      format: combine(timestamp(), format.simple()),
    }),
  ],
});

export default logger;
