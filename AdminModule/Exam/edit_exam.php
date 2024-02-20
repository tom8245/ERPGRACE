<?php

session_start();

if (isset($_SESSION['user_id'])) {


  include('../../includes/config.php');  // <!-- connecting database -->


  $ce_id = $_GET['ce_id'];
  $test_id = $_GET['test_id'];

  if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update'])) {
    // Get the updated exam end date and update the database
    $ce_edate = $_POST['ce_edate'];
    $sql = "UPDATE erp_createexam SET ce_edate = '$ce_edate' WHERE ce_id = '$ce_id'";
    $result = mysqli_query($conn, $sql);
    if (!$result) {
      echo "Error updating exam end date: " . mysqli_error($conn);
      exit();
    }

    // Get the updated exam dates and update the database
    foreach ($_POST['exam_date'] as $tt_subcode => $exam_date) {
      if (isset($tt_subcode) && isset($exam_date)) {
        $sql = "UPDATE erp_exam SET exam_date = '$exam_date' WHERE ce_id = '$ce_id' AND tt_subcode = '$tt_subcode'";
        $result = mysqli_query($conn, $sql);
        if (!$result) {
          echo "Error updating exam dates: " . mysqli_error($conn);
          exit();
        }
      }
    }

    echo "<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>
    <script>Swal.fire('Exam dates updated successfully.');
  window.location='Manage_exam.php';
  </script>";
  }

  // Get ce_sdate and ce_edate from the database
  $sql = "SELECT ce_sdate, ce_edate FROM erp_createexam WHERE ce_id = '$ce_id'";
  $result = mysqli_query($conn, $sql);
  if ($result && mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
    $ce_sdate = $row['ce_sdate'];
    $ce_edate = $row['ce_edate'];

    // Get exam dates and subject codes from the database
    $sql = "SELECT tt_subcode, exam_date FROM erp_exam WHERE ce_id = '$ce_id' AND test_id = '$test_id'";
    $result = mysqli_query($conn, $sql);
    if ($result && mysqli_num_rows($result) > 0) {
      // Start wrapping the elements inside the container div
      echo "<div class='container'>";
      echo "<form method='post'>";
      echo "<link rel='stylesheet' type='text/css' href='edit_exam.css'>";

      // Add input field for modifying the end date at the top of the form
      echo "<label for='ce_edate'>Exam End Date:</label>";
      echo "<input type='date' id='ce_edate' name='ce_edate' value='" . $ce_edate . "' min='" . $ce_sdate . "' onchange='updateExamDates(this.value)'><br><br>";

      echo "<table>";
      echo "<tr><th>Subject Code</th><th>Exam Date</th></tr>";
      while ($row = mysqli_fetch_assoc($result)) {
        echo "<tr>";
        echo "<td>" . $row['tt_subcode'] . "</td>";
        // Set the range for the exam date based on ce_sdate and ce_edate
        echo "<td><input type='date' name='exam_date[" . $row['tt_subcode'] . "]' value='" . $row['exam_date'] . "' min='" . $ce_sdate . "'></td>";
        echo "</tr>";
      }
      echo "</table>";
      echo "</div>"; // Close the container div

      echo '<input type="submit" name="update" value="Update">';
      echo "</form>";


      // Add JavaScript function to update exam date inputs based on the selected end date
      echo '<script>
      function updateExamDates(endDate) {
        const examDateInputs = document.querySelectorAll(\'input[type="date"][name^="exam_date"]\');
        examDateInputs.forEach(input => {
          input.max = endDate;
        });
      }
    </script>';
    } else {
      echo "No exam data found.";
    }

    // Add Back button
    echo "<form action='Manage_exam.php' method='post'>";
    echo "<input type='submit' name='back' value='Back'>";
    echo "</form>";
  } else {
    echo "No data found.";
  }

?>
<?php
} else {
  header("Location: ../../index.php");
}
?>
