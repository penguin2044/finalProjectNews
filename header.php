<?php
$login = false;

?>


<header>
    <ul id="firstUl">
        <li><a href="/index.php">Jesse Kleinschmit News</a></li>

        <li>
            <ul>

                <li>
                    <form action="#" method="post">
                        <input type="text" name="search">
                        <button type="submit">Search</button>
                    </form>
                </li>
                <?php if (!$login): ?>
                    <li><a href="#">Sign Up</a></li>
                    <li><a href="#">Sign In</a></li>
                <?php else: ?>
                    <li><a href="#">12345678901234567890</a></li>
                <?php endif ?>
            </ul>
        </li>
    </ul>
    </li>
    </ul>
</header>