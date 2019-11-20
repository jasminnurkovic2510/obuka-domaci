<?php
namespace domaci4;

class Stack extends Collection {

    public function getIterator(): Iterator
    {
        return new StackIterator($this);
    }

    public function push($item)
    {
        array_push($this->items, $item);
        $this->count++;
    }

    public function pop()
    {
        array_pop($this->items);
        $this->count--;
    }
}