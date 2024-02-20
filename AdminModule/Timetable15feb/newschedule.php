<?php

session_start();

if (isset($_SESSION['user_id'])) {

    include('../../includes/config.php');  // <!-- connecting database -->
    // Get the JSON data from the POST request
    $json_data = $_POST['data'];

    // Decode the JSON data into an array
    $data = json_decode($json_data, true);

    // display the data in the new page
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

    <body>
        <div class="TT-container">
            <div class="TT-head">
                <h1>Manage Time Table</h1>
            </div>
            <button class="TT-button" onclick="window.location.href = 'manageTT.php';">MANAGE TIME TABLE</button>
            <div class="TT-type-display" id="TTdisplay4">
                <center>
                    <table class="TT-type-display-table">
                        <tbody>
                            <tr>
                                <th>Department</th>
                                <td><?php echo $data['cls_deptname']; ?></td>
                            </tr>
                            <tr>
                                <th>Semester</th>
                                <td><?php echo  $data['cls_course'] . ' - ' . $data['cls_dept'] . ' - semester - ' . $data['cls_sem']  ?></td>
                            </tr>
                            <tr>
                                <th>Start and End date </th>
                                <td><?php echo date('d-m-Y', strtotime($data['sc_frdate'])) . ' to ' . date('d-m-Y', strtotime($data['sc_todate'])) ?></td>
                            </tr>
                            <tr>
                                <th>Time Table Type</th>
                                <td><?php echo $data['type_title']; ?></td>
                            </tr>
                        </tbody>
                    </table>
                </center>
            </div>
            <form action="schedule.php" method="post">
                <input type="hidden" name="data" value="<?php echo htmlspecialchars(json_encode($data));  ?>">
                <button type="submit" class="TT-button">Go Back</button>
            </form>
            <form id="TTform6" method="post" action="" class="TT-form">
                <h2>schedule</h2>
                <div class="TT-form-content">
                    <div>
                        <label for="day" style="display:inline">Day:</label>
                        <select name="day">
                            <option value=""><?php echo $_POST['day'] ?></option>
                        </select>
                        <input type="hidden" name="data" value="<?php echo htmlspecialchars(json_encode($data));  ?>">
                    </div>
                </div>
            </form>

            <?php if (isset($_POST['select'])) {

                // get data from input form
                $tt_day = $_POST['day'];
                // Get the JSON data from the POST request
                $json_data = $_POST['data'];

                // Decode the JSON data into an array
                $data = json_decode($json_data, true);

                // initializing data
                $cls_id = $data['cls_id'];
                $sc_id = $data['sc_id'];
                $max_period = $data['type_hours'];

                // Query the database for the timetable data
                $sql = "SELECT * FROM erp_timetable WHERE cls_id = '$cls_id' AND sc_id = '$sc_id' AND tt_day = '$tt_day'";
                $result = mysqli_query($conn, $sql);
            } ?>

            <div class="TT-type-display" id="TTdisplay5">
                <!-- <table class="TT-type-display-table"> -->
                <!-- <thead>
                    <tr>
                        <th>Period</th>
                        <th>Subject</th>
                        <th>Manage</th>
                    </tr>
                </thead>
                <tbody> -->
                <?php ?>
                <?php // for ($i = 1; $i <= $data['type_hours']; $i++) { 
                ?>
                <!-- <tr> -->
                <?php
                $period_sql = "SELECT erp_timetable.*,erp_subject.sub_name FROM erp_timetable LEFT JOIN erp_subject ON erp_timetable.tt_subcode=erp_subject.tt_subcode WHERE erp_timetable.cls_id = '$cls_id' AND erp_timetable.sc_id = '$sc_id' AND erp_timetable.tt_day = '$tt_day' ORDER BY erp_timetable.tt_period ";
                $period_result = mysqli_query($conn, $period_sql);
                if (mysqli_num_rows($period_result) > 0) {
                ?>
                    <table class="TT-type-display-table">
                        <thead>
                            <tr>
                                <th>Period</th>
                                <th>Subject</th>
                                <th>Manage</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            // Display the subject
                            $period_row = mysqli_fetch_all($period_result);
                            // for ($i = 1; $i <= $data['type_hours']; $i++) {
                            foreach ($period_row as $period_row_data) {
                            ?>
                                <tr>
                                    <td><?php echo $period_row_data[4]; // index 4 has the period number
                                        ?></td>
                                    <td><?php echo $period_row_data[5] . ' - ' . $period_row_data['9']; //index 5 has subject code and  index 9 has subject name
                                        ?></td>

                                    <!-- // Display the update button -->
                                    <td>
                                        <form method='post' action='updateschedule.php'>
                                            <input type='hidden' name='tt_id' value='<?php echo $period_row_data['tt_id']; ?>'>
                                            <input type='hidden' name='tt_day' value='<?php echo $tt_day; ?>'>
                                            <input type="hidden" name="data" value="<?php echo htmlspecialchars(json_encode($data));  ?>">
                                            <input type='submit' name='update' value='Update'>
                                        </form>
                                    </td>
                                </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                <?php
                    // }
                } else {
                ?>
                    <table class="TT-type-display-table">
                        <thead>
                            <tr>
                                <th>Period</th>
                                <th>Subject</th>
                            </tr>
                        </thead>
                        <form method='post' action='newaddschedule.php'>
                            <tbody>

                                <input type='hidden' name='cls_id' value='<?php echo $cls_id; ?>'>
                                <input type='hidden' name='sc_id' value='<?php echo $sc_id; ?>'>
                                <input type='hidden' name='tt_day' value='<?php echo $tt_day; ?>'>
                                <input type="hidden" name="data" value="<?php echo htmlspecialchars(json_encode($data));  ?>">
                                <?php
                                for ($i = 1; $i <= $data['type_hours']; $i++) {

                                ?>

                                    <tr>
                                        <td><?php echo $i; ?></td>

                                        <td>
                                            <select name='tt_subcode[]' required>
                                                <option value="">Not Assigned</option>
                                                <option value="Library">Library</option>
                                                <option value="Sports">Sports</option>
                                                <option value="Association">Association</option>
                                                <option value="Advisor Ward meet">Advisor Ward meet</option>
                                                <option value="Placement training">Placement training</option>
                                                <?php
                                                $subjects_sql = "SELECT * FROM erp_subject where cls_id=$cls_id";
                                                $subjects_result = mysqli_query($conn, $subjects_sql);
                                                while ($subjects_row = mysqli_fetch_assoc($subjects_result)) {
                                                ?>
                                                    <option value=<?php echo $subjects_row["tt_subcode"] ?>><?php echo $subjects_row['sub_name'] ?></option>
                                                <?php
                                                    // echo "<option value='" . $subjects_row['tt_subcode'] . "'>" . $subjects_row['sub_name'] . "</option>";
                                                }
                                                ?>
                                            </select>
                                        </td>
                                    </tr>

                                <?php }
                                ?>

                            </tbody>
                    </table>
                    <input type='submit' name='submit_add' value='Add' class="TT-button">
                    </form>
                <?php
                } ?>
                <!-- </tr> -->
                <?php // } 
                ?>
                <!-- </tbody>
                </table> -->
            </div>
        </div>
    </body>

    </html>


    <?php
    // Close database connection
    $conn->close();
    ?>
<?php
} else {
    header("Location: ../../index.php");
}
?>