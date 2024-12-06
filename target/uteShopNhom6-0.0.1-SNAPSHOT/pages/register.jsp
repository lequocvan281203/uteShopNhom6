<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký</title>
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
    <form action="/doRegister" method="POST" class="auth-form">
        <h2>Đăng ký</h2>
        <label for="username">Tên đăng nhập</label>
        <input type="text" id="username" name="username" required>
        <label for="email">Email</label>
        <input type="email" id="email" name="email" required>
        <label for="password">Mật khẩu</label>
        <input type="password" id="password" name="password" required>
        <button type="submit">Đăng ký</button>
    </form>
</body>
</html>
