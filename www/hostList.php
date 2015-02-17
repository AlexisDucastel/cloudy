<?php
require_once  __DIR__.'/../config/my.php';

$filter=array('active=1');
if(isset($_GET['env']) && $_GET['env']!='*') $filter[]="`env`='".$mysql->esc($_GET['env'])."'";
if(isset($_GET['pid']) && $_GET['pid']!='*') $filter[]="`pid` LIKE '".$mysql->esc($_GET['pid'])."%'";

$hostList=$mysql->query("SELECT * FROM inventory WHERE ".implode(' AND ',$filter)." ORDER BY pid,hid;");

$hostPerProvider=array();
foreach($hostList as $host){
    if(!isset($hostPerProvider[$host['pid']])) $hostPerProvider[$host['pid']]=array();
    $hostPerProvider[$host['pid']][]=$host;
}

?><html>
<head>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="//cdn.datatables.net/1.10.0/js/jquery.dataTables.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.0/css/jquery.dataTables.css">
    <script>
    $(function(){
        window.table = $('#hostList').dataTable({
            ordering: true,
            searching: true,
            paging: false
        });    
    });
    </script>
</head>
<body>
<div>
    

</div>
<br>

<table id="hostList" class="display">
<thead>
    <tr>
        <th>env</th>
        <th>ssh</th>
        <th>provider</th>
        <th>hid</th>
        <th>name</th>
    </tr>
</thead>
<tbody>
<?php
foreach($hostPerProvider as $provider=>$hostList){
    
    foreach($hostList as $host){
        echo '<tr>';
        
        $b='white';
        switch($host['env']){
            case 'prod':$b="red";break;
            case 'dev':$b="lightgreen";break;
            case 'qa':$b="yellow";break;
            case 'uat':$b="orange";break;
            case 'tpl':$b="silver";break;
        }
        echo '<td style="background:'.$b.';padding: 0 5px;">'.$host['env'].'</td>';
        
        echo '<td>';
        if($host['ssh']!=null)
            echo '<a href="'.htmlspecialchars($host['ssh']).'"><img src="img/ssh.png" title="SSH Magnet link"></a>';
        echo '</td>';
        
        echo '<td>'.htmlspecialchars($provider).'</td>';
        
        echo '<td><a href="hostEdit.php?pid='.htmlspecialchars($provider).'&hid='.htmlspecialchars($host['hid']).'">['.$host['hid'].']</a></td>';
        echo '<td>'.$host['name'].'</td>';
        
        
        echo '</tr>';
    }
    
}
?>
</tbody>
</table>
<div><a href="hostEditMass.php">Editer tous les serveurs</a></div>
</body>
</html>
