<?php

session_start();

if (isset($_SESSION['user_id'])) {

    include('../../includes/config.php');

?>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create Student</title>
        <link rel="stylesheet" type="text/css" href="../../AdminModule/assets/css/styles_TT.css">
        <!-- Jquery-3 -->
        <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <!-- sweet alert JS -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>

    <body>
        <div class="TT-container">
            <div class="TT-head">
                <h1>Student Profile</h1>
            </div>
            <div>
                <button class="TT-button" onclick="window.location.href = 'ManageStudent.php';">Manage Student Profile</button>
                <button class="TT-button" onclick="window.location.href = '../index.php';">User Profile</button>
            </div>

            <form method="post" id="createStudentForm" action="Studentdataupload.php" enctype="multipart/form-data" class="TT-form">
                <h2>Personal Details</h2>
                <div class="TT-form-content">
                    <div>
                        <label for="sid">Roll Number :</label>
                        <input type="text" id="sId" name="sid" value="" onchange="populateid()">
                    </div>
                    <div>
                        <label for="admno">Register Number :</label>
                        <input type="text" name="admno" id="admno">
                    </div>
                    <div>
                        <label for="studentProfilePic">Profile Picture :</label>
                        <input type="file" name="studentProfileImage[]" id="studentProfilePic" placeholder="Upload your picture" onchange="">
                    </div>
                    <!-- <div>
                        <label for="Salutations">Salutations: </label>
                        <select name="Salutations" id="Salutations" required>
                            <option>Select your Salutation</option>
                            <option value="Dr">Dr</option>
                            <option value="Mr">Mr</option>
                            <option value="Mrs">Mrs</option>
                            <option value="Ms">Ms</option>
                        </select>
                    </div> -->
                    <div>
                        <label for="first_name">First Name :</label>
                        <input type="text" id="fname" name="first_name">
                    </div>
                    <div>
                        <label for="last_name">Last Name : </label>
                        <input type="text" id="lname" name="last_name">
                    </div>
                    <div>
                        <label for="Initials">Initials: </label>
                        <input type="text" name="Initials" value="" id="Initials" placeholder="Enter your Initials ">
                    </div>
                    <div>
                        <label for="date_of_birth">Date of Birth :</label>
                        <input type="date" id="dob" name="date_of_birth">
                    </div>
                    <div>
                        <label for="gender">Gender:</label>
                        <span>
                            <input type="radio" id="male" name="gender" value="Male" checked>Male
                            <input type="radio" id="female" name="gender" value="Female">Female
                        </span>
                    </div>
                    <div>
                        <label for="clsid">Class :</label>
                        <select name="clsid">
                            <option>--Select class--</option>
                            <?php
                            $classsql = "SELECT distinct cls_id,cls_course,cls_dept,cls_startyr,cls_endyr from erp_class ";
                            $classresult = $conn->query($classsql);
                            while ($row = mysqli_fetch_assoc($classresult)) {
                                echo '<option value="' . $row['cls_id'] . '">' . $row['cls_course'] . '-' . $row['cls_dept'] . '. Batch(' . $row['cls_startyr'] . '-' . $row['cls_endyr'] . ')</option>';
                            }
                            ?>
                        </select>
                    </div>

                    <div>
                        <label for="doj">Date of Joining :</label>
                        <input type="date" id="doj" name="doj">
                    </div>
                    <div>
                        <label for="mobile_number">Mobile Number :</label>
                        <input type="number" id="mobileNum" name="mobile_number" />
                    </div>
                    <div>
                        <label for="email">Email ID : </label>
                        <input type="email" id="email" name="email">
                    </div>
                    <div>
                        <label for="coursetype">Course Type :</label>
                        <select name="coursetype">
                            <option>--Select Course Type--</option>
                            <option value="Regular">Regular</option>
                            <option value="Part Time">Part Time</option>
                        </select>
                    </div>
                    <div>
                        <label for="quota">Student quota :</label>
                        <select name="quota">
                            <option>--Select quota Type--</option>
                            <option value="Counselling">Counselling</option>
                            <option value="Management">Management</option>
                        </select>
                    </div>
                    <div>
                        <label for="counsellingNumber">Counselling Number (Optional) : </label>
                        <input type="text" id="counsellingNumber" name="counsellingNumber">
                    </div>
                    <div>
                        <label for="stu_lateral">Lateral Entry:</label>
                        <span>
                            <input type="radio" name="stu_lateral" value="Yes"> Yes
                            <input type="radio" name="stu_lateral" value="No" checked> No
                        </span>
                    </div>
                </div>

                <!-- <div id="loginInfo" class="TT-form-content">
                    <h2>Login Information</h2>
                    <div>
                        <label for="usr_name">User Name (Same as Id):</label>
                        <input type="text" name="usr_name" id="username" disabled >
                    </div>
                    <div>
                        <label for="password">Password:</label>
                        <span>
                            <input type="password" id="password" name="password" placeholder="Enter your password" onchange="validatePassword()" required>
                            <input type="checkbox" id="showPassword" onchange="togglePasswordVisibility()">
                        </span>
                        <br><span id="passwordError" style="color: red;"></span>
                    </div>
                    <div>
                        <label for="confirmPassword">Confirm password:</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" onchange="validateConfirmPassword()" required>
                        <br><span id="confirmPasswordError" style="color: red;"></span>
                    </div>
                </div> -->

                <div class="TT-form-button">
                    <button type="submit" name="create" class="TT-button">Create Profile</button>
                    <button type="reset" class="TT-button">Clear</button>
                </div>
            </form>
            <div id="Result"></div>
            <form id="redirectFidValueForm" method="post" enctype="multipart/form-data" action="ViewStudent.php">
                <div>
                    <label hidden for="usr_name">Id:</label>
                    <input type="text" value="" name="sid" id="username2" hidden>
                </div>
            </form>
        </div>
    </body>

    <script>
        // Populate sid for redirection form
        function populateid() {
            var sid = document.getElementById('sId').value;
            document.getElementById('username2').value = sid;
        }



        $(document).ready(function() {
            $('#createStudentForm').submit(function(e) {
                e.preventDefault();

                //  Acquiring values from the input fields from create faculty form




                // Student details
                var fileSize = 0;
                var sId = $('#sId').val();
                var admno = $("#admno").val();
                var studentProfilePic = $("#studentProfilePic").val(); // Note: File input values are not directly accessible due to security reasons
                
                var fname = $("#fname").val();
                var lname = $("#lname").val();
                var Initials = $('#Initials').val();
                // var Salutations = $('#Salutations').val();

                var dob = $("#dob").val();
                var gender = $("input[name='gender']:checked").val();
                var lateral = $("input[name='stu_lateral']:checked").val();
                var clsid = $("select[name='clsid']").val();
                var doj = $("#doj").val();
                var mobileNum = $("#mobileNum").val();
                var email = $("#email").val();
                var counsellingNumber = $("#counsellingNumber").val();
                var coursetype = $("select[name='coursetype']").val();
                var quota = $("select[name='quota']").val();
                var operation = 'insert';

                last_name = last_name + " " + Initials;

                // first_name = Salutations + "." + first_name;

                // // Log the values to the console
                // console.log("sId:", sId);
                // console.log("admno:", admno);
                // console.log("studentProfilePic:", studentProfilePic);
                // console.log("fname:", fname);
                // console.log("lname:", lname);
                // console.log("dob:", dob);
                // console.log("gender:", gender);
                // console.log("clsid:", clsid);
                // console.log("doj:", doj);
                // console.log("mobileNum:", mobileNum);
                // console.log("email:", email);
                // console.log("coursetype:", coursetype);
                // console.log("quota:", quota);
                // console.log("operation:", operation);

                // Creating artificial form data structure
                var formData = new FormData(this);

                // Append each variable to the FormData object
                formData.append('sId', sId);
                formData.append('admno', admno);
                formData.append('studentProfilePic', studentProfilePic);
                formData.append('fname', fname);
                formData.append('lname', lname);
                formData.append('dob', dob);
                formData.append('gender', gender);
                formData.append('lateral', lateral);
                formData.append('clsid', clsid);
                formData.append('doj', doj);
                formData.append('mobileNum', mobileNum);
                formData.append('email', email);
                formData.append('counsellingNumber', counsellingNumber);
                formData.append('coursetype', coursetype);
                formData.append('quota', quota);
                formData.append('operation', operation);

                // Logic for checking the size of the image file being uploaded
                if ($("#studentProfilePic").val() !== '') {
                    // Logic for checking the size of the image file being uploaded
                    var fileSize = ($("#studentProfilePic")[0].files[0].size / 1024);
                    fileSize = (Math.round(fileSize * 100) / 100);
                }
                setTimeout(function() {
                    if (fileSize <= 800) {
                        $.ajax({
                            url: 'ajax/upload.php',
                            type: 'POST',
                            data: formData,
                            processData: false,
                            contentType: false,
                            success: function(response) {
                                console.log(response);
                                if (response == "OK") {
                                    $("#Result").html(`<div class="alert alert-success fade show" role="alert"> Created successfully! </div>`);
                                    Swal.fire({
                                        title: "Profile created successfully! Would you like to update more profile info?",
                                        showCancelButton: true,
                                        confirmButtonText: "Update",
                                        cancelButtonText: "No, thanks",
                                    }).then((result) => {
                                        if (result.isConfirmed) {
                                            // Redirect to a page for updating more profile info
                                            $("#redirectFidValueForm").submit();
                                        } else {
                                            // Refresh the current page
                                            window.location.reload();
                                        }
                                    });
                                    // if (window.confirm("Profile created successfully! Would you like to update more profile info?")) {
                                    //     // Redirect to a page for updating more profile info
                                    //     $("#redirectFidValueForm").submit();
                                    // } else {
                                    //     // Refresh the current page
                                    //     window.location.reload();
                                    // }
                                } else {
                                    $("#Result").html(`<div class="alert alert-danger fade show" role="alert"> ${response}</div>`);
                                }
                                setTimeout(function() {
                                    $("#Result").html('');
                                }, 5000);

                            }
                        });
                        console.log('Good to upload~!');
                    } else {
                        $("#Result").html(`<div class="alert alert-danger fade show" role="alert"> File size has to be within 800kb</div>`);
                    }
                }, 2000);
            });
        });
    </script>

    </html>
<?php
} else {
    header("Location: ../../index.php");
}
?>