<?php
include("includes/Header.php");
include("conn.php");
session_start();

if (isset($_SESSION['user_id'])) {
    // // Get the JSON data from the POST request
    $user_id = $_SESSION['user_id'];

?>

    <button onclick="goBack()">Go Back</button>

    <script>
        function goBack() {
            window.history.back();
        }
    </script>
    <?php include("includes/Header.php");
    include("conn.php");

    $sql = "SELECT * FROM erp_news WHERE news_type='events' ORDER BY news_id DESC LIMIT 1;";
    $result = mysqli_query($conn, $sql);
    if (mysqli_num_rows($result) > 0) {

        $row = mysqli_fetch_assoc($result);
        echo "<h2><marquee direction='left' scrollamount='17'>" . $row['news_type'] . ": " . $row['news_title'] . ": " . $row['news_desc'] . "";
        echo "</marquee>";
        echo "</h2>";
    }
    ?>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-8 mx-auto text-center">
                <h2>Events</h2>
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>News Title</th>
                            <th>News Description</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        // Pagination variables
                        $limit = 3;
                        $page = isset($_GET['page']) ? $_GET['page'] : 1;
                        $start = ($page - 1) * $limit;

                        // Fetch and display data from erp_news table
                        $sql = "SELECT * FROM erp_news WHERE news_type='events' LIMIT $start, $limit";
                        $result = mysqli_query($conn, $sql);

                        if (mysqli_num_rows($result) > 0) {
                            while ($row = mysqli_fetch_assoc($result)) {
                                echo "<tr id=\"" . $row['news_id'] . "\">";
                                echo "<td>" . $row["news_title"] . "</td>";
                                echo "<td>" . $row["news_desc"] . "</td>";
                                echo "<td><a href='edit_for_calender.php?id=" . $row["news_id"] . "&db=erp_news" . "'>Edit</a></td>";
                                echo "<td><button class='btn btn-danger btn-sm remove'>Delete</button></td>";
                                echo "</tr>";
                            }
                        } else {
                            echo "<tr><td colspan='3'>No results</td></tr>";
                        }

                        // Pagination links
                        $sql = "SELECT COUNT(*) AS count FROM erp_news WHERE news_type ='events'";
                        $result = mysqli_query($conn, $sql);
                        $row = mysqli_fetch_assoc($result);
                        $total_pages = ceil($row['count'] / $limit);

                        echo "<tr><td colspan='3'>";
                        echo "<nav aria-label='Page navigation'>";
                        echo "<ul class='pagination justify-content-center'>";

                        for ($i = 1; $i <= $total_pages; $i++) {
                            $active = ($i == $page) ? "active" : "";
                            echo "<li class='page-item $active'><a class='page-link' href='?page=$i'>$i</a></li>";
                        }

                        echo "</ul>";
                        echo "</nav>";
                        echo "</td></tr>";

                        // if ($_SERVER["REQUEST_METHOD"] == "POST") {
                        //     $event_name = $_POST["event_name"];
                        //     $event_type = $_POST["event_type"];
                        //     $event_date = $_POST["event_date"];
                        //     $event_time = $_POST["event_time"];
                        //     $event_duration = $_POST["event_duration"];

                        //     // Create news description sentence
                        //     $news_desc = "The event '" . $event_name . "' of type '" . $event_type . "' is scheduled for " . $event_date . " at " . $event_time . " for a duration of " . $event_duration;
                        //     $news_desc = mysqli_real_escape_string($conn, $news_desc);

                        //     // Insert form data into erp_news table
                        //     $sql = "INSERT INTO erp_news (news_title, news_type, news_desc) VALUES ('$event_name', '$event_type', '$news_desc')";
                        //     if (mysqli_query($conn, $sql)) {
                        //         echo "New event created successfully";
                        //     } else {
                        //         echo "Error: " . $sql . "<br>" . mysqli_error($conn);
                        //     }
                        // }

                        ?>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(".remove").click(function() {
            var id = $(this).parents("tr").attr("id");


            if (confirm('Are you sure to remove this record ?')) {
                $.ajax({
                    url: '/delete_for_calender.php',
                    type: 'GET',
                    data: {
                        id: id
                    },
                    error: function() {
                        alert('Deleted');
                    },
                    success: function(data) {
                        $("#" + id).remove();
                        alert("Deleted Successfully");
                    }
                });
                window.location.href = "delete_for_calender.php?id=" + id + "&db=notices";
            }
        });
    </script>

    <?php include("includes/Footer.php"); ?>

<?php
} else {
    header("Location: ../../index.php");
}
?>