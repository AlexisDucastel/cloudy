<?php
require_once  __DIR__.'/../config/my.php';

if(isset($_POST['pid'],$_POST['hid'])){
    $sql='';
    foreach(array_keys($_POST['pid']) as $i){
        $pid=$_POST['pid'][$i];
        $hid=$_POST['hid'][$i];

        $updateSet=array();
        foreach($_POST as $attr=>$value){
            switch($attr){
                case 'pid':
                case 'hid':
                case 'name':
                    //do nothing
                    break;
                default:
                    $updateSet[]="`".$mysql->esc($attr)."`='".$mysql->esc($value[$i])."'";
            }
            
        }
        $sql="UPDATE inventory SET ".implode(',',$updateSet)." WHERE `pid`='".$mysql->esc($pid)."' AND`hid`='".$mysql->esc($hid)."';";
        $mysql->exec($sql);    
    }
    header('Location: hostList.php');
    exit();
}

$hostList=$mysql->query("SELECT * FROM inventory;");

$readOnly=array('pid','hid','name','cdate','mdate');

?><!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="author" content="">
    <title>Makadmin Host Editor</title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <style>
        th { text-align: left;  }
        td { padding: 0; padding-left: 10px; white-space: nowrap; }
    </style>
</head>
<body>
    <?php
    $splitter='<tr style="background:#AAA">';
    foreach($hostList[0] as $attr=>$value){
        $hattr=htmlspecialchars($attr);
        $splitter.='<th>'.$hattr.'</th>';
    }
    $splitter.="</tr>";
    ?>
    
    <form method="POST">
    
    <table id="hostList">
    <?php
        $colors=array('#FFF','#EEF');
        foreach($hostList as $i=>$host){
            if($i%20==0) echo $splitter;
            
            $first='<input type="hidden" name="pid[]" value="'.htmlspecialchars($host['pid']).'">';
            $first.='<input type="hidden" name="hid[]" value="'.htmlspecialchars($host['hid']).'">';
            
            echo '<tr style="background:'.$colors[$i%2].'">';
            foreach($host as $attr=>$value){
                $hattr=htmlspecialchars($attr);
                $hvalue=htmlspecialchars($value);
                
                echo "<td>";
                if($first!=null){ echo $first; $first=null; }
                if(in_array($attr,$readOnly)){
                    echo $hvalue;
                }
                else {
                    echo '<input type="text" name="'.$hattr.'[]" value="'.$hvalue.'">';
                }
                echo "</td>";
                
            }
            echo "</tr>";
        }
    ?>
    </table>
    <input type="submit" value="Update host">
    </form>
</body>
</html>
