
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Result</title>
    <link rel="stylesheet" href="main.css">
    <?php if ($_GET && $_GET["command"] == "signIn" || $_GET && $_GET["command"] == "signUp"): ?>
        <link rel="stylesheet" href="overFlow.css">
    <?php endif ?>


</head>
<?php
if (session_status() < 2) {
 session_start();
 
}


require("header.php");
require("loginScript.php");
$query1 = "SELECT * FROM categories";
  $statement = $db->prepare($query1);
  $statement->execute();

  $query2 = "SELECT * FROM posts";
  $statement2 = $db->prepare($query2);
  $statement2->execute();
?>
<body>
<h1 class="sh1">Search</h1>
 <form action="" method="post" class="search">
    <input type="text" name="search">
    <select name="drop" id="drop">

      <option value="title">title</option>
      <option value="username">username</option>
      <option value="commentText">commentText</option>
    </select>
  
    <button type="submit">Search</button>
</form>
<h1 class="h2">Categories</h1>
<div id="categories">
    <?php while ($row = $statement->fetch()): ?>
    <button type="button" value="<?=$row["categoryID"] ?>"><?=$row["categoryName"] ?></button>
    <?php endwhile ?>
</div>
<h1 class="h2">Search Results</h1>
<div class="searchRe">
  <?php while ($row = $statement2->fetch()): ?>
    <a href="" class="searchA" >
        <img src="Postimages/default.png" alt="Could Not find image">
        <div>
            <h2><?=$row["postName"] ?></h2>
            <small><?= $row["userName"]?></small>
            <p><?= $row["postMessage"]?></p>
        </div>
  </a>
    <?php endwhile ?>
</div>
</body>

</html>