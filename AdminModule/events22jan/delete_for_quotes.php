<?php

include "conn.php"; // Using database connection file here

$id = $_GET['id']; // get id through query string
$db = $_GET["db"];

$del = mysqli_query($conn, "DELETE FROM erp_news WHERE news_id = '" . $id . "'");// delete query

if($del)
{
    // Close connection

        header("location:quotes_manage.php"); 
        mysqli_close($conn); 
    // redirects to all records page
    exit;	
}
else
{
    echo "Error deleting record"; // display error message if not delete
}
?>
