<?php
if ($_GET && isset($_GET["command"]) && $_GET["command"] == "signIn") {
    require("login.php");
}
if ($_GET && isset($_GET["command"]) &&  $_GET["command"] == "signUp") {
    require("signUp.php");
}
if ($_GET && isset($_GET["command"]) && $_GET["command"] == "Logout") {
   session_destroy();
  
  header("Location: ?");
 
   }
