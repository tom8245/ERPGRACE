<?php

session_start();

      if(isset($_SESSION['user_id'])){


    include('../../includes/config.php');  // <!-- connecting database -->

      
      ?>

<!DOCTYPE html>
<html>
<title>Manage exam</title>
<head>
  <title>Manage Exam Timetables</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <style>
.button-container {
    display: flex;
    justify-content: space-between; /* Adjust as needed */
    align-items: center;
    margin-bottom: 20px; /* Add some spacing between the buttons and the form */
}

.button-container a {
    text-align: center;
    text-decoration: none;
}

.button-container button {
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
    font-weight: bold;
    text-transform: uppercase;
}

.button-container button:hover {
    background-color: #45a049;
}
.line {
    border-bottom: 10px solid green; 
    margin-bottom: 15px;
    color:black;
}

    table {
      border-collapse: collapse;
      width: 100%;
    }

    th,td {
      text-align: left;
      padding: 8px;
    }
    tr{
      width:100%;
    }

    th {
      background-color: #4CAF50;
      color: white;
    }

    tr:nth-child(even) {
      background-color: #f2f2f2;
    }

    body {
      display: flex;
      flex-direction: column;
      font-family: Arial, sans-serif;
    }

    .for {
      max-width: 500px;
      margin: 0 auto;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    label {
      display: inline-block;
      width: 150px;
      font-weight: bold;
      margin-bottom: 5px;
    }

    select {
      padding: 5px;
      border-radius: 3px;
      border: 1px solid #ccc;
      width: 250px;
      margin-bottom: 10px;
    }

    input[type="radio"] {
      margin: 0 5px 0 0;
    }

    input[type="text"] {
      padding: 5px;
      border-radius: 3px;
      border: 1px solid #ccc;
      width: 250px;
      margin-bottom: 10px;
    }

    input[type="submit"] {
      background-color: #4CAF50;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      margin-top: 10px;
    }

    button{
      background-color: #4CAF50;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      margin-top: 10px;
    }

    input[type="submit"]:hover {
      background-color: #3e8e41;
    }

    .error {
      color: red;
      margin-bottom: 10px;
    }
    .container{
      position: relative;
    left: 60px;
    width: calc(100% - 60px);
    }
  </style>
</head>

<body>
<div class='container'>
<h3 style="text-align:center">Manage Exam</h3>
<div class="line"></div>
<div class="button-container">
    <a href="../Admin.php"><button>Admin Module</button></a>
    <a href="Createexam.php"><button>Create Exam Timetable</button></a>
    <a href="Create.php"><button>Create Exam Name</button></a>
    <a href="Create_other_exam.php"><button>Create Other Exam</button></a>
  
</div>
<div class="line"></div>

  <form class="for" name="myform" method="POST" action="Manage_exam.php">
    <label for="ce_exam">Exam Name:</label>
    <select id="ce_exam" name="ce_exam">
      <?php

      // Query to get the list of exam names
      $query = "SELECT DISTINCT ce_exam FROM erp_createexam";

      // Execute the query
      $result = mysqli_query($conn, $query);

      // Loop through the results and create an option for each exam name
      echo '<option value="" selected>Select the Exam</option>';
      while ($row = mysqli_fetch_array($result)) {
        echo "<option value='" . $row['ce_exam'] . "'>" . $row['ce_exam'] . "</option>";
      }

      ?>
    </select>
    <br><br>
    <label for="cls_course">Course:</label>
    <select id="cls_course" name="cls_course">
      <?php

      // Query the database to fetch the dropdown options
      $sql = "SELECT DISTINCT cls_course FROM erp_class";
      $result = mysqli_query($conn, $sql);

      // Generate the options for the dropdown menu
      echo '<option value="" selected>Select the Course</option>';
      while ($row = mysqli_fetch_array($result)) {
        echo '<option value="' . $row['cls_course'] . '">' . $row['cls_course'] . '</option>';
      }

      ?>
    </select>
    <br><br>
    <label for="cls_deptname">Department:</label>
    <select id="cls_deptname" name="cls_deptname" required>
      <option value="" selected>Select the Department</option>
    </select>
    <br><br>
    <label for="cls_sem">Semester:</label>
    <select id="cls_sem" name="cls_sem" required>
      <option value="" selected>Select the Semester</option>
    </select>
    <br><br>
    <label>Exam Type:</label>
<input type="radio" name="ce_type" id="academic" style="display:inline-block;margin-left:1px;" value="academic" required>Academic
<input type="radio" name="ce_type" id="university" style="display:inline-block;margin-left:1px;" value="university">University
<input type="radio" name="ce_type" id="others" style="display:inline-block;margin-left:1px;" value="others">Others

    <br><br>
    <input type="submit" value="Search" name="submit">
  </form>
</div>

  <script>
    // Get the course, department, and semester dropdowns
    const courseDropdown = document.getElementById("cls_course");
    const deptDropdown = document.getElementById("cls_deptname");
    const semDropdown = document.getElementById("cls_sem");

    // Event listener for course dropdown
    courseDropdown.addEventListener("change", () => {
      // Clear previous options in department and semester dropdowns
      deptDropdown.innerHTML = '<option value="" selected>Select the Department</option>';
      semDropdown.innerHTML = '<option value="" selected>Select the Semester</option>';

      // Get the selected course
      const selectedCourse = courseDropdown.value;

      // Fetch the department options based on the selected course
      fetch(`get_depts.php?course=${selectedCourse}`)
        .then(response => response.json())
        .then(data => {
          // Generate the options for the department dropdown
          data.forEach(dept => {
            const option = document.createElement("option");
            option.value = dept;
            option.text = dept;
            deptDropdown.add(option);
          });
        })
        .catch(error => console.log(error));
    });

    // Event listener for department dropdown
    deptDropdown.addEventListener("change", () => {
      // Clear previous options in semester dropdown
      semDropdown.innerHTML = '<option value="" selected>Select the Semester</option>';

      // Get the selected course and department
      const selectedCourse = courseDropdown.value;
      const selectedDept = deptDropdown.value;

      // Fetch the semester options based on the selected course and department
      fetch(`get_sems.php?course=${selectedCourse}&dept=${selectedDept}`)
        .then(response => response.json())
        .then(data => {
          // Generate the options for the semester dropdown
          data.forEach(sem => {
            const option = document.createElement("option");
            option.value = sem;
            option.text = sem;
            semDropdown.add(option);
          });
        })
        .catch(error => console.log(error));
    });

  </script>
  <script>
    // clear form history
    if (window.history.replaceState) {
        window.history.replaceState(null, null, window.location.href);
    }
</script>
<script>
  // Function to clear form data when the page loads
  function clearFormData() {
    document.getElementById("ce_exam").value = "";
    document.getElementById("cls_course").value = "";
    document.getElementById("cls_deptname").value = "";
    document.getElementById("cls_sem").value = "";
    document.getElementById("academic").checked = false;
    document.getElementById("university").checked = false;
    document.getElementById("others").checked = false;
  }

  // Call the function to clear form data when the page loads
  window.addEventListener("load", clearFormData);
</script>

</body>

</html>
<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['submit'])) {
  // Get the form data
  $cls_deptname = $_POST['cls_deptname'];
  $cls_course = $_POST['cls_course'];
  $cls_sem = $_POST['cls_sem'];
  $ce_exam = $_POST['ce_exam'];
  $ce_type = $_POST['ce_type'];

  // Get the cls_id for the selected department
  $sql = "SELECT cls_id FROM erp_class WHERE cls_deptname = '$cls_deptname' AND cls_sem = '$cls_sem'";
  $result = mysqli_query($conn, $sql);
  if ($result && mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
    $cls_id = $row['cls_id'];
  }

  $sql = "SELECT test_id FROM erp_test WHERE test_name = '$ce_exam'";
  $result = mysqli_query($conn, $sql);
  if ($result && mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
    $test_id = $row['test_id'];
  }

  // Modify the query to handle "Others" option
  if ($ce_type === "others") {
    $sql = "SELECT ce_id, ce_exam, ce_type, ce_sdate, ce_edate FROM erp_createexam WHERE cls_id = '$cls_id' AND ce_exam = '$ce_exam' AND ce_type NOT IN ('academic', 'university')";
  } else {
    $sql = "SELECT ce_id, ce_exam, ce_type, ce_sdate, ce_edate FROM erp_createexam WHERE cls_id = '$cls_id' AND ce_exam = '$ce_exam' AND ce_type = '$ce_type'";
  }

  $result = mysqli_query($conn, $sql);
  if ($result && mysqli_num_rows($result) > 0) {
    // Display the exam details in a table
    echo "<div class='container'>";
    echo "<table>";
    echo "<tr><th>Exam Name</th><th>Exam Type</th><th>Start Date</th><th>End Date</th><th></th></tr>";
    while ($row = mysqli_fetch_assoc($result)) {
      $ce_id = $row['ce_id'];
      $ce_exam = $row['ce_exam'];
      $ce_type = $row['ce_type'];
      $ce_sdate = $row['ce_sdate'];
      $ce_edate = $row['ce_edate'];

      echo "<tr>";
      echo "<td>" . $ce_exam . "</td>";
      echo "<td>" . $ce_type . "</td>";
      echo "<td>" . $ce_sdate . "</td>";
      echo "<td>" . $ce_edate . "</td>";
      echo "<td>";
      echo "<form class='forfor' =action='view_exam.php' method='post'>";
      echo "<input type='hidden' name='ce_id' value='" . $ce_id . "'>";
      echo "<input type='hidden' name='test_id' value='" . $test_id . "'>";
      echo "<a href='view_exam.php?ce_id=" . $ce_id . "&test_id=" . $test_id . "'>View</a></td>";
      echo "</form>";
      echo "</td>";
      echo "</tr>";
    }
    echo "</table>";
    echo "</div>";
  } else {
    echo "No exam found.";
  }
}
      }else{
        header("Location: ../../index.php");
        exit;
      }
?>
