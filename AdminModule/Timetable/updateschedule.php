<?php

session_start();

if (isset($_SESSION['user_id'])) {

    include('../../includes/config.php');

    if (isset($_POST['update'])) {

        $tt_id = $_POST['tt_id'];
        $tt_day = $_POST['tt_day'];
        $tt_period = $_POST['tt_period'];
        $subject = $_POST['subject'];

        // Get the JSON data from the POST request
        $json_data = $_POST['data'];
        // Decode the JSON data into an array
        $data = json_decode($json_data, true);
        // initializing data
        $max_period = $data['type_hours'];

        $cls_id = $data['cls_id'];
    }

?>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Schedule</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/styles_TT.css">
    </head>

    <body id="update_body">
        <div class="TT-container">
            <div class="TT-head">
                <h1>Manage Time Table</h1>
            </div>
            <!-- // Display a dropdown menu to select the subject -->
            <form class='TT-form' method='post' action='updateschedulephp.php'>
                <h2>Update period</h2>
                <div class='TT-form-content'>
                    <input type='hidden' name='tt_id' value='<?php echo $tt_id ?>'>
                    <input type='text' readonly name='tt_day' value='<?php echo $tt_day; ?>'>
                    <input type='text' readonly name='tt_period' value='<?php echo 'Period ' . $tt_period; ?>'>
                    <input type='hidden' name='data' value='<?php echo htmlspecialchars(json_encode($data));  ?>'>
                    <select name='tt_subcode'>
                        <option value="">---select subject---</option>
                 
                        <?php
                        $subjects_sql = "SELECT * FROM erp_subject where cls_id=$cls_id";
                        $subjects_result = mysqli_query($conn, $subjects_sql);
                        while ($subjects_row = mysqli_fetch_assoc($subjects_result)) {
                            echo "<option value='" . $subjects_row['tt_subcode'] . '"';
                            echo (isset($subjects_row['tt_subcode']) && $subjects_row['tt_subcode'] == $subject) ? 'selected' : '';
                            echo ">" . $subjects_row[' tt_subcode']  . $subjects_row['sub_name'] . "</option>";
                        }
                        ?>
                    </select>
                    <input type="submit" value="Update">
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

    <?php
    // Close database connection
    $conn->close();
    ?>

<?php
} else {
    header("Location: ../../index.php");
}
?>