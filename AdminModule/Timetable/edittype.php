<?php

session_start();

if (isset($_SESSION['user_id'])) {

    include('../../includes/config.php');


    $id = $_REQUEST['id'];  //getting id from request
    $sql = "SELECT * FROM erp_tt_type WHERE type_id= '$id' ";   // selecting value of the record Query
    $result = $conn->query($sql);  //fetching
    $row = mysqli_fetch_all($result, MYSQLI_ASSOC);
?>
    <!DOCTYPE html>
    <html>

    <head>
        <Title>Edit Time Table Type</Title>
        <link rel="stylesheet" type="text/css" href="../assets/css/styles_TT.css">
    </head>

    <body>
        <div class="TT-container">
            <div class="TT-head">
                <h1>Update Type</h1>
            </div>
            <button class="TT-button" onclick="window.location.href = 'managetypes.php';">MANAGE TYPES</button>
            <div class="TT-type-display" id="TTdisplay2">
                <?php
                $status = "";
                if (isset($_POST['new']) && $_POST['new'] == 1) {
                    $id = $_REQUEST['id'];
                    $type = $_REQUEST['title'];
                    $hours = $_REQUEST['hours'];
                    $update = "update erp_tt_type set type_title='" . $type . "', type_hours='" . $hours . "' where type_id='" . $id . "'";
                    mysqli_query($conn, $update);
                    $status = "Record Updated Successfully.";
                    echo '<p style="color:#FF0000;">' . $status . '</p>';
                } else {
                    if (is_array($row)) {
                        foreach ($row as $data) {
                ?>
            </div>
            <form id="TTform4" method="post" action="#" class="TT-form">
                <div class="TT-form-content">
                    <div><input type="hidden" name="new" value="1" /></div>
                    <div><input name="id" type="hidden" value="<?php echo $data['type_id']; ?>" /></div>
                    <div>
                        <label for="type">Time Table type Name:</label>
                        <input type="text" name="title" placeholder="Enter TimeTable Type" required value="<?php echo $data['type_title']; ?>" />
                    </div>
                    <div>
                        <label for="hours">Total Number of Hours:</label>
                        <input type="text" name="hours" placeholder="Enter Hours" required value="<?php echo $data['type_hours']; ?>" />
                    </div>
                </div>
                <div class="TT-form-button">
                    <input class="TT-button" name="submit" type="submit" value="Update" />
                </div>
            </form>
    <?php
                        }
                    } ?>
<?php } ?>
        </div>
    </body>

    </html>

    <?php
    // Close database connection
    $conn->close();
    ?>
<?php
} else {
    header("Location: ../../index.php");
}
?>