<?php

session_start();

if (isset($_SESSION['user_id'])) {

  include('../../includes/config.php');


?>
  <!DOCTYPE html>
  <html>

  <head>
    <title>Subject Creation</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- sweet alert JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="./assets/css/style_TT.css">
    <style>
      /* Add your styles here */
      body {
        font-family: Arial, sans-serif;
        font-size: 14px;
        line-height: 1.5;
        color: #333;
        background-color: #f7f7f7;
        margin: 0;
        padding: 0;

        position: relative;
        left: 60px;
        width: calc(100% - 60px);
      }

      form {
        margin: 20px;
        padding: 20px;
        background-color: #fff;
        border: 1px solid #ccc;
        border-radius: 5px;
      }

      label {
        display: block;
        margin-bottom: 10px;
        font-weight: bold;
      }

      select,
      input[type="text"] {
        padding: 5px;
        border: 1px solid #ccc;
        border-radius: 3px;
        font-size: 14px;
        margin-bottom: 10px;
        width: 200px;
      }

      input[type="submit"] {
        padding: 10px;
        background-color: #337ab7;
        color: #fff;
        border: none;
        border-radius: 3px;
        cursor: pointer;
        font-size: 14px;
      }

      input[type="submit"]:hover {
        background-color: #286090;
      }

      table {
        border-collapse: collapse;
        width: 100%;
      }

      th,
      td {
        text-align: left;
        padding: 8px;
        border: 1px solid #ddd;
      }

      th {
        background-color: #f2f2f2;
      }
    </style>
  </head>

  <body>
    <h3 style="text-align:center">Create Subject</h3>
    <button class="Ad-button" onclick="window.location.href = './subject.php';">Manage Subject</button>
    <form method="POST" action="Create_subject.php">

      <label for="cls_course">Course:</label>
      <select id="cls_course" name="cls_course" required>
        <?php
        include('../../includes/config.php');

        // Query the database to fetch the dropdown options
        $sql = "SELECT DISTINCT cls_course FROM erp_class";
        $result = mysqli_query($conn, $sql);

        // Generate the options for the dropdown menu
        echo '<option value="" selected>Select the Course</option>';
        while ($row = mysqli_fetch_array($result)) {
          echo '<option value="' . $row['cls_course'] . '">' . $row['cls_course'] . '</option>';
        }

        // Close the database connection
        mysqli_close($conn);
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
      <label for="no_sub">No.of Subjects to Insert:</label>
      <input type="text" id="no_sub" name="no_sub" required></input>
      <br><br>
      <input type="submit" value="Submit" name="submit">
    </form>
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
  </body>


  <?php
  include('../../includes/config.php');

  if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['submit'])) {
    // Get the form data
    $cls_course = $_POST['cls_course'];
    $cls_deptname = $_POST['cls_deptname'];
    $cls_sem = $_POST['cls_sem'];
    $no_sub = $_POST['no_sub'];

    // Get the cls_id for the selected department
    $sql = "SELECT cls_id FROM erp_class WHERE cls_deptname = '$cls_deptname' AND cls_sem = '$cls_sem'";
    $result = mysqli_query($conn, $sql);
    if ($result && mysqli_num_rows($result) > 0) {
      $row = mysqli_fetch_assoc($result);
      $cls_id = $row['cls_id'];

      echo "<form id='myForm' action='insert_sub.php' method='post'>";
      echo "<input type='hidden' name='cls_id' value='" . $cls_id . "'>";
      echo "<table>";
      echo "<tr><th>Subject Code</th><th>Subject Name</th><th>Subject Credits</th><th>Subject Type</th></tr>";

      for ($i = 1; $i <= $no_sub; $i++) {
        echo "<tr>";
        echo "<td><input type='text' name='tt_subcode[]' required></td>";
        echo "<td><input type='text' name='sub_name[]' required></td>";
        echo "<td><input type='text' name='sub_credit[]' required></td>";
        echo "<td><select name='sub_type[]' required>";
        echo "<option value=''>Select the Type</option>";
        echo "<option value='Core'>Core</option>";
        echo "<option value='Elective'>Elective</option>";
        echo "<option value='Laboratory'>Laboratory</option>";
        echo "<option value='Others'>Others</option>";
        echo "</select></td>";
        echo "</tr>";
      }

      echo "</table>";
      echo "<input type='submit' name='submit' value='Create Subjects' disabled>";
      echo "</form>";
    }
  }
  ?>

  <script>
    const form = document.getElementById('myForm');
    const submitBtn = form.querySelector('input[type="submit"]');

    // Listen for input changes on the form
    form.addEventListener('input', () => {
      // Check if all required fields have been filled in
      const requiredFields = form.querySelectorAll('[required]');
      const isFormValid = Array.from(requiredFields).every(field => field.value !== '');

      // Enable/disable the submit button accordingly
      submitBtn.disabled = !isFormValid;
    });

    window.onload = function() {
      var form = document.getElementById("myForm");
      form.addEventListener("submit", function(event) {
        var subTypes = document.getElementsByName("sub_type[]");
        for (var i = 0; i < subTypes.length; i++) {
          if (subTypes[i].value == "") {
            Swal.fire("Please select a subject type for all subjects.");
            event.preventDefault();
            return false;
          }
        }
        return true;
      });
    }
  </script>

  </html>
<?php
} else {
  header("Location: ../../index.php");
}
?>