<?php
require_once "Singleton.php";
use Domaci\Patterns\Singleton\Singleton;

$instance1 = Singleton::getInstance();

echo '<h2>' . $instance1->getNumber() . '</h2>';