<head>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.min.css">
    <link rel="stylesheet" href="../Includes/Styles.css">
</head>
<?php

session_start();

if (isset($_SESSION['user_id'])) {
    include "../../includes/config.php";
    include "../../includes/Header.php";

    $log_id = $_SESSION['user_id']; // Store user ID in session (temp ) and use in all files 
    //for Fetching faculty details into session on login
    $sql1 = "SELECT * FROM `erp_faculty` where f_id='$log_id';";
    $result1 = mysqli_query($conn, $sql1);
    if (!$result1) {
        die('Query failed: ' . mysqli_error($conn));
    }
    $row = mysqli_fetch_assoc($result1);
    $ClassIdFromFaculty = $row['cls_id'];

    // print_r($_SESSION['FacultyDetails']);

    $currentYear = date('Y'); // Get current year
    $nextYear = date('Y', strtotime('+1 year')); // Get next year

    $ExamRows = mysqli_query($conn, "SELECT * FROM `erp_createexam` WHERE cls_id=$ClassIdFromFaculty AND ce_sdate > '$currentYear-01-01' AND ce_sdate < '$nextYear-01-01';");
    $ExamRows = mysqli_fetch_all($ExamRows);
    // print_r( $ExamRows);
?>
    <div class="main-container">
        <h1 class="headingmain">Result Entry</h1>
        <div class="frm d-flex">
            <form action="EntryPage.php" method="post">
                <input type="hidden" name="SubjectCode" id="SubjectCode" value="" />
                <input type="hidden" name="ExamCeId" id="ExamCeId" value="" />


                <div class="form-container">
                    <div class="center">
                        <!-- <div class="drop">
                        <label for="">Date :</label>
                        <input type="date" name="date" id="" required>
                    </div> -->
                        <?php
                        $Result = mysqli_query($conn, "SELECT * FROM erp_class WHERE cls_id=$ClassIdFromFaculty");
                        $ClassDetails = mysqli_fetch_assoc($Result);

                        $Course = $ClassDetails['cls_course'];
                        $Department = $ClassDetails['cls_dept'];
                        $Semester = $ClassDetails['cls_sem'];
                        ?>

                        <div class="item">
                            <label>Course:</label>
                            <select name='Course' id="Course" required>
                                <option value="" selected>--Select--</option>
                                <option value="<?php echo $Course; ?>">
                                    <?php echo $Course; ?>
                                </option>
                            </select>
                        </div>

                        <div class="item">
                            <label>Department:</label>
                            <select name='Department' id="Department">
                                <option value="none" selected>--Select--</option>
                                <option value="<?php echo $Department; ?>">
                                    <?php echo $Department; ?>
                                </option>
                            </select>
                        </div>
                        <div class="item">
                            <b><label> Semester: </label></b>
                            <select name='Semester' id='Semester'>
                                <option value="none" selected>--Select--</option>
                                <option value="<?php echo $Semester; ?>">
                                    <?php echo $Semester; ?>
                                </option>
                            </select>
                        </div>
                        <div class="item">
                            <label>Exam Name </label>
                            <select name='Exam' id="Exam" required>
                                <option value="none" selected disabled hidden>--Select--</option>
                                <?php
                                foreach ($ExamRows as $ExamRow) {
                                    echo "<option value=" . $ExamRow[0] . "  >" . $ExamRow[2] . "</option>";
                                    if($ExamRow == 'University Exam'){ 
                                        echo "super";
                                    }
                                }
                                
                                ?>
                            </select>
                        </div>
                        <div class="item">
                            <label> Subject Name: </label>
                            <select name='Subject' id="Subject" required>
                                <option value="none" selected disabled hidden>--Select--</option>
                            </select>
                        </div>
                    </div>
                </div>
                <input type="text" value="" hidden>
                
                <div class="action_buttons">
                    <button type="submit" name="submit_btn" class="btn btn-primary">OK</button> &emsp;
                    <button class="btn" type="reset" value="Reset" onclick="location.reload();">Clear</button>
                </div>
        </div>
        </form>
        <hr>

    </div>


    </body>
    <script>
        $('#Exam').on('change', function() {
            var ExamCeId = $("#Exam").val();
            console.log(ExamCeId);
            $.ajax({
                url: '../ajax/ename.php',
                type: "POST",
                data: {
                    ExamCeId: ExamCeId
                },
                success: function(result) {
                    $('#Subject').html(result);
                    console.log(result);
                }
            })
        });

        $('#Subject').on('change', function() {
            var subcode = $(this).val();
            console.log(subcode);
            $("#Subject").val(subcode);
        });
    </script>
    <?php
    if (isset($_GET['result'])) {
        if ($_GET['result'] == "success") {
            echo "
                <script>
                    Swal.fire({
                        icon: 'success',
                        title: 'Success!',
                        text: 'Result marked for " . $_GET['Count'] . ".'
                    });
                </script>
            ";
        }
        if ($_GET['result'] == "error") {
            echo "
                <script>
                    Swal.fire({
                        icon: 'error',
                        title: 'Error!',
                        text: 'Result for " . $_GET['Count'] . " has failed to mark.'
                    });
                </script>
            ";
        }
    }
    include "../Includes/FooteRes.php";
    ?>
<?php
} else {
    header("Location: ../index.php");
}
?>
<style>
    html {
        overflow: scroll;
        overflow-x: hidden;
    }

    ::-webkit-scrollbar {
        width: 0;
        background: transparent;
    }.item label ,select{ 
    width:300px;
}
</style>