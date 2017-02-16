<?php
namespace Josh;

use Monolog\Logger;

class Config {
    ################## Info ##################
    const App = 'Josh';
    ################## Info ##################

    ################## LOGGER ##################
    ##### Super Filters #####
    const LOG_ALL = false;
    const HIDE_ERRORS = false && !self::FULL_DEBUG;
    const LOG_LEVEL = Logger::DEBUG || self::LOG_ALL;
    ##### Super Filters #####

    ###### Log Filter ######
    const DEBUG_DISPLAY = false || self::LOG_ALL;
    const DISABLE_PREFETCH_LOGS = true || self::LOG_ALL;
    const DISABLE_AJAX_LOGS = true || self::LOG_ALL;
    ###### Log Filter ######

    ###### Log Location ######
    const LOG_DIR = '/usr/local/var/log/';
    const LOG_FILE = 'valet.log.mono.log';
    const LOG = self::LOG_DIR . self::LOG_FILE;
    ###### Log Location ######
    ################## LOGGER ##################
}