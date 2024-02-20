<?php

session_start();

if (isset($_SESSION['user_id'])) {

    include '../includes/config.php';

?>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Module</title>
        <link rel="stylesheet" href="./assets/css/style_TT.css">
    </head>

    <body>

        <div class="Ad-container">
            <div class="Ad-head">
                <h1>Admin module</h1>
            </div>
            <!-- John's module -->
            <div class="Ad-head">
                <h2>Academics</h2>
            </div>
            <div class="Ad-display">
                <table class="Ad-display-table">
                    <thead>
                        <tr>
                            <th>Manage Time Table</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './Timetable/createtype.php';">Create New Time Table
                                    Type</button></td>
                        </tr>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './Timetable/managetypes.php';">Manage Time Table
                                    Type</button></td>
                        </tr>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './Timetable/createTT.php';">Create Time Table</button>
                            </td>
                        </tr>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './Timetable/manageTT.php';">Manage Time Table</button>
                            </td>
                        </tr>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './Timetable/viewTT.php';">View student Time Table</button></td>
                        </tr>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './Timetable/facultyview.php';">View faculty Time Table</button></td>
                        </tr>
                    </tbody>
                </table>
                <table class="Ad-display-table">
                    <thead>
                        <tr>
                            <th>Manage Exam</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './Exam/Create.php';">Create
                                    Test</button></td>
                        </tr>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './Exam/Createexam.php';">Create
                                    Exam</button></td>
                        </tr>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './Exam/Manage_exam.php';">Manage
                                    Exam</button></td>
                        </tr>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './Exam/Create_other_exam.php';">Create Other
                                    Exam</button></td>
                        </tr>
                    </tbody>
                </table>
                <table class="Ad-display-table">
                    <thead>
                        <tr>
                            <th>Subject</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './subject/Create_subject.php';">Create Subject</button>
                            </td>
                        </tr>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './subject/subject.php';">Manage
                                    Subject</button></td>
                        </tr>
                    </tbody>
                </table>
                <table class="Ad-display-table">
                    <thead>
                        <tr>
                            <th>Class</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './class/createclass.php';">Create New Class</button></td>
                        </tr>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './class/manageClass.php';">Manage Class</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Thomas's module - Dashboard management -->
            <div class="Ad-head">
                <h2>Dashboard</h2>
            </div>
            <div class="Ad-display">
                <table class="Ad-display-table">
                    <thead>
                        <tr>
                            <th>Quotes</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './Events/quotes_create.php';">Create Quotes</button></td>
                        </tr>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './Events/quotes_manage.php';">Manage Quotes</button></td>
                        </tr>
                    </tbody>
                </table>
                <table class="Ad-display-table">
                    <thead>
                        <tr>
                            <th>
                                Notices</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './Events/notices_insert.php';">Create Notices</button></td>
                        </tr>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './Events/notices_manage.php';">Manage Notices</button></td>
                        </tr>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './Events/saved_notices.php';">Manage Saved Notices</button></td>
                        </tr>
                    </tbody>
                </table>
                <table class="Ad-display-table">
                    <thead>
                        <tr>
                            <th>Calender Events</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './Events/calender_create.php';">Create Event</button></td>
                        </tr>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './Events/calender_manage.php';">Manage Events</button></td>
                        </tr>
                    </tbody>
                </table>
                <table class="Ad-display-table">
                    <thead>
                        <tr>
                            <th>Best performer</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './Events/best_performer_create.php';">Create Best Performer</button></td>
                        </tr>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './Events/best_performer_manage.php';">Manage Best Performer</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- Rishu's module - Fee structure management -->
            <div class="Ad-head">
                <h2>Fee</h2>
            </div>
            <div class="Ad-display">
                <table class="Ad-display-table">
                    <thead>
                        <tr>
                            <th>Fee Structure</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './Fees/home.php';">Fee Menu</button></td>
                        </tr>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './Fees/add/add_fee.php';">Add Fee</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Gowtham's module - Gallery management -->
            <div class="Ad-head">
                <h2>Gallery</h2>
            </div>
            <div class="Ad-display">
                <table class="Ad-display-table">
                    <thead>
                        <tr>
                            <th>Gallery Moderation</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './Gallery/Images_Events.php';">Manage Events</button></td>
                        </tr>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './Gallery/UploadImages.php';">Upload Images</button></td>
                        </tr>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './Gallery/Images_All.php';">Manage Images</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Srdihar's module - Gallery management -->
            <div class="Ad-head">
                <h2>Roles & Categories</h2>
            </div>
            <div class="Ad-display">
                <table class="Ad-display-table">
                    <thead>
                        <tr>
                            <th>Roles Management</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './Roles/CreateRoles.php';">Create Roles</button></td>
                        </tr>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './Roles/SearchRoles.php';">Search Roles</button></td>
                        </tr>
                    </tbody>
                </table>
                <table class="Ad-display-table">
                    <thead>
                        <tr>
                            <th>Category Management</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './Roles/CreateCategory.php';">Create Category</button></td>
                        </tr>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './Roles/SearchCategory.php';">Search Category</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="Ad-head">
                <h2>Transport Management</h2>
            </div>
            <div class="Ad-display">
                <table class="Ad-display-table">
                    <thead>
                        <tr>
                            <th>Manage Transport</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './events/transports_manage.php';">Manage Transport Records</button></td>
                        </tr>
                        <tr>
                            <td><button class="Ad-button" onclick="window.location.href = './events/transports.php';">Create Transport Record</button></td>
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