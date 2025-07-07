
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit News Post</title>
     <link rel="stylesheet" href="main.css">
</head>
<?php
session_start();
require("header.php");
require("loginScript.php");

$id = $_GET["postID"];
 $query2 = "SELECT * FROM posts where postID = $id limit 1";
  $statement2 = $db->prepare($query2);
  $statement2->execute();
  $post = $statement2->fetchAll();
?>
<body>

</body>

 <?php foreach ($post as $row): ?>
 
<div id="Post">
 <img src="PostImages/default.png" alt="could not find image">
 <h1><?= $row["postName"]?> <small> by <?= $row["userName"]?></small></h1>
 <div><?= $row["postMessage"]?></div>
 </div>
    <?php endforeach ?>

</html>