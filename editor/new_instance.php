/*
    In this file, the respective fields are collected from the form in index.php

    Upon submitting the script, this file is executed and the information from the fields are collected using the POST
    method. These variables are then used in the insert function, which uploads the data to MySQL.

    header('location:index.php'); is then used to open the index.php page once the data is submitted to MySQL.
*/

<?php

include 'info_file.php';

open_connection();

insert($_POST["employee-id"],$_POST["licence"],$_POST["expire-date"],$_POST["acquire-date"],$_POST["lc-points"]);

header('Location:index.php');

close_connection();

?>
