<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart List</title>
	
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/styles1.css">
     <link rel="stylesheet" href="css/cart.css">
     <script>
     var sum=0,k=0;
       function check(i,j) {
    	
    	   sum=sum+i;
    	   
    	  if(k==0) {
    		sum=sum+j;
    	   document.getElementById("demo").innerHTML ="Total Price  :" + sum;
    	   
    	   k=1;
    	  }
    	  document.getElementById("demo").innerHTML ="Total Price  :" + sum;
       }
     </script>
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
    
       <h1>Your Shopping Cart</h1>
        <%
            // Database connection
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            ResultSet rs1=null;
            ResultSet rs2=null;
            ResultSet rs3=null;
            ArrayList al=new ArrayList();
            int count=0;
            double sum=0,sum1=0;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/arambakkamshop", "root", "mysql@balaji14");
                stmt = conn.createStatement();
               
                
                String sql1="select sum(p.price) as sum from products p inner join cart c on p.id=c.product_id";
                rs1=stmt.executeQuery(sql1);
                
                while(rs1.next()) {
                	sum=rs1.getDouble("sum");
                }
                
                String sql3="select sum(p.price) as sum from products1 p inner join cart c on p.pro_id=c.product_id";
                rs3=stmt.executeQuery(sql3);
                
                while(rs3.next()) {
                	sum1=rs3.getDouble("sum");
                }
                
                String sql2 = "SELECT p.images, p.name, p.price, c.quantity,c.id FROM products1 p INNER JOIN cart c ON p.pro_id = c.product_id";
                rs2 = stmt.executeQuery(sql2);
                
                while(rs2.next()) {
                	 al.add(rs2.getString("images")); 
                     al.add(rs2.getString("name"));
                     al.add(rs2.getDouble("price"));
                     al.add(rs2.getInt("id"));
                     count++;
                }
            
                String sql = "SELECT p.images, p.name, p.price, c.quantity,c.id FROM products p INNER JOIN cart c ON p.id = c.product_id";
                rs = stmt.executeQuery(sql);
              
                
                
        %>
    <div>
       
                   <div class="container">
             <% 
             
            
             while(rs.next()){
            	
                al.add(rs.getString("images"));
                al.add(rs.getString("name"));
                al.add(rs.getDouble("price"));
                al.add(rs.getInt("id"));
                 
                count++;
             
             }
             
             int k=0;
         for(int i=1;i<=count;i++) {
                 
                 %>
   
        <div class="cart-items">
            <div class="cart-item">
                <img src="images/<%= al.get(k++) %>" alt="Product 1"> 
                <div class="item-details">
                    <h2><%= al.get(k++) %></h2>
                    <p>Price :<%= al.get(k++) %></p>
                    <label for="quantity1">Quantity:</label>
                    <input type="number" id="quantity1" value="1" min="1">
                </div>
                <div class="remove-item">
                  <form action="RemoveFromCart?id=<%=al.get(k++)%>" method="post">
                    <button type="submit">Remove</button>
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
       <div class="cart-summary">
            <h2>Cart Summary</h2>
            <input type="hidden" id="jsValue">
            
           <p id="demo">Total Price: <%= sum+sum1 %></p>
           <form action="OrderPlaced" method="post">
            <button type="submit" class="checkout">Proceed to Checkout</button>
           </form> 
        </div> 
       
      
         
    </div>
    </div>
    
    
    
   
</body>
</html>
 