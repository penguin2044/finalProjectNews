
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit News Post</title>
     <link rel="stylesheet" href="main.css">
<link href="https://cdn.jsdelivr.net/npm/quill@2.0.3/dist/quill.snow.css" rel="stylesheet">
     

</head>
<?php
session_start();
require ('header.php');
require ('loginScript.php');

$id = $_GET['postID'];
$query2 = "SELECT * FROM posts where postID = $id limit 1";
$statement2 = $db->prepare($query2);
$statement2->execute();
$row = $statement2->fetch();
?>
<body>

</body>



<div id="Post">
  
 
 <img src="PostImages/<?= $row['postImage'] ?>" alt="could not find image">
 <h1 ><?= $row['postName'] ?> <small> by <?= $row['userName'] ?></small> <?php if (isset($_SESSION['logged']) && $_SESSION['logged'] == 1): ?><a href="edit.php?postID=<?= $row['postID'] ?>">Edit</a> <?php endif ?></h1>
 <div class="ql-editor"> <?= $row['postMessage'] ?></div>
 
 </div>
 



</html>