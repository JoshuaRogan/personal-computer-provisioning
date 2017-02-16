<?php
namespace Upstream;

use Josh\JLog;
use Monolog\Logger;

class Config extends \Josh\Config {
    #################################### Constants ####################################
    ################## Info ##################
    const APP = 'Upstream';
    const APP_PATH = '/Users/joshrogan/projects/fandom/';
    const PROXY_PATH = __DIR__;
    const HOME_URL = 'http://upstream.dev';
    ################## Info ##################

    ########### UPSTREAM LOGGER ###########
    const LOG_LEVEL = Logger::debug;
    const FULL_DEBUG = true;
    ########### UPSTREAM LOGGER ###########

    ############## Image Replacement ##############
    const EXTERNAL_IMAGES = true;
    ############## Image Replacement ##############
    #################################### Constants ####################################

    public static function wpConfig(){
        ################## FLAGS ##################
        define('WP_DEBUG', true);
        define('WP_DEBUG_DISPLAY', Config::DEBUG_DISPLAY);
        define('WP_DEBUG_LOG', false);
        define('HIDE_ERRORS', Config::HIDE_ERRORS);
        define('USE_BUNDLED_JS', true);
        define('WP_HOME', Config::HOME_URL);
        define('WP_SITEURL', Config::HOME_URL);
        ################## FLAGS ##################

        ################## WP Database ##################
        define('DB_NAME', 'wp_fandom2');
        define('DB_USER', 'root');
        define('DB_PASSWORD', 'root');
        define('DB_HOST', '127.0.0.1');
        define('DB_CHARSET', 'utf8');
        global $table_prefix; // TODO: Do I need this?
        $table_prefix = 'wp_';
        ################## WP Database ##################

        ################## WP Auth ##################
        define('DB_COLLATE', '');
        define('AUTH_KEY', 'put your unique phrase here');
        define('SECURE_AUTH_KEY', 'put your unique phrase here');
        define('LOGGED_IN_KEY', 'put your unique phrase here');
        define('NONCE_KEY', 'put your unique phrase here');
        define('AUTH_SALT', 'put your unique phrase here');
        define('SECURE_AUTH_SALT', 'put your unique phrase here');
        define('LOGGED_IN_SALT', 'put your unique phrase here');
        ################## WP Auth ##################

        ################### DEBUGGING ###################
        if (Config::HIDE_ERRORS) {
            error_reporting(0);
            ini_set('display_startup_errors', 'Off');
            ini_set('log_errors', 'Off');
            ini_set('html_errors', 'Off');
            ini_set('display_errors', 'Off');
        }

        ini_set('error_log', Config::LOG);
        ################### DEBUGGING ###################
    }
}