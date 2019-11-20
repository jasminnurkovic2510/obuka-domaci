<?php
namespace domaci4;

abstract class Collection implements HTMLRenderable {

    public $items;
    public $count;

    public function __construct()
    {
        $this->items = [];
        $this->count = 0;
    }

    protected function add($element, $position)
    {
        if ($position >= $this->count)
        {
            throw new CollectionOverflowException("Pozicija nije validna.");
        }
        $this->items[$position] = $element;
        $this->count++;
    }

    protected abstract function getIterator(): Iterator;

    public function isEmpty(): bool
    {
        if ($this->count > 0) {
            return false;
        }
        else {
            return true;
        }
    }

    public function toHtml(): string
    {
        $html = "<ul>";
        foreach ($this->items as $item)
        {
            $html .= "<li>" . $item . "</li>";
        }
        $html .= "</ul>";
        return $html;
    }

    public function getItems()
    {
        return $this->items;
    }
}