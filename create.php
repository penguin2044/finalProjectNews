
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
</body>

</html>