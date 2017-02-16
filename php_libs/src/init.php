<?php
namespace Josh;

class Init {

    public static function globalStart() {
        self::setXdebugLevel();
    }

    public static function globalEnd() {

    }

    /**
     * Setup service container
     */
    public static function serviceContainer() {
        return $app ?? [];
    }

    public static function setXdebugLevel() {
        ini_set('xdebug.max_nesting_level', 200);
        ini_set('xdebug.var_display_max_depth', 8);
    }

    ################################ LOGGING ################################
    public static function errorHandling($name = 'JLogger', $level = Config::LOG_LEVEL, $location = Config::LOG) {
        JLogger::init($name, $level, $location);
    }

    public static function logStart() {
        JLogger::debug('Request Started', $_SERVER);
    }

    public static function logEnd() {
        register_shutdown_function(function(){
            JLogger::debug('Request Completed', $_SERVER);
        });
    }

    public static function logStartEnd() {
        self::logStart();
        self::logEnd();
    }
    ################################ LOGGING ################################


}