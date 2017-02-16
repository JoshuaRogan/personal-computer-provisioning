<?php
namespace FanProfile;

use Josh\Application;

// Get autoloader
require_once __DIR__ . '/../autoloader.php';

$app = Init::init();

// Run Application
$app->run();
require Init::getFanProfileEntryPoint();
$app->end();