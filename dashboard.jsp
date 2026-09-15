<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ecommerce.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: Arial, sans-serif; background: #f3f3f3; }
        .header { background: #131921; color: white; padding: 12px 20px; display: flex; justify-content: space-between; align-items: center; }
        .header a { color: white; text-decoration: none; margin-left: 18px; }
        .logo { font-size: 22px; font-weight: bold; color: #febd69; }
        .container { max-width: 1000px; margin: 40px auto; padding: 20px; }
        .welcome { background: white; padding: 25px; border-radius: 8px; margin-bottom: 25px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .cards { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px; }
        .card { background: white; padding: 25px; border-radius: 8px; text-align: center; box-shadow: 0 2px 5px rgba(0,0,0,0.1); transition: 0.2s; }
        .card:hover { transform: translateY(-4px); box-shadow: 0 6px 15px rgba(0,0,0,0.12); }
        .card a { text-decoration: none; color: #111; font-weight: bold; }
        .card p { margin-top: 8px; color: #565959; font-size: 14px; }
    </style>
</head>
<body>
    <div class="header">
        <div class="logo">Ecommerce-Prithi</div>
        <div>
            <a href="products.jsp">Products</a>
            <a href="cart.jsp">Cart</a>
            <a href="orders">Orders</a>
            <a href="chat">Support</a>
            <a href="logout">Logout</a>
        </div>
    </div>

    <div class="container">
        <div class="welcome">
            <h1>Welcome<%= session.getAttribute("user") != null ? ", " + ((User)session.getAttribute("user")).getName() : "" %>!</h1>
            <p style="margin-top:8px; color:#565959;">What would you like to do today?</p>
        </div>

        <div class="cards">
            <div class="card">
                <a href="products.jsp">Browse Products</a>
                <p>View all available items</p>
            </div>
            <div class="card">
                <a href="cart.jsp">My Cart</a>
                <p>Check items in your cart</p>
            </div>
            <div class="card">
                <a href="orders">My Orders</a>
                <p>Track your order history</p>
            </div>
            <div class="card">
                <a href="chat">AI Support</a>
                <p>Ask the chatbot for help</p>
            </div>
            <div class="card">
                <a href="admin">Admin Panel</a>
                <p>Only for Admin users</p>
            </div>
        </div>
    </div>
</body>
</html>
