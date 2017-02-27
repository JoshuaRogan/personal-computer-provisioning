<?php
namespace Josh;

class Init {

    public static function globalStart() {
        self::setXdebugLevel();
        self::timezone();
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
    public static function errorHandling($name = 'JLogger', $level = Config::LOG_LEVEL, $location = Config::LOG_MIX) {
        JLogger::init($name, $level, $location);
        ini_set('error_log', Config::LOG_MIX);
    }

    private static function getLogStartEndData() {
        $data = [
            'SERVER' => $_SERVER,
            'REQUEST' => $_REQUEST,
            'GET' => $_GET,
            'POST' => $_POST,
        ];

        if (Config::LOG_VERBOSE) {
            $data['CONSTANTS'] = get_defined_constants();
        }

        return $data;
    }

    public static function logStart() {
        JLogger::debug('Start', self::getLogStartEndData(), 'REQUEST.START');
        define('JOSH_APP_START', $_SERVER['REQUEST_TIME_FLOAT'] ?? microtime(true));
    }

    public static function logEnd() {
        register_shutdown_function(function(){
            JLogger::debug('End: '.(microtime(true) - JOSH_APP_START ?? 0) . 's', self::getLogStartEndData(), 'REQUEST.END');
        });
    }

    public static function logStartEnd() {
        self::logStart();
        self::logEnd();
    }
    ################################ LOGGING ################################

    public static function timezone() {
//        date_default_timezone_set('UTC');
//        ini_set('date.timezone', 'UTC');
    }

}
