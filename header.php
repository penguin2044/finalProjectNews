<?php
require('connect.php');

if (isset($_SESSION["logged"]) && $_SESSION["logged"] == 1) {
    $login = true;
} else {
    $login = false;
}

if (isset($_SESSION["isAdmin"]) && $_SESSION["isAdmin"] == 1) {
    $admin = true;
} else {
    $admin = false;
}



?>


<header>
    <ul id="firstUl">

        <li><a href="index.php">Jesse Kleinschmit News </a></li>


        <li>
            <ul>

                <li>
                    <form action="/" method="post">
                        <input type="text" name="search">
                        <button type="submit">Search</button>
                    </form>
                </li>
                <?php if (!$login): ?>
                    <li><a href="?command=signUp">Sign Up</a></li>
                    <li><a href="?command=signIn">Login</a></li>
                <?php else: ?>
                    <?php if ($admin): ?>
                     
                        <li><a href="admin.php">Admin Panel</a></li>
                       
                    <?php endif ?>
                        <li><a href="post.php">Post</a></li>
                    <li><a href="#"><?= $_SESSION["username"] ?></a></li>
                        <li><a href="?command=Logout">Logout</a></li>
                        
                <?php endif ?>
            </ul>
        </li>
    </ul>

</header>