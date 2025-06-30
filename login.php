<?php 
 $passwordempty = false;
  $usernameEmpty = false;
$usernameNotFound = false;
$passwordWrong = false;
  $loggedIn = false;
if ($_POST) {
$username = filter_input(INPUT_POST, "username", FILTER_SANITIZE_SPECIAL_CHARS);
$password = $_POST["password"];
$error = false;
 if (empty($username)) {
        $usernameEmpty = true;
       if ($error != true) {
        $error = true;
       }
    }
    if (empty($password )) {
        $passwordempty = true;
        if ($error != true) {
        $error = true;
       }
    }
 if ( strlen($password) <= 8 && strlen($password) >= 50) {
       
         if($error != true) {
        $error = true;
       }
    }

    if ($error == false) {
         $query = "SELECT * FROM users WHERE userName = :userName";
   $statement = $db->prepare($query);
   $statement-> bindvalue(':userName', $username);
   
   $statement->execute();
    }
 if ($statement->rowCount() == 0 ) {
       if ($error != true) {
        $error = true;
       }
       $usernameNotFound = true;
    
   }
     if ($error = false) {
         $query = "SELECT * FROM users WHERE userName = :userName  and password = :password";
   $statement = $db->prepare($query);
   $statement-> bindvalue(':password', $password);
   
   $statement->execute();
    }
 if ($statement->rowCount() == 0 ) {
        if ($error != true) {
        $error = true;
       }
       $passwordWrong = true;
    
   }
    if ($error != true) {
        $loggedIn = true;
       }
  
}

?>



<div id="login">
    <div>
        <h2>Login</h2>
        <small>Dont have a account? <a href="?command=signUp">Sign up</a></small>
        <form action="" method="post">
            <ul>
                <li>
                    <input type="text" name="username" placeholder="Username">
                </li>
                 <?php if ($usernameEmpty): ?>
                    <li class="empty">
                        <p>Username empty</p>
                    </li>
                <?php endif ?>
                 <?php if ($usernameNotFound): ?>
                    <li class="empty">
                        <p>Username could not be found</p>
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
                <?php if ($passwordWrong): ?>
                    <li class="empty">
                        <p>password is wrong</p>
                    </li>
                <?php endif ?>
                 <?php if ($loggedIn): ?>
                    <li class="empty">
                        <p>Logged In</p>
                    </li>
                <?php endif ?>
                <li>
                    <button type="submit">Reset</button>
                    <button type="submit" name="signIn" value="signIn">Login</button>

                </li>
            </ul>
        </form>
    </div>
</div>