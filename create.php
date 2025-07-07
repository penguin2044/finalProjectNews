
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create News Post</title>
    <link rel="stylesheet" href="main.css">
</head>
<?php
session_start();
if (!isset($_SESSION["logged"]) || $_SESSION["logged"] == 0) {
    header("Location: index.php");
}
require("header.php");
require("loginScript.php");
?>
<body>
<h1>Create Post</h1>

<form action="" method="post">
    <ul>
        <li><label for='image'>Post name:</label><input type="text" name="postName" id="postName"></li>
        <li> <label for='image'>Image:</label>
         <input type='file' name='image' id='image'></li>
        <li> <label for='image'>Post message:</label><input type="text" name="postMessage" id="postMessage"></li>
        <li><button type="reset">Reset</button> <button type="submit">Submit</button></li>
    </ul>
</form>
</body>

</html>