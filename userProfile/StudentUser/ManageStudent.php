<?php

session_start();

if (isset($_SESSION['user_id'])) {

    include('../../includes/config.php');

    $profileresult = '';


    if (isset($_POST['search'])) {


        // Initialize an empty WHERE clause for the SQL query
        $whereClause = "";

        // Check if Department is selected
        if (isset($_POST['clsid']) && $_POST['clsid'] !== 'class') {
            $clsid = $_POST['clsid'];
            // Add the condition to the WHERE clause
            $whereClause .= " AND cls_id = '$clsid'";
        }

        // Check if other fields are provided
        if (!empty($_POST['stu_id'])) {
            $stu_id = $_POST['stu_id'];
            // Add the condition to the WHERE clause with a pattern match
            $whereClause .= " AND stu_id LIKE '%$stu_id%'";
        }

        if (!empty($_POST['stu_fname'])) {
            $firstName = $_POST['stu_fname'];
            // Add the condition to the WHERE clause with a pattern match
            $whereClause .= " AND stu_fname LIKE '%$firstName%'";
        }

        if (!empty($_POST['stu_lname'])) {
            $lastName = $_POST['stu_lname'];
            // Add the condition to the WHERE clause with a pattern match
            $whereClause .= " AND stu_lname LIKE '%$lastName%'";
        }

        if (!empty($_POST['stu_mobile'])) {
            $mobile = $_POST['stu_mobile'];
            // Add the condition to the WHERE clause with a pattern match
            $whereClause .= " AND stu_mobile LIKE '%$mobile%'";
        }





        // Construct the final SQL query
        $profilesql = "SELECT stu_id, stu_fname, stu_lname, stu_img, stu_status,stu_mobile,cls_id FROM erp_student WHERE 1 $whereClause";



        // Execute the query and handle errors
        $profileresult = mysqli_query($conn, $profilesql);
        if (!$profileresult) {
            die("Query failed: " . mysqli_error($conn));
        }
    }
?>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Student Profile</title>
        <!-- Jquery-3 -->
        <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="../../AdminModule/assets/css/styles_TT.css">

    </head>

    <body>
        <div class="TT-container">
            <div class="TT-head">
                <h1>Manage Student Profile</h1>
            </div>
            <div>
                <button class="TT-button" onclick="window.location.href = 'CreateStudent.php';">Create Profile</button>
                <button class="TT-button" onclick="window.location.href = '../index.php';">User Profile</button>
            </div>
            <form id="TTform5" method="post" action="#" class="TT-form">
                <h2>search</h2>
                <div class="TT-form-content">

                    <div>
                        <label for="clsid">Class :</label>
                        <select name="clsid" required>
                            <option value="class">Select class:</option>
                            <?php
                            $classsql = "SELECT distinct cls_id,cls_course,cls_dept,cls_startyr,cls_endyr from erp_class ";
                            $classresult = $conn->query($classsql);
                            while ($row = mysqli_fetch_assoc($classresult)) {
                                $id = $row['cls_id'];
                                $name = $row['cls_course'] . '-' . $row['cls_dept'] . '. Batch(' . $row['cls_startyr'] . '-' . $row['cls_endyr'] . ')';
                                echo '<option value="' . $id . '"';
                                echo (isset($studentData['cls_id']) && $studentData['cls_id'] == $id) ? 'selected' : '';
                                echo '>' . $name . '</option>';
                            }
                            ?>
                        </select>
                    </div>

                    <div>
                        <label class="TT-label" for="stu_id">Student ID:</label>
                        <input type="text" id="stu_id" name="stu_id"><br>
                    </div>
                    <div>
                        <!-- First Name -->
                        <label class="TT-label" for="stu_fname">First Name:</label>
                        <input type="text" id="stu_fname" name="stu_fname"><br>
                    </div>
                    <div>
                        <!-- Last Name -->
                        <label class="TT-label" for="stu_lname">Last Name:</label>
                        <input type="text" id="stu_lname" name="stu_lname"><br>
                    </div>

                    <div>
                        <!-- Mobile -->
                        <label class="TT-label" for="stu_mobile">Mobile:</label>
                        <input type="text" id="stu_mobile" name="stu_mobile"><br>
                    </div>

                    <div class="TT-form-button">
                        <button type="submit" name="search" class="TT-button">Search</button>
                        <button type="reset" class="TT-button">Clear</button>
                    </div>
                </div>
            </form>
            <?php if (isset($profileresult->num_rows) && $profileresult->num_rows > 0) {            ?>
                <main class="TT-type-display">
                    <table class="TT-type-display-table">
                        <thead>
                            <tr>
                                <th>S.No</th>
                                <th>Id</th>
                                <th>Name</th>
                                <th>Class</th>
                                <th>Mobile Number</th>
                                <th>Image</th>
                                <th>Status</th>
                                <th>Manage</th>
                            </tr>
                        </thead>
                        <tbody>

                            <?php

                            if ($profileresult == true) {
                                $i = 0;
                                while ($row = mysqli_fetch_assoc($profileresult)) {
                                    $i++;
                            ?>
                                    <tr>
                                        <td><?php echo $i; ?></td>
                                        <td><?php echo $row['stu_id']; ?></td>
                                        <td><?php echo $row['stu_fname'] . ' ' . $row['stu_lname']; ?></td>
                                        <td>
                                            <?php
                                            $classsql = "SELECT distinct cls_id,cls_course,cls_dept,cls_startyr,cls_endyr from erp_class where cls_id='" . $row['cls_id'] . "'";
                                            $classresult = $conn->query($classsql);
                                            while ($classrow = mysqli_fetch_assoc($classresult)) {

                                                $name = $classrow['cls_course'] . '-' . $classrow['cls_dept'] . '. Batch(' . $classrow['cls_startyr'] . '-' . $classrow['cls_endyr'] . ')';
                                                echo  $name;
                                            }
                                            ?>
                                        </td>
                                        <td><?php echo $row['stu_mobile']; ?></td>
                                        <td>
                                            <img src="../../assets/img/profile/<?php echo $row['stu_img']; ?>" alt="No Image" height="80px" width="80px">
                                        </td>
                                        <td>
                                            <form method="post" action="">
                                                <input type="hidden" name="stu_id" value="<?php echo $row['stu_id']; ?>">
                                                <button type="button" stuId="<?php echo $row['stu_id'] ?>" class="btn btn-primary statusBtn" data-bs-toggle="modal" data-bs-target="#exampleModal" name="active" style="color:white; background:<?php echo $row['stu_status'] == 'Active' || $row['stu_status'] == 'active' ? 'Green' : 'Grey' ?>"><?php echo $row['stu_status'] ?></button>
                                            </form>
                                        </td>
                                        <td>
                                            <form method="post" action="ViewStudent.php">
                                                <input type="hidden" name="sid" value="<?php echo $row['stu_id']; ?>">
                                                <button type="submit" name="view" class="TT-button">View Profile</button>
                                            </form>
                                        </td>
                                    </tr>
                            <?php
                                }
                            }
                            ?>
                        </tbody>
                </main>
            <?php } else {
                echo "<p>No records</p>";
            } ?>
        </div>
        <!-- Boostrap Modal -->

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Change status to</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <!-- Row 1 -->
                            <div class="row">
                                <div class="col">
                                    <div class="d-grid gap-2">
                                        <button type="button" class="btn btn-outline-primary statusChangeBtn">Transfer</button>
                                    </div>
                                </div>
                            </div>


                            <!-- Row 2 -->
                            <div class="row">
                                <div class="col">
                                    <div class="d-grid gap-2">
                                        <button type="button" class="btn btn-outline-secondary statusChangeBtn">Completed</button>
                                    </div>
                                </div>
                            </div>

                            <!-- Row 3 -->
                            <div class="row">
                                <div class="col">
                                    <div class="d-grid gap-2">
                                        <button type="button" class="btn btn-outline-success statusChangeBtn">Active</button>
                                    </div>
                                </div>
                            </div>

                            <!-- Row 4 -->
                            <div class="row">
                                <div class="col">
                                    <div class="d-grid gap-2">
                                        <button type="button" class="btn btn-outline-danger statusChangeBtn">Discontinued</button>
                                    </div>
                                </div>
                            </div>

                            <!-- Row 5 -->
                            <div class="row">
                                <div class="col">
                                    <div class="d-grid gap-2">
                                        <button type="button" class="btn btn-outline-warning statusChangeBtn">Dropout</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="d-grid gap-2">
                        <div id='Result'></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>


    </body>

    <script>
        $(document).ready(function() {

            $('.statusBtn').click(function(e) {
                var studentId = $(this).attr('stuId');
                console.log(studentId);

                $('.statusChangeBtn').unbind().click(function(e) {
                    var statusChangeValue = $(this).html();
                    console.log(statusChangeValue);

                    // AJAX call for updating the student status
                    $.ajax({
                        url: 'ajax/upload.php',
                        type: 'POST',
                        data: {
                            statusChangeValue: statusChangeValue,
                            studentId: studentId,
                            Function: 'studentStatusUpdate'
                        },
                        success: function(response) {
                            console.log(response);
                            if (response == "OK") {
                                $("#Result").html(`<div class="alert alert-success fade show" role="alert"> Updated the status successfully! </div>`);
                            } else {
                                $("#Result").html(`<div class="alert alert-danger fade show" role="alert"> ${response}</div>`);
                            }
                            setTimeout(function() {
                                $("#Result").html('');
                                location.reload();
                            }, 1000);

                        }
                    });

                });
            });
        });
    </script>

    </html>
<?php
} else {
    header("Location: ../../index.php");
}
?>