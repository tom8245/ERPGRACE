<?php

session_start();

if (isset($_SESSION['user_id'])) {


  include('../../includes/config.php');  // <!-- connecting database -->


?>
  <!DOCTYPE html>
  <html>

  <head>
    <title>Exam Form</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
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
        font-size: 16px;
        line-height: 1.5;
        color: #333;
      }

      form {
        max-width: 500px;
        margin: 0 auto;
        padding: 20px;
        background-color: #f6f6f6;
        border: 1px solid #ccc;
        border-radius: 5px;
      }

      label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
      }

      input[type="text"],
      input[type="number"],
      select {
        width: 100%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        margin-bottom: 15px;
      }

      input[type="submit"] {
        background-color: #4CAF50;
        color: #fff;
        padding: 12px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
      }

      input[type="submit"]:hover {
        background-color: #3e8e41;
      }
    </style>
  </head>

  <body>
    <div class='container'>
      <h3 style="text-align:center">Create Exam </h3>
      <div class="line"></div>
      <div class="button-container">
        <a href="../Admin.php"><button>Admin Module</button></a>
        <a href="Manage_exam.php"><button>Manage Exam</button></a>
        <a href="Createexam.php"><button>Create Exam Timetable</button></a>
      </div>
      <div class="line"></div>

      <form method="POST" action="Create.php">
        <label for="test_name">Exam Name:</label>
        <input type="text" id="test_name" name="test_name" required><br><br>

        <label for="test_type">Test Type:</label>
        <select id="test_type" name="test_type" onchange="toggleMarks()" required>
          <option value="">Select Test Type</option>
          <option value="m">Mark</option>
          <option value="g">Grade</option>
        </select><br><br>
        <label>Exam Type:</label>
        <input type="radio" name="ce_type" id="academic" style="display:inline-block;margin-left:1px;" value="academic" required>Academic
        <input type="radio" name="ce_type" id="university" style="display:inline-block;margin-left:1px;" value="university">University
        <input type="radio" name="ce_type" id="others" style="display:inline-block;margin-left:1px;" value="others">Others

        <br><br>
        <label for="test_maxmark">Max Mark/Grade:</label>
        <input type="number" id="test_maxmark" name="test_maxmark" required><br><br>

        <label for="test_passmark">Min Mark/Grade:</label>
        <input type="number" id="test_passmark" name="test_passmark" required><br><br>

        <input type="submit" name="submit" value="Submit">
      </form>

      <script>
        function toggleMarks() {
          const typeSelect = document.getElementById("test_type");
          const maxMarkInput = document.getElementById("test_maxmark");
          const passMarkInput = document.getElementById("test_passmark");

          if (typeSelect.value === "g") { // Change "G" to "g" to match the option value
            maxMarkInput.type = "text";
            passMarkInput.type = "text";
          } else {
            maxMarkInput.type = "number";
            passMarkInput.type = "number";
          }
        }
      </script>

  </body>

  </html>
  <?php

  if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['submit'])) {
    // Get the form data
    $test_name = $_POST['test_name'];
    $test_maxmark = $_POST['test_maxmark'];
    $test_passmark = $_POST['test_passmark'];
    $test_type = $_POST['test_type'];
    $test_ce_type = $_POST['ce_type'];

    // Check if the test already exists in the database
    $sql_check = "SELECT * FROM erp_test WHERE test_name = '$test_name' AND test_type = '$test_type'";
    $result = $conn->query($sql_check);
    if ($result->num_rows > 0) {
      // Display a pop-up message asking whether to create or cancel creation
      $sql = "INSERT INTO erp_test (test_name, test_maxmark, test_passmark, test_type, test_ce_type) VALUES ('$test_name', '$test_maxmark', '$test_passmark', '$test_type' ,'$test_ce_type')";

      echo "<script>
          Swal.fire({
              title: 'The test already exists. Do you want to create it anyway?',
              showCancelButton: true,
              confirmButtonText: 'Create',
              cancelButtonText: 'Cancel'
          }).then((result) => {
              if (result.isConfirmed) {
                  // User clicked OK, insert the data into the database
                  " . ($conn->query($sql) === TRUE ? "
                      Swal.fire('Test has been created.');
                  " : "
                      Swal.fire('Error: Cannot create test.');
                  ") . "
              } else {
                  // User clicked cancel, do nothing
              }
          });
      </script>";
    } else {
      // Insert the data into the database
      $sql_insert = "INSERT INTO erp_test (test_name, test_maxmark, test_passmark, test_type, test_ce_type) VALUES ('$test_name', '$test_maxmark', '$test_passmark', '$test_type' ,'$test_ce_type')";
      if ($conn->query($sql_insert) === TRUE) {
        // Display a pop-up message if the test is successfully inserted
        echo "<script>
            Swal.fire({
                title: 'Test has been created.',
                icon: 'success',
                confirmButtonText: 'OK'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location='Manage_exam.php';
                }
            });
        </script>";
      } else {
        echo "Error: Cannot create test.";
      }
    }
  }

  $conn->close();
  ?>
  <script>
    // Function to clear form data when the page loads
    function clearFormData() {
      document.getElementById("test_name").value = "";
      document.getElementById("test_type").value = "";
      document.getElementById("test_maxmark").value = "";
      document.getElementById("test_passmark").value = "";
    }

    // Call the function to clear form data when the page loads
    window.addEventListener("load", clearFormData);

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