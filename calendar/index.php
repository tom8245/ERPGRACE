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
        <title>Calendar</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" type="" href="../assets/css/style.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .container {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th,
            table td {
                height: 40px;
                width: 80px;
                padding: 10px;
                text-align: center;
                border: 1px solid #ddd;
            }

            table th {
                background-color: #470a52;
                color: #fff;
            }

            .d-flex {
                display: flex;
            }

            .flex-column {
                flex-direction: column;
            }

            .flex-row {
                flex-direction: row;
            }

            .flex-row p {
                margin: 0px;
            }

            .container {
                margin: 10px;
            }

            .events button {
                color: green !important;
            }

            .leave button {
                color: red !important;
            }

            .today {
                color: white !important;
                background-color: var(--pri) !important;
            }

            .today button {
                color: white !important;
                background-color: var(--pri) !important;
            }

            .fs-day {
                font-size: 30px;
            }

            .fs-day button {
                background-color: transparent;
                border: none;
                color: var(--pri);
            }

            .justify-content-center {
                justify-content: center;
            }

            .align-items-center {
                align-items: center;
            }

            h2 {
                margin: 5px;
            }

            .model-link {
                background-color: white;
                border: none;
                color: #8d1662;
            }

            .cal-event {
                display: flex;
                justify-content: center;
            }

            .cal-event img {
                max-width: 500px;
                max-height: 500px;
            }

            html {
                overflow: scroll;
                overflow-x: hidden;
            }

            ::-webkit-scrollbar {
                width: 0;
                background: transparent;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <div class="d-flex justify-content-center align-items-center">
                <h2>
                    <?php echo date('F - Y'); ?>
                </h2>
            </div>
            <?php include 'calendar.php'; ?>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
            </script>
    </body>
    <?php
} else {
    header("Location: ../index.php");
}
?>