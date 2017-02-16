<?php
namespace Upstream;

class Init extends \Josh\Init {

    public static function start() {
        self::setFlags();
        self::errorHandling(Config::APP);
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