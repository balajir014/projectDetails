<!DOCTYPE html>
<%@ page import="java.util.Random" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Placed</title>
    <link rel="stylesheet" href="css/order.css">
</head>
<body>
<% Random rr=new Random();

       int i=rr.nextInt(10000);%>
    <div class="container">
        <div class="order-confirmation">
            <img src="https://img.icons8.com/color/96/000000/ok--v1.png" alt="Order Placed">
            <h1>Thank You for Your Order!</h1>
            <p>Your order has been placed successfully.</p>
            <p>Order Number: <strong>#<%=i %></strong></p>
            <p>We have sent a confirmation email to your registered email address.</p>
            <a href="home.jsp" class="button">Continue Shopping</a>
            <a href="LogoutServlet" class="button">LogOut</a>
        </div>
    </div>
</body>
</html>
</html>