<?php
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
    if (!preg_match('/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/', strtolower($email))) {
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
    if ($statement->rowCount() > 0) {
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
    if ($statement->rowCount() > 0) {
        $error = true;
        $usernameTaken = true;
    }

    if ($error == false) {
        $query = 'INSERT INTO users(userName,password,email) values (:userName, :password, :email)';
        $statement = $db->prepare($query);
        $statement->bindvalue(':userName', $username);
        $statement->bindvalue(':password', $password);
        $statement->bindvalue(':email', $email);

        $statement->execute();
    }
}

?>



<div id="login">
    <div>
        <h2>Sign up</h2>
        <small>Already have a account <a href="?command=signIn">Login</a></small>
        <form action="" method="post">
            <ul>
                <li>
                    <input type="text" name="username" placeholder="Username" <?php if ($_POST && isset($_POST['username'])): ?> value="<?= $username ?>" <?php endif ?>>
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
                    <input type="email" name="email" placeholder="Email" <?php if ($_POST && isset($_POST['email'])): ?>value="<?= $email ?>"<?php endif ?>>
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
                    <input type="password" name="password" placeholder="Password" <?php if ($_POST && isset($_POST['password']) && !empty($_POST['password'])): ?> value="<?= $password ?>" <?php endif ?>>
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
                    <input type="password" name="repassword" placeholder="ReType Password" <?php if ($_POST && isset($_POST['repassword']) && !empty($_POST['repassword'])): ?>value="<?= $_POST['repassword'] ?>" <?php endif ?>>
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
                        <p>Account created!</p>
                        <br>
                        <p><a href="?command=signIn">SignIn</a></p>
                    </li>
                <?php endif ?>
                <li>
                    <button type="reset ">Reset</button>
                    <button type="submit" name="signUp" value="signUp">Sign Up</button>

                </li>
            </ul>
        </form>
    </div>
</div>