<?php

session_start();

if (isset($_SESSION['user_id'])) {

    include('../../includes/config.php');

    // Get the JSON data from the POST request
    $json_data = $_POST['data'];

    // Decode the JSON data into an array
    $data = json_decode($json_data, true);

    // get other values
    $sc_id = $data['sc_id'];
    $cls_id = $data['cls_id'];
    $hours = $data['type_hours'];

    //fetch timetable
    $sql = "SELECT * FROM erp_timetable WHERE sc_id= $sc_id";
    $result = mysqli_query($conn, $sql);
?>
    <!DOCTYPE html>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Timetable</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/styles_TT.css">

        <style>
            .current-day {
                background-color: blueviolet;
                color: white;
            }
        </style>
    </head>

    <body>
        <div class="TT-container">
            <div class="TT-head">
                <h1>View Time Table</h1>
            </div>
            <div class="TT-type-display">
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


            <div>
                <button class="TT-button" onclick="window.location.href = '../Admin.php';">Admin Module</button>
            </div>
            <!-- form for selecting class -->
            <section class="TT-form">
                <h2>Time table</h2>
                <!-- This form is just for style -->

                <div class="TT-type-display">
                    <?php
                    // Get the current day
                    $currentDay = date('l');
                    // Prepare and execute the SQL query to retrieve the timetable data
                    $view_sql = "SELECT tt_day, GROUP_CONCAT(tt_subcode ORDER BY tt_period) AS subjects FROM erp_timetable WHERE cls_id = '$cls_id' AND sc_id = '$sc_id' GROUP BY tt_day ORDER BY FIELD(tt_day, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')";
                    // "SELECT tt_day, GROUP_CONCAT(tt_subcode ORDER BY tt_period) AS subjects FROM erp_timetable WHERE cls_id = 'your_cls_id' AND sc_id = 'your_sc_id' GROUP BY tt_day ORDER BY FIELD(tt_day, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')";
                    $result = mysqli_query($conn, $view_sql);
                    // Prepare an array to store the results
                    $tableData = array();

                    while ($row = $result->fetch_assoc()) {
                        $tableData[$row['tt_day']] = explode(",", $row['subjects']);
                    }

                    // Determine the maximum number of subjects in a single day
                    $maxSubjects = empty($tableData) ? 0 : max(array_map('count', $tableData));




                    ?>
                    <table class="TT-type-display-table">
                        <thead>
                            <th>Day</th>
                            <?php
                            for ($i = 1; $i <= $hours; $i++) {
                                echo "<th>Period $i </th>";
                            }
                            ?>
                        </thead>
                        <tbody>
                            <?php

                            // Output the subject data
                            foreach ($tableData as $day => $subjects) {

                                // Check if the current day matches the row's day
                                $isCurrentDay = ($day === $currentDay);

                                // Apply different styles to the row based on whether it's the current day or not
                                $rowClass = $isCurrentDay ? 'current-day' : '';
                                echo "<tr class='$rowClass'><td>" . $day . "</td>";

                                // Fill empty columns with empty cells
                                for ($i = count($subjects) + 1; $i <= $maxSubjects; $i++) {
                                    echo "<td></td>";
                                }

                                // Output each subject in a separate column
                                foreach ($subjects as $subject) {
                                    echo "<td>" . $subject . "</td>";
                                }
                                echo "</tr>";
                            }

                            ?>
                        </tbody>
                    </table>
                </div>
                <div class="TT-type-display">
                    <?php
                    $subject_sql = "SELECT erp_subject.*,erp_faculty.f_fname,erp_faculty.f_lname FROM erp_subject LEFT JOIN erp_faculty ON erp_subject.f_id=erp_faculty.f_id WHERE erp_subject.cls_id=$cls_id";
                    $subject_result = mysqli_query($conn, $subject_sql);
                    // $subject_data = mysqli_fetch_all($subject_result);
                    ?>
                    <table class="TT-type-display-table">
                        <thead>
                            <tr>
                                <th>Sub code</th>
                                <th>Subject Name</th>
                                <th>Faculty</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            // foreach ($subject_data as $row) {
                            while ($row = mysqli_fetch_assoc($subject_result)) {
                            ?>
                                <tr>
                                    <td><?php echo $row['tt_subcode'] ?></td>
                                    <td><?php echo $row['sub_name'] ?></td>
                                    <td><?php echo $row['f_fname'] . "  " . $row['f_lname'] ?></td>
                                </tr>
                            <?php

                            }
                            ?>
                        </tbody>
                    </table>
                </div>
            </section>
        </div>
    </body>

    </html>



    <?php
    // Close the database connection
    $conn->close();
    ?>
<?php
} else {
    header("Location: ../../index.php");
}
?>