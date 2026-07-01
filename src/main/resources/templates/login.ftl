<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background-color: #1a1a2e; color: white; display: flex; justify-content: center; align-items: center; height: 100vh; }
        .login-box { background-color: #16213e; padding: 40px; border-radius: 10px; width: 350px; text-align: center; }
        .login-box h1 { color: #e94560; margin-bottom: 30px; font-size: 2em; }
        .form-group { margin-bottom: 20px; text-align: left; }
        .form-group label { display: block; margin-bottom: 5px; color: #aaa; }
        .form-group input { width: 100%; padding: 10px 15px; border-radius: 8px; border: 2px solid #0f3460; background-color: #1a1a2e; color: white; font-size: 1em; }
        .form-group input:focus { outline: none; border-color: #e94560; }
        .btn { width: 100%; padding: 12px; border-radius: 25px; border: none; background-color: #e94560; color: white; font-size: 1em; font-weight: bold; cursor: pointer; margin-top: 10px; }
        .btn:hover { background-color: #c73652; }
        .error { background-color: #c0392b; padding: 10px; border-radius: 8px; margin-bottom: 20px; }
        .info { color: #aaa; margin-top: 20px; font-size: 0.85em; }
        a { color: #e94560; text-decoration: none; }
    </style>
</head>
<body>
<div class="login-box">
    <h1>🏆 SportsHistory</h1>

    <#if RequestParameters?? && RequestParameters.error??>
    <div class="error">❌ Invalid username or password!</div>
    </#if>

    <form action="/login" method="post">
        <div class="form-group">
            <label>Username</label>
            <input type="text" name="username" placeholder="Enter username"/>
        </div>
        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" placeholder="Enter password"/>
        </div>
        <button type="submit" class="btn">Login</button>
    </form>

    <div class="info">
        <p>Admin: admin / admin123</p>
        <p>User: user / user123</p>
        <br>
        <a href="/">← Back to Home</a>
    </div>
</div>
</body>
</html>