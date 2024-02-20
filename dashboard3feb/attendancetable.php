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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    <title>HOME</title>
    <style>
      .footer1 {
        background-image: linear-gradient(to right, rgb(79, 4, 79), rgb(193, 91, 193));
        /* padding: 5%; */
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
        margin-left: -5px;
        margin-right: -5px;
      }

      .column {
        flex: 50%;
        padding: 5px;
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
        padding: 16px;
      }

      tr:nth-child(even) {
        background-color: #f2f2f2;
      }
    </style>
  </head>

  <body>
    <?php
    include 'Navbar.php';
    ?>
    <?php
    include("student.php");
    ?>
    <section class="home-section">

      <h2>Attendance Status Report</h2>
      <div class="row">
        <form action="#" method="post">
          <label for="f_fname">Faculty Name:</label>
          <select id="f_fname" name="faculty" onchange="this.form.submit()">
            <?php

            // Query to get the list of exam names
            $query = "SELECT DISTINCT f_fname FROM erp_faculty";

            // Execute the query
            $result = mysqli_query($con, $query);

            // Loop through the results and create an option for each exam name
            echo '<option value="" >Select the Faculty</option>';
            while ($row = mysqli_fetch_array($result)) {
            ?> <option value="<?php echo $row['f_fname']; ?>"><?php echo $row['f_fname'] ?> </option>
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
              <option value="<?php echo htmlspecialchars(json_encode($row)); ?>"><?php echo $row['cls_course'] . ' ' . $row['cls_dept'] ?> </option>
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
              <option value="<?php echo htmlspecialchars(json_encode($row)); ?>"><?php echo $row['att_hour'] ?> </option>
            <?php
            }

            ?>
          </select>
        </form>
        <table>
          <tr>
            <th>SI.no</th>
            <th>Department</th>
            <th>Semester</th>
            <th>period</th>
            <th>subject</th>
            <th>faculty</th>
            <th>posted status</th>
            <th>total</th>
            <th>present</th>
            <th>absent</th>
          </tr>
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
                  <td><?php echo $sn; ?></td>
                  <td><?php echo $row['cls_dept'] ?? ''; ?></td>
                  <td><?php echo $row['cls_sem'] ?? ''; ?></td>
                  <td><?php echo $row['att_hour'] ?? ''; ?></td>
                  <td><?php echo $row['sub_name'] ?? ''; ?></td>
                  <td><?php echo $row['f_fname'] ?? ''; ?></td>
                  <td><?php echo $row['att_status'] ?? ''; ?></td>
                  <td><?php echo $row['Total'] ?? ''; ?></td>
                  <td><?php echo $row['Present'] ?? ''; ?></td>
                  <td><?php echo $row['Absent'] ?? ''; ?></td>
                </tr>
            <?php
                $sn++;
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


      <script>
        if (window.history.replaceState) {
          window.history.replaceState(null, null, window.location.href);
        }
      </script>

  </body>

  </html>

<?php
} else {
  header("Location: ../../index.php");
}
?>