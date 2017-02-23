const webdriver = require('selenium-webdriver'),
    By = webdriver.By,
    until = webdriver.until;
const chalk = require('chalk')
const browser = new webdriver.Builder().usingServer().withCapabilities({'browserName': 'chrome' });

let URLS = [
  "http://fandom.wikia.com",
  "http://fandom.wikia.com/articles/top-10-kisses-dc-universe",
  "http://fandom.wikia.com/?p=105",
  "http://fandom.wikia.com/?p=145",
  "http://fandom.wikia.com/?p=297",
  "http://fandom.wikia.com/?p=1867",
  "http://fandom.wikia.com/?p=2580",
  "http://fandom.wikia.com/?p=5506",
  "http://fandom.wikia.com/?p=5719",
  "http://fandom.wikia.com/?p=6829",
  "http://fandom.wikia.com/?p=7989",
  "http://fandom.wikia.com/?p=16209",
  "http://fandom.wikia.com/?p=16256",
  "http://fandom.wikia.com/?p=16697",
  "http://fandom.wikia.com/?p=17041",
  "http://fandom.wikia.com/?p=17072",
  "http://fandom.wikia.com/?p=17089",
  "http://fandom.wikia.com/?p=17217",
  "http://fandom.wikia.com/?p=17256",
  "http://fandom.wikia.com/?p=17372",
  "http://fandom.wikia.com/?p=17375",
  "http://fandom.wikia.com/?p=17494",
  "http://fandom.wikia.com/?p=37841",
  "http://fandom.wikia.com/?p=38043",
  "http://fandom.wikia.com/?p=38130",
  "http://fandom.wikia.com/?p=38526",
  "http://fandom.wikia.com/?p=38557",
  "http://fandom.wikia.com/?p=39523",
  "http://fandom.wikia.com/?p=39926",
  "http://fandom.wikia.com/?p=40099",
  "http://fandom.wikia.com/?p=40119",
  "http://fandom.wikia.com/?p=40476",
  "http://fandom.wikia.com/?p=41464",
  "http://fandom.wikia.com/?p=47908"
];

// URLS = ["http://fandom.wikia.com"];

for(let get_url of URLS){
  const chrome = browser.build();

  chrome.get(get_url);

  chrome.getCurrentUrl().then( (url)=>{
      console.log(chalk.yellow(url));
  });

  chrome.findElements(webdriver.By.css('[src*="vignette"]')).then(function(links){
      console.log('Found', chalk.blue(links.length), 'vignette links.' );
  });

  chrome.findElements(webdriver.By.css('[src*="0000"]')).then(function(links){
      console.log('Found', chalk.blue(links.length), '0000 links.' );
  });

  chrome.findElements(webdriver.By.css('[src*="wp-content/uploads"]')).then(function(links){
      console.log('Found', chalk.blue(links.length), 'wp-content links.' );
  });


  chrome.quit();
}
