<?php
namespace domaci4;

class QueueIterator implements Iterator {

    private $queue;

    public function __construct($queue)
    {
        $this->queue = $queue;
    }

    public function next()
    {
        $nextItem = next($this->queue->items);
        return $nextItem;
    }

    public function hasNext(): bool
    {
        $currentElement = current($this->queue->items);
        $endElement = $this->queue->items[$this->queue->count - 1];

        if ($currentElement == $endElement) {
            return false;
        }
        return true;
    }
}