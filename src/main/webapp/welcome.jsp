<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome Page</title>
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
        h1 {
            text-align: center;
        }
        .buttons-container {
            margin-top: 20px;
            display: flex;
            justify-content: center;
        }
        form {
            margin: 0 10px; /* Adjust spacing between buttons */
        }
        button[type="submit"] {
            background-color: #b37eb5;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button[type="submit"]:hover {
            background-color: #905c8f;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Our Website!</h1>
        <div class="buttons-container">
            <form action="registration.jsp" method="get">
                <button type="submit">Register</button>
            </form>
            <form action="loginPage.jsp" method="get">
                <button type="submit">Login</button>
            </form>
        </div>
    </div>
</body>
</html>
