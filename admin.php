
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <link rel="stylesheet" href="main.css">
</head>
<?php
session_start();
require ('loginScript.php');
require ('header.php');
if (!isset($_SESSION['isAdmin']) || $_SESSION['isAdmin'] == 0) {
    header('Location: index.php');
}

// comment look up
$query = 'SELECT * FROM comments ORDER by commentID desc limit 100';
$statement = $db->prepare($query);
$statement->execute();
$comment = $statement->fetchAll();

if (isset($_SESSION['isAdmin']) || $_SESSION['isAdmin'] == 1 && $_GET && $_GET['del'] == true) {
    $delCommentID = $_GET['commentId'];
    $delQuery = 'DELETE FROM comments WHERE commentID = :commentID';
    $delStatement = $db->prepare($delQuery);
    $delStatement->bindValue(':commentID', $delCommentID);
    $delStatement->execute();
}
?>
<body>
<h1>Admin panel</h1>

<div class="admin">
    <div><h2>Users</h2></div>
    <div>
        <h2>comments</h2>
        <div>
         <?php foreach ($comment as $indi): ?>
        <div class="comment">
        <h2><?= $indi['userName'] ?> <small><a href="editUser.php?commentId=<?= $indi['commentID'] ?>">Edit</a> <a href="?del=true&commentId=<?= $indi['commentID'] ?>">Delete</a></small></h2>
        <h3><?= (new DateTime($indi['created_at']))->format('F j, Y \a\t g:i A') ?></h3>
       <p><?= $indi['commentText'] ?></p> 
        </div>
      <?php endforeach ?>
        </div>
    </div>
</div>
</body>

</html>