import log from './lib/log';
import rp from 'request-promise-native';
import data from './data/data';
import chalk from 'chalk';
import Api from './api';
//
//
// const searchString = 'fandom.wikia.com/wp-content/uploads/';
//
// log.info('Sending requests. Errors will be reported.');
//
//
// for(let link of data.articles) {
//     link = `http://fandom.wikia.com${link}`;
//
//     rp(link)
//         .then( (htmlString) => {
//             if(htmlString.includes(searchString)){
//                 log.error(`${chalk.blue(link)} contains '${searchString}'`);
//             }
//         })
//         .catch( (err) =>{
//             log.warn(`Crawling failed for ${chalk.blue(link)}`);
//         });
// }

const searchString = 'fandom.wikia.com/wp-content/uploads/';



