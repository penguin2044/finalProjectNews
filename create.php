
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create News Post</title>
    <link rel="stylesheet" href="main.css">
</head>
<?php
session_start();
if (!isset($_SESSION["logged"]) || $_SESSION["logged"] == 0) {
    header("Location: index.php");
}
require("header.php");
require("loginScript.php");
$query1 = "SELECT * FROM categories";
  $statement3 = $db->prepare($query1);
  $statement3->execute();
  $categories = $statement3->fetchAll();
//errors
$messageError = false;
$postNameError = false;
$postImageError = false;
$catErrror = false;

if ($_POST) {
   $postName = $_POST["postName"];
$postImage = $_POST["image"];
$categorie = $_POST["categorie"];
$postMessage = $_POST["postMessage"];
 $error = false;
 if (empty($postName) ) {
    $postNameError = true;
    if (!$error) {
       $error = true;
    }
 }
  if (empty($postImage) ) {
    $postImageError = true;
    if (!$error) {
       $error = true;
    }
 }
   if (empty($postMessage) ) {
    $messageError = true;
    if (!$error) {
       $error = true;
    }
 }
}


?>
<body>
<h1>Create Post</h1>

<form action="" method="post" class="createForm">
    <ul>
        <li class="inputs"><label for='image'>Post name:</label><input type="text" name="postName" id="postName"></li>
        <?php if($postNameError):?>
<li><p>ERROR: Post name is empty or invalid</p></li>
<?php endif?>
         <li> <label for='image'>Main Image:</label>
         <input type='file' name='image' id='image'></li>
         
        <li> 
<?php if($postImageError):?>
<li><p>ERROR:  no content</p></li>
<?php endif?>
            <li> <label for='image'>Post name:</label><select name="categorie" id="categorie">
               
    <?php foreach ($categories as $row): ?>
  <option value="<?= $row["categoryID"]?>"><?= $row["categoryName"]?></option>
    <?php endforeach?>
            </select></li>
            <?php if($catErrror):?>
<li><p>ERROR:  catagory error pick catagory/dont mess with the HTML</p></li>
<?php endif?>
<link href="https://cdn.jsdelivr.net/npm/quill@2.0.3/dist/quill.snow.css" rel="stylesheet" />

<!-- Create the editor container -->
<div id="editor">
  
</div>

<!-- Include the Quill library -->
<script src="https://cdn.jsdelivr.net/npm/quill@2.0.3/dist/quill.js"></script>

<!-- Initialize Quill editor -->
<script>
   const toolbarOptions = [[{header:[2,3,4,5,6,false]}],['bold', 'italic'], ['link'], [{list:"ordered"}, {list:"bullet"}], [{indent:"+1"}, {indent:"-1"}], [{align:[]}]];
  const quill = new Quill('#editor', {
    theme: 'snow',
    modules:{
        toolbar: toolbarOptions

    }
  });
 const myForm = document.getElementById('createForm');
myForm.addEventListener('submit', function(event) {
        
        
        // Prevent the default form submission
        event.preventDefault(); 
        
      
       let button = document.getElementById("postMessage");
       let html = quill.getSemanticHTML();
       button.setAttribute('value', html);
       myForm.submit();
      
    });
</script>
</li>
<?php if($messageError):?>
<li><p>ERROR:  no content</p></li>
<?php endif?>
        <li class="buttons123"><button type="reset">Reset</button> <button type="submit" name="postMessage" id="postMessage" value="">Submit</button></li>
    </ul>
</form>
<script>     
</script>
</body>

</html>