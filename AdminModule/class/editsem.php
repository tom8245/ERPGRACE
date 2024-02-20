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
        <Title>Edit Semester</Title>
        <link rel="stylesheet" type="text/css" href="../assets/css/styles_TT.css">
    </head>

    <body>
        <div class="TT-container">
            <div class="TT-head">
                <h1>Update Semester</h1>
            </div>
            <?php $clsid = $_REQUEST['clsid']; ?>
            <button class="TT-button" onclick="window.location.href = 'manageSem.php?id=<?php echo $clsid; ?>';">GO BACK</button>
            <div class="TT-type-display" id="TTdisplay">
                <?php
                $status = "";
                $semid = $_REQUEST['sem_id'];  //getting id from request
                if (isset($_POST['new']) && $_POST['new'] == 1) {

                    $Semester =       $_REQUEST['Semester'];
                    $StartDate =         $_REQUEST['StartDate'];
                    $EndDate =     $_REQUEST['EndDate'];

                    $update = "UPDATE erp_sem SET sem_no='$Semester', sem_start='$StartDate', sem_end='$EndDate' WHERE sem_id='$semid'";
                    mysqli_query($conn, $update);
                    $status = "Record Updated Successfully.";
                    echo '<p style="color:#FF0000;">' . $status . '</p>';
                    echo "<script>
                    if (window.history.replaceState) {
                        window.history.replaceState(null, null, window.location.href);
                    }
                </script>";
                }

                $classsql = "SELECT * FROM erp_class WHERE cls_id= '$clsid' ";   // selecting value of the record Query
                $classresult = $conn->query($classsql);  //fetching
                $classrow = mysqli_fetch_assoc($classresult);

                echo "<h3>" . $classrow['cls_startyr'] . "-" . $classrow['cls_endyr'] . " " . $classrow['cls_course'] . "-" . $classrow['cls_dept'] . " semester " . $classrow['cls_sem'] . "</h3>";

                $semsql = "SELECT * FROM erp_sem WHERE sem_id= '$semid' ";   // selecting value of the record Query
                $semresult = $conn->query($semsql);  //fetching
                $semrow = mysqli_fetch_all($semresult, MYSQLI_ASSOC);
                if (is_array($semrow)) {
                    foreach ($semrow as $data) {
                ?>

            </div>
            <form id="TTform" method="post" action="" class="TT-form">
                <div class="TT-form-content">
                    <div><input type="hidden" name="new" value="1" /></div>
                    <div><input name="id" type="hidden" value="<?php echo $data['sem_id']; ?>" /></div>
                    <div>
                        <label for="Semester">Semester</label>
                        <input type="text" name="Semester" placeholder="Enter Semester" required value="<?php echo $data['sem_no']; ?>" />
                    </div>
                    <div>
                        <label for="StartDate">Start Date</label>
                        <input type="date" name="StartDate" placeholder="Enter StartDate" required value="<?php echo $data['sem_start']; ?>" />
                    </div>
                    <div>
                        <label for="EndDate">End Date</label>
                        <input type="date" name="EndDate" placeholder="Enter EndDate" required value="<?php echo $data['sem_end']; ?>" />
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