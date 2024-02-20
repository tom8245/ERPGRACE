<?php
session_start();

if (isset($_SESSION['user_id'])) {

  include('../includes/config.php');

  $sql = "SELECT DISTINCT cls_dept FROM erp_class";
  $result = mysqli_query($conn, $sql);
  $existingDepartments = array(); // Take from existing classes in class table
  while ($row = $result->fetch_assoc()) {
    $existingDepartments[] = $row['cls_dept'];
  }
  // print_r($existingDepartments);


  // All of the not posted results
  $sql = "SELECT * FROM res_post_status_vw WHERE res_sts collate utf8mb4_unicode_ci ='Not Posted';";
  $result = mysqli_query($conn, $sql);
  $resultNotPostedArray = array(); // Take from existing classes in class table
  while ($row = $result->fetch_assoc()) {
    $resultNotPostedArray[] = $row;
  }
  // Select exam names
  $sql = "SELECT * FROM `res_post_status_vw` WHERE res_sts collate utf8mb4_unicode_ci ='Not Posted' GROUP BY ce_exam";
  $result = mysqli_query($conn, $sql);
  $examNames = array(); // Take from existing classes in class table
  $departmentNames = array();
  while ($row = $result->fetch_assoc()) {
    $examNames[] = $row['ce_exam'];
  }


  // print_r($examNames);

  // Get classes with result posted, with their mark table entries
  $sql = "SELECT DISTINCT cls_id FROM erp_mark WHERE mark_publish IS NOT NULL;";
  $result = mysqli_query($conn, $sql);
  $classes = array();
  while ($row = $result->fetch_assoc()) {
    $classes[] = $row;
  }

  // Find maximum mark for class
  $maximum_marks = array();
  foreach ($classes as $class) {
    $sql = "SELECT * FROM erp_mark WHERE cls_id=$class[cls_id] ORDER BY erp_mark.mark_publish DESC LIMIT 0,1;";
    $result = mysqli_query($conn, $sql);
    while ($row = $result->fetch_assoc()) {
      $maximum_marks[$class['cls_id']] = $row['mark_publish'];
    }
  }

  $day = date('D');


  // QUERY for selecting all periods (of all departments) and along with it necessary information
  $sql = "SELECT erp_subject.f_id, erp_subject.tt_subcode, erp_subject.sub_name, erp_faculty.f_fname, erp_faculty.f_lname, erp_timetable.tt_day, erp_timetable.tt_period , erp_timetable.sc_id, erp_schedule.sc_frdate, erp_schedule.sc_todate, erp_timetable.cls_id, erp_class.cls_dept, erp_class.cls_sem, CURRENT_DATE AS att_date FROM erp_subject JOIN erp_faculty ON erp_faculty.f_id = erp_subject.f_id JOIN erp_timetable ON erp_timetable.tt_subcode = erp_subject.tt_subcode JOIN erp_class ON erp_class.cls_id = erp_timetable.cls_id JOIN erp_schedule ON erp_timetable.sc_id = erp_schedule.sc_id WHERE CURRENT_DATE BETWEEN sc_frdate AND sc_todate AND tt_day='$day';";
  $result = mysqli_query($conn, $sql);
  $allPeriodsToday = array(); // Take from existing classes in class table
  while ($row = $result->fetch_assoc()) {
    $allPeriodsToday[] = $row;
  }
  // print_r($allPeriodsToday);

  // Select all departments from class table
  $sql = "SELECT DISTINCT cls_dept FROM erp_class";
  $result = mysqli_query($conn, $sql);
  $departments = array(); // Take from existing classes in class table
  while ($row = $result->fetch_assoc()) {
    $departments[] = $row;
  }



?>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <link rel="stylesheet" href="./asset/css/style.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


    <title>Dashboard</title>
    <style>
      body {
        overflow-y: scroll;
      }

      body::-webkit-scrollbar {
        display: none;
      }

      .NotResultPostedTableBody td {
        border: 1px solid grey;
      }

      .home-section .col-sm-6 {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        height: 50vh;
        margin-bottom: 10px;
      }


      .panel {
        max-height: 280px;
        overflow-y: scroll;
        /* width: 640px; */
        margin-top: 10px;
        margin-left: 10px;
      }

      .panel-body {
        min-height: 40px;
      }

      .panel::-webkit-scrollbar {
        display: none;
      }


      label {
        margin-left: 10px;
        display: inline-block;
        max-width: 100%;
        margin-bottom: 5px;
        font-weight: 700;
      }

      .footer1 {
        background-image: linear-gradient(to right, rgb(79, 4, 79), rgb(193, 91, 193));
        text-align: center;
        position: fixed;
        bottom: 0;
        padding: 0.3% 0% 0.3% 0%;
        color: #fff;
        width: 100%;
      }

      .linkbtn {
        background-color: transparent;
        border: unset;
        color: black;
      }

      .linkbtn:hover,
      .linkbtn:active,
      .linkbtn:after,
      .linkbtn:before {
        background-color: transparent;
        border: unset;
        color: black;
      }

      * {
        box-sizing: border-box;
      }

      .row {
        margin-left: -2px;
        margin-right: -2px;
      }

      .row thead {
        position: sticky;
        top: 60px;
      }

      .column {
        flex: 48%;
        padding: 5px;
      }

      .column thead {
        top: 40px;
      }


      table {
        border-collapse: collapse;
        border-spacing: 0;
        width: 100%;
        border: 1px solid #ddd;
      }

      th,
      td {
        text-align: left;
        padding: 2px;
        cursor: pointer;

      }

      tr:nth-child(even) {
        background-color: #f2f2f2;
      }

      .stdcount {
        width: 385px;
        overflow-y: auto;
      }

      .result {
        /* width: 710px; */
        height: fit-content;
      }

      .result,
      .performer {
        width: 48%;

      }

      .result,
      .performer,
      .attendance,
      .stdcount {
        margin: 0 auto;
      }

      .attendance {
        height: fit-content;
        /* width: 710px; */
      }

      /* table {
        border-collapse: collapse;
        width: 100%;
      } */

      .table-header th {
        position: sticky;
        top: 0;
        background-color: #7dd87d;
        z-index: 1;
      }

      .panel-heading {
        position: sticky;
        top: 0;
        background-color: #f4f4f4;
        z-index: 1;
      }

      .panel-primary>.panel-heading {
        color: #fff;
        background-color: #4c9173;
        border-color: #4c9173;
      }

      .column-top th {
        position: sticky;
        top: 40px;
        background-color: #f1b24b;
      }

      #theader {
        position: sticky;
        top: 40px;
        background-color: #fa8572;
      }

      #tattend {
        position: sticky;
        top: 40px;
        background-color: #74bec1;
      }

      .container-top-perform {
        position: sticky;
        top: 40px;
        background-color: #f1b24b;
      }

      .container-top-perform form select,
      label {
        width: min-content;
      }

      .container-top-result {
        position: sticky;
        top: 40px;
        background-color: #fa8572;
      }

      .container-top-attendance {
        position: sticky;
        top: 40px;
        background-color: #74bec1;
      }

      .percentage-above50 thead {
        position: sticky;
        top: 60px;
        background-color: #f1b24b;
      }

      .panel-success>.panel-heading {
        color: #F5F5DC;
        background-color: #d68438;
        border-color: #d6e9c6;
      }

      .panel-success {
        border-color: #d68438;
      }

      .panel-danger>.panel-heading {
        color: #F5F5DC;
        background-color: #516091;
        border-color: #516091;
      }

      .panel-heading {
        position: sticky;
        top: 0;
        color: #F5F5DC;
        background-color: #d68438;
        z-index: 1;
      }

      .panel-danger {
        border-color: #516091;
      }

      .panel-info>.panel-heading {
        color: #F5F5DC;
        background-color: #b24968;
        border-color: #b24968;
      }

      .panel-info {
        border-color: #b24968;
      }
    </style>
  </head>

  <body style="padding-top: 250px;">
    <?php //include("../includes/Navbar.php");
    ?>
    <?php include("student.php");
    ?>
    <!--Student count and drill down report -->
    <section class="home-section col-sm-9 " style="margin-top:-230px;">

      <!--Top Performer -->
      <div class="performer">
        <div class="panel panel-success">
          <div class="panel-heading">Top Performer</div>
          <div class="panel2">
            <div class="row">
              <div class="column">
                <div class="container-top-perform">
                  <form action="#" method="post" onsubmit="myFunction()">

                    <label for="department">Department:</label>
                    <select id=departmentSelection name="department">
                      <option value="" selected>Select the Department</option>
                      <?php foreach ($existingDepartments  as $existingDepartment) { ?>
                        <option value="<?php echo $existingDepartment ?>"><?php echo $existingDepartment ?></option>
                      <?php } ?>
                      <!-- Options will be dynamically populated based on PHP code -->
                    </select>
                    <label for="semester">Semester:</label>
                    <select id="semesterSelection" name="semester">
                      <option value="" selected>Select the Semester</option>
                      <!-- Options will be dynamically populated based on PHP code -->
                    </select>
                    <br>
                    <label for="ce_exam">Exam:</label>
                    <select style="margin-bottom: 10px;" id="ce_exam" name="exam">
                      <option value="">Select Exam</option>
                      <!-- Options will be dynamically populated based on PHP code -->
                    </select>
                    <br>
                  </form>
                </div>
                <script>
                  $(document).ready(function(e) {
                    $('#departmentSelection').change(function(ee) {
                      var selectedDepartment = $(this).val();
                      $.ajax({
                        url: 'functions.php',
                        type: 'POST',
                        data: {
                          selectedDepartment: selectedDepartment,
                          Operation: 'getSemestersUsingDepartment'
                        },
                        success: function(response) {
                          // console.log(response);
                          $('#semesterSelection').html(response);


                          if (response == 'OK') {

                          }
                        }
                      })
                    })
                    $('#semesterSelection').change(function(ee) {
                      // var selectedDepartment = $(this).val();
                      $.ajax({
                        url: 'functions.php',
                        type: 'POST',
                        data: {
                          Operation: 'getCreatedExams'
                        },
                        success: function(response) {
                          // console.log(response);
                          $('#ce_exam').html(response);


                          if (response == 'OK') {

                          }
                        }
                      })
                    })
                    $('#ce_exam').change(function(ee) {
                      var selectedDepartment = $('#departmentSelection').val();
                      var selectedSemesterAndClassId = $('#semesterSelection').val();
                      var selectedSemesterAndClassId = selectedSemesterAndClassId.split(',');
                      var selectedSemester = selectedSemesterAndClassId[0];
                      var selectedClassId = selectedSemesterAndClassId[1];
                      var createdExamId = $('#ce_exam').val();
                      console.log(selectedSemester + ' ' + selectedClassId);

                      $.ajax({
                        url: 'functions.php',
                        type: 'POST',
                        data: {
                          selectedSemester: selectedSemester,
                          selectedClassId: selectedClassId,
                          selectedDepartment: selectedDepartment,
                          createdExamId: createdExamId,
                          Operation: 'topPerformanceFinder'
                        },
                        success: function(response) {
                          // response = JSON.parse(response);
                          response = response.split('|');
                          firstTableBody = response[0];
                          secondTableBody = response[1];
                          console.log();
                          $('#topPerformerTableBody1').html(firstTableBody);
                          $('#topPerformerTableBody2').html(secondTableBody);
                        }
                      })
                    })
                  })
                </script>
                <table class="percentage-above50">
                  <thead>
                    <tr>
                      <th>SI.No</th>
                      <th>Department</th>
                      <th>Above 90%</th>
                      <th>80%-90%</th>
                      <th>70%-80%</th>
                      <th>60%-70%</th>
                      <th>50%-60%</th>
                    </tr>
                  </thead>
                  <tbody id="topPerformerTableBody1">
                    <!-- Table rows will be dynamically populated based on PHP code -->
                  </tbody>
                </table>
              </div>
            </div>
            <div class="column-top">
              <table>
                <div class="panel-heading">Need Attention</div>
                <thead>
                  <tr>
                    <th>SI.No</th>
                    <th>Department</th>
                    <th>40%-50%</th>
                    <th>30%-40%</th>
                    <th>Below 30%</th>
                  </tr>
                </thead>
                <tbody id="topPerformerTableBody2">
                  <!-- Table rows will be dynamically populated based on PHP code -->
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      </div>
      </div>

      <!--Results not published status report -->
      <div class="result">
        <div class="panel panel-info class">
          <div class="panel-heading">Results not published status report</div>
          <div class="panel3">
            <div class="row">
              <div class="container-top-result">
                <form action="#" method="post">
                  <label for="examName">Exam:</label>
                  <select id="examName" name="examName">
                    <option value="" selected>Select the Exam</option>
                    <?php foreach ($examNames as $examName) { ?>
                      <option value="<?php echo $examName ?>"><?php echo $examName ?></option>
                    <?php } ?>
                  </select>

                  <label for="departmentNames">Department:</label>
                  <select id="departmentNames" name="departmentNames">
                    <option value="" selected>Select the Department</option>
                  </select>
                </form>
              </div>
              <script>
                $(document).ready(function(e) {
                  $('#examName').change(function(ee) {
                    ee.preventDefault();
                    var selectedExam = $(this).val();
                    $.ajax({
                      url: 'functions.php',
                      type: 'POST',
                      data: {
                        selectedExam: selectedExam,
                        Operation: 'getDepartments'
                      },
                      success: function(response) {
                        // console.log(response);
                        $('#departmentNames').html(response);
                      }
                    })
                  })
                  $('#departmentNames').change(function(ee) {
                    ee.preventDefault();
                    var selectedDepartment = $(this).val();
                    var selectedExam = $('#examName').val();
                    $.ajax({
                      url: 'functions.php',
                      type: 'POST',
                      data: {
                        selectedExam: selectedExam,
                        selectedDepartment: selectedDepartment,
                        Operation: 'filterNotResultPosted'
                      },
                      success: function(response) {
                        console.log(response);
                        $('#tableBody').html(response);
                      }
                    })
                  })
                })
              </script>
              <table>
                <thead>
                  <tr>
                    <th id="theader">Class</th>
                    <th id="theader">Subject</th>
                    <th id="theader">Exam</th>
                    <th id="theader">Teacher</th>
                  </tr>
                </thead>
                <tbody class="NotResultPostedTableBody" id="tableBody">
                  <?php foreach ($resultNotPostedArray as $resultNotPostedRow) { ?>
                    <tr>
                      <td>
                        <a class='classAnchorTag' href="stucountview.php?classId=<?php echo $resultNotPostedRow['cls_id'] ?>">
                          <?php echo $resultNotPostedRow['cls_course'] . ' ' . $resultNotPostedRow['cls_dept'] . ' ' . $resultNotPostedRow['cls_sem'] . ' (' . $resultNotPostedRow['cls_startyr'] . ' - ' . $resultNotPostedRow['cls_endyr'] . ')'; ?>
                        </a>
                      </td>
                      <td><?php echo $resultNotPostedRow['sub_name'] ?></td>
                      <td><?php echo $resultNotPostedRow['ce_exam'] ?></td>
                      <td><?php echo $resultNotPostedRow['f_fname'] . ' ' . $resultNotPostedRow['f_lname'] ?></td>
                    </tr>
                  <?php } ?>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>

      <!-- Student count dashboard -->
      <div class="stdcount">
        <div class="panel panel-primary">
          <div class="panel-heading">Student count and drill down report</div>
          <div class="panel1">
            <div class="row">
              <div class="column">
                <table class="table-header">
                  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                  <script>
                    $(document).ready(function() {
                      $(".clickable-row").click(function() {
                        window.location = $(this).data("href");
                      });
                    });
                  </script>
                  <?php
                  if (isset($_GET['id'])) {
                    $id = $_GET['id'];
                    // Perform database query or any other processing based on the ID
                    // ...
                    // Display the data or perform other operations
                    echo "You clicked on row with ID: " . $id;
                  }
                  ?>
                  <thead>
                    <tr class="clickable-row" sticky data-href="student.php?id=1">
                      <th>S.N</th>
                      <th>Class</th>
                      <th>Male</th>
                      <th>Female</th>
                      <th>Total</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    if (is_array($fetchData)) {
                      $sn = 1;
                      foreach ($fetchData as $data) {
                    ?>
                        <tr data-href="http://www.google.com/">
                          <td>
                            <?php echo $sn; ?>
                          </td>
                          <td>
                            <a class='classAnchorTag' href="stucountview.php?course=<?php echo $data['course']; ?>&dept=<?php echo $data['dept']; ?>&semester=<?php echo $data['semester']; ?>&startyear=<?php echo $data['startyear']; ?>&endyear=<?php echo $data['endyear']; ?> &classId=<?php echo $data['classid']; ?>">
                              <?php echo $data['course'] . ' ' . $data['dept'] . ' ' . $data['semester'] . ' (' . $data['startyear'] . ' - ' . $data['endyear'] . ')'; ?>
                            </a>
                          <td>
                            <a class="genderAnchorTag" href="stdgenderview.php?cls_id=<?php echo $data['classid'] ?>&gender=<?php echo 'male' ?>"><?php echo $data['male'] ?></a>
                          </td>
                          <td>
                            <a class="genderAnchorTag" href="stdgenderview.php?cls_id=<?php echo $data['classid'] ?>&gender=<?php echo 'female' ?>"><?php echo $data['female'] ?></a>
                          </td>
                          <td>
                            <a class='classAnchorTag' href="stucountview.php?classId=<?php echo $data['classid'] ?>">
                              <?php echo $data['counts'] ?? ''; ?>
                            </a>
                          </td>
                        </tr>
                      <?php
                        $sn++;
                      }
                    } else { ?>
                      <tr>
                        <td colspan="4">
                          <?php echo $fetchData; ?>
                        </td>
                      <tr>
                      <?php
                    } ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Attendance Posted Status -->
      <div class="attendance">
        <div class="panel panel-danger class">
          <div class="panel-heading">Attendance Status Report</div>
          <div class="panel-body">
            <div class="row">
              <div class="container-top-attendance">
                <form action="#" method="post">
                  <label for="staff">Faculty:</label>
                  <select class="selectElement" id="staff" name="staff">
                    <option value="default" selected>Select the Faculty</option>
                    <?php
                    $staffIds = array();
                    $staffNames = array();
                    $periods = array();
                    foreach ($allPeriodsToday as $periodInfo) {
                      $staffIds[] = $periodInfo['f_id'];
                      $staffNames[] = $periodInfo['f_fname'] . ' ' . $periodInfo['f_lname'];
                      $periods[] = $periodInfo['tt_period'];
                    }
                    $distinctStaffIds = array();
                    $distinctStaffIds = array_unique($staffIds);
                    $distinctStaffNames = array();
                    $distinctStaffNames = array_unique($staffNames);
                    $distinctPeriods = array();
                    $distinctPeriods = array_unique($periods);
                    foreach ($distinctStaffIds as $index => $staffId) {
                    ?>
                      <option value="<?php echo $staffId ?>"><?php echo $distinctStaffNames[$index] ?></option>
                    <?php } ?>
                  </select>

                  <label for="department">Department:</label>
                  <select class="selectElement" id="dept" name="department">
                    <option value="default" selected>Select the Department</option>
                    <?php foreach ($departments as $department) { ?>
                      <option value="<?php echo $department['cls_dept'] ?>"><?php echo $department['cls_dept'] ?></option>
                    <?php } ?>
                  </select>

                  <label for="period">Period:</label>
                  <select class="selectElement" id="hour" name="period">
                    <option value="default" selected>Select the Period</option>
                    <?php foreach ($distinctPeriods as $period) { ?>
                      <option value="<?php echo $period ?>"><?php echo $period ?></option>
                    <?php } ?>
                  </select>
                </form>
              </div>

              <table>
                <thead>

                  <tr>
                    <th id="tattend">SI.no</th>
                    <th id="tattend">Department</th>
                    <th id="tattend">Semester</th>
                    <th id="tattend">Period</th>
                    <th id="tattend">Subject</th>
                    <th id="tattend">Faculty</th>
                    <th id="tattend">Posted Status</th>
                    <th id="tattend">Total</th>
                    <th id="tattend">Present</th>
                    <th id="tattend">Absent</th>
                  </tr>

                </thead>
                <tbody id="tableBody3">
                  <?php
                  $i = 1;
                  foreach ($allPeriodsToday as $periodToday) {
                    $postedStatus = 0;
                    $noOfStudentsPresent = 0;
                    $noOfStudentsAbsent = 0;
                    $classId = $periodToday['cls_id'];
                    $sql = "SELECT COUNT(stu_id) as studentCount FROM erp_student WHERE cls_id = $classId";
                    $result = mysqli_query($conn, $sql);
                    $studentCount = $result->fetch_assoc()['studentCount'];
                    // echo $studentCount;


                    $sql = "SELECT * FROM erp_attendance WHERE att_sub='$periodToday[tt_subcode]' AND att_hour=$periodToday[tt_period] AND cls_id=$periodToday[cls_id] And att_date='2024-02-16';";
                    $result = mysqli_query($conn, $sql);
                    if (mysqli_num_rows($result) > 0) {
                      $postedStatus = 1;
                      $attendanceTableArray = array();
                      while ($row = $result->fetch_assoc()) {
                        $attendanceTableArray[] = $row;
                      }
                      // Finding number of present for a faculty in attendance table
                      foreach ($attendanceTableArray as $attendanceRecord) {
                        if ($attendanceRecord['att_status'] == 'P') {
                          $noOfStudentsPresent++;
                        }
                      }
                      $noOfStudentsAbsent = $studentCount - $noOfStudentsPresent;
                    }


                  ?>
                    <tr>
                      <td><?php echo $i ?></td>
                      <td><?php echo $periodToday['cls_dept'] ?></td>
                      <td><?php echo $periodToday['cls_sem'] ?></td>
                      <td><?php echo $periodToday['tt_period'] ?></td>
                      <td><?php echo $periodToday['sub_name'] ?></td>
                      <td><?php echo $periodToday['f_fname'] . ' ' . $periodToday['f_lname'] ?></td>
                      <td><?php echo $postedStatus == 1 ? 'Posted' : 'Not Posted' ?></td>
                      <td><?php echo $studentCount ?></td>
                      <td><?php echo $noOfStudentsPresent ?></td>
                      <td><?php echo $noOfStudentsAbsent ?></td>
                    </tr>
                  <?php
                    $i++;
                  }
                  ?>
                  <!-- PHP code and dynamic content removed -->
                </tbody>
              </table>
            </div>
            <script>
              $(document).ready(function() {
                // Attach change event handler to all select elements
                $('select').change(function() {
                  // Log the value of the changed select element
                  var selectedValue = $(this).val();
                  var selectValuesArray = {};
                  var selectElementName = $(this).attr('name');
                  selectValuesArray[selectElementName] = selectedValue;
                  console.log(selectValuesArray);

                  // Check other select elements for non-default values and log them
                  $('.selectElement').not(this).each(function() {
                    var value = $(this).val();
                    var selectElementName = $(this).attr('name');
                    if (value !== 'default') {
                      selectValuesArray[selectElementName] = value;
                      console.log(selectValuesArray);
                    }
                    // var selectedValuesEncoded = JSON.stringify(selectValuesArray); 
                    // console.log(selectedValuesEncoded);
                  });
                  $.ajax({
                    url: 'functions.php',
                    type: 'POST',
                    data: {
                      selectValuesArray: selectValuesArray,
                      Operation: 'filteringAttendanceStatus',
                    },
                    success: function(response) {
                      console.log(response);
                      $('#tableBody3').html(response);
                    }
                  })
                });
              });
            </script>
          </div>
        </div>
      </div>



    </section>
  </body>
  <script>
    $(document).ready(function(e) {
      $('.classAnchorTag').click(function(a) {
        a.preventDefault();
        var href = $(this).attr('href');
        console.log(href);
        window.open(href, 'Student Count View', 'resizable,height=600,width=760');
      });
      $('.genderAnchorTag').click(function(a) {
        a.preventDefault();
        var href = $(this).attr('href');
        console.log(href);
        window.open(href, 'Student Count View', 'resizable,height=600,width=760');
      });
    });
  </script>

  </html>
<?php
} else {
  header("Location: ../../index.php");
}
?>