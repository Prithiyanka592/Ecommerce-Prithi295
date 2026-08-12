<%@ page import="java.util.List" %>
<%@ page import="com.ecommerce.model.Product" %>
<!DOCTYPE html>
<html>
<head><title>Products</title></head>
<body>
<h2>Browse Products</h2>
<form method="get" action="products">
    Keyword: <input name="keyword">
    Category: <input name="category">
    <button type="submit">Search</button>
</form>
<table border="1" cellpadding="8">
<tr><th>Name</th><th>Category</th><th>Price</th><th>Stock</th><th>Action</th></tr>
<%
List<Product> products = (List<Product>) request.getAttribute("products");
if (products != null) for (Product p : products) {
%>
<tr>
<td><%= p.getName() %></td>
<td><%= p.getCategory() %></td>
<td>₹<%= p.getPrice() %></td>
<td><%= p.getStockQty() %></td>
<td>
<form method="post" action="cart">
<input type="hidden" name="productId" value="<%= p.getId() %>">
<input type="number" name="quantity" value="1" min="1" max="<%= p.getStockQty() %>">
<button type="submit">Add to Cart</button>
</form>
</td>
</tr>
<% } %>
</table>
<a href="cart.jsp">View Cart</a> |
<a href="logout">Exit / Logout</a>
</body>
</html>
