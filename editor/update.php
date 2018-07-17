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
        <link href="assets/css/update-style.css" rel=stylesheet>
        <link href="https://fonts.googleapis.com/css?family=PT+Sans|Sunflower:300" rel="stylesheet">
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="assets/js/app.js" type="text/javascript"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        <?php include 'info_file.php';
                open_connection();
        
        ?>
        
    </head>
    
    <body>
        
        <div id="wrapper" class="content">
            
            <div id="bar">
                
                <table>
                    <th><h3>Minerva - Database Editor » bus_driver</h3></th>
                    <th><div class="back-con"><a href="index.php"><button class="glyphicon glyphicon-chevron-left" id="back" title="Back"></button></a></div></th>
                </table>
            </div>
            
            <div id="space"></div>
            
            <div class="update-bar">
                <div class="update-space">
                    <div class="update-entry">
                        
                        <div class="update-head">
                
                        <table>
                            <th><p>Employee ID</p></th>
                            <th><p id="licence">Licence Num</p></th>
                            <th><p id="expire">Expiry Date</p></th>
                            <th><p id="acquire">Acquiry Date</p></th>
                            <th><p id="points">Points</p></th>
                        </table>
                    
                        </div>
                        
                        <div id="update-fields">
                            
                        <?php
                        
                        populate_update();
                        
                        close_connection();
                        
                        ?>
                        
                        </div>
                        
                    </div>
                </div>
            </div>
            
            <div class="up-bar">
            </div>
            
            <div id="space"></div>
            
            <footer>
                <p>&copy Ryan Haytree</p>
            </footer>
            
        </div>
    
    </body>
    
</html>