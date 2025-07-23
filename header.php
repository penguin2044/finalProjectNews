<?php
require ('connect.php');

if (isset($_SESSION['logged']) && $_SESSION['logged'] == 1) {
    $login = true;
} else {
    $login = false;
}

if (isset($_SESSION['isAdmin']) && $_SESSION['isAdmin'] == 1) {
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
                    <form action="search.php" method="post">
                        <input type="text" name="search" placeholder="Search">
                        <input hidden type="text" name="drop" placeholder="title">
                          
                        <button type="submit">Search</button>
                    </form>
                </li>
                <?php if (!$login): ?>
                    <li><a href="?command=signUp">Sign Up</a></li>
                    <li><a href="?command=signIn">Login</a></li>
                    <li><button class="theme-toggle" onclick="toggleTheme()" aria-label="Toggle dark mode"><span class="theme-icon">🌙</span></button></li>
                <?php else: ?>
                    <?php if ($admin): ?>
                     
                        <li><a href="admin.php">Admin Panel</a></li>
                       
                    <?php endif ?>
                        <li><a href="create.php">Create post</a></li>
                    <li><a href="#"><?= $_SESSION['username'] ?></a></li>
                        <li><a href="?command=Logout">Logout</a></li>
                        <li><button class="theme-toggle" onclick="toggleTheme()" aria-label="Toggle dark mode"><span class="theme-icon">🌙</span></button></li>
                        
                <?php endif ?>
            </ul>
        </li>
    </ul>

</header>

<script>
function toggleTheme() {
  const html = document.documentElement;
  const currentTheme = html.getAttribute('data-theme');
  const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
  const icon = document.querySelector('.theme-icon');
  
  html.setAttribute('data-theme', newTheme);
  icon.textContent = newTheme === 'dark' ? '☀️' : '🌙';
  
  // Save preference
  localStorage.setItem('theme', newTheme);
}

// Load saved theme on page load
document.addEventListener('DOMContentLoaded', function() {
  const savedTheme = localStorage.getItem('theme') || 'light';
  const icon = document.querySelector('.theme-icon');
  
  document.documentElement.setAttribute('data-theme', savedTheme);
  icon.textContent = savedTheme === 'dark' ? '☀️' : '🌙';
});
</script>