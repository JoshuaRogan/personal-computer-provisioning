import log from './lib/log';
import rp from 'request-promise-native';
import chalk from 'chalk';
import lodash from 'lodash';
import fs from 'fs';
import data from './data/data.json';

const baseURL = 'http://fandom.wikia.com';
const jsonEndpoint = `${baseURL}/wp-json/wp/v2`;
const jsonPosts = `${jsonEndpoint}/posts`;
const jsonPages = `${jsonEndpoint}/pages`;
const PER_PAGE = 100;
const options = {
    qs: {
        per_page: PER_PAGE,
        orderby: 'date',
        order: 'desc',
    },
    json: true
};



async function getAllLinks(jsonURI, limit = 1000) {
    log.verbose(`Getting links for ${jsonURI}`);
    let allLinks = [];
    let page = 1;
    const maxPages = Math.ceil(limit / PER_PAGE);

    while( page <= maxPages ) {
        let links = await getLinks(jsonURI, page);
        if (links.length === 0){
            return lodash.flatten(allLinks);
        }
        allLinks.push(links);
        page++;
    }


    return lodash.flatten(allLinks);
}


function getLinks(jsonURI, page=1){
    let links = [];
    const opts = Object.assign({}, options, {uri: jsonURI});
    opts.qs.page = page;
    log.silly(opts);

    return rp(opts)
        .then( (posts) => {
            for( let post of posts ) {
                links.push(post.link);
            }

            return links;

        })
        .catch( (err) =>{
            log.warn(`Crawling failed`, err);
            return [];
        });
}
async function getPageLinks(limit=100){
    return await getAllLinks(jsonPages, limit);
}

async function getPostLinks(limit=100){
    return await getAllLinks(jsonPosts, limit);
}

function getArticlesFromJson(limit=100){
    const articles = lodash.shuffle(data.articles);
    return lodash.take(articles, limit);
}

function getPagesFromJson(limit=100){
    const pages = lodash.shuffle(data.pages);
    return lodash.take(pages, limit);
}

export default {
    Rest: {
        getPostLinks,
        getPageLinks
    },
    Articles: {
        get: getArticlesFromJson
    },
    Pages: {
        get: getPagesFromJson
    }
}

