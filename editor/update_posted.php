<?php

include 'info_file.php';

open_connection();

update($_POST["ID"],$_POST["employee-id"],$_POST["licence"],$_POST["expire-date"],$_POST["acquire-date"],$_POST["lc-points"]);

close_connection();

header('Location:index.php');

?>