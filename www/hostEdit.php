<?php
require_once  __DIR__.'/../config/my.php';

if(isset($_POST['pid'],$_POST['hid'])){
    $pid=$_POST['pid'];
    $hid=$_POST['hid'];

    $updateSet=array();
    foreach($_POST as $attr=>$value){
        switch($attr){
            case 'pid':
            case 'hid':
            case 'name':
                //do nothing
                break;
            default:
                $updateSet[]="`".$mysql->esc($attr)."`='".$mysql->esc($value)."'";
        }
        
    }
    $sql="UPDATE inventory SET ".implode(',',$updateSet)." WHERE `pid`='".$mysql->esc($pid)."' AND`hid`='".$mysql->esc($hid)."';";
    $mysql->exec($sql);
    header('Location: hostList.php');
    exit();
}

if(!isset($_GET['pid'],$_GET['hid'])){
    die('missing pid and hid');
}

$tags=$mysql->query("SELECT * FROM tags;");
$hostList=$mysql->query("SELECT * FROM inventory WHERE `pid`='".$mysql->esc($_GET['pid'])."' AND `hid`='".$mysql->esc($_GET['hid'])."';");
if(count($hostList)==0) die('Wrong pid or hid');
$host=$hostList[0];

$readOnly=array('pid','hid','name','cdate','mdate');

?><!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="author" content="">
    <title>Makadmin Host Editor</title>
</head>
<body>
    <form method="POST">
    <input type="hidden" name="pid" value="<?php echo htmlspecialchars($host['pid']); ?>">
    <input type="hidden" name="hid" value="<?php echo htmlspecialchars($host['hid']); ?>">
    <table>
    <?php
        foreach($host as $attr=>$value){
            $hattr=htmlspecialchars($attr);
            $hvalue=htmlspecialchars($value);
            
            echo "<tr><th>".$hattr."</th><td>";
            if(in_array($attr,$readOnly)){
                echo $hvalue;
            }
            else {
                echo '<input type="text" name="'.$hattr.'" value="'.$hvalue.'">';
            }
            echo "</td></tr>";
        }

    ?>
    </table>
    <input type="submit" value="Update host">
    </form>
    <?php
        foreach($tags as $tag){
            echo "$tag<br>";
        }
    ?>
  
</body>
</html>
