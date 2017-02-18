<?php
namespace Josh;

use Monolog\Logger;
use Monolog\Handler\StreamHandler;
use Monolog\ErrorHandler;
use Psr\Log\LoggerInterface;
use function str_contains;
use function str_plural;
use function str_replace;
use function strtoupper;


/**
 * Class JLogger
 * @package Josh
 * @method static JLogger warn(string $msg, array $context)
 * @method static JLogger info(string $msg, array $context)
 * @method static JLogger notice(string $msg, array $context)
 * @method static JLogger error(string $msg, array $context)
 * @method static JLogger debug(string $msg, array $context)
 * @method static JLogger alert(string $msg, array $context)
 * @method static JLogger emergency(string $msg, array $context)
 * @method static JLogger log(string $level, string $message, array $context = array())
 */
class JLogger {

    /**
     * @var Logger $logger
     */
    protected static $logger;

    /**
     * @var string $name
     */
    protected static $name;

    /**
     * @param string $name
     * @param integer $level
     * @param string $location
     */
    public static function init($name = 'JLogger', $level = Config::LOG_LEVEL, $location = Config::Log) {

        self::$name = strtoupper($name);
        self::$logger = new Logger(self::$name);
        ErrorHandler::register(self::$logger);

        if ($location !== Config::LOG_MIX) {
            self::$logger->pushHandler(new StreamHandler($location, $level));
        }

        self::$logger->pushHandler(new StreamHandler(Config::LOG_MIX, $level));
    }

    public static function __callStatic( $name, $arguments ) {
        $label = array_get($arguments, '2', null);
        $label = $label ? self::$name . '.' . $label  : self::$name;
        $ajaxTest = Config::LOG_AJAX_REQUESTS && self::isAjax();
        $prefetchTest = Config::LOG_PREFETCH_REQUESTS && self::isPrefetch();

        self::callLogger([ self::$logger->withName('AJAX.' . self::$name), $name ], $arguments, $ajaxTest );
        self::callLogger([ self::$logger->withName('PREFETCH.' . self::$name), $name ], $arguments, $prefetchTest );
        self::callLogger([ self::$logger->withName($label), $name ], $arguments, self::isNormal() );
    }

    public static function isAjax() {
        return str_contains( $_SERVER['REQUEST_URI'] , 'ajax' );
    }

    public static function isPrefetch() {
        return array_get($_SERVER, 'HTTP_PURPOSE', false) === 'prefetch';
    }

    public static function isNormal() {
        return !(self::isAjax() || self::isPrefetch());
    }

    private static function callLogger( $instance = [], $args, $test = true ) {
        return $test ? call_user_func_array( $instance, $args ) : false;
    }
}