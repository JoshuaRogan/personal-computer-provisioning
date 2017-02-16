<?php
namespace FanProfile;

use Josh\JLog;
use Monolog\Logger;

class Config extends \Josh\Config
{
    #################################### Constants ####################################
    ################## Info ##################
    const APP = 'FanProfile';
    const APP_PATH = '/Users/joshrogan/projects/fan-profile/';
    const PROXY_PATH = __DIR__;
    const HOME_PATH = 'fanprofile.dev';
    const HOME_URL = 'http://' . self::HOME_PATH;
    ################## Info ##################

    ########### UPSTREAM LOGGER ###########
    const LOG_LEVEL = Logger::CRITICAL;
    const FULL_DEBUG = true;
    const DEBUG_DISPLAY = false || self::FULL_DEBUG;
    ########### UPSTREAM LOGGER ###########
    #################################### Constants ####################################
}