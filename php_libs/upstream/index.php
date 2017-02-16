<?php
namespace Upstream;

use Josh\Application;

// Get autoloader
require __DIR__ . '/../autoloader.php';

// Create App
$app = new Application( Config::PROXY_PATH, Config::APP_PATH  );

// Events
$app->on('start', '\Upstream\Init::start');
$app->on('end', '\Upstream\Init::end');

// Why?
$app->run();
require Init::getWordpressEntrypoint();
$app->end();

