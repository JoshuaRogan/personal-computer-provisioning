<?php
namespace Upstream;

use Josh\JLog;
use Monolog\Logger;

class Config extends \Josh\Config{
    const LOG_LEVEL = Logger::WARNING;
}

################## CONSTANTS ##################
const FULL_DEBUG = true;
const HIDE_ERRORS = false;
const EXTERNAL_IMAGES = true;
################## CONSTANTS ##################

################## FLAGS ##################
define('UPSTREAM_DEBUG', false);
define('WP_DEBUG', true || FULL_DEBUG);
define('WP_DEBUG_DISPLAY', false || FULL_DEBUG);
define('WP_DEBUG_LOG', false || FULL_DEBUG);
define('HIDE_ERRORS', HIDE_ERRORS && !FULL_DEBUG);
define('USE_BUNDLED_JS', true);
define('REPLACE_LOCAL_IMAGES', EXTERNAL_IMAGES);
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
define('AUTH_KEY',         'put your unique phrase here');
define('SECURE_AUTH_KEY',  'put your unique phrase here');
define('LOGGED_IN_KEY',    'put your unique phrase here');
define('NONCE_KEY',        'put your unique phrase here');
define('AUTH_SALT',        'put your unique phrase here');
define('SECURE_AUTH_SALT', 'put your unique phrase here');
define('LOGGED_IN_SALT',   'put your unique phrase here');
define('NONCE_SALT',       'put your unique phrase here');
################## WP Auth ##################

################## PHP ##################
ini_set('xdebug.max_nesting_level', 200);
ini_set('xdebug.var_display_max_depth', 8);
################## PHP ##################

################### DEBUGGING ###################
if (HIDE_ERRORS) {
    error_reporting(0);
    ini_set('display_startup_errors', 'Off');
    ini_set('log_errors', 'Off');
    ini_set('html_errors', 'Off');
    ini_set('display_errors', 'Off');
}
$valet_log = '/usr/local/var/log/valet.log';
JLog::ends( 'START' );
JLog::log("Requested: {$_SERVER['REQUEST_URI']}");
################### DEBUGGING ###################
