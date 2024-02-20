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
        <title>Create Class</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/styles_TT.css">
        <!-- sweet alert JS -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>

    <body>
        <div class="ad-container">
            <div class="Ad-head">
                <h1>Create Class</h1>
            </div>
            <div>
                <button class="TT-button" onclick="window.location.href = 'manageClass.php';">Manage Class</button>
                <button class="TT-button" onclick="window.location.href = '../Admin.php';">Admin Module</button>
            </div>
            <form action="#" method="post" class="TT-form" id="TTform">
                <h2>Create</h2>
                <div class="TT-form-content">
                    <div>
                        <label for="course">Course:</label>
                        <select name="course" id="" required>
                            <option value="">---Select a Course---</option>
                            <option value="B.E">B.E</option>
                            <option value="B.Tech">B.Tech</option>
                            <option value="M.E">M.E</option>
                            <option value="M.B.A">M.B.A</option>
                        </select>
                    </div>
                    <div>
                        <label for="dept-name-abbr">Department: </label>
                        <select name="dept-name-abbr" id="" required>
                            <option value="">---Select a Department---</option>
                            <option value="CSE">CSE</option>
                            <option value="ECE">ECE</option>
                            <option value="EEE">EEE</option>
                            <option value="MECH">MECH</option>
                            <option value="CIVIL">CIVIL</option>
                            <option value="AI DS">AI DS</option>
                            <option value="MBA">MBA</option>
                            <option value="AE">AE</option>
                            <option value="PSE">PSE</option>
                        </select>
                    </div>
                    <div>
                        <label for="dept-name">Department Name:</label>
                        <select name="dept-name" id="" required>
                            <option value="">---Select a Department---</option>
                            <option value="Computer Science And Engineering">Computer Science And Engineering
                            </option>
                            <option value="Electronics And Communication Engineering">Electronics And Communication Engineering</option>
                            <option value="Electrical And Electronics Engineering">Electrical And Electronics Engineering</option>
                            <option value="Mechanical Engineering">Mechanical Engineering</option>
                            <option value="Civil Engineering">Civil Engineering</option>
                            <option value="Artificial Intelligence and Data Science">Artificial Intelligence And Data Science</option>
                            <option value="Master of Business Administration">Master of Business Administration
                            </option>
                            <option value="Applied Electronics">Applied Electronics</option>
                            <option value="Power Systems Engineering">Power Systems Engineering</option>
                        </select>
                    </div>
                    <div>
                        <label for="dept-code">Department Code:</label>
                        <input type="text" name="dept-code" value="" required>
                    </div>
                    <div>
                        <label for="bat-start-year">Batch start Year:</label>
                        <input type="text" name="bat-start-year" value="" required>
                    </div>
                    <div>
                        <label for="bat-end-year">Batch End Year:</label>
                        <input type="text" name="bat-end-year" value="" required>
                    </div>
                    <div>
                        <label for="startdate">First Semester Start Date:</label>
                        <input type="date" name="startdate" value="" required>
                    </div>
                </div>
                <div class="TT-form-button">
                    <button type="submit" name="create" class="TT-button">Create</button>
                    <button type="reset" class="TT-button">Clear</button>
                </div>
            </form>
        </div>

        <!-- creating type php code-->
        <?php



        if (isset($_POST['create'])) {
            //variable declaration
            $course = mysqli_real_escape_string($conn, $_POST['course']);
            $dept = mysqli_real_escape_string($conn, $_POST['dept-name-abbr']);
            $deptname = mysqli_real_escape_string($conn, $_POST['dept-name']);
            $deptcode = mysqli_real_escape_string($conn, $_POST['dept-code']);
            $batstartyear = mysqli_real_escape_string($conn, $_POST['bat-start-year']);
            $batendyear = mysqli_real_escape_string($conn, $_POST['bat-end-year']);
            $startdate = mysqli_real_escape_string($conn, $_POST['startdate']);
            $startyear = $batstartyear;
            $endyear = $batstartyear + 1;
            $semester  = 1;

            $fetchsql = "SELECT cls_id from erp_class where cls_startyr=$batstartyear and cls_endyr=$batendyear and cls_deptcode=$deptcode";
            $fetchresult = $conn->query($fetchsql);
            if ($fetchresult->num_rows > 0) {
                # code...
                echo '<script>swal.fire("Class Already Exist")</script>';
            } else {
                # code...

                $classsql = "INSERT INTO `erp_class` (`cls_startyr`, `cls_endyr`, `cls_deptcode`, `cls_dept`, `cls_deptname`, `cls_sem`, `cls_course`, `cls_acdstyr`, `cls_acdedyr`) VALUES('$batstartyear','$batendyear','$deptcode','$dept','$deptname','$semester','$course','$startyear','$endyear')";
                $classresult = $conn->query($classsql);
                if ($classresult === TRUE) {
                    # code...
                    $fetchsql = "SELECT cls_id from erp_class where cls_startyr=$batstartyear and cls_endyr=$batendyear and cls_deptcode=$deptcode";
                    $fetchresult = $conn->query($fetchsql);
                    if ($fetchresult->num_rows > 0) {

                        $clsrow = mysqli_fetch_assoc($fetchresult);
                        $cls_id = $clsrow['cls_id'];

                        $semsql = "INSERT into `erp_sem` (`cls_id`,`sem_no`,`sem_start`) values ('$cls_id','$semester','$startdate')";
                        $semresult = $conn->query($semsql);
        ?>
                        <script>
                            document.getElementById("TTform").reset();
                        </script>
        <?php
                        if ($semresult === TRUE) {
                            echo '<script>swal.fire("Class successfully Created")</script>';
                        } else {
                            echo "Error: " . $semsql . "<br>" . $conn->error;
                        }
                    } else {
                        echo "Created Class Not Found";
                    }
                } else {
                    echo "Error: " . $classsql . "<br>" . $conn->error;
                }
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