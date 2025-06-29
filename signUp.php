<?php
$usernameEmpty = false;
$usernameTaken = false;
$emailError = false;
$emailregex = false;
$passwordError = false;
$passwordempty = false;
$rePasswordempty = false;

if ($_POST) {
    if (empty($_POST["username"])) {
        $usernameEmpty = true;
    }
    if (empty($_POST["email"])) {
        $emailError = true;
    }
    if ($_POST["password"] != $_POST["repassword"] && !empty($_POST["password"]) && !empty($_POST["repassword"])) {
        $passwordError = true;
    }
    if (empty($_POST["password"])) {
        $passwordempty = true;
    }
    if (empty($_POST["repassword"])) {
        $rePasswordempty = true;
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
                    <input type="text" name="username" placeholder="Username">
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
                    <input type="email" name="email" placeholder="Email">
                </li>
                <?php if ($emailError): ?>
                    <li class="empty">
                        <p>email is empty</p>
                    </li>
                <?php endif ?>
                <?php if ($emailregex): ?>
                    <li class="empty">
                        <p>email is empty</p>
                    </li>
                <?php endif ?>
                <li>
                    <input type="password" name="password" placeholder="Password">
                </li>
                <?php if ($passwordempty): ?>
                    <li class="empty">
                        <p>password is empty</p>
                    </li>
                <?php endif ?>
                <li>
                    <input type="password" name="repassword" placeholder="ReType Password">
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
                <li>
                    <button type="submit">Reset</button>
                    <button type="submit" name="signUp" value="signUp">Sign Up</button>

                </li>
            </ul>
        </form>
    </div>
</div>