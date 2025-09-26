<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Success</title>
<style>
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        font-family: Arial, sans-serif;
        color: #b37eb5; /* Set text color to b37eb5 */
    }
    h1 {
        text-align: center;
    }
</style>
</head>
<body>
<%
String firstName = (String) session.getAttribute("firstName");
if(firstName == null){
    // If session attribute is null, redirect to login page
    response.sendRedirect("loginPage.jsp");
}
%>
<h1>Welcome <%= session.getAttribute("firstName") %>!</h1>

</body>
</html>
