<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Form</title>
<script>
function validateForm() {
    var firstName = document.getElementById("firstName").value;
    var lastName = document.getElementById("lastName").value;
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    
    if (firstName === "" || lastName === "" || username === "" || password === "") {
        alert("All fields are required");
        return false;
    }
    
    if (firstName === "") {
        alert("First Name field is incomplete");
        return false;
    }
    
    if (lastName === "") {
        alert("Last Name field is incomplete");
        return false;
    }
    
    if (username === "") {
        alert("Username field is incomplete");
        return false;
    }
    
    if (password === "") {
        alert("Password field is incomplete");
        return false;
    }
    
    return true;
}
</script>
</head>
<body>
<Form action="registration" method="POST" onsubmit="return validateForm()">
FirstName : <input id="firstName" name="firstName">
<br>
LastName : <input id="lastName" name="lastName">
<br>
UserName : <input id="username" name="username">
<br>
Password : <input id="password" name="password">
<br>
<input type="submit" value="Submit">
</Form>
</body>
</html>
