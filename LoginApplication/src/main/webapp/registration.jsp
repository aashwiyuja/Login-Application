<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Form</title>
<style>
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        font-family: Arial, sans-serif;
    }
    .container {
        text-align: center;
    }
    .form-box {
        width: 300px; /* Adjust the form width as needed */
        border: 1px solid #ccc;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .form-box label {
        display: block;
        margin-bottom: 10px;
        text-align: center;
    }
    .form-box input[type="text"], .form-box input[type="password"] {
        width: calc(100% - 20px); /* Adjust input width */
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 3px;
    }
    .form-box input[type="submit"] {
        width: 100%;
        padding: 10px;
        background-color: #b37eb5;
        color: white;
        border: none;
        border-radius: 3px;
        cursor: pointer;
    }
    .form-box input[type="submit"]:hover {
        background-color: #905c8f;
    }
</style>
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
<div class="container">
    <h2>Register Below!</h2>

    <% String error = (String) request.getAttribute("error");
       if (error != null) { %>
       <p style="color:red;"><%= error %></p>
    <% } %>

    <div class="form-box">
        <form action="Register" method="POST" onsubmit="return validateForm()">
            <label for="firstName">First Name</label>
            <input id="firstName" name="firstName" type="text">
            <br>
            <label for="lastName">Last Name</label>
            <input id="lastName" name="lastName" type="text">
            <br>
            <label for="username">Username</label>
            <input id="username" name="username" type="text">
            <br>
            <label for="password">Password</label>
            <input id="password" name="password" type="password">
            <br>
            <input type="submit" value="Submit">
        </form>
    </div>
</div>
</body>
</html>
