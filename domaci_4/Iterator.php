<?php
namespace domaci4;

interface Iterator {

    public function next();
    public function hasNext(): bool;

}