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
    <title>Change Password</title>
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    .pwd-con {
        margin: 10px;
        background-color: #fff;
        padding: 20px 40px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    form {
        display: flex;
        flex-direction: column;
    }

    label {
        margin-bottom: 8px;
    }

    input {
        padding: 8px;
        margin-bottom: 16px;
    }

    .alert h5 {
        margin: 0px
    }

    button {
        padding: 10px;
        background-color: var(--dark);
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    button:hover {
        background-color: var(--pri);
    }

    .alert {
        padding: 10px 30px;
        margin: 10px;
        border-radius: 5px;
    }

    .success {
        background-color: lightgreen;
        color: green;
    }

    .fail {
        background-color: lightpink;
        color: red;
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
    <link rel="stylesheet" href="../assets/css/style.css">
</head>

<body>
    <?php if (isset($_GET['sts'])) {
            if ($_GET['sts'] == 1) {
                ?>
    <div class="alert success">
        <h5>Password Changed Successfully</h5>
    </div>
    <?php
            } elseif ($_GET['sts'] == -1) {
                ?>
    <div class="alert fail">
        <h5>Password Changed Failed</h5>
    </div>
    <?php
            } elseif ($_GET['sts'] == 2) {
                ?>
    <div class="alert fail">
        <h5>Old Password Incorrect</h5>
    </div>
    <?php
            } else {
                ?>
    <div class="alert fail">
        <h5>Password Mismatch</h5>
    </div>
    <?php
            }
        }
        ?>
    <div class="pwd-con">
        <form action="chgpwd_query.php" method="post">
            <h2>Change Password</h2>

            <label for="new_password">Old Password:</label>
            <input type="password" name="old_password" required>

            <label for="new_password">New Password:</label>
            <input type="password" name="new_password" required>

            <label for="confirm_password">Confirm New Password:</label>
            <input type="password" name="confirm_password" required>

            <button type="submit">Change Password</button>
        </form>
    </div>
</body>
<?php
} else {
    header("Location: ../index.php");
}
?>