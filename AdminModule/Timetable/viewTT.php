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
        <title>View Time Table</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/styles_TT.css">
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
            <form id="TTform7" method="post" action="#" class="TT-form">
                <h2>search</h2>
                <div class="TT-form-content">
                    <div>
                        <label class="TT-label" for="course">Course:</label>
                        <select id="course" name="course" style="width: 300px;" required>
                            <option value="">---Select a course---</option>
                            <?php foreach ($courses as $course) : ?>
                                <option value="<?php echo $course; ?>"><?php echo $course; ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div>
                        <label class="TT-label" for="department">Department:</label>
                        <select id="department" name="department" style="width: 300px;" required>
                            <option value="">---Select a course first---</option>
                        </select>
                    </div>
                    <div>
                        <label class="TT-label" for="semester">Semester:</label>
                        <select id="semester" name="semester" style="width: 300px;" required>
                            <option value="">---Select a course first---</option>
                        </select>
                    </div>
                    <div class="TT-form-button">
                        <button type="submit" name="search" class="TT-button">Search</button>
                        <button type="reset" class="TT-button">Clear</button>
                    </div>
                </div>
            </form>



            <!-- display in Table -->



            <div class="TT-type-display" id="TTdisplay3">

                <?php
                $result4 = "";
                if (isset($_POST['search'])) {    //code for selecting based on the filters 
                    $cour = $_POST['course'];
                    $dept = $_POST['department'];
                    $sem = $_POST['semester'];

                    // fetching class id based on given inputs
                    $query2 = "select cls_id from erp_class where cls_deptname='$dept' and cls_course = '$cour' and cls_sem = '$sem'";
                    $result2 = $conn->query($query2);
                    $row2 = mysqli_fetch_all($result2, MYSQLI_ASSOC);
                    foreach ($row2 as $data) {
                        $clsid = $data['cls_id'];
                    }
                    $query4 = "SELECT * FROM erp_tt_type LEFT JOIN erp_schedule ON erp_tt_type.type_id = erp_schedule.type_id LEFT JOIN erp_class on erp_schedule.class_id=erp_class.cls_id where  erp_class.cls_id = $clsid ";
                    $result4 = $conn->query($query4);
                }

                if ($result4 == true) {
                    if ($result4->num_rows > 0) {
                ?>
                        <table class="TT-type-display-table">
                            <thead>
                                <tr>
                                    <th>Class</th>
                                    <th>Time Table Type</th>
                                    <th>Duration</th>
                                    <th>View</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $row4 = mysqli_fetch_all($result4, MYSQLI_ASSOC);
                                $msg4 = $row4;
                            } else {
                                $msg4 = "No Data Found";
                            }

                            if (is_array($msg4)) {
                                foreach ($msg4 as $data) {
                                ?>
                                    <tr>
                                        <td><?php echo $data['cls_course'] . ' - ' . $data['cls_dept'] . ' - Semester - ' . $data['cls_sem']; ?></td>
                                        <td><?php echo $data['type_title']; ?></td>
                                        <td><?php echo date('d-m-Y', strtotime($data['sc_frdate'])) . '  To  ' . date('d-m-Y', strtotime($data['sc_todate'])); ?></td>
                                        <td>
                                            <form action="  viewscript.php" method="post">
                                                <input type="hidden" name="data" value="<?php echo htmlspecialchars(json_encode($data));  ?>">
                                                <button type="submit" class="TT-button">View</button>
                                            </form>
                                        </td>
                                    </tr>
                                <?php
                                }
                            } else {   ?>
                                <tr>
                                    <td rowspan="3"><?php echo $msg4; ?></td>
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
    </body>

    <?php
    // Close database connection
    $conn->close();
    ?>

    </html>
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
<?php
} else {
    header("Location: ../../index.php");
}
?>


<!-- script end -->