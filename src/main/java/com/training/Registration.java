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

@WebServlet("/Register")
public class Registration extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void init() throws ServletException {
        System.out.println("Init Load for RegistrationServlet");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Entered into Servlet");
        Connection connection;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:...", "...", "...");
            System.out.println(connection);
            Statement statement = connection.createStatement();
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (firstName.isEmpty() || lastName.isEmpty() || username.isEmpty() || password.isEmpty()) {
                request.setAttribute("error", "All fields are required.");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("registration.jsp");
                requestDispatcher.forward(request, response);
                return;
            }

            ResultSet resultSet = statement.executeQuery(
                    "select * from logindetails where username='" + username + "'");

            if (resultSet.next()) {
                request.setAttribute("error", "Username already exists.");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("registration.jsp");
                requestDispatcher.forward(request, response);
            } else {
                statement.executeUpdate("insert into logindetails (firstName, lastName, username, password) values ('" +
                        firstName + "', '" + lastName + "', '" + username + "', '" + password + "')");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("success.jsp");
                requestDispatcher.forward(request, response);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
