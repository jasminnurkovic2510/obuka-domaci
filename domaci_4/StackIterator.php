<?php
namespace domaci4;

class StackIterator implements Iterator
{
    private $stack;

    public function __construct($stack)
    {
        $this->stack = $stack;
    }

    public function next()
    {
        $nextItem = next($this->stack->items);
        return $nextItem;
    }

    public function hasNext(): bool
    {
        $currentElement = current($this->stack->items);
        $endElement = $this->stack->items[$this->stack->count - 1];

        if ($currentElement == $endElement) {
            return false;
        }
        return true;
    }
}