<?php
namespace Upstream;

use Josh\Application;
use Josh\JLogger;

class Init extends \Josh\Init {

    public static function init() {
        $app = new Application(Config::PROXY_PATH, Config::APP_PATH);
        $app->on('start', '\Upstream\Init::start');
        $app->on('end', '\Upstream\Init::end');
        return $app;
    }


    public static function start() {
        self::setFlags();
        self::errorHandling(Config::APP, Config::LOG_LEVEL, Config::LOG);
        self::logStartEnd();
        ReplaceImages::start();
    }

    public static function end() {
        ReplaceImages::stop();
    }


    public static function getWordpressEntrypoint() {
        return __DIR__ . '/../../../fandom/index.php';
    }

    public static function setFlags() {
        Config::wpConfig();
    }
}