<?php
 session_start();
 require("loginScript.php");
require("header.php");
if (!isset($_SESSION["isAdmin"]) || $_SESSION["isAdmin"] == 0) {
    header("Location: index.php");
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <link rel="stylesheet" href="main.css">
</head>

<body>

</body>

</html>