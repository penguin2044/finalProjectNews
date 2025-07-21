
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

$query = "SELECT * FROM comments where postID = $id ORDER by commentID desc";
$statement = $db->prepare($query);
$statement->execute();
$comment = $statement->fetchAll();
if (!$comment) {
}
$error = false;
$commentErrorOne = false;
$commentErrorTwo = false;
if ($_POST) {
    $commentPOST = filter_input(INPUT_POST, 'comment', FILTER_SANITIZE_SPECIAL_CHARS);
    if (empty($commentPOST)) {
        $error = true;
        $commentErrorOne = true;
    }
    if (strlen($commentPOST) > 250) {
        $error = true;
        $commentErrorTwo = true;
    }
    if (!$error) {
        $query = 'INSERT INTO comments (commentText, postID, userName ) VALUES (:commentText, :postID, :userName)';
        $statement = $db->prepare($query);
        //  Bind values to the parameters

        $statement->bindValue(':commentText', $commentPOST);
        $statement->bindValue(':postID', $row['postID']);
        $statement->bindValue(':userName', $_SESSION['username']);

        $statement->execute();  // executing the statmate
    }
}
?>
<body>

</body>



<div class="Post">
  
 <?php if ($row['postImage'] != null): ?>
 <img src="PostImages/<?= $row['postImage'] ?>" alt="could not find image">
 <?php endif ?>
 <h1 ><?= $row['postName'] ?> <small> by <?= $row['userName'] ?></small> 
 <?php if (isset($_SESSION['logged']) && $_SESSION['logged'] == 1): ?><a href="edit.php?postID=<?= $row['postID'] ?>">Edit</a> <?php endif ?></h1>
                
              <h4 class="postH4"><small>Posted on <?= $row['dateMade'] ?></small> </h4> 
              <h4 class="postH4"><small>Last edited on <?= $row['dateEdit'] ?></small></h4> 
            
 <div class="ql-editor"> <?= $row['postMessage'] ?></div>
 
 </div>
 
<div class="post">
    <div>
    <?php if (isset($_SESSION['logged']) && $_SESSION['logged'] == 1): ?>
    <form action="" method="post">
        <label for="comment">comment</label> <br>
        <textarea name="comment" id="comment"></textarea>
        <?php if ($commentErrorOne): ?>
        <p>the comment area cant be empty or not valid</p>
        <?php endif ?>
          <?php if ($commentErrorTwo): ?>
          <p>your comment is to long</p>
        <?php endif ?>
 
        <button type="submit">Submit Comment</button>
    </form>
    <?php else: ?>
        <h2 class="centerH2">You must log in to post a comment</h2>
    <?php endif ?>
    <?php if ($comment): ?>
    <?php foreach ($comment as $indi): ?>
    <div class="comment">
        <h2><?= $indi['userName'] ?></h2>
        <h3><?= (new DateTime($indi['created_at']))->format('F j, Y \a\t g:i A') ?></h3>
       <p><?= $indi['commentText'] ?></p> 
    </div>
      <?php endforeach ?>
      <?php else: ?>
        <p class="noCom">no comments found</p>
        <?php endif ?>
    </div>
</div>


</html>