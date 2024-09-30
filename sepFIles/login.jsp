<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="css/login.css">
     <link rel="stylesheet" href="css/styles.css">
</head>
<body>
 <nav>
        <ul class="menu">
            <li><a href="welcome.jsp">Home</a></li>
            <li><a href="home.jsp">Shop</a></li>
            <li><a href="cart.jsp">cart</a></li>
            <li><a href="login.jsp">Login</a></li>
            
        </ul>
    </nav>
    <h2>Login</h2>
    <form action="LoginServlet" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>
        <input type="submit" value="Login">
        <a href="register.jsp">If new user, kindly register</a>
    </form>
</body>
</html>
    