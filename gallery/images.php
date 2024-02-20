<?php

if (isset($_SESSION['user_id'])) {

    include('../includes/config.php');
}
?>
<?php

session_start();

if (isset($_SESSION['user_id'])) {

    include('../includes/config.php');

    ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <title>Gallery</title>
    <link rel="stylesheet" href="../assets/css/style.css">
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .container {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .gallery {
        display: grid;
        grid-template-rows: repeat(auto-fill, minmax(200px, 1fr));
        grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
        grid-gap: 20px;
    }

    .gallery img {
        width: 100%;
        height: auto;
        border-radius: 8px;
        cursor: pointer;
    }

    .gallery img:hover {
        opacity: 0.8;
    }

    .folder-img {
        height: 100px;
    }

    a {
        color: var(--pri);
        text-decoration: none;
    }

    a:hover,
    a:active {
        color: var(--dark);
        text-decoration: underline;
    }

    a p {
        margin: 0px;
        text-align: center;
    }
    </style>
    <style>
    html {
        overflow: scroll;
        overflow-x: hidden;
    }

    ::-webkit-scrollbar {
        width: 0;
        background: transparent;
    }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/ui@5.0/dist/fancybox/fancybox.css">
    <script src='https://cdn.jsdelivr.net/npm/@fancyapps/ui@5.0/dist/fancybox/fancybox.umd.js'></script>
</head>

<body>
    <?php
        $id = $_GET['gid'];
        $gallery = "No Image Found";
        $sql = "SELECT * FROM `erp_img` LEFT JOIN `erp_gallery` ON erp_img.img_id=erp_gallery.g_id  WHERE erp_gallery.g_id=$id";
        $result = mysqli_query($conn, $sql);
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $gallery = $row['g_title'];
            }
        }
        ?>
    <div class="container m-5">
        <div class="d-flex justify-content-between">
            <h2>Images -
                <?php echo $gallery; ?>
            </h2>
            <a href="index.php">
                Back
            </a>
        </div>
        <hr>
        <div class="d-flex  flex-wrap">
            <?php
                $id = $_GET['gid'];
                $sql = "SELECT * FROM `erp_img` LEFT JOIN `erp_gallery` ON erp_img.img_id=erp_gallery.g_id  WHERE erp_img.g_id='$id'";
                $result = mysqli_query($conn, $sql);
                if (mysqli_num_rows($result) > 0) {
                    while ($row = mysqli_fetch_assoc($result)) {
                        $id = $row["img_id"];
                        $img = $row["img_img"];
                        $desc = $row["img_desc"];
                        ?>
            <div class="d-flex flex-column align-items-center flex-wrap">
                <a href="../AdminModule/gallery/<?php echo $img; ?>" data-fancybox="gallery">
                    <img class="folder-img m-2" src="../AdminModule/gallery/<?php echo $img; ?>" />
                    <p>
                        <?php echo $desc; ?>
                    </p>
                </a>
            </div>
            <!-- <a id="img<?php echo $id; ?>" class="img" href="../AdminModule/gallery/<?php echo $img; ?>"><img
                                src="../AdminModule/gallery/<?php echo $img; ?>" alt="" /></a>
                        <a id="inline" class="desc" href="#data<?php echo $id; ?>">
                            <?php echo $desc; ?>
                        </a>
                        <div style="display:none">
                            <div id="data<?php echo $id; ?>">
                                <?php echo $desc; ?>
                            </div>
                        </div> -->
            <?php
                    }
                } else {
                    ?>
            <div class="d-flex flex-column align-items-center flex-wrap">
                <img class='folder-img' src="assets/img/folder.png" alt="folder">
                <p>
                    <?php echo "No Image Found"; ?>
                </p>
            </div>
            <?php
                }
                ?>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
    </script>
</body>
<script>
Fancybox.bind("[data-fancybox]", {
    // Your custom options
});
</script>
<?php
} else {
    header("Location: ../index.php");
}
?>