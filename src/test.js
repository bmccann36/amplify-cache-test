import chalk from 'chalk'
import winston from "winston";

const logger = winston.createLogger({
  level: 'info',
  format: winston.format.json(),
  defaultMeta: {service: 'user-service'},
  transports: [

  ],
});

logger.info('hi from winston')

console.log(chalk.red('using chalk'))
