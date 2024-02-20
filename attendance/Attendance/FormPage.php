<head>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.min.css">
    <link rel="stylesheet" href="../Includes/Styles.css">
</head>
<!-- style dashboard -->
<style>
    html {
        overflow: scroll;
        overflow-x: hidden;
    }

    ::-webkit-scrollbar {
        width: 0;
        background: transparent;
    }

    .item label,
    select,
    input {
        width: 300px;
    }

    /* label { */
    /* width: 200px; */
    /* } */
</style>
<!-- style dashboard -->
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

?>
    <div class="main-container">
        <h1 class="headingmain">Attendance Entry</h1>
        <div class="frm d-flex">
            <form action="EntryPage.php" method="post">
                <div class="form-container">
                    <div class="center">
                        <div class="item">
                            <label for="">Date :</label>
                            <input type="date" style="align-items:center;" name="date" id="date" value="<?php echo date('Y-m-d'); ?>">
                        </div>
                        <?php
                        $Result = mysqli_query($con, "SELECT * FROM erp_class WHERE cls_id=$ClassIdFromFaculty");
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
                            <label>Period: </label>
                            <select name="Period" id="Period">
                                <option value="none" selected>--Select--</option>
                            </select>
                        </div>
                        <div class="item">
                            <label> Subject : </label>
                            <select name='Subject' id="Subject">
                                <option value="none" selected>--Select--</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="action_buttons">
                    <button type="submit" name="submit_btn" class="btn btn-primary">OK</button> &emsp;
                    <button class="btn" type="reset" value="Reset" onclick="location.reload();">Clear</button>
                </div>
            </form>
            <?php
            $currentDayName = date('D');
            ?>
        </div>
        <hr>
    </div>
    <script>
        $('#Semester').on('change', function() {
            var date = $('#date').val();
            $.ajax({
                url: '../ajax/GetPeriodsList.php',
                type: "POST",
                data: {
                    date: date
                },
                success: function(result) {
                    $('#Period').html(result);
                }
            });
        });

        $('#Period').on('change', function() {
            var Period = $('#Period').val();
            $.ajax({
                url: '../ajax/GetSubjectList.php',
                type: "POST",
                data: {
                    Period: Period
                },
                success: function(result) {
                    console.log(result);
                    $('#Subject').html(result);
                }
            });
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
                        text: 'Attendance marked for " . $_GET['status'] . ".'
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
                        text: 'Result for " . $_GET['status'] . " has failed to mark.'
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