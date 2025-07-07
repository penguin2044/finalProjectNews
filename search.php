
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Result</title>
    <link rel="stylesheet" href="main.css">
    <?php if ($_GET && isset($_GET["command"]) && $_GET["command"] == "signIn" || $_GET && isset($_GET["command"]) && $_GET["command"] == "signUp"): ?>
        <link rel="stylesheet" href="overFlow.css">
    <?php endif ?>


</head>
<?php
if (session_status() < 2) {
 session_start();
 
}


require("header.php");
require("loginScript.php");

$query1 = "SELECT * FROM categories limit 100";
  $statement3 = $db->prepare($query1);
  $statement3->execute();
  $categories = $statement3->fetchAll();



$nosearch = false;
  if ( $_POST && $_GET && isset($_GET["categorie"])) {
    $allowed_columns = ['postName', 'userName', 'postMessage'];

    $search = "%" . $_POST["search"] . "%";
 $drop = $_POST["drop"];
    if (!in_array($drop, $allowed_columns)) {
    $drop = 'postName'; // fallback to safe default
  }
  $query2 = "SELECT * FROM posts where categoryID = :categoryID and $drop like  :search limit 100";
  $statement2 = $db->prepare($query2);
  $statement2-> bindvalue(':categoryID', $_GET["categorie"]);
    $statement2-> bindvalue(':search', $search);
  $statement2->execute();
  $posts = $statement2->fetchAll();

  }
  elseif($_POST && !empty($_POST["search"]) ){
  $allowed_columns = ['postName', 'userName', 'postMessage'];

    $search = "%" . $_POST["search"] . "%";
  $drop = $_POST["drop"];
    if (!in_array($drop, $allowed_columns)) {
    $drop = 'postName'; 
  }
  $query2 = "SELECT * FROM posts where $drop like  :search limit 100";
  $statement2 = $db->prepare($query2);    
  $statement2-> bindvalue(':search', $search);
  $statement2->execute();
  $posts = $statement2->fetchAll();

  }
   else if($_POST && !isset($_GET["categorie"]) && empty($_POST["search"])){
$nosearch = true;
   }
  else if (!$_POST){
      $query2 = "SELECT * FROM posts limit 100";
  $statement2 = $db->prepare($query2);
  $statement2->execute();
  $posts = $statement2->fetchAll();
  }
  
?>
<body>
<h1 class="sh1">Search</h1>
 <form action="" method="post" class="search">
    <input type="text" name="search">
    <select name="drop" id="drop">

      <option value="postName">title</option>
      <option value="userName">username</option>
      <option value="postMessage">commentText</option>
    </select>
  
    <button type="submit">Search</button>
    <a class="d" href="?">Reset</a>
</form>
<h1 class="h2">Categories</h1>

<div id="categories">
      
  <form action="" method="get">
   <!--<a class="b" href="?">Reset</a>-->
    <?php foreach ($categories as $row): ?>
    <button type="submit" name="categorie" class="<?php if($_GET && isset($_GET["categorie"]) && $_GET["categorie"] == $row["categoryID"]) {
     echo "categorieSelected";
    } ?>" value="<?=$row["categoryID"] ?>"><?=$row["categoryName"] ?></button>
    <?php endforeach?>
 
    </form>
</div>
<h1 class="h2">Search Results</h1>
<div class="searchRe">
  <?php if(!$nosearch): ?>
  <?php foreach ($posts as $row): ?>
    <a href="post.php?postID=<?= $row["postID"]?>" class="searchA" >
        <img src="Postimages/<?= $row["postImage"]?>" alt="Could Not find image">
        <div>
            <h2><?=$row["postName"] ?></h2>
            <small><?= $row["userName"]?></small>
            
        </div>
  </a>
    <?php endforeach ?>
    <?php endif ?>
    <?php if ($nosearch):?>
      <p id="ERROR">You have to pick a Categorie or put something in the input bar</p>
      <?php endif ?>
</div>
</body>

</html>