<?php

include 'info_file.php';

open_connection();

insert($_POST["employee-id"],$_POST["licence"],$_POST["expire-date"],$_POST["acquire-date"],$_POST["lc-points"]);

header('Location:index.php');

close_connection();

?>