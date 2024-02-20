<?php

session_start();

if (isset($_SESSION['user_id'])) {


    include('../../includes/config.php');  // <!-- connecting database -->

?>
<?php

  $ce_id = $_GET['ce_id'];
  $test_id = $_GET['test_id'];

  $sql = "SELECT tt_subcode, exam_date FROM erp_exam WHERE ce_id = '$ce_id'";
  $result = mysqli_query($conn, $sql);
  if ($result && mysqli_num_rows($result) > 0) {
    // Display the rows in a table
    echo "<div class='container'>";
    echo "<form method='post'>";
    echo "<link rel='stylesheet' type='text/css' href='view_exam.css'>";
    echo "<table>";
    echo "<tr><th>Subject Code</th><th>Exam Date</th></tr>";
    while ($row = mysqli_fetch_assoc($result)) {
      echo "<tr>";
      echo "<td>" . $row['tt_subcode'] . "</td>";
      echo "<td>" . $row['exam_date'] . "</td>";
      echo "</tr>";
    }
    echo "</table>";
    echo "</form>";

    // Add Edit and Back buttons
    echo "<form action='edit_exam.php' method='get'>";
    echo "<input type='hidden' name='ce_id' value='" . $ce_id . "'>";
    echo "<input type='hidden' name='test_id' value='" . $test_id . "'>";
    echo '<input type="submit" value="Edit">';
    echo "</form>";

    echo "<br>";

    echo "<form action='Manage_exam.php' method='post'>";
    echo "<input type='submit' name='back' value='Back'>";
    echo "</form>";
    echo "</div>";
  } else {
    echo "No data found.";
  }
} else {
  header("Location: ../../index.php");
}
?>
