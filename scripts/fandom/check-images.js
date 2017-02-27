import log from './lib/log';
import chalk from 'chalk';

export function checkImages(link, html){
    const searchString = 'fandom.wikia.com/wp-content/uploads/';
    if(html.includes(searchString)){
        log.error(`${chalk.blue(link)} contains '${searchString}'`);
    }
}
