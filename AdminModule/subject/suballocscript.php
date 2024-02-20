<?php

session_start();

if (isset($_SESSION['user_id'])) {

    include('../../includes/config.php');
    //conecting database
?>


    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Subject</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/styles_TT.css">
        <!-- sweet alert JS -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <?php if (isset($_POST['add'])) {
        //initialize
        $success = "";
        // getting data
        $f_id = $_POST['f_id'];
        $sub_id = $_POST['sub_id'];
        $cour = $_POST['course'];
        $dept = $_POST['department'];
        $sem = $_POST['semester'];


        $add_sql =  "Update erp_subject set f_id = '" . $f_id . "' where sub_id = '" . $sub_id . "'";
        $add_result = $conn->query($add_sql);

        if ($add_result) {
            $success = "true";
        } else {
            $success = "false";
        }

        if ($success) {
            echo "<script>
            Swal.fire('Faculty Allocated successfully.');
            </script>";
    ?>

            <body>
                <div class="TT-container" style="display: hidden;">
                    <form action="subject.php" method="post" id="myform" style="display: hidden;">
                        <div class="TT-form-content">
                            <input type="hidden" name="course" value='<?php echo $cour; ?>'>
                            <input type="hidden" name="department" value='<?php echo $dept; ?>'>
                            <input type="hidden" name="semester" value='<?php echo $sem; ?>'>
                            <input type="hidden" value="OK" id="search" name="search">
                        </div>
                    </form>
                    <script>
                        document.getElementById("myform").submit();
                    </script>
                </div>
            </body>
            <script>
                // clear form history
                if (window.history.replaceState) {
                    window.history.replaceState(null, null, window.location.href);
                }
            </script>



    <?php
        } else {
            echo "<script>Swal.fire('Error adding timetable entry: " . mysqli_error($conn) . "')</script>";
        }
    }
    // Close database connection
    $conn->close();
    ?>

    </html>
<?php
} else {
    header("Location: ../../index.php");
}
?>