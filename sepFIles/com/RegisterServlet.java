package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String username = request.getParameter("username");
	        String password = request.getParameter("password");
	        String email=request.getParameter("email");
	        int phone=Integer.parseInt(request.getParameter("PhoneNumber"));
            
	        try {
	            // Load JDBC Driver
	            Class.forName("com.mysql.jdbc.Driver");

	            // Establish a connection
	            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/arambakkamshop", "root", "mysql@balaji14");

	            // Prepare SQL statement
	            String query = "INSERT INTO users (username, password, email, phone) VALUES (?, ?,?,?)";
	            PreparedStatement stmt = conn.prepareStatement(query);
	            stmt.setString(1, username);
	            stmt.setString(2, password);
	            stmt.setString(3, email);
	            stmt.setInt(4, phone);

	            // Execute update
	            int rowsInserted = stmt.executeUpdate();
	            if (rowsInserted > 0) {
	                response.sendRedirect("login.jsp");
	            } else {
	                response.getWriter().println("Registration failed!");
	            }

	            // Close connection
	            conn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.getWriter().println("An error occurred: " + e.getMessage());
	        }
	    
	}

}
