<?php
require_once 'MenuItem.php';


class Menu implements Renderable
{
    private $items;

    public function __construct() 
    {
        $page1 = new MenuItem("Page 1", "/obuka-domaci/page_1.php", ['name' => 'Jasmin Nurkovic', 'userName' => 'JN123']);
        $page2 = new MenuItem("Page 2", "/obuka-domaci/page_2.php", ['name' => 'Jasmina Nurkovic', 'userName' => 'JJN123']);
        $homepage = new MenuItem("Homepage", "/obuka-domaci/homepage.php", ['name' => 'Elma Nurkovic', 'userName' => 'E123']);
        $this->items = [$page1, $page2, $homepage];
    }

    public function render():string
    {
        $list = "<ul>";
        foreach($this->items as $item)
        {
            $list .= "<li>" . $item->render() . "</li>";
        }
        $list .= "</ul>";
        return $list;
    }
}



?>