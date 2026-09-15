<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ecommerce.model.Order" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Orders</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        table { border-collapse: collapse; width: 100%; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; }
        th { background-color: #333; color: white; }
    </style>
</head>
<body>
    <h1>My Orders</h1>

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
            <td><%= o.getId() %></td>
            <td><%= o.getTotalAmount() %></td>
            <td><%= o.getStatus() %></td>
            <td><%= o.getCreatedAt() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="4">No orders found.</td>
        </tr>
        <%
            }
        %>
    </table>

    <br>
    <a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>
