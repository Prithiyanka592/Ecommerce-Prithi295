<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Review</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        form { max-width: 400px; }
        label { display: block; margin-top: 10px; }
        input, textarea, select { width: 100%; padding: 8px; margin-top: 5px; }
        button { margin-top: 15px; padding: 10px 20px; background: #333; color: white; border: none; cursor: pointer; }
    </style>
</head>
<body>
    <h1>Add Product Review</h1>

    <form action="review" method="post">
        <label>Product ID:</label>
        <input type="number" name="productId" required>

        <label>Rating (1-5):</label>
        <select name="rating" required>
            <option value="5">5 - Excellent</option>
            <option value="4">4 - Good</option>
            <option value="3">3 - Average</option>
            <option value="2">2 - Poor</option>
            <option value="1">1 - Very Poor</option>
        </select>

        <label>Comment:</label>
        <textarea name="comment" rows="4" required></textarea>

        <button type="submit">Submit Review</button>
    </form>

    <br>
    <a href="products.jsp">Back to Products</a>
</body>
</html>
