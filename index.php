
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jesse Kleinschmit News</title>
    <link rel="stylesheet" href="main.css">
    <?php if ($_GET && $_GET['command'] == 'signIn' || $_GET && $_GET['command'] == 'signUp'): ?>
        <link rel="stylesheet" href="overFlow.css">
    <?php endif ?>
</head>
<?php
if (session_status() < 2) {
    session_start();
}

require ('header.php');
require ('loginScript.php');
$query2 = 'SELECT * FROM posts order by postID desc limit 100';
$statement2 = $db->prepare($query2);
$statement2->execute();
$posts = $statement2->fetchAll();

$query1 = 'SELECT * FROM categories limit 100';
$statement3 = $db->prepare($query1);
$statement3->execute();
$categories = $statement3->fetchAll();
?>
<body>
  
<h1>Home</h1>
<div id="home">
    <div>
 
        <div class="indexPost">
       <h2 class="block">Top 100 Lastest posts</h2>
          <?php foreach ($posts as $row): ?>
    <a href="post.php?postID=<?= $row['postID'] ?>" class="searchA" >
        <img src="Postimages/<?= $row['postImage'] ?>" alt="Could Not find image">
        <div>
            <h2><?= $row['postName'] ?></h2>
            <small><?= $row['userName'] ?></small>
            
        </div>
    </a>
    <?php endforeach ?>
          </div>
    </div>
        <div  id="categorie2">
          <h2 class="block">categories</h2>
    <form action="search.php" method="get">
  
    <?php foreach ($categories as $row): ?>
    <button type="submit" name="categorie" class="<?php if ($_GET && isset($_GET['categorie']) && $_GET['categorie'] == $row['categoryID']) {
        echo 'categorieSelected';
    } ?>" value="<?= $row['categoryID'] ?>"><?= $row['categoryName'] ?></button>
    <?php endforeach ?>
 
    </form>
        </div>
        <div></div>
    </div>
</div>
</body>

</html>