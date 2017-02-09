<?php
namespace Josh;

use FlorianWolters\Component\Util\Singleton\SingletonTrait;
use Monolog\Logger;
use Monolog\Handler\StreamHandler;
use Monolog\ErrorHandler;
use Psr\Log\LoggerInterface;


class JLogger {
    use SingletonTrait;

    const LOCATION = '/usr/local/var/log/valet.log.mono.log';
    const DIR = '/usr/local/var/log/';
    const LEVEL = Config::LOG_LEVEL;

    protected $logger;

    private function __construct() {
        $this->logger = new Logger('Upstream');
        ErrorHandler::register($this->logger);
        $this->logger->pushHandler(new StreamHandler(self::LOCATION, self::LEVEL));
    }

    public static function __callStatic( $name, $arguments ) {
        $logger = self::getInstance()->logger;
        return call_user_func_array( [ $logger, $name ], $arguments );
    }
}
