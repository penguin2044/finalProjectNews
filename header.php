<?php
require('connect.php');

if (isset($_SESSION["login"])) {
    $login = true;
} else {
    $login = false;
}

if (isset($_SESSION["admin"])) {
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
                        <li><a href="#">Admin Panel</a></li>
                    <?php endif ?>
                    <li><a href="#">12345678901234567890</a></li>

                <?php endif ?>
            </ul>
        </li>
    </ul>

</header>