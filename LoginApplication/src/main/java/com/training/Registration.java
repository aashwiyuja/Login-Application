package com.training;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Connection connection = null;

	public void init(ServletConfig config) throws ServletException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/training", "root", "Abcdef@123456");
			System.out.println(connection);
			Statement statement = connection.createStatement();
			ServletContext servletContext = config.getServletContext();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public void destroy() {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Statement statement = connection.createStatement();
            // Check if the username already exists
            ResultSet resultSet = statement.executeQuery("SELECT * FROM logindetails WHERE username = '" + username + "'");
            if (resultSet.next()) {
                // Username already exists, return an error message
                PrintWriter writer = response.getWriter();
                response.setContentType("text/html");
                writer.println("<h2>Error: Username already exists. Please choose a different username.</h2>");
                writer.close();
                return;
            }
            // If the username doesn't exist, proceed with inserting the user into the database
            int executeUpdate = statement.executeUpdate("INSERT INTO logindetails VALUES ('" + firstName + "','" + lastName
                    + "','" + username + "','" + password + "')");
            PrintWriter writer = response.getWriter();
            response.setContentType("text/html");
            if (executeUpdate == 1) {
                writer.append("User Added Successfully!");
            } else {
                writer.append("Error Adding User.");
            }
            writer.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}