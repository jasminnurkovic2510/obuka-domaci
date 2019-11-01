<?php
require('helpers.php');

$link1 = ['label' => 'Page 1', 'pageName' => '/domaci_2/page_1.php', 'params' => ['name' => 'Jasmin Nurkovic', 'userName' => 'Jasmin123']];
$link2 = ['label' => 'Page 2', 'pageName' => '/domaci_2/page_2.php', 'params' => ['name' => 'Jasmina Nurkovic', 'userName' => 'J123']];
$links = [$link1, $link2];

?>
<ul>
    <?php
    foreach ($links as $item)
    {
        $pageName = $item['pageName'];
        $params = $item['params'];
        $label = $item['label'];
        $href = generateHref($pageName, $params);
        echo "<li><a href='". $href . "'>". $label ."</a></li>";
    }
    ?>
</ul>


