<?php

session_start();

if (isset($_SESSION['user_id'])) {

    include('../includes/config.php');


    ?>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Anydata Report</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="../assets/css/style.css">
    <style>
    * {
        font-family: sans-serif !important;
    }

    .lbox {
        width: 15px;
        height: 15px;
    }

    .col_blue {
        background-color: blue;
    }

    .col_red {
        background-color: red;
    }

    .col_green {
        background-color: green;
    }

    .col_violet {
        background-color: darkviolet;
    }

    .parent-cls {
        color: darkviolet;
    }

    .student-cls {
        color: blue;
    }

    .staff-cls {
        color: green;
    }

    .common-cls {
        color: red;
    }

    label {
        margin: 0px 5px;
    }

    tr>td {
        padding: 0px 15px;
        font-size: 13px;
    }

    td {
        margin-bottom: 10px !important;
    }

    input,
    select {
        font-size: 11px;
        margin-bottom: 3px;
    }

    /*  */

    .check-tbl #fieldSelectionForm .label-box {
        margin-bottom: 5px;
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
    }


    .check-tbl #fieldSelectionForm label {
        width: 190px;
        font-size: 13px;
        margin-bottom: 3px;
    }

    .checkall label {
        width: 190px;
        font-size: 13px;
        margin-bottom: 3px;
        display: flex;
    }

    .checkall label input {
        margin: 0px;
    }

    .check-tbl #fieldSelectionForm label input {
        margin-right: 10px;
    }

    .check-tbl #fieldSelectionForm button {
        padding: 3px 5px;
        background-color: var(--pri);
        color: white;
        border: none;
        border-radius: 3px;
        cursor: pointer;
        font-size: 13px;
    }

    .btn-pri {
        padding: 3px 5px;
        background-color: var(--pri);
        color: white;
        border: none;
        border-radius: 3px;
        cursor: pointer;
        font-size: 13px;
        text-decoration: none;
    }

    .btn-pri:hover,
    .btn-pri:focus {
        background-color: var(--dark);
        color: white;
    }

    .filter div div label {
        padding: 0px 8px;
        font-size: 13px;
    }

    .filter div div select,
    .filter div div input {
        width: 200px;
    }

    #agefr,
    #ageto,
    #expfr,
    #expto {
        width: 30px;
    }

    .filter div div {
        justify-content: space-between;
    }

    .filter div div p {
        margin: 0px 5px;
        padding: 0px 8px;
        font-size: 15px;
        font-weight: 600;
    }

    .check-tbl table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    .check-tbl th,
    .check-tbl td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: left;
    }

    .check-tbl th {
        background-color: var(--pri);
        color: white;
    }

    .check-tbl tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    #reporttable table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    #reporttable th,
    #reporttable td {
        border: 1px solid #ddd;
        text-align: left;
    }

    .table-responsive {
        overflow: scroll;
        max-width: 80rem;
        max-height: 39rem;
    }

    .legends label {
        width: unset;
        margin: 0px 5px;
    }

    input[type="checkbox"] {
        margin-bottom: 0px;
    }

    .mr-23px {
        margin-right: 23px;
    }

    /*  */
    </style>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="assets/js/script.js"></script>
    <script src="assets/js/html2pdf.js/dist/html2pdf.bundle.js"></script>
</head>

<body>
    <div class="card text-bg-light mx-3 my-1">
        <div class="report-head p-2 d-flex justify-content-center">
            <h3>ANY DATA REPORT</h3>
        </div>
        <div class="card-header border-top">
            <div class="d-flex flex-row justify-content-between">
                <h6 class='mb-0'>SEARCH</h6>
                <h6 class='mb-0'>* INDICATES MANDATORY FIELDS</h6>
            </div>
        </div>
        <div class="card-body py-1 d-flex flex-column align-items-center justify-content-center">
            <form method="POST" id="reportform">
                <div class="d-flex flex-row flex-wrap justify-content-center filter">
                    <div class="d-flex flex-column">
                        <div class="d-flex">
                            <p>General</p>
                        </div>
                        <div class="d-flex flex-row">
                            <label for="fname" class="">First name:</label><br>
                            <input type="text" id="fname" name="fname">
                        </div>
                        <div class="d-flex flex-row">
                            <label for="lname" class="">Last name:</label><br>
                            <input type="text" id="lname" name="lname">
                        </div>
                        <div class="d-flex flex-row">
                            <label for="dept" class="">Department:</label><br>
                            <select id="dept" name="dept" class="">
                                <option value="">--select--</option>
                                <?php
                                    $sql = "SELECT distinct cls_dept FROM `erp_class`";
                                    $result = mysqli_query($conn, $sql);

                                    if (mysqli_num_rows($result) > 0) {
                                        // output data of each row
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            ?>
                                <option value='<?php echo $row['cls_dept']; ?>'>
                                    <?php echo $row['cls_dept']; ?>
                                </option>
                                <?php
                                        }
                                    }
                                    ?>
                            </select>
                        </div>
                        <div class=" d-flex flex-row">
                            <label for="age" class="">Age:</label><br>
                            <div class="d-flex justify-content-between">
                                <div class="d-flex justify-content-between">
                                    <label for="agefr" class="">From:</label><br>
                                    <input type="text" id="agefr" name="agefr">
                                </div>
                                <div class="d-flex justify-content-between">
                                    <label for="ageto" class="">To:</label><br>
                                    <input type="text" id="ageto" name="ageto">
                                </div>
                            </div>
                        </div>
                        <div class="d-flex flex-row">
                            <label for="exp" class="">Experience:</label><br>
                            <div class="d-flex justify-content-between">
                                <div class="d-flex justify-content-between">
                                    <label for="expfr" class="">From:</label><br>
                                    <input type="text" id="expfr" name="expfr">
                                </div>
                                <div class="d-flex justify-content-between">
                                    <label for="expto" class="">To:</label><br>
                                    <input type="text" id="expto" name="expto">
                                </div>
                            </div>
                        </div>
                        <div class="d-flex flex-row">
                            <label for="mobile" class="">Mobile Number:</label><br>
                            <input type="text" id="mobile" name="mobile">
                        </div>
                    </div>
                    <div class="d-flex flex-column">
                        <div class="d-flex flex-row">
                            <label for="sem" class="">Class:</label><br>
                            <select id="sem" name="sem" class="">
                                <option value="">--select--</option>
                                <?php
                                    $sql = "SELECT distinct cls_startyr,cls_endyr,cls_course,cls_dept,cls_sem FROM `erp_class`";
                                    $result = mysqli_query($conn, $sql);

                                    if (mysqli_num_rows($result) > 0) {
                                        // output data of each row
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            ?>
                                <option
                                    value='<?php echo $row['cls_startyr'] . ',' . $row['cls_endyr'] . ',' . $row['cls_course'] . ',' . $row['cls_dept'] . ',' . $row['cls_sem']; ?>'>
                                    <?php echo $row['cls_startyr'] . ' - ' . $row['cls_endyr'] . ' ' . $row['cls_course'] . ' ' . $row['cls_dept'] . ' ' . $row['cls_sem'] . ' Semester'; ?>
                                </option>
                                <?php
                                        }
                                    }
                                    ?>
                            </select>
                        </div>
                        <div class="d-flex flex-row">
                            <label for="qlf" class="">Qualification:</label><br>
                            <input type="text" id="qlf" name="qlf">
                        </div>
                        <div class="d-flex flex-row">
                            <label for="regno" class="">Reg No:</label><br>
                            <input id="regno" name="regno" class="">
                        </div>
                        <div class="d-flex flex-row">
                            <label for="gen" class="">Gender:</label><br>
                            <select id="gen" name="gen" class="">
                                <option value="">--select--</option>
                                <?php
                                    $sql = "SELECT distinct stu_gender FROM `erp_student`";
                                    $result = mysqli_query($conn, $sql);
                                    if (mysqli_num_rows($result) > 0) {
                                        // output data of each row
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            ?>
                                <option value='<?php echo $row['stu_gender'] ?>'>
                                    <?php echo $row['stu_gender']; ?>
                                </option>
                                <?php
                                        }
                                    }
                                    ?>
                            </select>
                        </div>
                        <div class="d-flex flex-row">
                            <label for="blood" class="">Blood Group:</label><br>
                            <select id="blood" name="blood" class="">
                                <option value="">--select--</option>
                                <?php
                                    $sql = "SELECT distinct stu_bloodgrp FROM `erp_student`";
                                    $result = mysqli_query($conn, $sql);
                                    if (mysqli_num_rows($result) > 0) {
                                        // output data of each row
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            ?>
                                <option value='<?php echo $row['stu_bloodgrp'] ?>'>
                                    <?php echo $row['stu_bloodgrp']; ?>
                                </option>
                                <?php
                                        }
                                    }
                                    ?>
                            </select>
                        </div>
                        <div class="d-flex flex-row">
                            <label for="role" class="">Role:</label><br>
                            <select id="role" name="role" class="">
                                <option value="">--select--</option>
                                <?php
                                    $sql = "SELECT distinct r_rolename,r_id FROM `erp_role`";
                                    $result = mysqli_query($conn, $sql);
                                    if (mysqli_num_rows($result) > 0) {
                                        // output data of each row
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            ?>
                                <option value='<?php echo $row['r_id'] ?>'>
                                    <?php echo $row['r_rolename']; ?>
                                </option>
                                <?php
                                        }
                                    }
                                    ?>
                                    <option>student</option>
                            </select>
                        </div>
                    </div>
                    <div class="d-flex flex-column">
                        <div class="d-flex">
                            <p>Transport</p>
                        </div>
                        <div class="d-flex flex-row">
                            <label for="transport" class="">Transport:</label><br>
                            <select id="transport" name="transport" class="">
                                <option value="">--select--</option>
                                <?php
                                    $sql = "SELECT distinct stu_transport FROM `erp_student`";
                                    $result = mysqli_query($conn, $sql);
                                    if (mysqli_num_rows($result) > 0) {
                                        // output data of each row
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            ?>
                                <option value='<?php echo $row['stu_transport'] ?>'>
                                    <?php echo $row['stu_transport']; ?>
                                </option>
                                <?php
                                        }
                                    }
                                    ?>
                            </select>
                        </div>
                        <div class="d-flex flex-row">
                            <label for="route" class="">Route:</label><br>
                            <select id="route" name="route" class="">
                                <option value="">--select--</option>
                                <?php
                                    $sql = "SELECT distinct tr_routeno FROM `erp_transport`";
                                    $result = mysqli_query($conn, $sql);

                                    if (mysqli_num_rows($result) > 0) {
                                        // output data of each row
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            ?>
                                <option value='<?php echo $row['tr_routeno'] ?>'>
                                    <?php echo $row['tr_routeno']; ?>
                                </option>
                                <?php
                                        }
                                    }
                                    ?>
                            </select>
                        </div>
                        <div class="d-flex flex-row">
                            <label for="stop" class="">Stop:</label><br>
                            <select id="stop" name="stop" class="">
                                <option value="">--select--</option>
                                <?php
                                    $sql = "SELECT distinct tr_stop FROM `erp_transport`";
                                    $result = mysqli_query($conn, $sql);

                                    if (mysqli_num_rows($result) > 0) {
                                        // output data of each row
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            ?>
                                <option value='<?php echo $row['tr_stop'] ?>'>
                                    <?php echo $row['tr_stop']; ?>
                                </option>
                                <?php
                                        }
                                    }
                                    ?>
                            </select>
                        </div>
                        <div class="d-flex">
                            <p>Hostel</p>
                        </div>
                        <div class="d-flex flex-row">
                            <label for="hos" class="">Hostel:</label><br>
                            <select id="hos" name="hos" class="">
                                <option value="">--select--</option>
                                <?php
                                    $sql = "SELECT distinct stu_hostel FROM `erp_student`";
                                    $result = mysqli_query($conn, $sql);

                                    if (mysqli_num_rows($result) > 0) {
                                        // output data of each row
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            ?>
                                <option value='<?php echo $row['stu_hostel'] ?>'>
                                    <?php echo $row['stu_hostel']; ?>
                                </option>
                                <?php
                                        }
                                    }
                                    ?>
                            </select>
                        </div>
                    </div>
                    <div class="d-flex flex-column">
                        <div class="d-flex">
                            <p>Scholarship</p>
                        </div>
                        <div class="d-flex flex-row">
                            <label for="comm" class="">Community:</label><br>
                            <select id="comm" name="comm" class="">
                                <option value="">--select--</option>
                                <?php
                                    $sql = "SELECT distinct stu_community FROM `erp_student`";
                                    $result = mysqli_query($conn, $sql);
                                    if (mysqli_num_rows($result) > 0) {
                                        // output data of each row
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            ?>
                                <option value='<?php echo $row['stu_community'] ?>'>
                                    <?php echo $row['stu_community']; ?>
                                </option>
                                <?php
                                        }
                                    }
                                    ?>
                            </select>
                        </div>
                        <div class="d-flex flex-row">
                            <label for="caste" class="">Caste:</label><br>
                            <select id="caste" name="caste" class="">
                                <option value="">--select--</option>
                                <?php
                                    $sql = "SELECT distinct stu_caste FROM `erp_student`";
                                    $result = mysqli_query($conn, $sql);

                                    if (mysqli_num_rows($result) > 0) {
                                        // output data of each row
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            ?>
                                <option value='<?php echo $row['stu_caste'] ?>'>
                                    <?php echo $row['stu_caste']; ?>
                                </option>
                                <?php
                                        }
                                    }
                                    ?>
                            </select>
                        </div>
                        <div class="d-flex flex-row">
                            <label for="rel" class="">Religion:</label><br>
                            <select id="rel" name="rel" class="">
                                <option value="">--select--</option>
                                <?php
                                    $sql = "SELECT distinct stu_religion FROM `erp_student`";
                                    $result = mysqli_query($conn, $sql);

                                    if (mysqli_num_rows($result) > 0) {
                                        // output data of each row
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            ?>
                                <option value='<?php echo $row['stu_religion'] ?>'>
                                    <?php echo $row['stu_religion']; ?>
                                </option>
                                <?php
                                        }
                                    }
                                    ?>
                            </select>
                        </div>
                        <div class="d-flex flex-row">
                            <label for="quote" class="">Student Quota:</label><br>
                            <select id="quote" name="quote" class="">
                                <option value="">--select--</option>
                                <?php
                                    $sql = "SELECT distinct stu_quota FROM `erp_student`";
                                    $result = mysqli_query($conn, $sql);
                                    if (mysqli_num_rows($result) > 0) {
                                        // output data of each row
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            ?>
                                <option value='<?php echo $row['stu_quota'] ?>'>
                                    <?php echo $row['stu_quota']; ?>
                                </option>
                                <?php
                                        }
                                    }
                                    ?>
                            </select>
                        </div>
                        <div class="d-flex flex-row">
                            <label for="aadhar" class="">Aadhar No:</label><br>
                            <input type="text" id="aadhar" name="aadhar">
                        </div>
                        <div class="d-flex flex-row">
                            <label for="bankno" class="">Bank Account No:</label><br>
                            <input id="bankno" name="bankno" class="">
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-between align-content-center align-items-center checkall">
                    <label for="checkAll">Check All&nbsp;
                        <input type="checkbox" id="checkAll" onchange="checkAllCheckboxes()">
                    </label>
                    <div class="d-flex flex-row justify-content-center align-items-center legends">
                        <label for="admno" class="w-100">Legends:</label><br>
                        <div class="d-flex flex-row justify-content-between align-items-center">
                            <input type="checkbox" id="stucheckAll" onchange="studentCheckboxes()">&ensp;
                            <div class="lbox col_blue"></div>&nbsp;
                            <label class="">
                                Student
                            </label>
                        </div>&ensp;
                        <div class="d-flex flex-row justify-content-between align-items-center">
                            <input type="checkbox" id="stacheckAll" onchange="staffCheckboxes()">&ensp;
                            <div class="lbox col_green"></div>&nbsp;
                            <label class="">
                                Staff
                            </label>
                        </div>&ensp;
                        <div class="d-flex flex-row justify-content-between align-items-center">
                            <input type="checkbox" id="parcheckAll" onchange="parentCheckboxes()">&ensp;
                            <div class="lbox col_violet"></div>&nbsp;
                            <label class="">
                                Parent
                            </label>
                        </div>&ensp;
                        <div class="d-flex flex-row justify-content-between align-items-center">
                            <input type="checkbox" id="comcheckAll" onchange="commonCheckboxes()">&ensp;
                            <div class="lbox col_red"></div>&nbsp;
                            <label class="">
                                Common
                            </label>
                        </div>
                    </div>
                </div>
                <div class="d-flex flex-column check-tbl">
                    <div class="form" id="fieldSelectionForm">
                        <div class="label-box">
                            <?php
                                $fieldMappings = [
                                    'First Name' => 'common-cls',
                                    'Designation' => 'staff-cls',
                                    'Last Name' => 'common-cls',
                                    'Department' => 'common-cls',
                                    'Class' => 'student-cls',
                                    'Mobile Number' => 'common-cls',
                                    'Photo' => 'common-cls',
                                    'Blood Group' => 'common-cls',
                                    'Student Quota' => 'student-cls',
                                    'Community' => 'common-cls',
                                    'Caste' => 'common-cls',
                                    'Aadhaar No' => 'common-cls',
                                    'Admission Date' => 'student-cls',
                                    'Admission Number' => 'student-cls',
                                    'Email' => 'common-cls',
                                    'City' => 'common-cls',
                                    'Class Advisor' => 'staff-cls',
                                    'Date of Birth' => 'common-cls',
                                    'Date Of Joining' => 'staff-cls',
                                    // 'Dietary Needs Details',
                                    'Disability' => 'common-cls',
                                    'DisabilityDetails' => 'student-cls',
                                    'Drop Time' => 'common-cls',
                                    'Education Details' => 'student-cls',
                                    'Emergency Contact number' => 'common-cls',
                                    'Faculty ID' => 'staff-cls',
                                    'Experience' => 'staff-cls',
                                    'Experience Details' => 'staff-cls',
                                    'Extra Curricular Activities' => 'student-cls',
                                    'Father Education' => 'parent-cls',
                                    'Father Name' => 'parent-cls',
                                    'Father Mobile' => 'parent-cls',
                                    'Father Occupation' => 'parent-cls',
                                    'Food Offering' => 'common-cls',
                                    'Full Name' => 'common-cls',
                                    'Gender' => 'common-cls',
                                    'Hostel' => 'common-cls',
                                    'Identification Marks' => 'common-cls',
                                    'Mother Name' => 'parent-cls',
                                    'Mother Mobile' => 'parent-cls',
                                    'Mother Occupation' => 'parent-cls',
                                    'Mother Tongue' => 'common-cls',
                                    'Nationality' => 'common-cls',
                                    'Guardian Name' => 'parent-cls',
                                    'Guardian Mobile Phone' => 'parent-cls',
                                    'Permanent Address' => 'common-cls',
                                    'Personal doctor details' => 'student-cls',
                                    'Pick Time' => 'common-cls',
                                    'Pin Code' => 'common-cls',
                                    'Qualification' => 'staff-cls',
                                    'Reg. No.' => 'student-cls',
                                    'Religion Name' => 'common-cls',
                                    'Role Name' => 'common-cls',
                                    'Roll Number' => 'common-cls',
                                    'Room' => 'student-cls',
                                    'Route' => 'common-cls',
                                    'Scholarship' => 'student-cls',
                                    'Sibling Details' => 'student-cls',
                                    'Siblings in Same Institute' => 'student-cls',
                                    'Staff Child' => 'staff-cls',
                                    'State Name' => 'common-cls',
                                    'Stop Name' => 'common-cls',
                                    'TC Comments' => 'student-cls',
                                    'TC Number' => 'student-cls',
                                    'Transfer Details' => 'student-cls',
                                    'Transport' => 'common-cls',
                                    'Type of Disability' => 'student-cls',
                                    'Account Name' => 'student-cls',
                                    'Account No' => 'student-cls',
                                    'IFSC code' => 'student-cls',
                                    'Bank Name' => 'student-cls',
                                    'Branch Name' => 'student-cls',
                                    'Scholarship Status' => 'student-cls',
                                ];

                                $checkbox = array();
                                foreach ($fieldMappings as $fullName => $class) {
                                    echo "<label class='$class'><input type='checkbox' id='$fullName' name='checkbox[]' value='$fullName'>$fullName</label>";
                                }
                                ?>
                        </div>
                        <div class=" d-flex justify-content-end mr-23px">
                            <button type="button" id="searchbtn">Search</button>
                        </div>
                        <!-- <input type="submit" value="submit"> -->
                    </div>
                </div>
                <div class="mt-2">
                    <div id="reporttable">
                        <!-- The selected fields will be displayed here -->
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
    </script>
    <script>
    $(() => {
        $("#searchbtn").click(function(ev) {
            ev.preventDefault();
            var form = $("#reportform");
            var url = './ajax/getreport.php';
            $.ajax({
                type: "POST",
                url: url,
                data: form.serialize(),
                success: function(data) {
                    $("#reporttable").html(data);
                },
                error: function(data) {
                    alert("some  Error");
                }
            });

        });

    });


    function exportpdf() {
        var form = document.getElementById('reportform');
        form.action = './ajax/export_pdf.php';
        form.method = 'post';
        form.submit();
    }

    function exportexcel() {
        var form = document.getElementById('reportform');
        form.action = './ajax/export_excel.php';
        form.method = 'post';
        form.submit();
    }

    document.getElementById('First Name').checked = true;
    document.getElementById('Last Name').checked = true;
    </script>
</body>

</html>
<?php
} else {
    header("Location: ../index.php");
}
?>