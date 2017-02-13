<?php
namespace Josh;

class JLog {

    public static $queue_self  = [];

    const LOCATION = '/usr/local/var/log/valet.log.queue.log';
    const DIR = '/usr/local/var/log/';

	public static function log( $message, $data = [] )
	{
        if ( Config::JLOG_ENABLED === false ) {
            return;
        }

		$errorLog      = ini_get( 'error_log' );
		$log_data = addslashes($message);

		if (!empty($data)) {
			$log_data = array_merge(
				[
					'message' => $message,
				],
				$data
			);

			$log_data = json_encode($log_data, JSON_PRETTY_PRINT);
		}

		self::queue( $log_data.PHP_EOL );
		file_put_contents( $errorLog, $log_data.PHP_EOL, FILE_APPEND );
	}

	public static function nl($times = 1) {
		self::log(str_repeat(PHP_EOL, $times));
	}

	public static function format_log( $message, $times = 30, $char = '#' ) {
		$times = $times;
		$msg = str_repeat($char, $times) . " $message " . str_repeat($char, $times);
		self::log($msg);
	}

	public static function ends( $msg, $start = true ) {
	    if (!Config::JLOG_ENDS_ENABLED){
	        return;
        }
		if(!$start) self::nl(1);
		self::format_log( $msg, 50 );
		if($start) self::nl(2);
	}

	public static function output_queue() {
		if (!empty(self::$queue_self)) {
			foreach (self::$queue_self as $log_data) {
				$errorLog      = self::LOCATION;
				file_put_contents( $errorLog, $log_data.PHP_EOL, FILE_APPEND );
			}
		}
	}

	public static function queue( $msg ) {
        self::$queue_self[] = $msg;
	}
}
