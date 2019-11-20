<?php
namespace domaci4;

class Queue extends Collection {

    public function getIterator(): Iterator
    {
        return new QueueIterator($this);
    }

    public function enqueue($item)
    {
        array_unshift($this->items, $item);
        $this->count++;
    }

    public function dequeue()
    {
        $first_element = $this->items[0];
        array_shift($this->items);
        $this->count--;
        return $first_element;
    }
}