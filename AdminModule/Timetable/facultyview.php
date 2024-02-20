<?php

session_start();

if (isset($_SESSION['user_id'])) {

    include('../../includes/config.php');

    // Get the JSON data from the POST request
    $fid = $_SESSION['user_id'];

    //fetch timetable
    $fsql = "SELECT f_fname,f_lname FROM erp_faculty WHERE f_id= '" . $fid . "'";
    $fresult = mysqli_query($conn, $fsql);
    while ($row = mysqli_fetch_assoc($fresult)) {
        $fname = $row['f_fname'] . " " . $row['f_lname'];
    }

    $subsql = "SELECT distinct tt_subcode,sub_name FROM erp_subject where f_id= '" . $fid . "'";
    $subresult = mysqli_query($conn, $subsql);
    $subject = array();
    $i = 0;
    while ($row = mysqli_fetch_assoc($subresult)) {
        $subject[$i] = $row['tt_subcode'];
        $i++;
    }
?>
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
                    // $view_sql = "SELECT tt_day, GROUP_CONCAT(tt_subcode ORDER BY tt_period) AS subjects FROM erp_timetable where erp_timetable.tt_subcode in ({implode(',',$subject}) GROUP BY tt_day ORDER BY FIELD(tt_day, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')";
                    // "SELECT tt_day, GROUP_CONCAT(tt_subcode ORDER BY tt_period) AS subjects FROM erp_timetable WHERE cls_id = 'your_cls_id' AND sc_id = 'your_sc_id' GROUP BY tt_day ORDER BY FIELD(tt_day, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')";
                    $view_sql = "SELECT
                tt_day,tt_period,tt_subcode
             FROM
                erp_timetable
             WHERE
                erp_timetable.tt_subcode IN ('" . implode("','", $subject) . "')
             ORDER BY
                FIELD(tt_day, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')";


                    $result = mysqli_query($conn, $view_sql);
                    // Prepare an array to store the results
                    $tableData = array();
                    $hours = 0;

                    while ($row = $result->fetch_assoc()) {
                        $tt_day = $row['tt_day'];
                        $tt_period = $row['tt_period'];
                        $tt_subcode = $row['tt_subcode'];
                        if (!isset($tableData[$tt_day])) {
                            $tableData[$tt_day] = array();
                        }
                        if (!isset($tableData[$tt_day][$tt_period])) {
                            $tableData[$tt_day][$tt_period] = $tt_subcode;
                        }

                        if ($hours < $tt_period) {
                            $hours = $tt_period;
                        }
                    }








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
                            foreach ($tableData as $day => $data) {

                                // Check if the current day matches the row's day
                                $isCurrentDay = ($day === $currentDay);

                                // Apply different styles to the row based on whether it's the current day or not
                                $rowClass = $isCurrentDay ? 'current-day' : '';
                                echo "<tr class='$rowClass'><td>" . $day . "</td>";

                                for ($i = 1; $i <= $hours; $i++) {
                                    if (isset($data[$i])) {
                                        echo "<td>$data[$i]</td>";
                                    } else {
                                        echo "<td></td>";
                                    }
                                }
                                echo "</tr>";
                            }

                            ?>
                        </tbody>
                    </table>
                </div>
                <div class="TT-type-display">
                    <?php
                    $subject_sql = "SELECT erp_subject.*,erp_faculty.f_fname,erp_faculty.f_lname FROM erp_subject LEFT JOIN erp_faculty ON erp_subject.f_id=erp_faculty.f_id WHERE erp_subject.f_id='" . $fid . "'";
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