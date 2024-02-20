<?php

session_start();

if (isset($_SESSION['user_id'])) {

  include('../../includes/config.php');  // <!-- connecting database -->
?>
  <!DOCTYPE html>
  <html>

  <head>
    <title>Other Exam Timetable Creation</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
      /* Style the form container */
      .container {

        position: relative;
        left: 60px;
        width: calc(100% - 60px);
      }

      .button-container {
        display: flex;
        justify-content: space-between;
        /* Adjust as needed */
        align-items: center;
        margin-bottom: 20px;
        /* Add some spacing between the buttons and the form */
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
        color: black;
      }

      body {
        font-family: Arial, sans-serif;
      }

      form {
        margin: 50px auto;
        max-width: 600px;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-shadow: 0 0 5px #ccc;
      }

      label {
        display: block;
        margin-bottom: 10px;
        margin-right: 5px;
        /* added margin-right to reduce space between labels */
      }

      select,
      input[type="date"] {
        padding: 5px;
        font-size: 16px;
        border-radius: 5px;
        border: 1px solid #ccc;
        width: 100%;
        max-width: 400px;
        box-sizing: border-box;
        margin-bottom: 20px;
      }

      input[type="radio"] {
        margin-right: 10px;
      }

      input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
      }

      input[type="submit"]:hover {
        background-color: #3e8e41;
      }
    </style>
  </head>

  <body>
    <div class='container'>
      <h3 style="text-align:center">Other Exam Timetable Creation</h3>
      <div class="line"></div>
      <div class="button-container">
        <a href="../Admin.php"><button>Admin Module</button></a>
        <a href="Manage_exam.php"><button>Manage Exam</button></a>


      </div>
      <div class="line"></div>

      <form method="POST" action='insert_other_exam.php'>
        <label for="test_name">Select a test:</label>
        <select name="test_name" id="test_name" onchange="setSelectedTest();">
          <option value="" selected>Select the Test</option>
          <?php


          // Fetch test names from the database
          $sql = "SELECT DISTINCT test_name FROM erp_test WHERE test_ce_type = 'others';";
          $result = $conn->query($sql);

          // Create a drop-down list of test names
          $options = "";
          if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
              $options .= "<option value='" . $row['test_name'] . "'>" . $row['test_name'] . "</option>";
            }
          }

          echo $options;
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
        <select id="cls_deptname" name="cls_deptname">
          <option value="" selected>Select the Department</option>
        </select>

        <br><br>
        <label for="cls_sem">Semester:</label>
        <select id="cls_sem" name="cls_sem">
          <option value="" selected>Select the Semester</option>
        </select>
        <br><br>
        <label for="ce_sdate">Start Date:</label>
        <input type="date" id="ce_sdate" name="ce_sdate" value="<?php echo isset($_POST['ce_sdate']) ? $_POST['ce_sdate'] : ''; ?>" required>
        <br><br>
        <label for="ce_edate">End Date:</label>
        <input type="date" id="ce_edate" name="ce_edate" value="<?php echo isset($_POST['ce_edate']) ? $_POST['ce_edate'] : ''; ?>" required>
        <br><br>


        <input type="submit" value="Submit" name="submit">

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
      // Function to disable autocomplete for all form elements
      function disableFormAutocomplete() {
        const formElements = document.querySelectorAll('input, select, textarea');
        formElements.forEach(element => {
          element.setAttribute('autocomplete', 'off');
        });

        // Explicitly reset the course and select test fields
        const courseDropdown = document.getElementById("cls_course");
        const testDropdown = document.getElementById("test_name");
        if (courseDropdown) {
          courseDropdown.value = '';
        }
        if (testDropdown) {
          testDropdown.value = '';
        }
      }

      // Call the function to disable autocomplete when the page loads
      window.addEventListener("load", disableFormAutocomplete);
    </script>

  </body>

  </html>

<?php
} else {
  header("Location: ../../index.php");
}
?>