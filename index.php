<?php
session_start();
include('includes/config.php');

if (isset($_POST['username']) && isset($_POST['password'])) {

    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);

    $sql = "SELECT * FROM erp_login WHERE log_id='$username' AND log_pwd='$password'";
    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) == 1) {
        $_SESSION['user_id'] = $username;
        $sql = "SELECT * FROM erp_faculty";
        $result = mysqli_query($conn, $sql);
        $facultyAll = array();
        while ($row = $result->fetch_assoc()) {
            $facultyAll[] = $row;
        }
        // Find logged in user from faculty table
        foreach ($facultyAll as $faculty) {
            if ($username == $faculty['f_id']) {
                $faculty_role_id = $faculty['f_role']; // The role id of the logged in faculty
            }
        }
        $_SESSION['faculty_role_id'] = $faculty_role_id;

        // Match role id to erp role table
        $sql = 'SELECT * FROM erp_role';
        $result = mysqli_query($conn, $sql);
        $roles = array();
        while ($row = $result->fetch_assoc()) {
            $roles[] = $row;
        }

        // Find access pages for role found
        foreach ($roles as $role) {
            if ($role['r_id'] ==  $faculty_role_id) {
                $faculty_access = $role['r_access'];
            }
        }
        $_SESSION['access'] = $faculty_access;

        header("Location: ./dashboard/index.php");
        exit();
    } else {
        $sql = "SELECT * FROM `erp_login` left join erp_student on erp_login.log_id=erp_student.stu_id WHERE stu_regno='$username' AND log_pwd='$password'";
        $result = mysqli_query($conn, $sql);

        if (mysqli_num_rows($result) == 1) {
            $_SESSION['user_id'] = $username;

            header("Location: ./dashboard/index.php");
            exit();
        } else {
            echo "<script>alert('Invalid Username Or Password.');</script>";
        }
    }
}

// mysqli_close($conn);
?>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>GracER | Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        ul {
            list-style: none;
        }

        h4 {
            color: #470a52;
        }

        li,
        label {
            color: #8d1662;
        }

        body {
            background: linear-gradient(#fdfdfd00, #fdfdfd), url(assets/img/clg_wide_drone.JPG) center;
            background-repeat: no-repeat;
            background-size: cover;
            height: 700px;
            overflow: hidden;
        }

        .login-box {
            bottom: 60px;
            right: 40px;
        }
    </style>
</head>

<body>
    <div class="d-flex flex-column m-2 jerald_abishek">
        <div class="d-flex align-items-center justify-content-center">
        </div>
        <div class="d-flex flex-row justify-content-around">
            <div class="d-flex w-25 shadow m-2 p-2 rounded-2 bg-light position-absolute login-box">
                <form method='post' class='w-100'>
                    <h4 class='mb-3'>GracER | Login </h4>
                    <hr>
                    <div class="d-flex flex-column">
                        <div class="d-flex flex-row mb-3">
                            <label class="form-label w-50">User Id :</label>
                            <input type="text" id="username" name="username" class="form-control form-control-sm" aria-describedby="emailHelp">
                        </div>
                        <div class="d-flex flex-row mb-3">
                            <label class="form-label w-50">Password :</label>
                            <input type="password" id="password" name="password" class="form-control form-control-sm">
                        </div>
                        <div class="d-flex flex-row justify-content-end mb-3">
                            <button type="submit" class="btn btn-primary btn-sm">Login</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous">
    </script>
</body>

</html>f