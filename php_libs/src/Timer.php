<?php

namespace Josh;


use FlorianWolters\Component\Util\Singleton\SingletonTrait;
use \PHP_Timer;

class Timer extends PHP_Timer {
    use SingletonTrait;
}