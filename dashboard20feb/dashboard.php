<?php

session_start();

if (isset($_SESSION['user_id'])) {

  include('../includes/config.php');


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
        /* width: 400px; */
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
          <div class="panel-heading">Top Performer</div><?php print_r($maximum_marks) ?>
          <div class="panel2">
            <div class="row">
              <div class="column">
                <div class="container-top-perform">
                  <form action="#" method="post" onsubmit="myFunction()">
                    <label for="ce_exam">Exam:</label>
                    <select id="ce_exam" name="exam" onchange="this.form.submit()">
                      <?php

                      $sql1 = "SELECT erp_class.cls_id, cls_startyr, cls_endyr, cls_dept, cls_sem, cls_course, ce_exam,
                COUNT(CASE WHEN mark_publish > 90 THEN 1 END) AS '90-100',
                COUNT(CASE WHEN mark_publish > 80 AND mark_publish <= 90 THEN 1 END) AS '80-90',
                COUNT(CASE WHEN mark_publish > 70 AND mark_publish <= 80 THEN 1 END) AS '70-80',
                COUNT(CASE WHEN mark_publish > 60 AND mark_publish <= 70 THEN 1 END) AS '60-70',
                COUNT(CASE WHEN mark_publish > 50 AND mark_publish <= 60 THEN 1 END) AS '50-60',
                COUNT(CASE WHEN mark_publish > 40 AND mark_publish <= 50 THEN 1 END) AS '40-50',
                COUNT(CASE WHEN mark_publish > 30 AND mark_publish <= 40 THEN 1 END) AS '30-40',
                COUNT(CASE WHEN mark_publish > 20 AND mark_publish <= 30 THEN 1 END) AS '20-30',
                COUNT(CASE WHEN mark_publish > 0 AND mark_publish <= 20 THEN 1 END) AS '0-20'
                FROM `erp_mark` 
                LEFT JOIN `erp_createexam` ON `erp_mark`.`ce_id`=`erp_createexam`.`ce_id` 
                LEFT JOIN `erp_class` ON `erp_mark`.`cls_id`=`erp_class`.`cls_id` 
                GROUP BY erp_createexam.cls_id, erp_createexam.ce_exam";
                      $result1 = mysqli_query($con, $sql1);
                      $result2 = mysqli_query($con, $sql1);
                      $dept = "";
                      $cour = "";

                      if (isset($_POST['department'])) {
                        # code...
                        // Get the JSON data from the POST request
                        $json_data = $_POST['department'];
                        // Decode the JSON data into an array
                        $data = json_decode($json_data, true);
                        if (is_array($data)) {
                          # code...
                          $cour = $data['cls_course'];
                          $dept = $data['cls_dept'];
                        }
                        $exam = $_POST['exam'];



                        $sql1 = "SELECT erp_class.cls_id, cls_startyr, cls_endyr, cls_dept, cls_sem, cls_course, ce_exam,
                  COUNT(CASE WHEN mark_publish > 90 THEN 1 END) AS '90-100',
                  COUNT(CASE WHEN mark_publish > 80 AND mark_publish <= 90 THEN 1 END) AS '80-90',
                  COUNT(CASE WHEN mark_publish > 70 AND mark_publish <= 80 THEN 1 END) AS '70-80',
                  COUNT(CASE WHEN mark_publish > 60 AND mark_publish <= 70 THEN 1 END) AS '60-70',
                  COUNT(CASE WHEN mark_publish > 50 AND mark_publish <= 60 THEN 1 END) AS '50-60',
                  COUNT(CASE WHEN mark_publish > 40 AND mark_publish <= 50 THEN 1 END) AS '40-50',
                  COUNT(CASE WHEN mark_publish > 30 AND mark_publish <= 40 THEN 1 END) AS '30-40',
                  COUNT(CASE WHEN mark_publish > 20 AND mark_publish <= 30 THEN 1 END) AS '20-30',
                  COUNT(CASE WHEN mark_publish > 0 AND mark_publish <= 20 THEN 1 END) AS '0-20'
                  FROM `erp_mark` 
                  LEFT JOIN `erp_createexam` ON `erp_mark`.`ce_id`=`erp_createexam`.`ce_id` 
                  LEFT JOIN `erp_class` ON `erp_mark`.`cls_id`=`erp_class`.`cls_id` 
                  WHERE erp_class.cls_dept = '$dept'
                  AND erp_class.cls_course = '$cour'
                  OR erp_createexam.ce_exam = '$exam'
                  GROUP BY erp_createexam.cls_id, erp_createexam.ce_exam";

                        $result1 = mysqli_query($con, $sql1);
                        $result2 = mysqli_query($con, $sql1);
                      }
                      ?>
                      <?php

                      // Query to get the list of exam names
                      $query = "SELECT DISTINCT ce_exam FROM erp_createexam";

                      // Execute the query
                      $result = mysqli_query($con, $query);

                      // Loop through the results and create an option for each exam name
                      echo '<option value="" >Select Exam</option>';
                      while ($row = mysqli_fetch_array($result)) {
                      ?>
                        <option value="<?php echo $row['ce_exam']; ?>">
                          <?php echo $row['ce_exam'] ?>
                        </option>
                      <?php
                      }


                      ?>
                    </select>

                    <label for="department">Department:</label>
                    <select name="department" onchange="this.form.submit()">
                      <?php

                      // Query to get the list of departments
                      $query = "SELECT DISTINCT cls_course,cls_dept FROM erp_class";

                      // Execute the query
                      $result = mysqli_query($con, $query);

                      // Loop through the results and create an option for each exam name
                      echo '<option value="" selected>Select the Department</option>';
                      while ($row = mysqli_fetch_array($result)) {
                      ?>
                        <option value="<?php echo htmlspecialchars(json_encode($row)); ?>">
                          <?php echo $row['cls_course'] . ' ' . $row['cls_dept'] ?>
                        </option>
                      <?php
                      }


                      ?>
                    </select>
                    <br>
                    <?php error_reporting(0); ?>
                    <b style="font-size: small;">
                      <?php echo $cour . " " . $dept ?>
                    </b>
                    <b style="font-size: small;">
                      <?php echo $exam ?>
                    </b>
                  </form>
                </div>
                <table class="percentage-above50">
                  <thead>
                    <tr>
                      <th>SI.No</th>
                      <th>Class</th>
                      <th>Above 90%</th>
                      <th>80% -90%</th>
                      <th>70%-80%</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    if (mysqli_num_rows($result1) > 0) {
                      // output data of each row
                      $sn = 1;
                      while ($row = mysqli_fetch_assoc($result1)) {
                    ?>
                        <tr>
                          <td>
                            <?php echo $sn; ?>
                          </td>
                          <td>
                            <a href="topperformview.php" target="_blank?course=<?php echo $row['cls_course']; ?>&dept=<?php echo $row['cls_dept']; ?>&semester=<?php echo $row['cls_sem']; ?>&startyear=<?php echo $row['cls_startyr']; ?>&endyear=<?php echo $row['cls_endyr']; ?>">
                              <?php echo $row['cls_course'] . ' ' . $row['cls_dept'] . ' ' . $row['cls_sem'] . ' (' . $row['cls_startyr'] . ' - ' . $row['cls_endyr'] . ')'; ?>
                            </a>
                          </td>
                          <td>
                            <?php echo $row['90-100'] ?? ''; ?>
                          </td>
                          <td>
                            <?php echo $row['80-90'] ?? ''; ?>
                          </td>
                          <td>
                            <?php echo $row['70-80'] ?? ''; ?>
                          </td>
                        </tr>
                    <?php
                        $sn++;
                      }
                    } else {
                      echo "0 results";
                    }

                    //mysqli_close($conn);
                    ?>
                  </tbody>
              </div>
              </table>
            </div>
            <div class="column-top">
              <table>
                <thead>
                  <tr>
                    <th>SI.No</th>
                    <th>Class</th>
                    <th>40%-50%</th>
                    <th>30%-40%</th>
                    <th>Below 30%</th>
                  </tr>
                </thead>
                <tbody>
                  <?php

                  if (mysqli_num_rows($result2) > 0) {
                    // output data of each row
                    $sn = 1;
                    while ($row = mysqli_fetch_assoc($result2)) {
                  ?>
                      <tr>
                        <td>
                          <?php echo $sn; ?>
                        </td>
                        <td>
                          <a href="topperformview" target="_blank" .php?course=<?php echo $row['cls_course']; ?>&dept=<?php echo $row['cls_dept']; ?>&semester=<?php echo $row['cls_sem']; ?>&startyear=<?php echo $row['cls_startyr']; ?>&endyear=<?php echo $row['cls_endyr']; ?>">
                            <?php echo $row['cls_course'] . ' ' . $row['cls_dept'] . ' ' . $row['cls_sem'] . ' (' . $row['cls_startyr'] . ' - ' . $row['cls_endyr'] . ')'; ?>
                          </a>
                        <td>
                          <?php echo $row['40-50'] ?? ''; ?>
                        </td>
                        <td>
                          <?php echo $row['30-40'] ?? ''; ?>
                        </td>
                        <td>
                          <?php echo $row['20-30'] + $row['0-20'] ?? ''; ?>
                        </td>

                      </tr>
                  <?php
                      $sn++;
                    }
                  } else {
                    echo "0 results";
                  }

                  //mysqli_close($conn);
                  ?>
                </tbody>
              </table>
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
                  <label for="examstatus">Exam:</label>
                  <select id="ce_exam" name="examstatus" onchange="this.form.submit()">
                    <?php

                    // Query to get the list of exam names
                    $query = "SELECT * from res_post_status_vw";

                    // Execute the query
                    $result = mysqli_query($con, $query);

                    // Loop through the results and create an option for each exam name
                    echo '<option value="" >Select the Exam</option>';
                    while ($row = mysqli_fetch_array($result)) {
                    ?>
                      <option value="<?php echo $row['ce_exam']; ?>">
                        <?php echo $row['ce_exam'] ?>
                      </option>
                    <?php
                    }


                    ?>
                  </select>

                  <label for="departmentstatus">Department:
                    <?php echo $cour . $dept ?>
                  </label>
                  <select id="dept" name="departmentstatus">
                    <!-- <select id="dept" name="departmentstatus" onchange="this.form.submit()"> -->
                    <?php


                    // Query to get the list of departments
                    $query = "SELECT DISTINCT cls_course,cls_dept FROM erp_class";

                    // Execute the query
                    $result = mysqli_query($con, $query);

                    // Loop through the results and create an option for each exam name
                    echo '<option value="" selected>Select the Department</option>';
                    while ($row = mysqli_fetch_array($result)) {
                    ?>
                      <option value="<?php echo htmlspecialchars(json_encode($row)); ?>">
                        <?php echo $row['cls_course'] . ' ' . $row['cls_dept'] ?>
                      </option>
                    <?php
                    }


                    ?>
                  </select>
                </form>
              </div>
              <table>
                <thead>
                  <tr>
                    <th id="theader">Class</th>
                    <th id="theader">Subject</th>
                    <th id="theader">Exam</th>
                    <th id="theader">Teacher</th>
                  </tr>
                </thead>
                <tbody>
                  <?php

                  $sql = "SELECT * FROM res_post_status_vw";
                  $result = mysqli_query($con, $sql);
                  if (mysqli_num_rows($result) > 0) {
                    // output data of each row
                    $sn = 1;
                    while ($row = mysqli_fetch_assoc($result)) {
                      if ($row['res_sts'] == "Not Posted") {
                  ?>
                        <tr>
                          <td>
                            <a href="resultview.php" target="_blank" ?startyear=<?php echo $row['cls_startyr']; ?>&endyear=<?php echo $row['cls_endyr']; ?>&course=<?php echo $row['cls_course']; ?>&dept=<?php echo $row['cls_dept']; ?>&semester=<?php echo $row['cls_sem']; ?>">
                              <?php echo $row['cls_startyr'] . ' - ' . $row['cls_endyr'] . ' ' . $row['cls_course'] . ' ' . $row['cls_dept'] . ' ' . $row['cls_sem'] . ' Sem'; ?>
                            </a>
                          </td>
                          <td>
                            <?php echo $row['sub_name'] ?? ''; ?>
                          </td>
                          <td>
                            <?php echo $row['ce_exam'] ?? ''; ?>
                          </td>
                          <td>
                            <?php echo $row['f_fname'] ?? ''; ?>
                          </td>
                        </tr>
                  <?php
                        $sn++;
                      }
                    }
                  } else {
                    echo "0 results";
                  }

                  ?>
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
                            <?php echo $data['counts'] ?? ''; ?>
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

      <!--Attendance Status Report -->
      <div class="attendance">
        <div class="panel panel-danger class">
          <div class="panel-heading">Attendance Status Report</div>
          <div class="panel-body">

            <div class="row">
              <div class="container-top-attendance">
                <form action="#" method="post">
                  <label for="f_fname">Faculty:</label>
                  <select id="f_fname" name="faculty" onchange="this.form.submit()">
                    <?php


                    // Query to get the list of exam names
                    $query = "SELECT DISTINCT f_fname FROM erp_faculty";

                    // Execute the query
                    $result = mysqli_query($con, $query);

                    // Loop through the results and create an option for each exam name
                    echo '<option value="" >Select the Faculty</option>';
                    while ($row = mysqli_fetch_array($result)) {
                    ?>
                      <option value="<?php echo $row['f_fname']; ?>">
                        <?php echo $row['f_fname'] ?>
                      </option>
                    <?php
                    }


                    ?>
                  </select>

                  <label for="department">Department:</label>
                  <select id="dept" name="department" onchange="this.form.submit()">
                    <?php

                    // Query to get the list of departments
                    $query = "SELECT DISTINCT cls_course,cls_dept FROM erp_class";

                    // Execute the query
                    $result = mysqli_query($con, $query);

                    // Loop through the results and create an option for each exam name
                    echo '<option value="" selected>Select the Department</option>';
                    while ($row = mysqli_fetch_array($result)) {
                    ?>
                      <option value="<?php echo htmlspecialchars(json_encode($row)); ?>">
                        <?php echo $row['cls_course'] . ' ' . $row['cls_dept'] ?>
                      </option>
                    <?php
                    }


                    ?>
                  </select>
                  <label for="period">Period:</label>
                  <select id="hour" name="attendance" onchange="this.form.submit()">
                    <?php

                    // Query to get the list of departments
                    $query = "SELECT DISTINCT att_hour FROM erp_attendance";

                    // Execute the query
                    $result = mysqli_query($con, $query);

                    // Loop through the results and create an option for each exam name
                    echo '<option value="" selected>Select the Period</option>';
                    while ($row = mysqli_fetch_array($result)) {
                    ?>
                      <option value="<?php echo htmlspecialchars(json_encode($row)); ?>">
                        <?php echo $row['att_hour'] ?>
                      </option>
                    <?php
                    }

                    ?>
                  </select>
                </form>
              </div>
              <table>

                <thead>
                  <tr>
                    <th id="tattend">SI.no</th>
                    <th id="tattend">Department</th>
                    <th id="tattend">Semester</th>
                    <th id="tattend">period</th>
                    <th id="tattend">subject</th>
                    <th id="tattend">faculty</th>
                    <th id="tattend">posted status</th>
                    <th id="tattend">total</th>
                    <th id="tattend">present</th>
                    <th id="tattend">absent</th>
                  </tr>
                </thead>
                <tbody>
                  <?php

                  $sql = "SELECT erp_class.cls_id,cls_dept,cls_sem,att_hour,att_sub,sub_name,f_fname,att_status, 
                  count(case when att_status='P' then 1 end)as 'Present',count(case when att_status='A' then 0 end)as 'Absent',sum(att_status='P' and att_status='A') as Total
                       FROM `erp_class`              
                  join erp_attendance on erp_attendance.cls_id=erp_attendance.stu_id
                                  
                      join erp_subject on erp_subject.cls_id=erp_attendance.cls_id
                      join erp_faculty on erp_faculty.cls_id=erp_attendance.cls_id";

                  $result = mysqli_query($con, $sql);
                  if (mysqli_num_rows($result) > 0) {
                    // output data of each row
                    $sn = 1;
                    while ($row = mysqli_fetch_assoc($result)) {
                  ?>
                      <tr>
                        <td>
                          <?php echo $sn; ?>
                        </td>
                        <td>
                          <?php echo $row['cls_dept'] ?? ''; ?>
                        </td>
                        <td>
                          <?php echo $row['cls_sem'] ?? ''; ?>
                        </td>
                        <td>
                          <?php echo $row['att_hour'] ?? ''; ?>
                        </td>
                        <td>
                          <?php echo $row['sub_name'] ?? ''; ?>
                        </td>
                        <td>
                          <?php echo $row['f_fname'] ?? ''; ?>
                        </td>
                        <td>
                          <?php echo $row['att_status'] ?? ''; ?>
                        </td>
                        <td>
                          <?php echo $row['Total'] ?? ''; ?>
                        </td>
                        <td>
                          <?php echo $row['Present'] ?? ''; ?>
                        </td>
                        <td>
                          <?php echo $row['Absent'] ?? ''; ?>
                        </td>
                      </tr>
                  <?php
                      $sn++;
                    }
                  } else {
                    echo "0 results";
                  }

                  //mysqli_close($conn);
                  ?>
                </tbody>
              </table>
            </div>
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