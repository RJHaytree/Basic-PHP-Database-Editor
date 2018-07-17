<!DOCTYPE html>

<?php

?>

<html>
    
    <head>
        <meta charset="utf-8">
        <title>Minerva - Database Editor</title>
        
        <meta name="author" content="Ryan Haytree">
        <meta name="description" content="A web-based database editor for Minerva. Currently supporting the editing of the bus driver table">
        
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=PT+Sans|Sunflower:300" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="assets/js/app.js" type=text/javascript></script>
        
        <?php include 'info_file.php';
                open_connection();
        
        ?>
        
    </head>
    
    <body>
        
        <div id="wrapper" class="content">
            
            <div id="bar">
                <h3>Minerva - Database Editor » bus_driver</h3>
            </div>
            
            <div id="space"></div>
            
            <div class="input-bar">
                <div class="input-space">
                    <div class="new-entry">
                        <form action="new_instance.php" method="post" onsubmit="return validateAdditionForm()" name="addition">
                            <input type="text" name="employee-id" placeholder="Employee ID">
                            <input type="text" name="licence" placeholder="Licence Num">
                            <input type="text" name="expire-date" placeholder="Expiry Date">
                            <input type="text" name="acquire-date" placeholder="Acquiry Date">
                            <input type="number" name="lc-points"  placeholder="Points">
                            <button class="glyphicon glyphicon-plus" title="Add" type="submit"></button>
                        </form>
                    </div>
                </div>
            </div>
            
            <div id="space"></div>
            
            <div class="table-content">
                
                <div class="table-head">
                
                    <table>
                        <th><p>Employee ID</p></th>
                        <th><p id="licence">Licence Num</p></th>
                        <th><p id="expire">Expiry Date</p></th>
                        <th><p id="acquire">Acquiry Date</p></th>
                        <th><p id="points">Points</p></th>
                    </table>
                    
                </div>
                
                <?php
                
                show_table();
                close_connection();
                
                ?>
                
            </div>
            
            <div id="space"></div>
            
            <footer>
                <p>&copy Ryan Haytree</p>
            </footer>
            
        </div>
    
    </body>
    
</html>