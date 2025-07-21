
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
if (isset($_SESSION['isAdmin']) && $_SESSION['isAdmin'] == 1 && $_GET && isset($_GET['searchCom'])) {
    $search = '%' . $_GET['searchCom'] . '%';
    $query = 'SELECT * FROM comments where commentText like :commentText ORDER by commentID desc limit 100';
    $statement = $db->prepare($query);
    $statement->bindValue(':commentText', $search);
    $statement->execute();
    $comment = $statement->fetchAll();
} else {
    $query = 'SELECT * FROM comments ORDER by commentID desc limit 100';
    $statement = $db->prepare($query);
    $statement->execute();
    $comment = $statement->fetchAll();
}
if (isset($_SESSION['isAdmin']) && $_SESSION['isAdmin'] == 1 && $_GET && isset($_GET['del'])) {
    $delCommentID = $_GET['commentId'];
    $delQuery = 'DELETE FROM comments WHERE commentID = :commentID';
    $delStatement = $db->prepare($delQuery);
    $delStatement->bindValue(':commentID', $delCommentID);
    $delStatement->execute();
}

if (isset($_SESSION['isAdmin']) && $_SESSION['isAdmin'] == 1 && $_GET && isset($_GET['searchCom'])) {
    $search = '%' . $_GET['searchUser'] . '%';
    $query = 'SELECT * FROM users where userName like :userName ORDER by userName desc limit 100';
    $statement = $db->prepare($query);
    $statement->bindValue(':userName', $search);
    $statement->execute();
    $users = $statement->fetchAll();
} else {
    $query = 'SELECT * FROM users ORDER by userName desc limit 100';
    $statement = $db->prepare($query);
    $statement->execute();
    $users = $statement->fetchAll();
}
if (isset($_SESSION['isAdmin']) && $_SESSION['isAdmin'] == 1 && $_GET && isset($_GET['delUser'])) {
    $userName = $_GET['userName'];
    $delQuery = 'DELETE FROM users WHERE userName = :userName';
    $delStatement = $db->prepare($delQuery);
    $delStatement->bindValue(':userName', $userName);
    $delStatement->execute();
}
?>
<body>
<h1>Admin panel</h1>

<div class="admin">
    <div>
        <h2>Users</h2>
        <div>
             <form action="" method="GET">
               
                <input type="text" name="searchUser" id="searchUser" >
                <button type="submit">Search</button>
            </form>
            <?php foreach ($users as $row): ?>
                <div class="users">
                    <h2>User: <?= $row['userName'] ?> <small><a href="editUser.php?userName=<?= $row['userName'] ?>"> Edit</a> <a href="?delUser=true&userName=<?= $row['userName'] ?>">Delete</a></small></h2>
                    <h3>Password: <?= $row['password'] ?></h3>
                    <h4>email: <?= $row['email'] ?></h4>
                    <?php if ($row['isAdmin'] == 1): ?>
                     <h4>This User is a Admin</h4 >
                    <?php else: ?>
                    <h4>This User is not a Admin</h4>
                        <?php endif ?>
                    
                </div>
                <?php endforeach ?>
        </div>
    </div>
    <div>
        <h2>comments</h2>
        <div>
            <form action="" method="GET">
               
                <input type="text" name="searchCom" id="searchCom" >
                <button type="submit">Search</button>
            </form>
         <?php foreach ($comment as $indi): ?>
        <div class="comment">
        <h2><?= $indi['userName'] ?> <small><a href="?del=true&commentId=<?= $indi['commentID'] ?>">Delete</a></small></h2>
        <h3><?= (new DateTime($indi['created_at']))->format('F j, Y \a\t g:i A') ?></h3>
       <p><?= $indi['commentText'] ?></p> 
        </div>
      <?php endforeach ?>
        </div>
    </div>
</div>
</body>

</html>