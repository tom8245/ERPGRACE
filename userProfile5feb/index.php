<!-- <!DOCTYPE html>
<html>

<head>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        body {
            background-color: #cfd1d4;
            display: flex;
            justify-content: center;
        }

        .main_container {
            margin-top: 10%;
            height: 300px;
            width: 750px;
            border-radius: 27px;
            background-color: #fff;
            box-shadow: 27px 27px 57px grey;
        }

        input {
            width: 40%;
            padding: 8px;
            padding-left: 20px;
            padding-right: 10px;
            margin-top: 17%;
            margin-left: 8%;
            border-radius: 7px;
        }

        button {
            background-color: #4352da;
            border: none;
            color: white;
            border-radius: 8px;
            margin-top: 110px;
            padding: 10px 25px;
            text-decoration: none;
            cursor: pointer;
        }

        .btn-success {
            padding: 10px 25px;
        }

        .btn-success>a {
            overflow: hidden;
            text-decoration: none;
        }

        @media only screen and (max-width: 900px) {
            .main_container {
                margin-top: 18%;
                margin-left: 10%;
                height: 300px;
                width: 550px;
                border-radius: 27px;
                background-color: #fff;
                box-shadow: 27px 27px 57px grey;
            }
        }
    </style>
</head>

<body>
    <div class="main_container">
        <div class="search_phase">
            <form method="GET" action="./Search User/search_user.php">
                <input type="text" name="search" placeholder="Search Register number or Name ">
                <button type="submit">Search</button>
                <a href="./Create New Profile/create_new_profile.php" class="btn btn-success">Create New User</a>
            </form>
        </div>
    </div>
</body>

</html> -->


<?php

session_start();

if (isset($_SESSION['user_id'])) {

    include('../includes/config.php');

?>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Profile</title>
        <link rel="stylesheet" href="../AdminModule/assets/css/style_TT.css">
    </head>

    <body>

        <div class="Ad-container">
            <div class="Ad-head">
                <h1>User Profile</h1>
            </div>

            <div class="Ad-display">

                <table class="Ad-display-table">
                    <thead>
                        <tr>
                            <th>Faculty User</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './FacultyUser/Create_faculty.php';">Create Faculty</button>
                            </td>
                        </tr>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './FacultyUser/ManageFaculty.php'">Manage Facultuy</button></td>
                        </tr>
                    </tbody>
                </table>
                <table class="Ad-display-table">
                    <thead>
                        <tr>
                            <th>Student User</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './StudentUser/CreateStudent.php';">Create Student</button>
                            </td>
                        </tr>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './StudentUser/ManageStudent.php'">Manage Student</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>
        </div>
    </body>
<?php
} else {
    header("Location: ../index.php");
}
?>