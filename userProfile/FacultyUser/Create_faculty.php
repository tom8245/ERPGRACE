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
        <title>Create Faculty</title>
        <link rel="stylesheet" type="text/css" href="../../AdminModule/assets/css/styles_TT.css">
        <!-- Jquery-3 -->
        <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <!-- sweet alert JS -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script>
            function togglePasswordVisibility() {
                const passwordInput = document.getElementById("password");
                if (passwordInput.type === "password") {
                    passwordInput.type = "text";
                } else {
                    passwordInput.type = "password";
                }
            }


            function validatePassword() {
                const passwordInput = document.getElementById("password");
                const passwordError = document.getElementById("passwordError");
                const regex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/;
                if (!regex.test(passwordInput.value)) {
                    passwordError.innerHTML = "Password must be at least 8 characters long, and include at least one uppercase letter, one lowercase letter, and one number.";
                } else {
                    passwordError.innerHTML = "";
                }
            }

            function validateConfirmPassword() {
                const confirmPasswordInput = document.getElementById("confirmPassword");
                const confirmPasswordError = document.getElementById("confirmPasswordError");
                const passwordInput = document.getElementById("password");
                if (confirmPasswordInput.value !== passwordInput.value) {
                    confirmPasswordError.innerHTML = "Passwords do not match.";
                } else {
                    confirmPasswordError.innerHTML = "";
                }
            }

            function populateid() {
                var fid = document.getElementById('fid').value;
                document.getElementById('username').value = fid;
                document.getElementById('username2').value = fid;
            }
        </script>
    </head>

    <body>
        <div class="TT-container">
            <div class="TT-head">
                <h1>Faculty Profile</h1>
            </div>
            <div>
                <button class="TT-button" onclick="window.location.href = 'ManageFaculty.php';">Manage Profile</button>
                <button class="TT-button" onclick="window.location.href = '../index.php';">User Profile</button>
            </div>
            <form method="post" id="create_faculty_form" action="faculty_data.php" enctype="multipart/form-data" class="TT-form">
                <h2>Personal Details</h2>
                <div class="TT-form-content">
                    <div>
                        <label for="f_id">Faculty ID* :</label>
                        <input type="text" name="f_id" id="fid" placeholder="Enter your Faculty id" onchange="populateid()" required>
                    </div>
                    <div>
                        <label for="profile_pic">Profile Picture :</label>
                        <input type="file" name="profileImage[]" id="profile_pic" placeholder="Upload your picture" onchange="">
                    </div>
                    <div>
                        <label for="Salutations">Salutations: </label>
                        <select name="Salutations" id="Salutations" required>
                            <option>Select your Salutation</option>
                            <option value="Dr">Dr</option>
                            <option value="Mr">Mr</option>
                            <option value="Mrs">Mrs</option>
                            <option value="Ms">Ms</option>
                        </select>
                    </div>
                    <div>
                        <label for="first_name">First Name* :</label>
                        <input type="text" name="first_name" value="" id="first_name" placeholder="Enter your First Name" required>
                    </div>
                    <div>
                        <label for="last_name">Last Name : </label>
                        <input type="text" name="last_name" value="" id="last_name" placeholder="Enter your Last Name">
                    </div>
                    <div>
                        <label for="Initials">Initials: </label>
                        <input type="text" name="Initials" value="" id="Initials" placeholder="Enter your Initials ">
                    </div>
                    <div>
                        <label for="date_of_birth">Date of Birth* :</label>
                        <input type="date" name="date_of_birth" value="" id="date_of_birth" placeholder="Enter your Date Of Birth" required>
                    </div>
                    <div>
                        <label for="gender">Gender*:</label>
                        <span>
                            <input type="radio" name="gender" value="Male" checked>Male
                            <input type="radio" name="gender" value="Female">Female
                        </span>
                    </div>
                    <div>
                        <label for="dept">Department :</label>
                        <select name="dept">
                            <option>Select your Department</option>
                            <?php
                            $deptsql = "select distinct cls_dept from erp_class ";
                            $deptresult = $conn->query($deptsql);
                            while ($row = mysqli_fetch_assoc($deptresult)) {
                                $dept = $row['cls_dept'];
                                echo '<option value="' . $dept . '">' . $dept . '</option>';
                            }
                            ?>
                        </select>
                    </div>
                    <div>
                        <label for="designation">Designation :</label>
                        <select name="designation">
                            <option selected>Select your designation</option>
                            <option value="Assistant Professor">Assistant Professor</option>
                            <option value="Associate Professor">Associate Professor</option>
                            <option value="HOD">HOD</option>
                            <option value="Principal">Principal</option>
                        </select>
                    </div>
                    <div>
                        <label for="qualification">Qualification:</label>
                        <input type="text" id="qualification" value="" name="qualification" placeholder="Qualification" required>
                    </div>
                    <div>
                        <label for="experiance">Experience :</label>
                        <input type="number" name="experience" value="" id="experience" placeholder="Enter your experience" required />
                    </div>
                    <div>
                        <label for="role">Role :</label>
                        <select name="role" required>
                            <option >Select Role:</option>
                            <?php
                            $rolesql = "SELECT DISTINCT r_id,r_rolename from erp_role ";
                            $roleresult = $conn->query($rolesql);
                            while ($row = mysqli_fetch_assoc($roleresult)) {
                                $id = $row['r_id'];
                                $name = $row['r_rolename'];
                                echo '<option value="' . $id . '">' . $name . '</option>';
                            }
                            ?>
                        </select>
                    </div>
                    <div>
                        <label for="doj">Date of Joining* :</label>
                        <input type="date" id="doj" name="doj" value="" placeholder="Enter Date Of Joining" required>
                    </div>
                    <div>
                        <label for="mobile_number">Mobile Number :</label>
                        <input type="number" value="" name="mobile_number" id="mobile_number" placeholder="Enter your contact number" required />
                    </div>
                    <div>
                        <label for="email">Email ID : </label>
                        <input type="email" value="" name="email" id="email" placeholder="Enter your Email Address" required>
                    </div>
                </div>

                <div id="loginInfo" class="TT-form-content">
                    <h2>Login Information</h2>
                    <div>
                        <label for="usr_name">User Name (Same as Id):</label>
                        <input type="text" value="" name="usr_name" id="username" disabled>
                    </div>
                    <div>
                        <label for="password">Password:</label>
                        <span>
                            <input type="password" id="password" value="" name="password" placeholder="Enter your password" onchange="validatePassword()" required>
                            <input type="checkbox" id="showPassword" onchange="togglePasswordVisibility()">
                        </span>
                        <br><span id="passwordError" style="color: red;"></span>
                    </div>
                    <div>
                        <label for="confirmPassword">Confirm password:</label>
                        <input type="password" id="confirmPassword" value="" name="confirmPassword" placeholder="Confirm your password" onchange="validateConfirmPassword()" required>
                        <br><span id="confirmPasswordError" style="color: red;"></span>
                    </div>
                </div>
                <div class="TT-form-button">
                    <button type="submit" name="create" class="TT-button">Create Profile</button>
                    <button type="reset" class="TT-button">Clear</button>
                </div>
            </form>
            <form id="redirectFidValueForm" method="post" enctype="multipart/form-data" action="ViewFaculty.php">
                <div>
                    <label for="usr_name" hidden>Id:</label>
                    <input type="text" value="" name="fid" id="username2" hidden>
                </div>
            </form>
            <div id="Result"></div>
        </div>
    </body>
    <script>
        $(document).ready(function() {
            $('#create_faculty_form').submit(function(e) {
                e.preventDefault();

                //  Acquiring values from the input fields from create faculty form
                var fileSize = 0;
                var fid = $('#fid').val();
                var profile_pic = $('#profile_pic').val();

                var first_name = $('#first_name').val();
                var last_name = $('#last_name').val();
                var Initials = $('#Initials').val();
                var Salutations = $('#Salutations').val();

                var date_of_birth = $('#date_of_birth').val();
                var gender = $('input[name="gender"]:checked').val(); // Radio buttons need special handling
                var dept = $('select[name="dept"]').val();
                var designation = $('select[name="designation"]').val();
                var qualification = $('#qualification').val();
                var experience = $('#experience').val();
                var role = $('select[name="role"]').val();
                var doj = $('#doj').val();
                var mobile_number = $('#mobile_number').val();
                var email = $('#email').val();
                var username = $('#username').val();
                var password = $('#password').val();
                var confirmPassword = $('#confirmPassword').val();
                var operation = 'insert';
                last_name = last_name + " " + Initials;

                first_name = Salutations + "." + first_name;

                // Preparing input values as form data for Ajax call
                var formData = new FormData(this);
                formData.append('f_id', fid);
                formData.append('first_name', first_name);
                formData.append('last_name', last_name);
                formData.append('date_of_birth', date_of_birth);
                formData.append('gender', gender);
                formData.append('dept', dept);
                formData.append('designation', designation);
                formData.append('qualification', qualification);
                formData.append('experience', experience);
                formData.append('role', role);
                formData.append('doj', doj);
                formData.append('mobile_number', mobile_number);
                formData.append('email', email);
                formData.append('username', username);
                formData.append('password', password);
                formData.append('confirmPassword', confirmPassword);
                formData.append('operation', operation);

                // Logic for checking the size of the image file being uploaded
                if ($("#profile_pic").val() !== '') {
                    // Logic for checking the size of the image file being uploaded
                    var fileSize = ($("#profile_pic")[0].files[0].size / 1024);
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
                                    $("#Result").html(`<div class="alert alert-success fade show" role="alert"> Created successfully! </div>`);
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