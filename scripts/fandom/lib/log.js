import winston from 'winston';
import util from 'util';

const transports = [];

transports.push(new (winston.transports.Console)({
    colorize: true,
    level: 'verbose',
    showLevel: true,
    prettyPrint: true,
}));

transports.push(new (winston.transports.File)({
    filename: 'logs/winston.log',
    prettyPrint: true,
    level: 'verbose',
}));


const logger = new (winston.Logger)({
    transports
});


logger.inspect = (obj) => {
    console.log(util.inspect(obj, {depth: null, showHidden:true}));
};

logger.cond = (obj, bool = false) => {
    if (bool) {
        logger.log('info', obj);
    }
};

export default logger;
