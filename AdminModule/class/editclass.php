<?php

session_start();

if (isset($_SESSION['user_id'])) {


    include('../../includes/config.php');
?>
    <?php

    ?>
    <!DOCTYPE html>
    <html>

    <head>
        <Title>Edit Class</Title>
        <link rel="stylesheet" type="text/css" href="../assets/css/styles_TT.css">
    </head>

    <body>
        <div class="TT-container">
            <div class="TT-head">
                <h1>Update Class</h1>
            </div>
            <button class="TT-button" onclick="window.location.href = 'manageClass.php';">MANAGE CLASS</button>
            <div class="TT-type-display" id="TTdisplay">
                <?php
                $status = "";
                if (isset($_POST['new']) && $_POST['new'] == 1) {
                    $id = $_REQUEST['id'];
                    $course =       $_REQUEST['course'];
                    $dept =         $_REQUEST['department'];
                    $deptname =     $_REQUEST['deptname'];
                    $deptcode =     $_REQUEST['deptcode'];
                    $batstartyear = $_REQUEST['startyear'];
                    $batendyear =   $_REQUEST['endyear'];
                    $startyear =    $_REQUEST['acdstyr'];
                    $endyear =      $_REQUEST['acdedyr'];
                    $semester =     $_REQUEST['semester'];
                    $update = "UPDATE erp_class SET cls_course='$course', cls_dept='$dept', cls_deptname='$deptname', cls_deptcode='$deptcode', cls_startyr='$batstartyear', cls_endyr='$batendyear', cls_acdstyr='$startyear', cls_acdedyr='$endyear', cls_sem='$semester' WHERE cls_id='$id'";
                    mysqli_query($conn, $update);
                    $status = "Record Updated Successfully.";
                    echo '<p style="color:#FF0000;">' . $status . '</p>';
                    echo "<script>
                    if (window.history.replaceState) {
                        window.history.replaceState(null, null, window.location.href);
                    }
                </script>";
                }
                $id = $_REQUEST['id'];  //getting id from request
                $classsql = "SELECT * FROM erp_class WHERE cls_id= '$id' ";   // selecting value of the record Query
                $classresult = $conn->query($classsql);  //fetching
                $classrow = mysqli_fetch_all($classresult, MYSQLI_ASSOC);
                if (is_array($classrow)) {
                    foreach ($classrow as $data) {
                ?>
            </div>
            <form id="TTform" method="post" action="" class="TT-form">
                <div class="TT-form-content">
                    <div><input type="hidden" name="new" value="1" /></div>
                    <div><input name="id" type="hidden" value="<?php echo $data['cls_id']; ?>" /></div>
                    <div>
                        <label for="course">Course</label>
                        <input type="text" name="course" placeholder="Enter Course" required value="<?php echo $data['cls_course']; ?>" />
                    </div>
                    <div>
                        <label for="department">Department</label>
                        <input type="text" name="department" placeholder="Enter Department Abbr" required value="<?php echo $data['cls_dept']; ?>" />
                    </div>
                    <div>
                        <label for="deptname">Department Name</label>
                        <input type="text" name="deptname" placeholder="Enter Department Name" required value="<?php echo $data['cls_deptname']; ?>" />
                    </div>
                    <div>
                        <label for="deptcode">Department Code</label>
                        <input type="text" name="deptcode" placeholder="Enter Department Code" required value="<?php echo $data['cls_deptcode']; ?>" />
                    </div>
                    <div>
                        <label for="startyear">Start Year</label>
                        <input type="text" name="startyear" placeholder="Enter Start Year" required value="<?php echo $data['cls_startyr']; ?>" />
                    </div>
                    <div>
                        <label for="endyear">End Year</label>
                        <input type="text" name="endyear" placeholder="Enter End Year" required value="<?php echo $data['cls_endyr']; ?>" />
                    </div>
                </div>
                <div class="TT-form-button">
                    <input class="TT-button" name="submit" type="submit" value="Update" />
                </div>
            </form>
    <?php
                    }
                } ?>

        </div>

        <script>
            if (window.history.replaceState) {
                window.history.replaceState(null, null, window.location.href);
            }
        </script>
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