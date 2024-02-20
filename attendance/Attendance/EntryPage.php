<head>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.min.css">
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
?>
    <div class="container">
        <div class="table-responsive">
            <h3 align="center">Attendance Posting</h3>
        </div>
    </div>
    <center>
        <table class="post-head">
            <tr>
                <td>
                    <?php
                    function dateHeader(){
                        if (isset($_POST['date'])) {
                            $date = $_POST['date'];
                            echo "Date: " . $date;
                        }
                        return $date;
                        $date = date("d-M-Y ");
                        echo "Date: " . $date;
                        return $date;

                    }
                    $date = dateHeader();

                    ?>
                </td>
                <td>
                    <?php echo "Course: " . $_POST['Course']; ?>
                </td>
                <td>
                    <?php echo "Semester: " . $_POST['Semester']; ?>
                </td>
            </tr>
            <tr>
                <td>
                    <?php echo "Department: " . $_POST['Department']; ?>
                </td>
                <td>
                    <?php echo "Period: " . $_POST['Period']; ?>
                </td>
                <td>
                    <?php echo "Subject: " . $_POST['Subject']; ?>
                </td>
            </tr>
        </table>
    </center>
    <form action="PostPage.php" method="post">
        <input type="hidden" name="Date" value="<?php echo $date; ?>">
        <input type="hidden" name="Course" value="<?php echo $_POST['Course']; ?>">
        <input type="hidden" name="Department" value="<?php echo $_POST['Department']; ?>">
        <input type="hidden" name="Semester" value="<?php echo $_POST['Semester']; ?>">
        <input type="hidden" name="Period" value="<?php echo $_POST['Period']; ?>">
        <input type="hidden" name="Subject" value="<?php echo $_POST['Subject']; ?>">

        <?php
        // $ClassId = $_SESSION['FacultyDetails']['cls_id'];
        $query = "SELECT * FROM erp_student WHERE cls_id='$ClassIdFromFaculty'";
        $result = mysqli_query($conn, $query);
        $numrow = mysqli_num_rows($result);
        if ($numrow > 0) {
            echo '<div class="table-container">';
            echo '<table class="dbresult" id="attendanceTable">';
            echo '<thead>';
            echo '<tr>';
            echo '<th>Sl.No</th>';
            echo '<th>Name</th>';
            echo '<th>Reg No.</th>';
            echo '<th>Status</th>';
            echo '</tr>';
            echo '</thead>';
            echo '<tbody>';

            $i = 1; // Start index from 1

            while ($row = mysqli_fetch_assoc($result)) {
                echo '<tr>';
                echo '<td>', $i, '</td>';
                echo '<td>', $row['stu_fname'] . ' ' . $row['stu_lname'], '<input type="hidden" name="attendanceRecords[' . $i . '][name]" value="' . $row['stu_fname'] . ' ' . $row['stu_lname'] . '"></td>';
                echo '<td>', $row['stu_id'], '<input type="hidden" name="attendanceRecords[' . $i . '][regno]" value="' . $row['stu_id'] . '"></td>';
                echo '<td> 
                    <input type="radio" id="pre' . $i . '" name="attendanceRecords[' . $i . '][status]" value="P" checked>Present
                    <input type="radio" id="abs' . $i . '" name="attendanceRecords[' . $i . '][status]" value="A">Absent
                    <select id="sel' . $i . '" name="attendanceRecords[' . $i . '][dropdown]" style="display:none">
                      <option value="">Choose</option>
                      <option value="od">On-Duty</option>
                      <option value="absent">Absent</option> 
                    </select>
                </td>';
                echo '</tr>';
                $i++;
            }

            echo '</tbody>';
            echo '</table>';
            echo '</div>';
        } else {
            echo 'Record Not found';
        }
        echo '
     <div id="absentStudentsBox">
         <h5><b>Absent Students</b></h5>
         <ul id="absentStudentsList"></ul>
     </div>';
        ?>

        <!--absentees students name list on separate box-->
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                let radios = document.querySelectorAll('[name^="attendanceRecords["][name$="[status]"]');
                radios.forEach(function(radio) {
                    radio.addEventListener('change', function() {
                        updateAbsentList();
                    });
                });

                function updateAbsentList() {
                    let list = document.getElementById('absentStudentsList');
                    list.innerHTML = ''; // Clear the list

                    radios.forEach(function(radio) {
                        if (radio.value == 'A' && radio.checked) {
                            let name = radio.closest('tr').querySelector(
                                '[name^="attendanceRecords["][name$="[name]"]').value;
                            let li = document.createElement('li');
                            li.textContent = name;
                            list.appendChild(li);
                        }
                    });
                }
            });
        </script>
        <?php
        $j = 0; //Hide & show checkbox in attendance absent
        while ($j < $i) {

        ?>
            <script>
                $(document).ready(function() {
                    $("#abs<?php echo $j; ?>").click(function() {
                        console.log("1");
                        $("#sel<?php echo $j; ?>").show(); //dropdown
                    });
                    $("#pre<?php echo $j; ?>").click(function() {
                        $("#sel<?php echo $j; ?>").hide(); //dropdown
                    });
                });
            </script>
        <?php
            $j++;
        } ?>
        <div>
            <center>
                <input type="submit" name="save" value="Save" class="button button4">&emsp;
                <!-- <button class="button button4">Save as Draft</button>&emsp; -->
                <button class="button button4" type="reset" value="Reset" onclick="location.reload();">Clear</button>
            </center>
        </div>
    </form>
<?php
} else {
    header("Location: ../index.php");
}
?>
<style>
    /* #attendanceTable {
    border-collapse: collapse;
    width: 61.5%;
}

#attendanceTable th, #attendanceTable td {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

#attendanceTable th {
    background-color: 33A5FF;
    position: sticky;
    top: 0;
    z-index: 1;
} */
    .table-container {
        max-height: 420px;
        overflow-y: auto;
        width: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0 auto;
        /* Added to center the container horizontally */
    }

    .table-container::-webkit-scrollbar {
        display: none;
    }



    .dbresult {
        border-collapse: collapse;
        width: 100%;
        table-layout: fixed;
    }

    .dbresult th,
    .dbresult td {
        border: 1px solid #dddddd;
        padding: 8px;
    }

    .dbresult thead th {
        position: sticky;
        top: 0;
        background-color: 33A5FF;
    }

    .post-head {
        width: 50%;
        margin: 0 auto;
        border-collapse: collapse;
        margin-top: 10px;
        margin-bottom: 17px;
    }

    .post-head td {
        border: 1px solid #639cd9;
        padding: 8px;
        text-align: left;
    }

    center {
        text-align: center;
    }
</style>
<style>
    html {
        overflow: scroll;
        overflow-x: hidden;
    }

    ::-webkit-scrollbar {
        width: 0;
        background: transparent;
    }
</style>