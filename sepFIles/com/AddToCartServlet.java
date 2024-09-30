package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        HttpSession ses=request.getSession(true);
        String nn=(String)ses.getAttribute("key");
       
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/arambakkamshop", "root", "mysql@balaji14");

           
            System.out.println("one");
            
            try {
            if(nn.equals("j123")) {
            	 String sql = "INSERT INTO cart (product_id, quantity) VALUES (?, 1)";
                 PreparedStatement ps = conn.prepareStatement(sql);
                 ps.setInt(1, productId);
                 ps.executeUpdate();
            response.sendRedirect("home.jsp?n=321");
            }}catch(NullPointerException e) {
            	response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
