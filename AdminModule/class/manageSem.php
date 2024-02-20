<?php

session_start();

if (isset($_SESSION['user_id'])) {


    include('../../includes/config.php');
?>
    <?php
    $id = $_REQUEST['id'];  //getting id from request
    $semsql = "SELECT * FROM erp_sem WHERE cls_id= '$id' "; // selecting value of the record Query
    $semresult = $conn->query($semsql);  //fetching
    ?>
    <!DOCTYPE html>
    <html>

    <head>
        <Title>Manage Semester</Title>
        <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../assets/css/styles_TT.css">

        <script>
            function showdate(id) {
                var formid = "edit_date_form" + id;
                var type = document.getElementById(formid).style.display;
                if (type == 'none') {
                    document.getElementById(formid).style.display = 'flex';
                } else {
                    document.getElementById(formid).style.display = 'none';
                }
            }

            function show() {
                var type = document.getElementById('create_sem').style.display;
                if (type == 'none') {
                    document.getElementById('create_sem').style.display = 'flex';
                } else {
                    document.getElementById('create_sem').style.display = 'none';
                }
            }
        </script>
    </head>

    <body>
        <div class="TT-container">
            <div class="TT-head">
                <h1>Manage Semester</h1>
            </div>
            <div>
                <button class="TT-button" onclick="window.location.href = 'manageClass.php';">MANAGE CLASS</button>
                <button class="TT-button" onclick="window.location.href = '../Admin.php';">Admin Module</button>
            </div>
            <!-- dispaly available semester -->

            <div class="TT-type-display">
                <table class="TT-type-display-table">
                    <thead>
                        <tr>
                            <th>Department Code</th>
                            <th>Batch</th>
                            <th>Course</th>
                            <th>Department</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $classsql = "SELECT * from erp_class where cls_id= '$id' ";
                        $classresult = $conn->query($classsql);
                        $classrow = mysqli_fetch_assoc($classresult);
                        ?>
                        <tr>
                            <td><?php echo $classrow['cls_deptcode']; ?></td>
                            <td><?php echo $classrow['cls_startyr'] . '-' . $classrow['cls_endyr']; ?></td>
                            <td><?php echo $classrow['cls_course']; ?></td>
                            <td><?php echo $classrow['cls_dept']; ?></td>
                        </tr>
                    </tbody>
                </table>
                <?php

                if ($semresult == true) {

                    if ($semresult->num_rows > 0) {

                ?>

                        <table class="TT-type-display-table" id="semdisplay">
                            <thead>
                                <th>Semester</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th colspan="3">Manage</th>
                            </thead>
                            <tbody>
                                <?php
                                $semrow = mysqli_fetch_all($semresult, MYSQLI_ASSOC);
                                $semmsg = $semrow;
                            } else {
                                $semmsg = "No semester Found";
                            }

                            if (is_array($semmsg)) {
                                foreach ($semmsg as $data) {
                                ?>
                                    <tr>
                                        <td><?php echo $data['sem_no'] ?? ''; ?></td>
                                        <td><?php echo $data['sem_start'] ?? ''; ?></td>
                                        <td><?php echo $data['sem_end'] ?? ''; ?></td>
                                        <td>
                                            <button class="btn btn-secondary" onclick="showdate(<?php echo $data['sem_id'] ?? ''; ?>)">Edit End Date</button>
                                            <form id="edit_date_form<?php echo $data['sem_id'] ?? ''; ?>" method="post" enctype="multipart/form-data" style="display: none;">
                                                <input type="date" name="date" id="date">
                                                <input type="text" value="<?php echo $data['sem_id'] ?? ''; ?>" name="semid" id="semid" hidden>
                                                <button class="btn btn-success" type="submit" name="edit" class="TT-button">submit</button>
                                            </form>
                                        </td>
                                        <td>
                                            <button class="btn btn-dark" onclick="window.location.href= 'editsem.php?clsid=<?php echo $data['cls_id']; ?>&sem_id=<?php echo $data['sem_id']; ?>'">Edit</button>
                                        </td>
                                        <td>
                                            <button class="btn btn-danger" onclick="if(confirm('Are you sure you want to delete this item?')) { window.location.href = 'delSem.php?id=<?php echo $data['sem_id']; ?>'; }">Delete</button>
                                        </td>
                                    </tr>
                        <?php
                                }
                            }
                        }
                        ?>
                            </tbody>
                        </table>

                        <div id="Result"></div>
            </div>
            <div class="TT-type-display">
                <button class="btn btn-primary" onclick="show()">Create New Semester</button>
                <hr>
                <form id="create_sem" method="post" class="TT-form" style="display: none;">
                    <h2>Create</h2>
                    <div class="TT-form-content">
                        <input type="hidden" id="clsid" value="<?php echo $id; ?>">
                        <div>
                            <label for="semester">Semester Number</label>
                            <input type="number" name="semester" id="semester" value="" min="1" required>
                        </div>
                        <div>
                            <label for="startdate">Semester Start Date:</label>
                            <input type="date" id="startdate" value="" required>
                        </div>
                    </div>
                    <div class="TT-form-button">
                        <button type="submit" name="create" class="TT-button">Create</button>
                        <button type="reset" class="TT-button">Clear</button>
                    </div>
                </form>
            </div>
        </div>
    </body>

    <script>
        $(document).ready(function() {
            $('#create_sem').submit(function(e) {
                e.preventDefault();

                var clsid = $('#clsid').val();
                var semester = $('#semester').val();
                var startdate = $('#startdate').val();
                var operation = 'create';

                // Preparing input values as form data for Ajax call
                var formData = new FormData(this);
                formData.append('clsid', clsid);
                formData.append('semester', semester);
                formData.append('startdate', startdate);
                formData.append('operation', operation);

                setTimeout(function() {
                    $.ajax({
                        url: 'upload.php',
                        type: 'POST',
                        data: formData,
                        processData: false,
                        contentType: false,
                        success: function(response) {
                            console.log(response);
                            if (response == "OK") {
                                $("#Result").html(`<div class="alert alert-success fade show" role="alert">Created successfully! </div>`);
                            } else {
                                $("#Result").html(`<div class="alert alert-danger fade show" role="alert"> ${response}</div>`);
                            }
                            setTimeout(function() {
                                location.reload();
                            }, 2000);
                        }
                    });
                }, 2000);
            });


            $(document).on('submit', '[id^=edit_date_form]', function(e) {
                e.preventDefault();

                var operation = 'update';
                var formData = new FormData(this);
                formData.append('operation', operation);

                $.ajax({
                    url: 'upload.php',
                    type: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(response) {
                        console.log(response);
                        if (response == "OK") {
                            $("#Result").html(`<div class="alert alert-success fade show" role="alert"> Updated successfully! </div>`);
                        } else {
                            $("#Result").html(`<div class="alert alert-danger fade show" role="alert"> ${response}</div>`);
                        }
                        setTimeout(function() {
                            location.reload();
                        }, 2000);
                    }
                });
            });


        });
    </script>

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