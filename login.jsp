<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f3f3f3; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .login-box { background: white; padding: 40px; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); width: 350px; }
        h1 { text-align: center; margin-bottom: 25px; color: #131921; }
        label { display: block; margin-top: 15px; font-size: 14px; }
        input { width: 100%; padding: 10px; margin-top: 5px; border: 1px solid #ddd; border-radius: 4px; }
        button { width: 100%; margin-top: 25px; padding: 12px; background: #ffd814; border: none; border-radius: 20px; font-weight: bold; cursor: pointer; }
        button:hover { background: #f7ca00; }
        .register-link { text-align: center; margin-top: 20px; font-size: 14px; }
        .register-link a { color: #0066c0; text-decoration: none; }
    </style>
</head>
<body>
    <div class="login-box">
        <h1>Sign In</h1>
        <form action="login" method="post">
            <label>Email</label>
            <input type="email" name="email" required>

            <label>Password</label>
            <input type="password" name="password" required>

            <button type="submit">Sign In</button>
        </form>
        <div class="register-link">
            New customer? <a href="register.jsp">Create account</a>
        </div>
    </div>
</body>
</html>
