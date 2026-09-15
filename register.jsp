<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Account</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f3f3f3; display: flex; justify-content: center; align-items: center; min-height: 100vh; margin: 0; }
        .box { background: white; padding: 40px; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); width: 380px; }
        h1 { text-align: center; margin-bottom: 25px; color: #131921; }
        label { display: block; margin-top: 14px; font-size: 14px; }
        input, select { width: 100%; padding: 10px; margin-top: 5px; border: 1px solid #ddd; border-radius: 4px; }
        button { width: 100%; margin-top: 25px; padding: 12px; background: #ffd814; border: none; border-radius: 20px; font-weight: bold; cursor: pointer; }
        button:hover { background: #f7ca00; }
        .login-link { text-align: center; margin-top: 20px; font-size: 14px; }
        .login-link a { color: #0066c0; text-decoration: none; }
    </style>
</head>
<body>
    <div class="box">
        <h1>Create Account</h1>
        <form action="register" method="post">
            <label>Full Name</label>
            <input type="text" name="name" required>

            <label>Email</label>
            <input type="email" name="email" required>

            <label>Password</label>
            <input type="password" name="password" required>

            <label>Role</label>
            <select name="role" required>
                <option value="BUYER">Buyer</option>
                <option value="SELLER">Seller</option>
            </select>

            <button type="submit">Create your account</button>
        </form>
        <div class="login-link">
            Already have an account? <a href="login.jsp">Sign in</a>
        </div>
    </div>
</body>
</html>
