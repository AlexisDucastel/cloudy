<?php
require_once  __DIR__.'/../config/my.php';

$tags=$mysql->query("SELECT DISTINCT tag FROM tags;");

?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="author" content="">
<title>Makadmin Map</title>
<link rel="stylesheet" type="text/css" href="my.css">
</head>
<body>

<?php
    foreach($tags as $tag){
        echo "$tag<br>";
    }
?>
  
</body>
</html>
