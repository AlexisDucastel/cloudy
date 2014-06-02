<?php
require_once  __DIR__.'/../vendor/autoload.php';

if(!file_exists('../config/providers.json'))die('Cannot find providers.json');

$providers=json_decode(file_get_contents('../config/providers.json'),true);
if($providers===null) die('Cannot decode config');

foreach($providers as $provider){
    $name=$provider['name'];
    echo "<h3>$name</h3>";
    
    $p=\Cloudy\Core\Provider::factory(
        $provider['type'],
        $provider['args']
    );
    
    $srvList=$p->serverList();
    foreach($srvList as $id=>$name){
        echo "<div>$id : $name</div>";
    }
}