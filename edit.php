
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit News Post</title>
    <link rel="stylesheet" href="main.css">
</head>
<?php

use Dom\Text;

session_start();
if (!isset($_SESSION['logged']) || $_SESSION['logged'] == 0) {
    header('Location: index.php');
}
require ('header.php');
require ('loginScript.php');
if ($_GET) {
    $id = $_GET['postID'];
}
$query3 = "SELECT * FROM posts where postID = $id limit 1";
$statement4 = $db->prepare($query3);
$statement4->execute();
$post = $statement4->fetch();

$id = $post['categoryID'];

$query5 = "SELECT * FROM categories where categoryID = $id";
$statement3 = $db->prepare($query5);
$statement3->execute();
$categori = $statement3->fetch();
$query1 = 'SELECT * FROM categories';
$statement3 = $db->prepare($query1);
$statement3->execute();
$categories = $statement3->fetchAll();
// errors
$messageError = false;
$postNameError = false;
$postImageError = false;
$catErrror = false;
$removeWork = false;

if ($_POST) {
    $postName = $_POST['postName'];

    $categorie = $_POST['categorie'];
    $postMessage = $_POST['postMessage'];

    $error = false;
    if (empty($postName)) {
        $postNameError = true;
        if (!$error) {
            $error = true;
        }
    }
    if (empty($categorie) || (int) $categorie == 0) {
        $catErrror = true;
        if (!$error) {
            $error = true;
        }
    }

    if ($postMessage === '<p></p>' || $postMessage == '') {
        $messageError = true;
        if (!$error) {
            $error = true;
        }
    }

    // file_upload_path() - Safely build a path String that uses slashes appropriate for our OS.

    // Default upload path is an 'uploads' sub-folder in the current folder.
    function file_upload_path($original_filename, $upload_subfolder_name = 'PostImages')
    {
        $current_folder = dirname(__FILE__);

        // Build an array of paths segment names to be joins using OS specific slashes.
        $path_segments = [$current_folder, $upload_subfolder_name, basename($original_filename)];

        // The DIRECTORY_SEPARATOR constant is OS specific.
        return join(DIRECTORY_SEPARATOR, $path_segments);
    }

    // file_is_an_image() - Checks the mime-type & extension of the uploaded file for "image-ness".
    function file_is_an_image($temporary_path, $new_path)
    {
        $allowed_file_extensions = ['gif', 'jpg', 'jpeg', 'png'];

        $actual_file_extension = pathinfo($new_path, PATHINFO_EXTENSION);

        $file_extension_is_valid = in_array($actual_file_extension, $allowed_file_extensions);

        return $file_extension_is_valid;
    }

    $image_upload_detected = isset($_FILES['image']) && ($_FILES['image']['error'] === 0);
    $upload_error_detected = isset($_FILES['image']) && ($_FILES['image']['error'] > 0);

    if ($image_upload_detected) {
        $image_filename = $_FILES['image']['name'];
        $temporary_image_path = $_FILES['image']['tmp_name'];

        $new_image_path = file_upload_path($image_filename);
        if (file_is_an_image($temporary_image_path, $new_image_path) && !$error) {
            move_uploaded_file($temporary_image_path, $new_image_path);
        }
        if (!file_is_an_image($temporary_image_path, $new_image_path)) {
            $postImageError = true;
            $error = true;
        }
    }

    if (!$error) {
        $id = $post['postID'];
        $date = date('Y-m-d H:i:s');
        $query = "UPDATE posts SET postName = :title, postMessage = :message, postImage = :image, categoryID = :category, dateEdit = :dateEdit WHERE postID = $id";
        $statement = $db->prepare($query);
        //  Bind values to the parameters

        $statement->bindValue(':title', $postName);
        $statement->bindValue(':message', $postMessage);
        if ($image_upload_detected) {
            $statement->bindValue(':image', $image_filename);
        } else {
            $statement->bindValue(':image', $post['postImage']);
        }
        $statement->bindValue(':dateEdit', $date);
        $statement->bindValue(':category', $categorie);

        $statement->execute();  // executing the statmate
    }
    if (isset($_POST['remove']) && $_POST['remove'] == 'on') {
        $currentImage = $post['postImage'];
        $query = "UPDATE posts SET postImage = :image WHERE postID = $id";
        $statement = $db->prepare($query);
        //  Bind values to the parameters

        $statement->bindValue(':image', null);

        $statement->execute();  // executing the statmate
        if (!empty($currentImage)) {
            $checkQuery = 'SELECT COUNT(*) as imageCount FROM posts WHERE postImage = :imageName AND postImage IS NOT NULL';
            $checkStatement = $db->prepare($checkQuery);
            $checkStatement->bindValue(':imageName', $currentImage);
            $checkStatement->execute();
            $result = $checkStatement->fetch();

            // If no other posts are using this image, delete it from the filesystem
            if ($result['imageCount'] == 0) {
                $imagePath = file_upload_path($currentImage);
                if (file_exists($imagePath)) {
                    unlink($imagePath);  // Delete the file
                }
            }
        }
        $removeWork = true;
        $error = true;
    }
    if (!$error) {
        header(header: "Location: post.php?postID={$id}");  // once the above code is done it reloads the page with the get id of id
    }
}

?>
    <body>
    <h1>Edit Post</h1>
    
   
    <form action="" method="post" id="createForm" enctype='multipart/form-data'>
        <ul>
            <li class="inputs"><label for='image'>Post name:</label><input type="text" name="postName" id="postName" value="<?= $post['postName'] ?>"></li>
            <?php if ($postNameError): ?>
    <li class="errorli"><p class="errorP">ERROR: Post name is empty or invalid</p></li>
    <?php endif ?>
            <li> <label for='image'>Main Image:</label>
            <input type='file' name='image' id='image' value="<?= $post['postImage'] ?>"></li>
            
            <li> 
    <?php if ($postImageError): ?>
    <li class="errorli"><p class="errorP">ERROR:invalid format we only take png jpeg jpg and gif images.</p></li>
    <?php endif ?>
        <li> <label>Remove image</label> <input type="checkbox" name="remove" id="remove"></li>
         <?php if ($removeWork): ?>
    <li class="errorli"><p class="errorP">the image Has been removed</p></li>
    <?php endif ?>
                <li> <label for='image'>Post category:</label><select name="categorie" id="categorie">
                <option value="<?= $categori['categoryID'] ?>"><?= $categori['categoryName'] ?></option>
        <?php foreach ($categories as $row): ?>
    <option value="<?= $row['categoryID'] ?>"><?= $row['categoryName'] ?></option>
        <?php endforeach ?>
                </select></li>
                <?php if ($catErrror): ?>
    <li class="errorli"><p class="errorP">ERROR:  catagory error pick catagory/dont mess with the HTML</p></li>
    <?php endif ?>
    <link href="https://cdn.jsdelivr.net/npm/quill@2.0.3/dist/quill.snow.css" rel="stylesheet" />

    <!-- Create the editor container -->
    <div id="editor">
    <?= $post['postMessage'] ?>
    </div>

    <!-- Include the Quill library -->
    <script src="https://cdn.jsdelivr.net/npm/quill@2.0.3/dist/quill.js"></script>

    <!-- Initialize Quill editor -->
    <script>
    const toolbarOptions = [[{header:[2,3,4,5,6,false]}],['bold', 'italic'], [{list:"ordered"}, {list:"bullet"}], [{indent:"+1"}, {indent:"-1"}], [{align:[]}]];
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
            let html = quill.getSemanticHTML();
        
        button = document.getElementById("postMessage").setAttribute('value', html);
        
        
        myForm.submit();
        
        });
    </script>
    </li>
    <?php if ($messageError): ?>
    <li><p class="errorP">ERROR:  no content</p></li>
    <?php endif ?>
    <input  name="postMessage" type="hidden" id="postMessage" value="" >
            <li class="buttons123"><button type="reset">Reset</button> <button type="submit" >Submit</button></li>
        </ul>
    </form>
    
   
  
    </body>

    </html>