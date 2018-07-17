<?php

$connection_var;

function open_connection(){
    global $connection_var;
    $connection_var = mysqli_connect("localhost","root","","bus_db");
    
    if (mysqli_connect_error($connection_var)){
        echo "Failed to connect to MySQL: " . mysqli_connect_error();
    }
}

function close_connection(){
    global $connection_var;
    mysqli_close($connection_var);
}

function show_table(){
    global $connection_var;
    $result = mysqli_query($connection_var,"SELECT * FROM bus_driver");
    
    while ($row = mysqli_fetch_array($result)){
        echo "<div class='field-div'>";
        echo "<table>";
        echo "<tr>";
        echo "<td class='field'>" . $row['employee_id'] . "</td>";
        echo "<td class='field'>" . $row['licence_num'] . "</td>";
        echo "<td class='field'>" . $row['expire_date'] . "</td>";
        echo "<td class='field'>" . $row['acquire_date'] . "</td>";
        echo "<td class='field' id='points_column'>" . $row['p_points'] . "</td>";
        echo "<td class='div-table'></td>";
        echo '<td><a href="update.php?id=' . $row['ID'] . '"><button class="glyphicon glyphicon-pencil" title="Edit" id="edit"></button></a></td>';
        echo "<td class='div-table'></td>";
        echo '<td><a href="delete.php?id=' . $row['ID'] . '"><button class="glyphicon glyphicon-remove" title="Delete" id="delete"></button></a></td>';
        echo "</tr>";
        echo "</table>";
        echo "</div>";
    }
}

function insert($employee_id, $licence_num, $input_expire, $input_acquire, $points) {
    global $connection_var;
    
    mysqli_query($connection_var, "INSERT INTO bus_driver (`ID`,`employee_id`,`licence_num`,`expire_date`,`acquire_date`,`p_points`) VALUES (NULL,'".$employee_id."','".$licence_num."','".$input_expire."','".$input_acquire."','".$points."')");
}

function delete(){
    global $connection_var;
    
    $url = 'DELETE FROM bus_driver WHERE ID='.$_GET["id"];
    mysqli_query($connection_var, $url);
}

function update($ID, $employee_id, $licence_num, $input_expire, $input_acquire, $points) {
    global $connection_var;
    
    mysqli_query($connection_var, "UPDATE bus_driver SET employee_id = '".$employee_id."', licence_num = '".$licence_num."', expire_date = '".$input_expire."', acquire_date = '".$input_acquire."', p_points = '".$points."' WHERE ID = '".$ID."'");
}

function populate_update(){
    global $connection_var;
    
    $result = mysqli_query($connection_var, "SELECT * FROM bus_driver WHERE ID = ".$_GET["id"]);
    
    $row = mysqli_fetch_array($result);
    
    echo '<form action="update_posted.php" method="post" onsubmit="return validateUpdateForm()" name="update">';
    echo'<input type="hidden" name="ID" value="'.$_GET["id"].'">';
    echo '<input type="text" name="employee-id" placeholder="Employee ID" value="'.$row['employee_id'].'">';
    echo '<input type="text" name="licence" placeholder="Licence Num" value="'.$row['licence_num'].'">';
    echo '<input type="text" name="expire-date" placeholder="Expiry Date" value="'.$row['expire_date'].'">';
    echo '<input type="text" name="acquire-date" placeholder="Acquiry Date" value="'.$row['acquire_date'].'">';
    echo '<input type="number" name="lc-points"  placeholder="Points" value="'.$row['p_points'].'">';
    echo '<button class="glyphicon glyphicon-save" title="Update" type="submit"></button>';
    echo '</form>';
}

?>