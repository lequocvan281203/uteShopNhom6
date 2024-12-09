<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<div class="container-fluid">
	<div class="px-xl-5" style="background-color: white;padding-bottom: 20px">
		<div class="row" style="width: 85%; margin: 0 auto">
			<div class="col-lg-3 d-none d-lg-block">
				<a
					class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100"
					data-toggle="collapse" href="#navbar-vertical"
					style="height: 65px; margin-top: -1px; padding: 0 30px;">
					<h6 class="m-0">Danh mục sản phẩm</h6> <i
					class="fa fa-angle-down text-dark"></i>
				</a>
				<nav
					class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-bottom-0 bg-light"
					id="navbar-vertical" style="width: calc(100% - 30px); z-index: 2;">
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
					</div>
				</nav>
			</div>
			<div class="col-lg-9">
				<nav
					class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
					<a href="home" class="text-decoration-none d-block d-lg-none">
						<h1 class="m-0 display-5 font-weight-semi-bold">
							<span class="text-primary font-weight-bold border px-3 mr-1">Cosmetics</span>
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
			</div>
		</div>
	</div>
</div>