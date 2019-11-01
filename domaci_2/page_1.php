<?php
require('helpers.php');

$list = formatGetParams();
echo $list;

$testExamples = ["192.168.200.512", "192.16.256.214", "46.161.123.35", "216.58.216.164"];
foreach($testExamples as $item)
{
    $rez = validateIP($item);
    echo $rez . "<br/>";
}

?>