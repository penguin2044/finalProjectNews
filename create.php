
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

    $categorie = $_POST["categorie"];
    $postMessage = $_POST["postMessage"];

    $error = false;
    if (empty($postName) ) {
        $postNameError = true;
        if (!$error) {
        $error = true;
        }
    }
    if (empty($categorie)|| (int)$categorie == 0) {
         $catErrror = true;
         if (!$error) {
        $error = true;
        }
    }
    

    
    if ($postMessage === "<p></p>" || $postMessage == "") {
        $messageError = true;
        if (!$error) {
        $error = true;
        }
    }
     // file_upload_path() - Safely build a path String that uses slashes appropriate for our OS.
    // Default upload path is an 'uploads' sub-folder in the current folder.
    function file_upload_path($original_filename, $upload_subfolder_name = 'PostImages') {
       $current_folder = dirname(__FILE__);
       
       // Build an array of paths segment names to be joins using OS specific slashes.
       $path_segments = [$current_folder, $upload_subfolder_name, basename($original_filename)];
       
       // The DIRECTORY_SEPARATOR constant is OS specific.
       return join(DIRECTORY_SEPARATOR, $path_segments);
    }

    // file_is_an_image() - Checks the mime-type & extension of the uploaded file for "image-ness".
    function file_is_an_image($temporary_path, $new_path) {
      
        $allowed_file_extensions = ['gif', 'jpg', 'jpeg', 'png'];
        
        $actual_file_extension   = pathinfo($new_path, PATHINFO_EXTENSION);
        
        
        $file_extension_is_valid = in_array($actual_file_extension, $allowed_file_extensions);
      
        
        return $file_extension_is_valid;
    }
    
    $image_upload_detected = isset($_FILES['image']) && ($_FILES['image']['error'] === 0);
    $upload_error_detected = isset($_FILES['image']) && ($_FILES['image']['error'] > 0);
if (!$image_upload_detected ) {
    $postImageError = true;
    $error = true;
}
    if ($image_upload_detected) { 
        $image_filename        = $_FILES['image']['name'];
        $temporary_image_path  = $_FILES['image']['tmp_name'];
       


        $new_image_path        = file_upload_path($image_filename);
        if (file_is_an_image($temporary_image_path, $new_image_path) && !$error) {
            move_uploaded_file($temporary_image_path, $new_image_path);
        }
        if (!file_is_an_image($temporary_image_path, $new_image_path)) {
    $postImageError = true;
    $error = true;
}
    }


    if(!$error){
        $query = "INSERT INTO posts(postName, postMessage, postImage, userName,categoryID) VALUES (:title, :message, :image,:user ,:category)";
$statement = $db->prepare($query);
        //  Bind values to the parameters

        
$statement->bindValue(':title', $postName);
$statement->bindValue(':message', $postMessage);
$statement->bindValue(':image', $image_filename);
$statement->bindValue(':user', $_SESSION["username"]);
$statement->bindValue(':category', $categorie);


$statement->execute();//executing the statmate
    }
    }


    ?>
    <body>
    <h1>Create Post</h1>

    <form action="" method="post" id="createForm" enctype='multipart/form-data'>
        <ul>
            <li class="inputs"><label for='postName'>Post name:</label><input type="text" name="postName" id="postName"></li>
            <?php if($postNameError):?>
    <li class="errorli"><p class="errorP">ERROR: Post name is empty or invalid</p></li>
    <?php endif?>
            <li> <label for='image'>Main Image:</label>
            <input type='file' name='image' id='image'></li>
            
            <li> 
    <?php if($postImageError):?>
    <li class="errorli"><p class="errorP">ERROR: no Image found or invalid format we only take png jpeg jpg and gif images.</p></li>
    <?php endif?>
                <li> <label for='categorie'>Post category:</label><select name="categorie" id="categorie">
                
        <?php foreach ($categories as $row): ?>
    <option value="<?= $row["categoryID"]?>"><?= $row["categoryName"]?></option>
        <?php endforeach?>
                </select></li>
                <?php if($catErrror):?>
    <li class="errorli"><p class="errorP">ERROR:  catagory error pick catagory/dont mess with the HTML</p></li>
    <?php endif?>
    <link href="https://cdn.jsdelivr.net/npm/quill@2.0.3/dist/quill.snow.css" rel="stylesheet" />

    <!-- Create the editor container -->
    <div id="editor">
    
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
    <?php if($messageError):?>
    <li><p class="errorP">ERROR:  no content</p></li>
    <?php endif?>
    <input  name="postMessage" type="hidden" id="postMessage" value="" >
            <li class="buttons123"><button type="reset">Reset</button> <button type="submit" >Submit</button></li>
        </ul>
    </form>
    <script>     
    </script>
    </body>

    </html>