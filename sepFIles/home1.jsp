<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
     <link rel="stylesheet" href="css/styles1.css">
     <link rel="stylesheet" href="css/styles.css">
     <link rel="stylesheet" href="css/search.css">
     <script type="text/javascript">
        function show() {
        	var m=document.getElementById("validId");
        
        	if(m.value=="321"){
        		alert("added to the cart...")
        	}
        }
          
     
     </script>
    
    
</head>
<body onload="show();">
 <nav>
 <% String n=(String)session.getAttribute("n");
            if(n==null)
            n="ArambakkamOnlineShop";
            else
            n="welcome " + n;
            
            %>
 <div class="search-container">
        <form action="SearchServlet" method="GET">
            <input type="text" placeholder="Search for products..." name="q" class="search-input">
            <button type="submit" class="search-button">Search</button>
        </form>
    </div>           
        <ul class="menu">
            <li><a href="welcome.jsp">Home</a></li>
            <li><a href="home.jsp">Shop</a></li>
            <li><a href="cart.jsp">cart</a></li>
            <li><a href="login.jsp">Login</a></li>
            <li><font color="red" size ="4"><%= n %></font>
            
        </ul>
    </nav>
   
       <div class="product-grid">
     <%
            // Database connection
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/arambakkamshop", "root", "mysql@balaji14");
                stmt = conn.createStatement();
                String sql = "SELECT * FROM products1";
                rs = stmt.executeQuery(sql);

                while(rs.next()){
                    int id = rs.getInt("pro_id");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    String im=rs.getString("images");
        %>
        <!-- Product 1 -->
        <div class="product">
            <img src="images/<%=im%>" alt="Product 1" class="product-image" width="250px" height="250px">
            <h2 class="product-title"><%= name %></h2>
            <p class="product-price"><%= price %></p>
            <div class="product-actions">
                <form action="AddToCartServlet" method="post">
                 <input type="hidden" name="productId" value="<%= id %>"/>
                 <input type="hidden" id="validId" value="<%=request.getParameter("n") %>"/>
                   <button type="submit" class="btn add-to-cart">Add to Cart</button>
                <a href="BuyNow" class="btn buy-now">Buy Now</a>
                </form>
            </div>
        </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
       
        
    </div>
</body>
</html>
   
    
