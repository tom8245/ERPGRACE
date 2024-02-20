<?php

session_start();

if (isset($_SESSION['user_id'])) {

  include('../../includes/config.php');  // <!-- connecting database -->

?>
  <!DOCTYPE html>
  <html>

  <head>
    <title>Exam Timetable Creation</title>
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
      <h3 style="text-align:center">Create Exam Timetable</h3>
      <div class="line"></div>
      <div class="button-container">
        <a href="../Admin.php"><button>Admin Module</button></a>
        <a href="Manage_exam.php"><button>Manage Exam</button></a>
        <a href="Create_other_exam.php"><button>Create Other Exam</button></a>

      </div>
      <div class="line"></div>

      <form method="POST" action='Createexam.php' id="createexamform">
        <label for="test_name">Select a test:</label>
        <select name="test_name" id="test_name" onchange="setSelectedTest()" ;>
          <option value="" selected>Select the Test</option>
          <?php


          // Fetch test names from the database
          $sql = "SELECT DISTINCT test_name FROM erp_test WHERE test_ce_type = 'academic' OR test_ce_type = 'university';";
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
        <label>Exam Type:</label>
        <input type="radio" name="ce_type" id="academic" style="display:inline-block;margin-left:1px;" value="academic" required>Academic
        <input type="radio" name="ce_type" id="university" style="display:inline-block;margin-left:1px;" value="university">University
        <br><br>
        <label for="ce_sdate">Start Date:</label>
        <input type="date" id="ce_sdate" name="ce_sdate" value="<?php echo isset($_POST['ce_sdate']) ? $_POST['ce_sdate'] : ''; ?>" required>
        <br><br>
        <label for="ce_edate">End Date:</label>
        <input type="date" id="ce_edate" name="ce_edate" value="<?php echo isset($_POST['ce_edate']) ? $_POST['ce_edate'] : ''; ?>" required>
        <br><br>

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
      // Function to clear form data when the page loads
      function clearFormData() {
        document.getElementById("test_name").value = "";
        document.getElementById("cls_course").value = "";
        document.getElementById("cls_deptname").value = "";
        document.getElementById("cls_sem").value = "";
        document.getElementById("academic").checked = false;
        document.getElementById("university").checked = false;
        document.getElementById("ce_sdate").value = "";
        document.getElementById("ce_edate").value = "";
      }

      // Call the function to clear form data when the page loads
      window.addEventListener("load", clearFormData);

      // Disable caching of the form page
      window.addEventListener("pageshow", function(event) {
        if (event.persisted || (window.performance && window.performance.navigation.type === 2)) {
          // Page was fetched from the cache, clear form data
          clearFormData();
        }
      });
    </script>


    <!-- Container for PHP code after form submission -->
    <div id="phpCodeSection">
      <?php


      if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['submit'])) {


        echo "<script>
        document.addEventListener('DOMContentLoaded', function() {
          var phpCodeSection = document.getElementById('phpCodeSection');
          if (phpCodeSection) {
            phpCodeSection.scrollIntoView({
              behavior: 'smooth',
              block: 'start'
            });
          }
        });
      </script>";

        // Get the form data
        $cls_deptname = $_POST['cls_deptname'];
        $cls_course = $_POST['cls_course'];
        $ce_sdate = $_POST['ce_sdate'];
        $ce_edate = $_POST['ce_edate'];
        $cls_sem = $_POST['cls_sem'];
        $ce_exam = $_POST['test_name'];
        $ce_type = $_POST['ce_type'];


        // Get the cls_id for the selected department
        $sql = "SELECT cls_id FROM erp_class WHERE cls_deptname = '$cls_deptname' AND cls_sem = '$cls_sem'";
        $result = mysqli_query($conn, $sql);
        if ($result && mysqli_num_rows($result) > 0) {
          $row = mysqli_fetch_assoc($result);
          $cls_id = $row['cls_id'];

          // Get the subject details for the selected department
          $sql = "SELECT sub_name, tt_subcode FROM erp_subject WHERE cls_id = '$cls_id'";
          $result = mysqli_query($conn, $sql);

          if ($result && mysqli_num_rows($result) > 0) {
            echo "<form id='schedule' action='insert_exam.php' method='post' onsubmit='return validateDates()'>";
            echo "<input type='hidden' name='ce_exam' value='" . $ce_exam . "'>";
            echo "<input type='hidden' name='ce_type' value='" . $ce_type . "'>";
            echo "<input type='hidden' name='cls_id' value='" . $cls_id . "'>";
            echo "<input type='hidden' name='ce_sdate' value='" . $ce_sdate . "'>";
            echo "<input type='hidden' name='ce_edate' value='" . $ce_edate . "'>";

            echo "<table>";
            echo "<tr><th>Subject Name</th><th>Subject Code</th><th>Date Of Examination</th></tr>";
            echo "<tr><td></td><td></td><td><span>*check the box to exclude</span></td></tr>";
            while ($row = mysqli_fetch_assoc($result)) {
              echo "<tr><td>" . $row['sub_name'] . "</td><td>" . $row['tt_subcode'] . "</td>";
              echo "<input type='hidden' name='tt_subcode[]' value='" . $row['tt_subcode'] . "'>";
              echo "<td><input type='date' name='exam_date[]' min='" . $ce_sdate . "' max='" . $ce_edate . "'></td>";
              echo "<td><input type='checkbox' name='exclude_exam[]'></td>";
              echo "</tr>";
            }

            echo "</table>";
            echo "<input type='submit' name='submit' value='Create Exam'>";
            echo "</form>";
          }
        } else {
          echo "No data found for the selected department.";
        }
      }
      ?>

    </div>
    <script>
      // Scroll to the PHP code section after form submission
      document.getElementById('createexamform').onsubmit = function() {
        var phpCodeSection = document.getElementById('phpCodeSection');
        if (phpCodeSection) {
          phpCodeSection.scrollIntoView({
            behavior: 'smooth',
            block: 'start'
          });
        }
      };
    </script>

  </body>

  </html>


  <script>
    function validateDates() {
      var examDates = document.getElementsByName("exam_date[]");
      var excludeExams = document.getElementsByName("exclude_exam[]");

      for (var i = 0; i < examDates.length; i++) {
        // If the checkbox is checked, skip validation for this row
        if (excludeExams[i].checked) {
          continue;
        }

        if (examDates[i].value == "") {
          Swal.fire("Please enter all exam dates.");
          return false;
        }
      }
      return true;
    }
  </script>

  <script>
    // clear form history
    if (window.history.replaceState) {
      window.history.replaceState(null, null, window.location.href);
    }
  </script>
<?php
} else {
  header("Location: ../../index.php");
}
?>