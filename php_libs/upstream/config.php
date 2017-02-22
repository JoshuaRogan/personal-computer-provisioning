<?php
namespace Upstream;

use Josh\JLog;
use Monolog\Logger;

class Config extends \Josh\Config
{
    #################################### Constants ####################################
    ################## Info ##################
    const APP = 'Upstream';
    const APP_PATH = '/Users/joshrogan/projects/fandom/';
    const PROXY_PATH = __DIR__;
    const HOME_PATH = 'fandom.dev';
    const HOME_URL = 'http://' . self::HOME_PATH;
    const USE_BUNDLED_JS = true;
    ################## Info ##################

    ########### UPSTREAM LOGGER ###########
    const LOG_LEVEL = Logger::DEBUG;
    const FULL_DEBUG = false;
    const DEBUG_DISPLAY = false || self::FULL_DEBUG;
    const LOG_FILE = 'valet.log.upstream.log';
    const LOG_VERBOSE = false;
    ########### UPSTREAM LOGGER ###########

    ############## Image Replacement ##############
    const EXTERNAL_IMAGES = true;
    ############## Image Replacement ##############
    #################################### Constants ####################################

    public static function homeUrl( $homePath = self::HOME_PATH) {
        return 'http://' . (string) array_get($_SERVER, 'HTTP_HOST', $homePath);
    }

    public static function wpConfig()
    {
        ################## FLAGS ##################
        define('WP_DEBUG', true);
        define('WP_DEBUG_DISPLAY', Config::DEBUG_DISPLAY);
        define('USE_BUNDLED_JS', Config::USE_BUNDLED_JS);
        define('WP_HOME', Config::homeUrl());
        define('WP_SITEURL', Config::homeUrl());
        define('WP_DEBUG_LOG', false);
//        define( 'WP_ALLOW_MULTISITE', true );
//        define('MULTISITE', true);
//        define('SUBDOMAIN_INSTALL', true);
//        define('DOMAIN_CURRENT_SITE', Config::homeUrl());
//        define('PATH_CURRENT_SITE', '/');
//        define('SITE_ID_CURRENT_SITE', 1);
//        define('BLOG_ID_CURRENT_SITE', 1);
//        define( 'SUNRISE', 'on' );
//        define('DISABLE_WP_CRON', true);
        ################## FLAGS ##################

        ################## WP Database ##################
        define('DB_NAME', 'wp_fandom2');
        define('DB_USER', 'root');
        define('DB_PASSWORD', 'root');
        define('DB_HOST', '127.0.0.1');
        define('DB_CHARSET', 'utf8');
        global $table_prefix;
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
        ini_set('error_log', Config::LOG_MIX);
        ################### DEBUGGING ###################
    }
}