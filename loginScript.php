<?php
if ($_GET && $_GET["command"] == "signIn") {
    require("login.php");
}
if ($_GET && $_GET["command"] == "signUp") {
    require("signUp.php");
}
