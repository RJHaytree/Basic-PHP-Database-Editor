function validateAdditionForm(){
    var a = document.forms["addition"]["employee-id"].value;
    var b = document.forms["addition"]["licence"].value;
    var c = document.forms["addition"]["expire-date"].value;
    var d = document.forms["addition"]["acquire-date"].value;
    var e = document.forms["addition"]["lc-points"].value;
    
    regex = /(\d{4})-(\d{2})-(\d{2})/;
    
    if (a == null || a == ""){
        alert("The employee ID cannot be empty!");
        return false;
    }
    else if (a.length != 6){
        alert("The employee ID must be 6 characters long!");
        return false;
    }
    else if (b == null || b == ""){
        alert("The licence number cannot be empty!");
        return false;
    }
    else if (b.length < 8 || b.length > 9){
        alert("The licence number must be 8-9 characters long. Do not include spaces in the input!");
        return false;
    }
    else if (c == null || c == ""){
        alert("The licence expiry date cannot be empty!");
        return false;
    }
    else if (!c.match(regex)){
        alert("The licence expiry date must be in the format YYYY-MM-DD.");
        return false;
    }
    else if (d == null || d == ""){
        alert("The licence acquiry date cannot be empty!");
        return false;
    }
    else if (!d.match(regex)){
        alert("The licence acquiry date must be in the format YYYY-MM-DD.");
        return false;
    }
    else if (e == null || e == ""){
        alert("The licence points cannot be empty! Enter 0 if no points are allocated.");
        return false;
    }
    else if (e < 0){
        alert("The licence points cannot be lower than 0!");
        return false;
    }
}

function validateUpdateForm() {
    var a = document.forms["update"]["employee-id"].value;
    var b = document.forms["update"]["licence"].value;
    var c = document.forms["update"]["expire-date"].value;
    var d = document.forms["update"]["acquire-date"].value;
    var e = document.forms["update"]["lc-points"].value;
    
    regex = /(\d{4})-(\d{2})-(\d{2})/;
    
    if (a == null || a == ""){
        alert("The employee ID cannot be empty!");
        return false;
    }
    else if (a.length != 6){
        alert("The employee ID must be 6 characters long!");
        return false;
    }
    else if (b == null || b == ""){
        alert("The licence number cannot be empty!");
        return false;
    }
    else if (b.length < 8 || b.length > 9){
        alert("The licence number must be 8-9 characters long. Do not include spaces in the input!");
        return false;
    }
    else if (c == null || c == ""){
        alert("The licence expiry date cannot be empty!");
        return false;
    }
    else if (!c.match(regex)){
        alert("The licence expiry date must be in the format YYYY-MM-DD.");
        return false;
    }
    else if (d == null || d == ""){
        alert("The licence acquiry date cannot be empty!");
        return false;
    }
    else if (!d.match(regex)){
        alert("The licence acquiry date must be in the format YYYY-MM-DD.");
        return false;
    }
    else if (e == null || e == ""){
        alert("The licence points cannot be empty! Enter 0 if no points are allocated.");
        return false;
    }
    else if (e < 0){
        alert("The licence points cannot be lower than 0!");
        return false;
    }
}