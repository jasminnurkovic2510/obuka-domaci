<?php
namespace domaci4;
use Exception;


class CollectionOverflowException extends Exception
{
    public function __construct($message)
    {
        parent::__construct($message);
    }
}