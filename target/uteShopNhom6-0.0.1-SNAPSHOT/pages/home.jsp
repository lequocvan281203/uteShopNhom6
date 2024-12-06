<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ UTE Shop</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .header { background-color: #007bff; color: white; padding: 10px; }
        .product-card { margin: 15px; padding: 10px; border: 1px solid #ddd; text-align: center; }
        .promo-banner { background-color: #f9f9f9; text-align: center; padding: 20px; margin: 15px 0; }
        .social-icons { position: fixed; bottom: 20px; right: 20px; }
        .social-icons img { width: 40px; margin: 5px; cursor: pointer; }
        .menu-icons a img { margin-left: 10px; cursor: pointer; }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header d-flex justify-content-between align-items-center">
        <div class="logo">
          <img src="https://drive.google.com/uc?export=view&id=1pW_nQls2pGvuuCdcZM7zjMx19LbdH1YR" alt="Logo SPK SHOPPING" width="50">
          <span>SPK SHOPPING</span>
        </div>

        <input type="text" class="form-control w-50" placeholder="Tìm kiếm...">
        <div class="menu-icons">
            <a href="home.jsp" title="Trang chủ">
                <img src="home-icon.png" alt="Home" width="30">
            </a>
            <a href="login.jsp" title="Đăng nhập">
                <img src="user-icon.png" alt="User" width="30">
            </a>
            <a href="cart.jsp" title="Giỏ hàng">
                <img src="cart-icon.png" alt="Cart" width="30">
            </a>
        </div>
    </div>

    <!-- Carousel -->
    <div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="banner1.jpg" class="d-block w-100" alt="Banner 1">
            </div>
            <div class="carousel-item">
                <img src="banner2.jpg" class="d-block w-100" alt="Banner 2">
            </div>
        </div>
    </div>

    <!-- Promo -->
    <div class="promo-banner">
        <h3>[Khung khuyến mãi]</h3>
    </div>

    <!-- Product Section -->
    <div class="d-flex flex-wrap justify-content-around">
        <div class="product-card">
            <img src="product1.jpg" alt="Sản phẩm 1" width="100%">
            <p>Tên sản phẩm</p>
            <p>Giá bán</p>
            <button class="btn btn-primary">Chọn mua</button>
        </div>
        <div class="product-card">
            <img src="product2.jpg" alt="Sản phẩm 2" width="100%">
            <p>Tên sản phẩm</p>
            <p>Giá bán</p>
            <button class="btn btn-primary">Chọn mua</button>
        </div>
    </div>

    <!-- Footer -->
    <div class="social-icons">
        <a href="tel:+84912345678" title="Liên hệ qua điện thoại">
            <img src="phone-icon.png" alt="Phone">
        </a>
        <a href="https://facebook.com" target="_blank" title="Facebook">
            <img src="facebook-icon.png" alt="Facebook">
        </a>
        <a href="https://zalo.me" target="_blank" title="Zalo">
            <img src="zalo-icon.png" alt="Zalo">
        </a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
