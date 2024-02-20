<?php

session_start();

if (isset($_SESSION['user_id'])) {

  include('../../includes/config.php');

?>
<?php
  include('../../includes/config.php');

  if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['submit'])) {
    // Get the form data
    $cls_id = $_POST['cls_id'];
    $tt_subcode = $_POST['tt_subcode'];
    $sub_name = $_POST['sub_name'];
    $sub_credit = $_POST['sub_credit'];
    $sub_type = $_POST['sub_type'];

    // Loop through the subject data and insert into the database
    $success = true;
    for ($i = 0; $i < count($tt_subcode); $i++) {
      $sql = "INSERT INTO erp_subject (cls_id, tt_subcode, sub_name, sub_credit, sub_type) VALUES ('$cls_id', '$tt_subcode[$i]', '$sub_name[$i]', '$sub_credit[$i]', '$sub_type[$i]')";
      if (!mysqli_query($conn, $sql)) {
        $success = false;
        break;
      }
    }
    if ($success) {
      echo "    <!-- sweet alert JS -->
      <script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>
      <script>Swal.fire('Subjects created successfully.')
    window.location='Create_subject.php';
    </script>";
    } else {
      echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }
  }
} else {
  header("Location: ../../index.php");
}
?>
