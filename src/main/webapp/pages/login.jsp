<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
    <form action="/doLogin" method="POST" class="auth-form">
        <h2>Đăng nhập</h2>
        <label for="username">Tên đăng nhập</label>
        <input type="text" id="username" name="username" required>
        <label for="password">Mật khẩu</label>
        <input type="password" id="password" name="password" required>
        <button type="submit">Đăng nhập</button>
    </form>
</body> 
</html>