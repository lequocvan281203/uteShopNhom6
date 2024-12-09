<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<div class="container-fluid bg-secondary text-dark  pt-5">
	<div class="px-xl-5 pt-2">
		<div class="row" style="width: 85%; margin: 0 auto">
			<div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
				<a href="" class="text-decoration-none">
					<h1 class="mb-4 display-5 font-weight-semi-bold">
						<span
							class="text-primary font-weight-bold border border-white px-3 mr-1">UTESHOP</span>
					</h1>
				</a>
				<p>Shop bán hàng số 1 Võ Văn Ngân</p>
				<p class="mb-2">
					<i class="fa fa-map-marker-alt text-primary mr-3"></i>Số 1, Võ Văn Ngân, TP.Thủ Đức
				</p>
				<p class="mb-2">
					<i class="fa fa-envelope text-primary mr-3"></i>uteshop@gmail.com
				</p>
				<p class="mb-0">
					<i class="fa fa-phone-alt text-primary mr-3"></i>+84 123 456 899
				</p>
			</div>
			<div class="col-lg-8 col-md-12">
				<div class="row">
					<div class="col-md-5 mb-5">
						<h5 class="font-weight-bold text-dark mb-4">Truy cập nhanh</h5>
						<div class="d-flex flex-column justify-content-start">
							<a class="text-dark mb-2" href="home"><i
								class="fa fa-angle-right mr-2"></i>Trang chủ</a> <a class="text-dark mb-2"
								href="shop?page=1&maxPageItem=9"><i class="fa fa-angle-right mr-2"></i>Sản phẩm</a> <a
								class="text-dark mb-2" href="cart"><i
								class="fa fa-angle-right mr-2"></i>Giỏ hàng</a> <a
								class="text-dark mb-2" href="checkout"><i
								class="fa fa-angle-right mr-2"></i>Thanh toán</a> <a class="text-dark"
								href="contact"><i class="fa fa-angle-right mr-2"></i>Thông tin liên hệ</a>
						</div>
					</div>
					<div class="col-md-5 mb-5">
						<h5 class="font-weight-bold text-dark mb-4">Thông báo mới</h5>
						<form action="">
							<div class="form-group">
								<input type="text" class="form-control border-0 py-4"
									placeholder="Tên của bạn" required="required" />
							</div>
							<div class="form-group">
								<input type="email" class="form-control border-0 py-4"
									placeholder="Email của bạn" required="required" />
							</div>
							<div>
								<button class="btn btn-primary btn-block border-0 py-3"
									type="submit">Đăng ký</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>