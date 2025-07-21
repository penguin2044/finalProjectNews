<?php
session_start();
require ('loginScript.php');
require ('header.php');
if (!isset($_SESSION['isAdmin']) || $_SESSION['isAdmin'] == 0) {
    header('Location: index.php');
}

$usernameEmpty = false;
$usernameTaken = false;
$emailError = false;
$emailregex = false;
$passwordError = false;
$passwordempty = false;
$rePasswordempty = false;
$passwordLong = false;
$error = false;
$usernameTaken = false;
$emailUsed = false;

if ($_GET && isset($_GET['userName'])) {
    $query = 'SELECT * FROM users where userName = :userName limit 1';
    $statement = $db->prepare($query);
    $statement->bindValue(':userName', $_GET['userName']);
    $statement->execute();
    $user = $statement->fetch();
}
if ($_POST) {
    $username = filter_input(INPUT_POST, 'username', FILTER_SANITIZE_SPECIAL_CHARS);
    $password = $_POST['password'];
    $email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
    if (empty($username)) {
        $usernameEmpty = true;
        if ($error != true) {
            $error = true;
        }
    }
    if (empty($email)) {
        $emailError = true;
        if ($error != true) {
            $error = true;
        }
    }
    if (!preg_match('/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/', $email)) {
        $emailregex = true;
        if ($error != true) {
            $error = true;
        }
    }
    if ($password != $_POST['repassword'] && !empty($password) && !empty($_POST['repassword'])) {
        $passwordError = true;
        if ($error != true) {
            $error = true;
        }
    }
    if (empty($password)) {
        $passwordempty = true;
        if ($error != true) {
            $error = true;
        }
    }
    if (empty($_POST['repassword'])) {
        $rePasswordempty = true;
        if ($error != true) {
            $error = true;
        }
    }

    if (strlen($password) <= 8 || strlen($password) >= 50) {
        $passwordLong = true;
        if ($error != true) {
            $error = true;
        }
    }

    $query = 'SELECT
    *
FROM
    users
WHERE
   email = :email ';
    $statement = $db->prepare($query);

    $statement->bindvalue(':email', $email);
    $statement->execute();
    if ($statement->rowCount() > 0 && $email != $user['email']) {
        $error = true;
        $emailUsed = true;
    }

    $query = 'SELECT
    *
FROM
    users
WHERE
 userName = :userName';
    $statement = $db->prepare($query);
    $statement->bindvalue(':userName', $username);

    $statement->execute();
    if ($statement->rowCount() > 0 && $username != $_GET['userName']) {
        $error = true;
        $usernameTaken = true;
    }

    if ($error == false) {
        $query = 'UPDATE users SET password = :password, email = :email, userName = :usernames WHERE userName = :userName';
        $statement = $db->prepare($query);
        $statement->bindValue(':userName', $_GET['userName']);
        $statement->bindValue(':usernames', $username);
        $statement->bindValue(':password', $password);
        $statement->bindValue(':email', $email);

        $statement->execute();
    }
}

?>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User</title>
    <link rel="stylesheet" href="main.css">
    
   
        <link rel="stylesheet" href="overFlow.css">
    
</head>
<body>
    <div id="login">
    <div>
        <h2>Edit user</h2>
       
        <form action="" method="post">
            <ul>
                <li>
                    <input type="text" name="username" placeholder="Username" value="<?= $user['userName'] ?>">
                </li>
                <?php if ($usernameEmpty): ?>
                    <li class="empty">
                        <p>user name empty</p>
                    </li>
                <?php endif ?>
                <?php if ($usernameTaken): ?>
                    <li class="empty">
                        <p>username is taken already</p>
                    </li>
                <?php endif ?>
                <li>
                    <input type="email" name="email" placeholder="Email" value="<?= $user['email'] ?>">
                </li>
                <?php if ($emailError): ?>
                    <li class="empty">
                        <p>email is empty</p>
                    </li>
                <?php endif ?>
                 <?php if ($emailUsed): ?>
                    <li class="empty">
                        <p>email is used already</p>
                    </li>
                <?php endif ?>
                <?php if ($emailregex): ?>
                    <li class="empty">
                        <p> format is Wrong </p>
                    </li>
                <?php endif ?>
                <li>
                    <input type="text" name="password" placeholder="Password" value="<?= $user['password'] ?>">
                </li>
                <?php if ($passwordempty): ?>
                    <li class="empty">
                        <p>password is empty</p>
                    </li>
                <?php endif ?>
                 <?php if ($passwordLong): ?>
                    <li class="empty">
                        <p>password must be less then 50 and longer then 8 long</p>
                    </li>
                <?php endif ?>
                <li>
                    <input type="text" name="repassword" placeholder="ReType Password" value="<?= $user['password'] ?>">
                </li>
                <?php if ($rePasswordempty): ?>
                    <li class="empty">
                        <p>retype password is empty</p>
                    </li>
                <?php endif ?>
               
                <?php if ($passwordError): ?>
                    <li class="empty">
                        <p>password dont match</p>
                    </li>
                <?php endif ?>
                 <?php if ($_POST && $error == false): ?>
                    <li class="empty">
                        <p>Account updated!</p>
                        <br>
                        <p><a href="admin.php">Go Back?</a></p>
                    </li>
                <?php endif ?>
                <li>
                    <button type="reset">Reset</button>
                    <button type="submit" name="signUp" value="signUp">Update</button>

                </li>
            </ul>
        </form>
    </div>
</div>
</body>
</html>
