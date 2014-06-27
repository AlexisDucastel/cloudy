<?php
require_once  __DIR__.'/../vendor/autoload.php';
require_once  __DIR__.'/../config/my.php';

if(!file_exists('../config/providers.json'))die('Cannot find providers.json');

$providers=json_decode(file_get_contents('../config/providers.json'),true);
if($providers===null) die('Cannot decode config');

$mysql->exec("UPDATE inventory SET active=0");
foreach($providers as $provider){
    $pid=$provider['name'];
    
    $p=\Cloudy\Core\Provider::factory(
        $provider['type'],
        $provider['args']
    );
    
    $srvList=$p->serverList();
    
    foreach($srvList as $hid=>$name){
        //echo "<div>$hid : $name</div>";
        
        $escPid  = $mysql->esc($pid);
        $escHid  = $mysql->esc($hid);
        $escName = $mysql->esc($name);
        $sql="
            INSERT INTO inventory (`pid`,`hid`,`name`,`cdate`,`mdate`) VALUES ('$escPid','$escHid','$escName',NOW(),NOW())
            ON DUPLICATE KEY UPDATE `name`='$escName', `mdate`=NOW(),active=1;
        ";
        $mysql->exec($sql);
    }
    echo "$pid : ".count($srvList)." done<br>";
}