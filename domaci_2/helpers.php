<?php

function generateUrlQuery(array $params): string
{
    $url = '';
    foreach($params as $key => $value)
    {
        $url .= $key . '=' . $value . '&';
    }
    $url = substr($url, 0, -1);
    return $url;
}


function generateHref(string $pageName, array $params):string
{
    $url = $pageName . '?' . generateUrlQuery($params);
    return $url;
}


function formatGetParams(): string
{
    $list = "<ul>";
    foreach($_GET as $key => $value)
    {
        $list .= "<li>" . $key . ':' . $value . "</li>";
    }
    $list .= "</ul>";
    return $list;
}

function validateIP(string $address): string
{
    $rez = explode(".", $address);
    if(count($rez) != 4)
    {
        return "false";
    }

    foreach($rez as $item)
    {
       $number = intval($item);
       if($number < 0 || $number > 255)
       {
           return "false";
       }
    }
    return "true";
}

?>







