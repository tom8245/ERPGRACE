<?php

session_start();

if (isset($_SESSION['user_id'])) {

    include('../../includes/config.php');
    // <!-- connecting database -->

    error_reporting(0);
    $courses = array(); //array to store courses
    $departments = array(); //array to store departments
    $semesters = array(); // array to store semesters
    $cour_dept_query = 'SELECT DISTINCT cls_course, cls_deptname FROM erp_class ORDER BY cls_course';
    $result = $conn->query($cour_dept_query);
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
        <title>Subject</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/styles_TT.css">
    </head>

    <body>

        <div class="TT-container">
            <div class="TT-head">
                <h1>Suject Allocation</h1>
            </div>
            <div>
                <button class="TT-button" onclick="window.location.href = '../Admin.php';">Admin Module</button>
            </div>
            <!-- form for selecting class -->
            <form id="TTform5" method="post" action="#" class="TT-form">
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
            <?php

            if (isset($_POST['search'])) {
                $cour = $_POST['course'];
                $dept = $_POST['department'];
                $sem = $_POST['semester'];
            ?>
                <div class="TT-container">
                    <div class="TT-head">
                        <!-- <h1>Subject Allocation</h1> -->
                        <h3><?php echo $cour . ' ' . $dept . ' semester ' . $sem ?></h3>
                    </div>
                    <!-- <button class="TT-button" onclick="window.location.href = 'subject.php';">GO Back</button> -->
                    <div class="TT-type-display">
                        <?php

                        $query2 = "select cls_id from erp_class where cls_deptname='$dept' and cls_course = '$cour' and cls_sem = '$sem'";
                        $result2 = $conn->query($query2);
                        $row2 = mysqli_fetch_all($result2, MYSQLI_ASSOC);
                        foreach ($row2 as $data) {
                            $clsid = $data['cls_id'];
                        }
                        $sub_query = "SELECT * FROM erp_subject WHERE cls_id= $clsid ";
                        $sub_result = $conn->query($sub_query);
                        if (mysqli_num_rows($sub_result) > 0) {
                        ?>

                            <table class="TT-type-display-table">
                                <thead>
                                    <tr>
                                        <th>S.No</th>
                                        <th>Subject</th>
                                        <th>Faculty</th>
                                        <th>Manage</th>
                                    </tr>
                                </thead>

                                <?php

                                // Display the subject
                                $i = 1;
                                while ($sub_row = mysqli_fetch_assoc($sub_result)) {

                                    if ($sub_row['f_id'] == "") {
                                ?>

                                        <tbody>
                                            <tr>
                                                <form method='post' action='suballocscript.php' id='updateform'>
                                                    <td><?php echo $i; ?></td>
                                                    <td><?php echo $sub_row['tt_subcode'] . '-' . $sub_row['sub_name']; ?></td>
                                                    <?php
                                                    $faculty_query = "SELECT f_id,f_fname,f_lname,f_designation FROM erp_faculty  ORDER BY f_fname ASC";
                                                    $faculty_result = mysqli_query($conn, $faculty_query);
                                                    ?>
                                                    <td>
                                                        <select name='f_id' required>
                                                            <option value="">Not Assigned</option>
                                                            <?php
                                                            while ($faculty_row = mysqli_fetch_assoc($faculty_result)) {
                                                            ?>
                                                                <option value=<?php echo $faculty_row["f_id"]; ?>><?php echo $faculty_row['f_fname'] . '  ' . $faculty_row['f_lname'] . ',' . $faculty_row['f_designation'] ?></option>
                                                            <?php
                                                            }
                                                            ?>
                                                        </select>
                                                    </td>
                                                    <td>

                                                        <input type="hidden" name="course" value='<?php echo $cour; ?>'>
                                                        <input type="hidden" name="department" value='<?php echo $dept; ?>'>
                                                        <input type="hidden" name="semester" value='<?php echo $sem; ?>'>
                                                        <input type='hidden' name='sub_id' id="recordId" value='<?php echo $sub_row['sub_id']; ?>'>
                                                        <input type='submit' name='add' value='Assign'>

                                                    </td>
                                                </form>
                                            </tr>
                                        </tbody>
                                    <?php
                                    } else {
                                    ?>
                                        <tbody>
                                            <tr>
                                                <td><?php echo $i; ?></td>
                                                <td><?php echo $sub_row['tt_subcode'] . '-' . $sub_row['sub_name']; ?></td>
                                                <?php
                                                $faculty_query = "SELECT f_fname,f_lname,f_designation FROM erp_faculty Where f_id= '" . $sub_row['f_id'] . "'";
                                                $faculty_result = mysqli_query($conn, $faculty_query);
                                                $faculty_row = mysqli_fetch_assoc($faculty_result);
                                                ?>
                                                <td><?php echo $faculty_row['f_fname'] . '  ' . $faculty_row['f_lname'] . ',' . $faculty_row['f_designation'] ?></td>
                                                <!-- // Display the update button -->
                                                <td>
                                                    <form method='post' action='facultysubupdate.php' id='updateform'>
                                                        <input type="hidden" name="course" value='<?php echo $cour; ?>'>
                                                        <input type="hidden" name="department" value='<?php echo $dept; ?>'>
                                                        <input type="hidden" name="semester" value='<?php echo $sem; ?>'>
                                                        <input type="hidden" name="subcode" value='<?php echo $sub_row['tt_subcode']; ?>'>
                                                        <input type="hidden" name="subname" value='<?php echo $sub_row['sub_name']; ?>'>
                                                        <input type="hidden" name="faculty" value='<?php echo $faculty_row['f_fname'] . '  ' . $faculty_row['f_lname'] . ',' . $faculty_row['f_designation'] ?>'>
                                                        <input type='hidden' name='sub_id' id="recordId" value='<?php echo $sub_row['sub_id']; ?>'>
                                                        <input type='submit' name='update' value='Update'>
                                                    </form>
                                                </td>
                                            </tr>
                                        </tbody>
                                <?php
                                    }
                                    $i++;
                                }
                                ?>
                            </table>
                    <?php

                        } else {
                            echo 'Please Create Subjects First';
                        }
                    }

                    ?>
                    </div>

                    <!-- end of display -->
                </div>
        </div>
    </body>


    <script type="text/javascript">
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