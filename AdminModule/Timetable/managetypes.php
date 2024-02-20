<?php

session_start();

if (isset($_SESSION['user_id'])) {

    include('../../includes/config.php');

    // <!-- php code to fetch from database -->
    $result = "";
    $msg = "";
    if (isset($_POST['search'])) {
        if ((!empty($_POST['type'])) && (!empty($_POST['hours']))) { //check if both fields are set
            $typeid = $_POST['type'];
            $hours = $_POST['hours'];
            $sql = "SELECT * FROM erp_tt_type WHERE type_title like '%$typeid%' and type_hours='$hours' ";
            $result = $conn->query($sql);
        } elseif (!empty($_POST['type'])) { //check if type field only is set
            $typeid = $_POST['type'];
            $sql = "SELECT * FROM erp_tt_type WHERE type_title like '%$typeid%' ";
            $result = $conn->query($sql);
        } elseif (!empty($_POST['hours'])) {    // check if no of hours field only is set
            $hours = $_POST['hours'];
            $sql = "SELECT * FROM erp_tt_type WHERE type_hours='$hours' ";
            $result = $conn->query($sql);
        } else {            // executed when no field is set
            $sql = "SELECT * FROM erp_tt_type";
            $result = $conn->query($sql);
        }
    }


    // <!-- data fetched from database  -->



?>



    <!-- html form Code -->

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Types</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/styles_TT.css">
    </head>

    <body>

        <!-- manage types search form -->
        <div class="TT-container">
            <div class="TT-head">
                <h1>Manage Time Table Types</h1>
            </div>
            <div>
                <button class="TT-button" onclick="window.location.href = 'createtype.php';">Create New Time Table Type</button>
                <button class="TT-button" onclick="window.location.href = '../Admin.php';">Admin Module</button>
            </div>
            <form id="TTform1" method="post" action="#" class="TT-form">
                <h2>Search</h2>
                <div class="TT-form-content">
                    <div><label for="type">Time Table type Name:</label>
                        <!-- php code  for fetching timetable type for html form -->
                        <?php
                        $sql3 = "select*from erp_tt_type";
                        $result3 = $conn->query($sql3);
                        if ($result3 == true) {
                            if ($result3->num_rows > 0) {
                                $row3 = mysqli_fetch_all($result3, MYSQLI_ASSOC);
                                $msg3 = $row3;
                            } else {
                                $msg3 = "No Data Found";
                            }
                        ?>
                            <select name="type" id="type">
                                <option value="">--Time table type--</option>
                                <?php
                                if (is_array($msg3)) {
                                    foreach ($msg3 as $data) {
                                ?>
                                        <option value="<?php echo $data['type_title']; ?>"><?php echo $data['type_title'] ?? ''; ?>
                                        </option>
                            <?php
                                    }
                                } else {
                                }
                            }
                            ?>
                            </select>



                            <!-- timetable type fetched -->
                    </div>
                    <div><label for="hours">Total Number of Hours:</label>
                        <input type="text" name="hours">
                    </div>
                </div>
                <div class="TT-form-button">
                    <button type="submit" name="search" class="TT-button">Search</button>
                    <button type="reset" class="TT-button">Clear</button>
                </div>
            </form>

            <!-- html form ends -->



            <!-- display in Table -->



            <div class="TT-type-display" id="TTdisplay1">

                <?php

                if ($result == true) {
                    if ($result->num_rows > 0) {
                ?>
                        <table class="TT-type-display-table">
                            <thead>
                                <tr>
                                    <th>Type Name</th>
                                    <th>Number of Hours</th>
                                    <th colspan="2">Manage</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $row = mysqli_fetch_all($result, MYSQLI_ASSOC);
                                $msg = $row;
                            } else {
                                $msg = "No Data Found";
                            }

                            if (is_array($msg)) {
                                foreach ($msg as $data) {
                                ?>
                                    <tr>
                                        <td><?php echo $data['type_title'] ?? ''; ?></td>
                                        <td><?php echo $data['type_hours'] ?? ''; ?></td>
                                        <td><button class="TT-button" onclick="window.location.href= 'edittype.php?id=<?php echo $data['type_id']; ?>'">Edit</button></td>
                                    </tr>
                                <?php
                                }
                            } else {   ?>
                                <tr>
                                    <td rowspan="3"><?php echo $msg; ?></td>
                                </tr>
                        <?php
                            }
                        }
                        ?>
                            </tbody>
                        </table>
            </div>

            <!-- end of display -->


        </div>

        <script>
            if (window.history.replaceState) {
                window.history.replaceState(null, null, window.location.href);
            }
        </script>

    </body>

    <?php
    // Close database connection
    $conn->close();
    ?>

    </html>
<?php
} else {
    header("Location: ../../index.php");
}
?>