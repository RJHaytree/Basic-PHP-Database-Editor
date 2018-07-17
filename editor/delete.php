<?php

include 'info_file.php';

open_connection();

delete();

close_connection();

header('Location:index.php');

?>