<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ecommerce.model.CartItem" %>
<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: Arial, sans-serif; background: #f3f3f3; }
        .header { background: #131921; color: white; padding: 12px 20px; display: flex; justify-content: space-between; align-items: center; }
        .header a { color: white; text-decoration: none; margin-left: 18px; }
        .logo { font-size: 22px; font-weight: bold; color: #febd69; }
        .container { max-width: 900px; margin: 30px auto; background: white; padding: 25px; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background: #f8f8f8; }
        .total { font-size: 20px; font-weight: bold; margin-top: 20px; text-align: right; }
        .btn { background: #ffd814; border: none; padding: 10px 20px; border-radius: 20px; cursor: pointer; font-weight: bold; }
        .btn:hover { background: #f7ca00; }
    </style>
</head>
<body>
    <div class="header">
        <div class="logo">Ecommerce-Prithi</div>
        <div>
            <a href="products.jsp">Products</a>
            <a href="dashboard.jsp">Home</a>
            <a href="logout">Logout</a>
        </div>
    </div>

    <div class="container">
        <h1>Your Shopping Cart</h1>

        <table>
            <tr>
                <th>Product</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Subtotal</th>
            </tr>
            <%
                List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
                double total = 0;
                if (cart != null && !cart.isEmpty()) {
                    for (CartItem item : cart) {
                        double sub = item.getPrice().doubleValue() * item.getQuantity();
                        total += sub;
            %>
            <tr>
                <td><%= item.getProductName() %></td>
                <td>₹<%= item.getPrice() %></td>
                <td><%= item.getQuantity() %></td>
                <td>₹<%= String.format("%.2f", sub) %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="4">Your cart is empty.</td>
            </tr>
            <% } %>
        </table>

        <div class="total">Total: ₹<%= String.format("%.2f", total) %></div>

        <% if (cart != null && !cart.isEmpty()) { %>
        <div style="text-align:right; margin-top:20px;">
            <form action="checkout" method="post">
                <button class="btn" type="submit">Proceed to Checkout</button>
            </form>
        </div>
        <% } %>
    </div>
</body>
</html>
