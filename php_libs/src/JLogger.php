<?php
namespace Josh;

use FlorianWolters\Component\Util\Singleton\SingletonTrait;
use Monolog\Logger;
use Monolog\Handler\StreamHandler;
use Monolog\ErrorHandler;
use Psr\Log\LoggerInterface;
use function str_contains;


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
    const LOCATION = Config::LOG;
    const LEVEL = Config::LOG_LEVEL;

    protected static $logger;

    public static function init($name = 'JLogger') {
        self::$logger = new Logger($name);
        ErrorHandler::register(self::$logger);
        self::$logger->pushHandler(new StreamHandler(Config::LOG, self::LEVEL));
    }

    public static function __callStatic( $name, $arguments ) {
        // Prefetch logs
        if ( Config::DISABLE_AJAX_LOGS && str_contains( $_SERVER['REQUEST_URI'] , 'ajax' )) {
            return;
        }

        // Prefetch logs
        if ( Config::DISABLE_PREFETCH_LOGS && array_get($_SERVER, 'HTTP_PURPOSE', false) === 'prefetch' ) {
            return;
        }

        return call_user_func_array( [ self::$logger, $name ], $arguments );
    }
}
