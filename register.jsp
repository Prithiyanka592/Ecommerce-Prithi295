<!DOCTYPE html>
<html>
<head><title>Register</title></head>
<body>
<h2>Buyer / Seller Registration</h2>
<form method="post" action="register">
    Name: <input type="text" name="name" required><br><br>
    Email: <input type="email" name="email" required><br><br>
    Password: <input type="password" name="password" required><br><br>
    Role:
    <select name="role">
        <option value="BUYER">Buyer</option>
        <option value="SELLER">Seller</option>
    </select><br><br>
    <button type="submit">Register</button>
</form>
</body>
</html>
