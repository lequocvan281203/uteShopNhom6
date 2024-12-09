<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<div class="container-fluid mb-5">
	<div class="px-xl-5">
		<div class="row" style="width: 85%; margin: 0 auto; overflow: hidden">
			<div class="col-lg-3 d-none d-lg-block" style="max-height: 475px">
				<a
					class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100"
					data-toggle="collapse" href="#navbar-vertical"
					style="height: 65px; margin-top: -1px; padding: 0 30px;">
					<h6 class="m-0">Danh mục sản phẩm</h6> <i
					class="fa fa-angle-down text-dark"></i>
				</a>
				<nav
					class="collapse show navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0"
					id="navbar-vertical">
					<div class="navbar-nav w-100">
						<c:forEach items="${allcategory}" var="category">
							<div class="nav-item btn-group dropright">
							  <a type="button" class="nav-link" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							    ${category.icon} ${category.categoryName}
							  </a>
							  <div class="dropdown-menu" style="position: absolute">
							    <c:forEach items="${category.childCategory}" var="childcategory">
								    <a class="dropdown-item" href="shop?page=1&maxPageItem=9&key=CategoryID&search=${childcategory.categoryID}">${childcategory.categoryName}</a>
 						 	  	</c:forEach>
							  </div>
							</div>
							
						</c:forEach>
						<img alt="" src="https://d2jx2rerrg6sh3.cloudfront.net/images/Article_Images/ImageForArticle_22033_16430370682719147.jpg">
					</div>
				</nav>
			</div>
			<div class="col-lg-9">
				<nav
					class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
					<a href="home" class="text-decoration-none d-block d-lg-none">
						<h1 class="m-0 display-5 font-weight-semi-bold">
							<span class="text-primary font-weight-bold border px-3 mr-1">UTESHOP</span>
						</h1>
					</a>
					<button type="button" class="navbar-toggler" data-toggle="collapse"
						data-target="#navbarCollapse">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-between"
						id="navbarCollapse">
						<div class="navbar-nav mr-auto py-0">
							<a href="home" class="nav-item nav-link ${page == 'home' ? "active" : ""}">Trang chủ</a> 
							<a href="shop?page=1&maxPageItem=9" class="nav-item nav-link ${page == 'shop' ? "active" : ""}">Sản phẩm</a>
							<a href="contact" class="nav-item nav-link ${page == 'contact' ? "active" : ""}">Thông tin liên hệ</a>
							<a href="brand?page=1&maxPageItem=12" class="nav-item nav-link ${page == 'brand' ? "active" : ""}">Thương hiệu</a>
						</div>
					</div>
				</nav>
				<div id="header-carousel" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active" style="height: 410px;">
							<img class="img-fluid" src="${pageContext.request.contextPath}/static/images/banner2.png" alt="Image" style="opacity: 0.8">
							<div
								class="carousel-caption d-flex flex-column align-items-center justify-content-center">
								<div class="p-3" style="max-width: 700px;">
									<h4 class="text-white text-uppercase font-weight-medium mb-3">Giảm ngay 10% cho đơn hàng đầu tiên</h4>
									<h3 class="display-4 text-white font-weight-semi-bold mb-4">Sản Phẩm hàng hiệu</h3>
									<a href="shop?page=1&maxPageItem=9" class="btn btn-light py-2 px-3">Mua sắm ngay</a>
								</div>
							</div>
						</div>
						<div class="carousel-item" style="height: 410px;">
							<img class="img-fluid" src="${pageContext.request.contextPath}/static/images/banner1.jpg" alt="Image" style="opacity: 0.8">
							<div
								class="carousel-caption d-flex flex-column align-items-center justify-content-center">
								<div class="p-3" style="max-width: 700px;">
									<h4 class="text-light text-uppercase font-weight-medium mb-3">Giảm ngay 10% cho đơn hàng đầu tiên</h4>
									<h3 class="display-4 text-white font-weight-semi-bold mb-4">Giá cả cạnh tranh</h3>
									<a href="shop?page=1&maxPageItem=9" class="btn btn-light py-2 px-3">Mua sắm ngay</a>
								</div>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#header-carousel"
						data-slide="prev">
						<div class="btn btn-dark" style="width: 45px; height: 45px;">
							<span class="carousel-control-prev-icon mb-n2"></span>
						</div>
					</a> <a class="carousel-control-next" href="#header-carousel"
						data-slide="next">
						<div class="btn btn-dark" style="width: 45px; height: 45px;">
							<span class="carousel-control-next-icon mb-n2"></span>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>