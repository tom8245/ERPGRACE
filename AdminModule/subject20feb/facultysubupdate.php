<?php

session_start();

if (isset($_SESSION['user_id'])) {

    include('../../includes/config.php');

    if (isset($_POST['update'])) {
        // If the submit update button was clicked, insert the new timetable entry into the database
        $sub_id = $_POST['sub_id'];
        $subcode = $_POST['subcode'];
        $subname = $_POST['subname'];
        $faculty = $_POST['faculty'];
        $cour = $_POST['course'];
        $dept = $_POST['department'];
        $sem = $_POST['semester'];
    }
?>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Subject</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/styles_TT.css">
    </head>

    <body>
        <div class="TT-container">
            <div class="TT-head">
                <h1>Update Faculty</h1>
            </div>
            <form action="subject.php" method="post" id="myform">
                <h2></h2>
                <div class="TT-form-content">
                    <input type="hidden" name="course" value='<?php echo $cour; ?>'>
                    <input type="hidden" name="department" value='<?php echo $dept; ?>'>
                    <input type="hidden" name="semester" value='<?php echo $sem; ?>'>
                    <input type="submit" value="Go Back" name="search" class="TT-button">
                </div>
            </form>
            <form class="TT-form" action="suballocscript.php" method="post">
                <h2></h2>
                <div class="TT-form-content">
                    <?php
                    $faculty_query = "SELECT f_id,f_fname,f_lname,f_designation FROM erp_faculty  ORDER BY f_fname ASC";
                    $faculty_result = mysqli_query($conn, $faculty_query);
                    ?>
                    <input type="text" value="<?php echo $subcode . '-' . $subname ?>" disabled>
                    <input type="text" value="<?php echo $faculty ?>" disabled>
                    <input type="hidden" name="course" value='<?php echo $cour; ?>'>
                    <input type="hidden" name="department" value='<?php echo $dept; ?>'>
                    <input type="hidden" name="semester" value='<?php echo $sem; ?>'>
                    <input type='hidden' name='sub_id' id="recordId" value='<?php echo $sub_id; ?>'>
                    <select name='f_id' required>
                        <option value="">Select faculty</option>
                        <?php
                        while ($faculty_row = mysqli_fetch_assoc($faculty_result)) {
                        ?>
                            <option value=<?php echo $faculty_row["f_id"] ?>><?php echo $faculty_row['f_fname'] . '  ' . $faculty_row['f_lname'] . ',' . $faculty_row['f_designation'] ?></option>
                        <?php
                        }
                        ?>
                    </select>
                    <input type="submit" value="Update" name="add">
                </div>
            </form>
        </div>
    </body>
    <script>
        // clear form history
        if (window.history.replaceState) {
            window.history.replaceState(null, null, window.location.href);
        }
    </script>

    </html>
    <?php
    // Close the database connection
    mysqli_close($conn);
    ?>
<?php
} else {
    header("Location: ../../index.php");
}
?>