<?php 
include("includes/Header.php");
include("conn.php");

?>

<div class="container mt-5">

<?php
	include('conn.php');

	// SQL query
	$sql = "SELECT * FROM erp_news WHERE news_type = 'thought'";
	$result = mysqli_query($conn, $sql);
?>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h2>Quotes Table</h2>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Quote</th>
                        <th>Posted By</th>
					</tr>
				</thead>
				<tbody>
					<?php

    // Output data of each row
    while ($row = mysqli_fetch_assoc($result)) {
      echo "<tr id=\"" . $row['news_id'] . "\">";
        echo "<td>" . $row["news_title"] . "</td>";
        echo "<td>" . $row["news_postby"] . "</td>";
        echo "</tr>";
    }
?>

				</tbody>
			</table>
      <a href="quotes_manage.php" class="btn btn-primary">Manage</a>
      <a href="quotes_create.php" class="btn btn-primary">Create</a>


		</div>
	</div>
</div>


<?php include("includes/Footer.php"); ?>