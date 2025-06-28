<?php
require("header.php");
if ($_GET && $_GET["command"] == "signIn") {
    require("login.php");
}
if ($_GET && $_GET["command"] == "signUp") {
    require("signUp.php");
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jesse Kleinschmit News</title>
    <link rel="stylesheet" href="main.css">
    <?php if ($_GET && $_GET["command"] == "signIn" || $_GET && $_GET["command"] == "signUp"): ?>
        <link rel="stylesheet" href="overFlow.css">
    <?php endif ?>
</head>

<body>

</body>

</html>