<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<div>
	<div class="bg-secondary py-2 px-xl-5">
		<div class="row" style="width: 85%; margin: 0 auto">
			<div class="col-lg-6 d-none d-inline-flex align-items-center">
				<i class="fab fa-facebook-f mx-2"></i> <i class="fab fa-youtube mx-2"></i>
				<i class="fab fa-instagram mx-2"></i>
			</div>
			<div class="col-lg-6 text-center text-lg-right">
				<div class="d-inline-flex align-items-center">
	
					<c:if test="${not empty USERMODEL }">
						<a class="text-dark px-2" href=""> <a href="userprofile?page=1&maxPageItem=9"
							class="mx-2 text-body">${USERMODEL.fullName}</a> <a
							href="<c:url value = 'thoat?action=loguot'/>"
							class="mx-2 text-body">Thoát</a>
						</a>
					</c:if>
					<c:if test="${ empty USERMODEL }">
						<li class="nav-item" style="list-style:none">
							<button type="button" class="text-body btn" data-toggle="modal" data-target="#loginModal">Đăng nhập</button>
							<button type="button" class="text-body btn" data-toggle="modal" data-target="#registModal">Đăng ký</button>
						</li>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<div class="align-items-center py-3 px-xl-5"
		style="background-color: white">
		<div class="row" style="width: 85%; margin: 0 auto">
			<div class="col-lg-3 d-none d-lg-block">
				<a href="home" class="text-decoration-none">
					<h1 class="m-0 display-5 font-weight-semi-bold">
						<span class="text-primary font-weight-bold px-3 mr-1">OriShop</span>
					</h1>
				</a>
			</div>
			<div class="col-lg-6 col-6 text-left">
				<form action="search" id="search" method="get">
					<div class="input-group">
						<input type="hidden" value="1" name="page">
						<input type="hidden" value="9" name="maxPageItem">
						<input type="hidden" name="key" value="ProductName">
						<input type="text" name="search" class="form-control"
							placeholder="Tìm kiếm sản phẩm">
						<div class="input-group-append">
							<button type="submit"
								class="input-group-text bg-transparent text-primary">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-lg-3 col-6 text-right">
				<a href="cart" class="btn border"> <i
					class="fas fa-shopping-cart text-primary"></i> 
					<span class="badge">
						<c:set var="totalCartItem" value="${0}" />
						<c:forEach items="${sessionScope.cart}" var="cart">
								<c:set var="totalCartItem" value="${totalCartItem + cart.value.amount}" />
						</c:forEach>
						${totalCartItem}
					</span>
				</a>
			</div>
		</div>
	</div>
</div>