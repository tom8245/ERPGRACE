<!DOCTYPE html>
<html>

<head>
    <title>Notices Table</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmY" crossorigin="anonymous"></script>
    <style>
        h2 {
            font-size: 24px;
            /* Change the font size */
            font-weight: bold;
            /* Make the text bold */
            color: #333;
            /* Change the text color */
            text-align: center;
            /* Align the text to the center */
            text-transform: uppercase;
            /* Change the text to uppercase */
            letter-spacing: 2px;
            /* Add space between letters */
            margin-bottom: 20px;
            /* Add margin to the bottom of the text */
        }
    </style>
</head>

<body>

<button onclick="goBack()">Go Back</button>

<script>
    function goBack() {
        window.history.back();
    }
</script>


    <?php
    include('conn.php');
    $sql = "SELECT * FROM erp_news WHERE news_type = 'notice' AND news_status = 0 ORDER BY news_id DESC LIMIT 1;";
    $result = mysqli_query($conn, $sql);
    if ($result && mysqli_num_rows($result) > 0) {

        $row = mysqli_fetch_assoc($result);
        echo "<h2><marquee direction='left' scrollamount='17'>" . $row['news_type'] . ": " . $row['news_desc'] . "";
        echo "</marquee>";
        echo "</h2>";
    }
    ?>
    <div class="container mt-5">
        <?php
        // SQL query
        $sql = "SELECT * FROM erp_news WHERE news_type='notice' AND news_status = 0";
        $result = mysqli_query($conn, $sql);
        ?>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2> Saved Notices Table</h2>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Description</th>
                                <!-- <th>Posted By</th> -->
                                <th>Edit</th>
                                <th>Delete</th>
                                <th>Pending</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php

                            if (isset($_GET['page']) && is_numeric($_GET['page'])) {
                                $currentPage = (int)$_GET['page'];
                            } else {
                                $currentPage = 1;
                            }
                            // Output data of each row
                            while ($row = mysqli_fetch_assoc($result)) {
                                echo "<tr>";
                                echo "<td>" . $row['news_id'] . "</td>";
                                echo "<td>" . $row["news_title"] . "</td>";
                                echo "<td>" . $row['news_desc'] . "</td>";
                                // echo "<td>" . $row['news_postby'] . "</td>";
                                echo "<td><a href='edit_for_notices.php?id=" . $row['news_id'] . "&db=notices_saved" . "' target='_blank'>Edit</a></td>";
                                echo "<td><a href='delete_for_notices.php?id=" . $row['news_id'] . "&db=notices_saved'>Delete</a></td>";
                                $id = $row['news_id'];
                                $notice_type = $row['news_type'];
                                $notice_subject = $row['news_desc'];
                                $posted_by = $row['news_postby'];
                                echo '<td>
<form action="notices_insert.php" method="POST">
<input type="hidden" name="s_id" value="' . $row['news_id'] . '">
<input type="hidden" name="s_notice_type" value="' . $row['news_type'] . '">
<input type="hidden" name="s_notice_subject" value="' . $row['news_desc'] . '">
<input type="hidden" name="s_posted_by" value="' . $row['news_postby'] . '">
<input type="submit" name="s_submit" value="Post">
</form>
</td>';

                                echo "</tr>";
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- <div class="text-center">
  <a href="saved_notices.php" class="btn btn-primary">Saved notices</a>
</div> -->

        </div>


        <!-- <div class="ml-xl-5 mt-4">
<form id="insert-form-notice" class="form-group" method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
<div class="form-group row">
    <label for='news_type' class="col-sm-2">notice_type:</label>
    <div class="col-sm-10">
    <input class="" type="text" id='news_type' name='news_type' required>
    </div>
    </div>
    <div class="form-group row">
    <label for='news_desc' class="col-sm-2">notice_subject:</label>
    <div class="col-sm-10">
    <input type="text" id='news_desc' name='news_desc' required>
                    </div>
                    </div>
                    <div class="form-group row">
    <label for='news_postby' class="col-sm-2">posted_by:</label>
    <div class="col-sm-10">
    <input type="text" id='news_postby' name='news_postby' required>
    </div>
                    </div>
                    <input  class="btn btn-primary ml-4" type="submit" name="save" value="save">
    <input  class="btn btn-primary ml-4" type="submit" name="insert" value="Insert">
    
</form>
                    </div> -->
        <?php
        // if (isset($_POST["insert"])){
        // // Retrieve data from the form
        // $notice_type = $_POST['news_type'];
        // $notice_subject = $_POST['news_desc'];
        // $posted_by = $_POST['posted_by'];

        // // Create the SQL query
        // $sql = "INSERT INTO notices_saved(notice_type, notice_subject, posted_by, date) VALUES ('$notice_type', '$notice_subject', '$posted_by', CURRENT_TIMESTAMP)";

        // // Execute the query
        // if (mysqli_query($conn, $sql)) {
        //   echo '<script>window.location.href = "notices_saved.php"</script>';
        //     echo "New record created successfully";
        // } else {
        //     echo "Error: " . $sql . "<br>" . mysqli_error($conn);
        // }
        // 	// Close connection

        // }
        // if(isset($_POST["save"])){
        //   $notice_type = $_POST['news_type'];
        // $notice_subject = $_POST['news_desc'];
        // $posted_by = $_POST['posted_by'];

        // // Create the SQL query
        // $sql = "INSERT INTO notices_saved (notice_type, notice_subject, posted_by, date) VALUES ('$notice_type', '$notice_subject', '$posted_by', CURRENT_TIMESTAMP)";
        // // Execute the query
        // if (mysqli_query($conn, $sql)) {

        // }

        // Close connection

        // }

        ?>
    </div>

</body>

</html>