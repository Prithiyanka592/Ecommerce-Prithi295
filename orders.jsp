<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ecommerce.model.Order" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Orders</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: Arial, sans-serif; background: #f3f3f3; }
        .header { background: #131921; color: white; padding: 12px 20px; display: flex; justify-content: space-between; align-items: center; }
        .header a { color: white; text-decoration: none; margin-left: 18px; }
        .logo { font-size: 22px; font-weight: bold; color: #febd69; }
        .container { max-width: 900px; margin: 30px auto; background: white; padding: 25px; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 14px; text-align: left; border-bottom: 1px solid #eee; }
        th { background: #f8f8f8; }
        .status { padding: 4px 10px; border-radius: 12px; font-size: 12px; font-weight: bold; }
        .pending { background: #fff3cd; color: #856404; }
        .back { display: inline-block; margin-top: 20px; color: #0066c0; text-decoration: none; }
    </style>
</head>
<body>
    <div class="header">
        <div class="logo">Ecommerce-Prithi</div>
        <div>
            <a href="dashboard.jsp">Home</a>
            <a href="products.jsp">Products</a>
            <a href="logout">Logout</a>
        </div>
    </div>

    <div class="container">
        <h1>Your Orders</h1>

        <table>
            <tr>
                <th>Order ID</th>
                <th>Total Amount</th>
                <th>Status</th>
                <th>Date</th>
            </tr>
            <%
                List<Order> orders = (List<Order>) request.getAttribute("orders");
                if (orders != null && !orders.isEmpty()) {
                    for (Order o : orders) {
            %>
            <tr>
                <td>#<%= o.getId() %></td>
                <td>₹<%= o.getTotalAmount() %></td>
                <td><span class="status pending"><%= o.getStatus() %></span></td>
                <td><%= o.getCreatedAt() %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="4">You have no orders yet.</td>
            </tr>
            <% } %>
        </table>

        <a class="back" href="dashboard.jsp">← Back to Dashboard</a>
    </div>
</body>
</html>
