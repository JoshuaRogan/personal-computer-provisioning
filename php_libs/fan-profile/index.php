<?php
namespace FanProfile;

use Josh\Application;

// Get autoloader
require_once __DIR__ . '/../autoloader.php';

$joshApp = Init::init();

// Run Application
$joshApp->run();
require_once Init::getFanProfileEntryPoint();
$joshApp->end();
