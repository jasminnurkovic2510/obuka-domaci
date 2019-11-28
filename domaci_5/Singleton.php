<?php
namespace Domaci\Patterns\Singleton;
class Singleton
{
    protected static $instance;
    protected $number;
    protected $pownumber;
    private function __construct()
    {
        $this->number = rand(1, 100);
        $this->number = pow($this->number, 2);
    }
    public function getNumber()
    {
        return $this->number;
    }
    public static function getInstance(): Singleton
    {
        if (!Singleton::$instance) {
            Singleton::$instance = new Singleton();
        }
        return Singleton::$instance;
    }
}
