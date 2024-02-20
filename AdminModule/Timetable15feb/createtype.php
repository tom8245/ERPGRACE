<?php

session_start();

if (isset($_SESSION['user_id'])) {

    include('../../includes/config.php');


?>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create Time table Type</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/styles_TT.css">
        <!-- sweet alert JS -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
            function show() {
                var type = document.getElementById('type').value;
                if (type == 'others') {
                    document.getElementById('typename').style.display = 'flex';
                } else {
                    document.getElementById('typename').style.display = 'none';
                }
            }
        </script>
    </head>

    <body>

        <!-- html form -->

        <div class="TT-container">
            <div class="TT-head">
                <h1>Create Time Table Type</h1>
            </div>
            <div>
                <button class="TT-button" onclick="window.location.href = 'managetypes.php';">MANAGE TYPES</button>
                <button class="TT-button" onclick="window.location.href = '../Admin.php';">Admin Module</button>
            </div>
            <form id="TTform2" method="post" action="#" class="TT-form">
                <h2>Create</h2>
                <div class="TT-form-content">
                    <div><label for="type">Timetable Type Name:</label>
                        <select name="type" id="type" onchange="show()">
                            <option value="">--select Type</option>
                            <option value="General Timetable">General Timetable</option>
                            <option value="MBA Timetable">MBA Timetable</option>
                            <option value="Special Timetable">Special Timetable</option>
                            <option value="others">Others</option>
                        </select>
                    </div>
                    <div id="typename" style="display: none;">
                        <label for="typename">Other Type Name:</label>
                        <input type="text" name="typename">
                    </div>
                    <div><label for="hours">Number of Hours per day:</label>
                        <input type="text" name="hours" value="" required>
                    </div>
                </div>
                <div class="TT-form-button">
                    <button type="submit" name="create" class="TT-button">Create</button>
                    <button type="reset" class="TT-button">Clear</button>
                </div>
            </form>
            <!-- html form end -->

            <!-- creating type php code-->
            <?php


            if (isset($_POST['create'])) {
                //variable declaration
                $type = $_POST['type'];
                $hours = $_POST['hours'];

                if ($type === "others") {
                    $type = $_POST['typename'];
                }

                $sql = "insert into erp_tt_type (type_title,type_hours) values('$type','$hours')";
                $result = $conn->query($sql);
            ?>
                <script>
                    document.getElementById("TTform2").reset();
                </script>
            <?php
                if ($result === TRUE) {
                    echo '<script>Swal.fire("Time Table type successfully Created");</script>';
                } else {
                    echo "Error: " . $sql . "<br>" . $conn->error;
                }
            }
            $conn->close();
            ?>

            <!-- creation code ends -->

        </div>

        <script>
            if (window.history.replaceState) {
                window.history.replaceState(null, null, window.location.href);
            }
        </script>
    </body>

    </html>
<?php
} else {
    header("Location: ../../index.php");
}
?>