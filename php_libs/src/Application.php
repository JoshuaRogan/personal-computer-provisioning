<?php
namespace Josh;

use function call_user_func;
use function call_user_func_array;
use function getcwd;
use Illuminate\Support\Collection;
use function realpath;
use Upstream\Init;

class Application {

    /**
     * @var <Collection>Collection
     */
    protected $eventHandlers;

    protected $proxyAppPath;
    protected $realAppPath;

    /**
     * Application constructor.
     * @param string $proxyAppPath
     * @param string $realAppPath
     */
    public function __construct($proxyAppPath, $realAppPath ) {
        $this->eventHandlers = new Collection();
        $this->proxyAppPath = realpath($proxyAppPath);
        $this->realAppPath = realpath($realAppPath);
    }

    public function run() {
        $this->start();
    }

    public function on($name, $function) {
        $event = $this->eventHandlers->get($name, new Collection())->push($function);
        $this->eventHandlers->put($name, $event);
    }

    private function fire($eventName) {
        $events = $this->eventHandlers->get($eventName, new Collection());
        $events->each( function ($value){ $value(); });
        $this->eventHandlers->put($eventName, new Collection());
    }

    public function start() {
        Init::globalStart();
        $this->fire('start');
    }

    public function end() {
        Init::globalEnd();
        $this->fire('end');
    }
}