<?php
namespace FanProfile;

use Josh\Application;
use Josh\JLogger;

class Init extends \Josh\Init {

    public static function init() {
        $app = new Application(Config::PROXY_PATH, Config::APP_PATH);
        $app->on('start', '\FanProfile\Init::start');
        $app->on('end', '\FanProfile\Init::end');
        return $app;
    }


    public static function start() {
        self::errorHandling(Config::APP);
        self::logStartEnd();
    }

    public static function end() {

    }

    public static function getFanProfileEntryPoint() {
        return __DIR__ . '/../../../fan-profile/www/index.php';
    }

}
