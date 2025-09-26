<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<style>
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        font-family: Arial, sans-serif;
    }
    .login-container {
        text-align: center;
    }
    .login-box {
        border: 1px solid #ccc;
        padding: 50px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
        display: inline-block;
    }
    .login-box h1 {
        color: red;
        margin-bottom: 20px;
    }
    .login-box input[type="text"], .login-box input[type="password"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 3px;
    }
    .login-box input[type="submit"] {
        padding: 10px 20px;
        background-color: #b37eb5;
        color: white;
        border: none;
        border-radius: 3px;
        cursor: pointer;
    }
    .login-box input[type="submit"]:hover {
        background-color: #905c8f;
    }
</style>
</head>
<body>
<div class="login-container">
    <h2>Login</h2>
    <div class="login-box">
        <h1> <% 
        String error = (String) session.getAttribute("error");
        if(error != null){
            out.print(error);
            session.setAttribute("error",null);
        } 
        %></h1>
        <form action="login" method="post">
            <label for="username">UserName</label>
            <input type="text" id="username" name="username"><br>
            <label for="password">Password</label>
            <input type="password" id="password" name="password"><br>
            <input type="submit" value="Login">
        </form>
    </div>
</div>
</body>
</html>
