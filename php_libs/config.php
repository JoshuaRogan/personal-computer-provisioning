<?php
namespace Josh;

use Monolog\Logger;

class Config {
    ################## LOGGER ##################
    const LOG_LEVEL = Logger::DEBUG;
    const JLOG_ENABLED = true;
    const JLOG_ENDS_ENABLED = false;
    ################## LOGGER ##################
}

d(Config::LOG_LEVEL);