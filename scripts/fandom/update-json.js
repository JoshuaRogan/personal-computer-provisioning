import log from './lib/log';
import rp from 'request-promise-native';
import chalk from 'chalk';
import Api from './api';
import {checkImages} from './check-images';
import data from './data/data.json';
import fs from 'fs';

const baseURI = 'http://fandom.wikia.com';


async function update(linksPromise, fieldName){
    let links = await linksPromise;
    links = links.map((link) =>{
        return link.replace(baseURI, '');
    })
    data[fieldName] = links;
    fs.writeFile('data/updated-data.json', JSON.stringify(data));
}



// check(Api.getPostLinks(100));
update(Api.Rest.getPageLinks(100), 'pages');
update(Api.Rest.getPostLinks(5000), 'articles');
