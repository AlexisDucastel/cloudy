<?php
require_once  __DIR__.'/../config/my.php';

$hostList=$mysql->query("SELECT * FROM inventory ORDER BY pid,name,hid;");

$hostPerProvider=array();
foreach($hostList as $host){
    if(!isset($hostPerProvider[$host['pid']])) $hostPerProvider[$host['pid']]=array();
    $hostPerProvider[$host['pid']][]=$host;
}

?><html>
<body>

<table>
<?php
foreach($hostPerProvider as $provider=>$hostList){
    echo '<tr><td colspan="3"><h3>'.htmlspecialchars($provider).'</h3></td></tr>';
    
    foreach($hostList as $host){
        echo '<tr><td>';
        if($host['ssh']!=null) 
            echo '<a href="'.htmlspecialchars($host['ssh']).'"><img src="img/ssh.png" title="SSH Magnet link"></a>';
        echo '</td>';
        
        echo '<td style="text-align:right;"><a href="hostEdit.php?pid='.htmlspecialchars($provider).'&hid='.htmlspecialchars($host['hid']).'">['.$host['hid'].']</a></td>';
        echo '<td>'.$host['name'].'</td>';
        echo '</tr>';
    }
    
}
?>
</table>

</body>
</html>
