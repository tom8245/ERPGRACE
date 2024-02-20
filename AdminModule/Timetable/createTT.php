<?php

session_start();

if (isset($_SESSION['user_id'])) {

    include('../../includes/config.php');  // <!-- connecting database -->


    $courses = array(); //array to store courses
    $departments = array(); //array to store departments
    $semesters = array(); // array to store semesters
    $query = 'SELECT DISTINCT cls_course, cls_deptname FROM erp_class ORDER BY cls_course';
    $result = $conn->query($query);
    while ($row = mysqli_fetch_assoc($result)) {
        $course = $row['cls_course'];
        $department = $row['cls_deptname'];
        if (!in_array($course, $courses)) {
            $courses[] = $course;
        }
        if (!isset($departments[$course])) {
            $departments[$course] = array();
        }
        $departments[$course][] = $department;
    }


    $query1 = 'SELECT DISTINCT cls_course, cls_sem FROM erp_class ORDER BY cls_course';
    $result1 = $conn->query($query1);
    while ($row = mysqli_fetch_assoc($result1)) {
        $course = $row['cls_course'];
        $semester = $row['cls_sem'];
        if (!in_array($course, $courses)) {
            $courses[] = $course;
        }
        if (!isset($semesters[$course])) {
            $semesters[$course] = array();
        }
        $semesters[$course][] = $semester;
    }
?>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create Time Table</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/styles_TT.css">
        <!-- sweet alert JS -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>

    <body>
        <div class="TT-container">
            <div class="TT-head">
                <h1>Create Time Table</h1>
            </div>
            <div>
                <button class="TT-button" onclick="window.location.href = 'manageTT.php';">Manage Time Table</button>
                <button class="TT-button" onclick="window.location.href = '../Admin.php';">Admin Module</button>
            </div>
            <!-- form for selecting class -->
            <form id="TTform3" method="post" action="#" class="TT-form">
                <h2>Create</h2>
                <div class="TT-form-content">
                    <div>
                        <label for="course">Course:</label>
                        <select id="course" name="course" style="width: 300px;" required>
                            <option value="">---Select a course---</option>
                            <?php foreach ($courses as $course) : ?>
                                <option value="<?php echo $course; ?>"><?php echo $course; ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div>
                        <label for="department">Department:</label>
                        <select id="department" name="department" style="width: 300px;" required>
                            <option value="">---Select a course first---</option>
                        </select>
                    </div>
                    <div>
                        <label for="semester">Semester:</label>
                        <select id="semester" name="semester" style="width: 300px;" required>
                            <option value="">---Select a course first---</option>
                        </select>
                    </div>
                    <div>
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
                            <label for="type">Time Table type:</label>
                            <select name="type" id="type" style="width: 300px;" required>
                                <option value="">--Time table type--</option>
                                <?php
                                if (is_array($msg3)) {
                                    foreach ($msg3 as $data) {
                                ?>
                                        <option value=" <?php echo $data['type_id']; ?> "><?php echo $data['type_title'] ?? ''; ?> </option>
                            <?php
                                    }
                                }
                            }
                            ?>
                            </select>
                            <!-- timetable type fetched -->
                    </div>
                    <div>
                        <label for="frdate">From Date:</label>
                        <input type="date" name="frdate" id="sc_frdate" required>
                    </div>
                    <div>
                        <label for="todate">To Date:</label>
                        <input type="date" name="todate" id="sc_todate" required>
                    </div>
                    <div class="TT-form-button">
                        <button type="submit" name="create" class="TT-button">Save</button>
                        <button type="reset" class="TT-button">Clear</button>
                    </div>
                </div>
            </form>
        </div>
    </body>
    <script>
        var departments = <?php echo json_encode($departments); ?>;
        var semesters = <?php echo json_encode($semesters); ?>;
        document.getElementById('course').addEventListener('change', function() {
            var course = this.value;
            var departmentSelect = document.getElementById('department');
            var semesterSelect = document.getElementById('semester');
            // Remove existing options
            while (departmentSelect.firstChild) {
                departmentSelect.removeChild(departmentSelect.firstChild);
            }
            while (semesterSelect.firstChild) {
                semesterSelect.removeChild(semesterSelect.firstChild);
            }
            // Add default option
            var defaultOption = document.createElement('option');
            defaultOption.value = '';
            defaultOption.innerHTML = 'Select a department';
            departmentSelect.appendChild(defaultOption);

            var defaultOption = document.createElement('option');
            defaultOption.value = '';
            defaultOption.innerHTML = 'Select a semester';
            semesterSelect.appendChild(defaultOption);

            // Add options based on the selected course
            if (departments.hasOwnProperty(course)) {
                departments[course].forEach(function(department) {
                    var option = document.createElement('option');
                    option.value = department;
                    option.innerHTML = department;
                    departmentSelect.appendChild(option);
                });
            }

            if (semesters.hasOwnProperty(course)) {
                semesters[course].forEach(function(semester) {
                    var option = document.createElement('option');
                    option.value = semester;
                    option.innerHTML = semester;
                    semesterSelect.appendChild(option);
                });
            }

        });
    </script>

    <script>
        // clear form history
        if (window.history.replaceState) {
            window.history.replaceState(null, null, window.location.href);
        }
    </script>


    <!-- script end -->


    </html>




    <!-- creating type php code-->
    <?php


    if (isset($_POST['create'])) {
        //variable declaration and getting value
        $cour = $_POST['course'];
        $dept = $_POST['department'];
        $sem = $_POST['semester'];
        $type = $_POST['type'];
        $frdate = $_POST['frdate'];
        $todate = $_POST['todate'];
        //fetching cls id    
        $sql1 = "select cls_id from erp_class where cls_deptname='$dept' and cls_course = '$cour' and cls_sem = '$sem'";
        $result1 = $conn->query($sql1);
        $row1 = mysqli_fetch_all($result1, MYSQLI_ASSOC);
        foreach ($row1 as $data) {
            $clsid = $data['cls_id'];
        }

        // echo $clsid;
        //insert to schedule table
        $sql2 = "insert into erp_schedule (class_id,type_id,sc_frdate,sc_todate) values ('$clsid','$type','$frdate','$todate')";
        $result2 = $conn->query($sql2);
    ?>

    <?php
        if ($result2 === TRUE) {
            echo '<script>Swal.fire("Time Table successfully Created");</script>';
        } else {
            echo "Error: " . $sql2 . "<br>" . $conn->error;
        }
    }
    $conn->close();
    ?>
<?php
} else {
    header("Location: ../../index.php");
}
?>

<!-- creation code ends -->