<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trang chủ UTE Shop</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="style.css">
  <link rel="icon" type="image/x-icon" href="static/images/logo_uteshop.png"> 
</head>
<body>
	<!-- Header -->
	<div class="header d-flex justify-content-between align-items-center">
		<div class="logo">
			<img src="static/images/logo_uteshop.png" alt="Logo SPK SHOPPING"
				width="50"> <span>SPK SHOPPING</span>
		</div>

		<input type="text" class="form-control w-50" placeholder="Tìm kiếm...">
		<div class="menu-icons">
			<a href="home.jsp" title="Trang chủ"> <img
				src="static/images/home-icon.png" alt="Home" width="30">
			</a> <a href="login.jsp" title="Đăng nhập"> <img
				src="static/images/user-icon.png" alt="User" width="30">
			</a> <a href="cart.jsp" title="Giỏ hàng"> <img
				src="static/images/cart-icon.png" alt="Cart" width="30">
			</a>
		</div>
	</div>

	<!-- Carousel -->
	<div id="carouselExample" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="static/images/banner1.jpg" class="d-block w-100"
					alt="Banner 1">
			</div>
			<div class="carousel-item">
				<img src="static/images/banner2.png" class="d-block w-100"
					alt="Banner 2">
			</div>
		</div>
	</div>

	<!-- Promo -->
	<div class="categories">
			<a href="#"><img
				src="static/images/category/Phụ kiện công nghệ.jpg" alt="Danh mục 1" ></a>
			<a href="#"><img
				src="static/images/category/Sản phẩm làm đẹp.jpg" alt="Danh mục 2"></a>
			<a href="#"><img src="static/images/category/Thời trang.jpg"
				alt="Danh mục 3"></a>		
			<a href="#"><img src="static/images/category/Đồ dùng học tập.jpg"
				alt="Danh mục 4"></a> <a href="#"><img
				src="static/images/category/Đồ trang trí phòng.jpg" alt="Danh mục 5"></a>
	</div>
	
	<!-- Product Section -->
	<div class="d-flex flex-wrap justify-content-around">
		<c:forEach items="${products}" var="product">
			<div class="product-card">
				<img src="${product.imageUrl}" alt="${product.name}" width="100%">
				<p>${product.name}</p>
				<p>${product.price}</p>
				<button class="btn btn-primary">Chọn mua</button>
			</div>
		</c:forEach>
	</div>

	<!-- Footer -->
	<div class="social-icons">
		<a href="tel:+84912345678" title="Liên hệ qua điện thoại"> <img
			src="phone-icon.png" alt="Phone">
		</a> <a href="https://facebook.com" target="_blank" title="Facebook">
			<img src="facebook-icon.png" alt="Facebook">
		</a> <a href="https://zalo.me" target="_blank" title="Zalo"> <img
			src="zalo-icon.png" alt="Zalo">
		</a>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>