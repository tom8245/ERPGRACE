<?php session_start();
include("conn.php");
include("includes/Header.php");

if (!isset($_SESSION['user_id'])) {
    exit();
} ?>

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
    $sql = "SELECT * FROM erp_news WHERE news_status = 1 AND news_type = 'notice' ORDER BY news_id DESC LIMIT 1;";
    $result = mysqli_query($conn, $sql);
    if (mysqli_num_rows($result) > 0) {

        $row = mysqli_fetch_assoc($result);
        echo "<h2><marquee direction='left' scrollamount='17'>" . $row['news_type'] . ": " . $row['news_desc'] . "";
        echo "</marquee>";
        echo "</h2>";
    }
    ?>
    <div class="container mt-5">
        <?php
        // SQL query
        $sql = "SELECT * FROM erp_news WHERE news_status = 1 AND news_type='notice'";
        $result = mysqli_query($conn, $sql);
        ?>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2>Notices Table</h2>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Title</th>
                                <th>Description</th>
                                <!-- <th>Date</th> -->
                                <!-- <th>Posted By</th> -->
                                <th>Edit</th>
                                <th>Delete</th>
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
                                echo "<tr id=\"" . $row['news_id'] . "\">";
                                echo "<td>" . $row["news_title"] . "</td>";
                                echo "<td>" . $row["news_desc"] . "</td>";
                                // echo "<td>" . $row["date"] . "</td>";
                                // echo "<td>" . $row["news_postby"] . "</td>";
                                echo "<td><a href='edit_for_notices.php?id=" . $row["news_id"] . "&db=erp_news" . "' >Edit</a></td>";
                                echo "<td><button class='btn btn-danger btn-sm remove'>Delete</button></td>";
                                echo "</tr>";
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="text-center">
                <a href="saved_notices.php" class="btn btn-primary">Saved notices</a>
            </div>

        </div>


        <div class="ml-xl-5 mt-4">
            <br>
            <br>
</body>
<script type="text/javascript">
    $(".remove").click(function() {
        var id = $(this).parents("tr").attr("id");


        if (confirm('Are you sure to remove this record ?')) {
            $.ajax({
                url: '/delete_for_notices.php',
                type: 'GET',
                data: {
                    id: id
                },
                error: function() {
                    alert('Deleted!');
                },
                success: function(data) {
                    $("#" + id).remove();
                    alert("The record has shruken into oblivion");
                }
            });
            window.location.href = "delete_for_notices.php?id=" + id + "&db=notices";
        }
    });
</script>

</html>