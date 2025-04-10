package com.training;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Servlet implementation class LoginServlet
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		System.out.println("Init Load for LoginServlet");
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Entered into Servlet");
		Connection connection;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:....", "...", "...");
			System.out.println(connection);
			Statement statement = connection.createStatement();
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			ResultSet resultSet = statement.executeQuery(
					"select * from logindetails where username='" + username + "' and password='" + password + "'");
			// Assuming `firstName` is fetched from the database and set in the session
			if (resultSet.next()) {
			    String firstName = resultSet.getString("firstName"); // Assuming this is how you retrieve the first name from the result set
			    request.getSession().setAttribute("firstName", firstName);
			    RequestDispatcher requestDispatcher = request.getRequestDispatcher("success.jsp");
			    requestDispatcher.forward(request, response);
			} else {
			    // If login fails, set an error message in session and forward to login page
			    request.getSession().setAttribute("error", "Invalid username or password");
			    RequestDispatcher requestDispatcher = request.getRequestDispatcher("loginPage.jsp");
			    requestDispatcher.forward(request, response);
			}


		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

}