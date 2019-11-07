<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/obuka-domaci/domaci_3/interfejsi/Renderable.php'; 


class MenuItem implements Renderable
{
    private $label;
    private $pageName;
    private $params;

    public function __construct($label, $pageName, $params) {
        $this->label = $label;
        $this->pageName = $pageName;
        $this->params = $params;
    } 

    public function render():string
    {
        $href = $this->generateHref($this->pageName, $this->params);
        $html = "<a href='". $href ."'>". $this->label ."</a>";
        return $html;
    }

    public function generateHref(string $pageName, array $params):string
    {
        $url = $pageName . '?' . $this->generateUrlQuery($params);
        return $url;
    }   

    public function generateUrlQuery(array $params): string
    {
        $url = '';
        foreach($params as $key => $value)
        {
            $url .= $key . '=' . $value . '&';
        }
        $url = substr($url, 0, -1);
        return $url;
    }
}

?>