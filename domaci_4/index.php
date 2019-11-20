<?php
require_once 'HTMLRenderable.php';
require_once 'Iterator.php';
require_once 'Collection.php';
require_once 'Queue.php';
require_once 'Stack.php';
require_once 'StackIterator.php';
require_once 'QueueIterator.php';

use domaci4\Stack;
use domaci4\Queue;

$stack = new Stack();
$stack->push(1);
$stack->push(2);
$stack->push(3);
$stack->push(4);
$stack->push(5);

echo "STACK COUNT: " . $stack->count;

if (!$stack->isEmpty())
{
    echo $stack->toHtml();
}

$stackIterator = $stack->getIterator();
while ($stackIterator->hasNext())
{
    $current = current($stack->items);
    echo "Current element: " . $current;
    $stackIterator->next();
}

//// -------------------------------------------------------------
$queue = new Queue();
$queue->enqueue(20);
$queue->enqueue(21);
$queue->enqueue(22);
$queue->enqueue(23);
$queue->enqueue(24);
$queue->enqueue(25);

echo "QUEUE COUNT: " . $queue->count;

if (!$queue->isEmpty())
{
    echo $queue->toHtml();
}

//$queueIterator = $queue->getIterator();
//while ($queueIterator->hasNext())
//{
//    $current = current($queue->items);
//    echo "Queue element: " . $current;
//    $queueIterator->next();
//}