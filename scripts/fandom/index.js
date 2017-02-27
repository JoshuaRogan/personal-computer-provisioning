import log from './lib/log';
import rp from 'request-promise-native';
import chalk from 'chalk';
import Api from './api';
import {checkImages} from './check-images';


const baseURL = 'http://fandom.wikia.com';
const searchString = 'fandom.wikia.com/wp-content/uploads/';

const tests = [
    checkImages,
];

function check(links){
    for(let link of links) {
        const url = `${baseURL}${link}`;
        rp(url)
            .then( (html) => {
                for( let test of tests){
                    test(url, html);
                }
            })
            .catch( (err) =>{
                log.warn(`Crawling failed for ${chalk.blue(url)}`);
            });
    }
}


check(Api.Pages.get(100));
check(Api.Articles.get(5000));
