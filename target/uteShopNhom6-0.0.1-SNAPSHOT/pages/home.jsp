<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <!-- Header -->
    <header>
        <div class="container">
            <div class="logo">
                <a href="home.jsp"><img src="images/logo.png" alt="Logo"></a>
            </div>
            <nav>
                <ul>
                    <li><a href="home.jsp">Trang chủ</a></li>
                    <li><a href="category.jsp">Danh mục sản phẩm</a></li>
                    <li><a href="contact.jsp">Liên hệ</a></li>
                    <li><a href="login.jsp">Đăng nhập</a></li>
                </ul>
            </nav>
            <div class="search-bar">
                <form action="search.jsp" method="get">
                    <input type="text" name="query" placeholder="Tìm kiếm sản phẩm...">
                    <button type="submit">Tìm kiếm</button>
                </form>
            </div>
        </div>
    </header>

    <!-- Main Banner -->
    <section class="main-banner">
        <div class="container">
            <img src="images/banner.jpg" alt="Main Banner">
        </div>
    </section>

    <!-- Product Highlights -->
    <section class="product-highlights">
        <div class="container">
            <h2>Sản phẩm nổi bật</h2>
            <div class="product-grid">
                <!-- Ví dụ về một sản phẩm -->
                <div class="product-item">
                    <img src="images/product1.jpg" alt="Product 1">
                    <h3>Tên sản phẩm 1</h3>
                    <p>Giá: 1.000.000đ</p>
                    <a href="product-detail.jsp?id=1" class="btn">Xem chi tiết</a>
                </div>
                <!-- Thêm các sản phẩm khác tương tự -->
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <p>Bản quyền © 2023 Công ty XYZ. Mọi quyền được bảo lưu.</p>
        </div>
    </footer>
</body>
</html>
