<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ecommerce.model.Product" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel - Ecommerce</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        table { border-collapse: collapse; width: 100%; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #333; color: white; }
        h1 { color: #333; }
        .logout { margin-top: 20px; }
    </style>
</head>
<body>
    <h1>Admin Panel</h1>
    <p>Welcome, Admin. You can view all products below.</p>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Stock</th>
            <th>Category</th>
        </tr>
        <%
            List<Product> products = (List<Product>) request.getAttribute("products");
            if (products != null) {
                for (Product p : products) {
        %>
        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getName() %></td>
            <td><%= p.getPrice() %></td>
            <td><%= p.getStockQty() %></td>
            <td><%= p.getCategory() %></td>
        </tr>
        <%
                }
            }
        %>
    </table>

    <div class="logout">
        <a href="logout">Logout</a>
    </div>
</body>
</html>
