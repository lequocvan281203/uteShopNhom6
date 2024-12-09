<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>

	<!-- Page Header Start -->
	<div class="mb-1">
		<div
			class="d-flex flex-column align-items-center justify-content-center"
			style="min-height: 50px">
			<div class="d-inline-flex">
				<p class="m-0">
					<a href="">Trang chủ</a>
				</p>
				<p class="m-0 px-1">/</p>
				<p class="m-0">Chi tiết sản phẩm</p>
			</div>
		</div>
	</div>
	<!-- Page Header End -->


	<!-- Shop Detail Start -->
	<div class="container-fluid py-5">
		<c:forEach items="${product}" var="product">
			<div class="row px-xl-5">
				<div class="col-lg-5 pb-5" style="max-width: 450px">
				
					<!-- Product's images -->
					<div id="product-carousel" class="carousel slide" data-ride="carousel">
						<div class="carousel-inner border">
							<c:if test="${product.amount == 0}">
								<div style="position: absolute; right: 0; z-index: 2; padding: 2px 8px; background-color: gray; border-radius: 5px; color: white;">Hết hàng</div>
							</c:if>
							<div class="carousel-item active">
								<img class="w-100 h-100" src="<c:url value = "/uploads/"/>${product.image[0].imageLink}" alt="Image">
							</div>
							<c:forEach items="${product.image}" var="image" varStatus="state">
							
								<c:if test="${not state.first}">
									<div class="carousel-item">
										<img class="w-100 h-100" src="<c:url value = "/uploads/"/>${image.imageLink}" alt="Image">
									</div>
								</c:if>
								
							</c:forEach>
							
						</div>
						<a class="carousel-control-prev" href="#product-carousel" role="button" data-slide="prev"> 
							<i class="fa fa-2x fa-angle-left text-dark"></i>
						</a> 
						<a class="carousel-control-next" href="#product-carousel" role="button" data-slide="next"> 
							<i class="fa fa-2x fa-angle-right text-dark"></i>
						</a>
					</div>
					
					<!--  -->
					<div style="margin-top: 10px; overflow: auto" class="row justify-content-center">
						<c:forEach items="${product.image}" var="image" varStatus="state">
							<div style="margin-right: 2px; max-width: 120px" class="col">
								<img class="w-100 h-100" src="<c:url value = "/uploads/"/>${image.imageLink}" alt="Image">
							</div>
						</c:forEach>
					</div>
					
				</div>

				<div class="col-lg-7 pb-5">
					<h3 class="font-weight-semi-bold">${product.productName}</h3>
					<div class="d-flex mb-3">
						<div class="text-primary mr-2">
							<small class="fas fa-star"></small> <small class="fas fa-star"></small>
							<small class="fas fa-star"></small> <small
								class="fas fa-star-half-alt"></small> <small class="far fa-star"></small>
						</div>
						<small class="pt-1">(50 Reviews)</small>
						<small class="pt-1 pl-2">(${product.amount} sản phẩm)</small>
					</div>
					<h3 class="font-weight-semi-bold mb-4">
						<fmt:setLocale value="vi_VN" />
						<fmt:formatNumber value="${product.price}" type="currency" />
					</h3>
					<p class="mb-4">${product.description}</p>
					<div class="d-flex align-items-center mb-4 pt-2">
						<div class="input-group quantity mr-3 align-items-center" style="width: 130px;">
							<div class="input-group-btn">
								<button class="btn btn-primary btn-minus">
									<i class="fa fa-minus"></i>
								</button>
							</div>
							<input type="text" class="form-control bg-secondary text-center" id="quantityInput"
								value="1">
							<div class="input-group-btn">
								<button class="btn btn-primary btn-plus">
									<i class="fa fa-plus"></i>
								</button>
							</div>
						</div>
						<!-- Còn hàng -->
						<c:if test="${product.amount > 0}">
							<button class="btn btn-primary px-3 addToCartBtn" onclick = "addToCart()">
								<i class="fa fa-shopping-cart mr-1"></i> Thêm sản phẩm
							</button>
						</c:if>
						<!-- Hết hàng -->
						<c:if test="${product.amount == 0}">
							<button class="btn btn-primary px-3 addToCartBtn" disabled>
								<i class="fa fa-shopping-cart mr-1"></i> Tạm hết hàng
							</button>
						</c:if>
					</div>
					<div class="d-flex pt-2">
						<p class="text-dark font-weight-medium mb-0 mr-2">Share on:</p>
						<div class="d-inline-flex">
							<a class="text-dark px-2" href=""> <i
								class="fab fa-facebook-f"></i>
							</a> <a class="text-dark px-2" href=""> <i class="fab fa-twitter"></i>
							</a> <a class="text-dark px-2" href=""> <i
								class="fab fa-linkedin-in"></i>
							</a> <a class="text-dark px-2" href=""> <i
								class="fab fa-pinterest"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="row px-xl-5">
				<div class="col">
					<div
						class="nav nav-tabs justify-content-center border-secondary mb-4">
						<a class="nav-item nav-link active" data-toggle="tab"
							href="#tab-pane-1">Mô tả</a> <a class="nav-item nav-link"
							data-toggle="tab" href="#tab-pane-2">Thông tin</a> <a
							class="nav-item nav-link" data-toggle="tab" href="#tab-pane-3">Đánh
							giá (0)</a>
					</div>
					<div class="tab-content">
						<div class="tab-pane fade show active" id="tab-pane-1">
							<h4 class="mb-3">Mô tả sản phẩm</h4>
							<p>${product.description}</p>
						</div>
						<div class="tab-pane fade" id="tab-pane-2">
							<h4 class="mb-3">Additional Information</h4>
							<p>${product.description}</p>
							<div class="row">
								<div class="col-md-6">
									<ul class="list-group list-group-flush">
										<li class="list-group-item px-0">Sit erat duo lorem duo
											ea consetetur, et eirmod takimata.</li>
										<li class="list-group-item px-0">Amet kasd gubergren sit
											sanctus et lorem eos sadipscing at.</li>
										<li class="list-group-item px-0">Duo amet accusam eirmod
											nonumy stet et et stet eirmod.</li>
										<li class="list-group-item px-0">Takimata ea clita labore
											amet ipsum erat justo voluptua. Nonumy.</li>
									</ul>
								</div>
								<div class="col-md-6">
									<ul class="list-group list-group-flush">
										<li class="list-group-item px-0">Sit erat duo lorem duo
											ea consetetur, et eirmod takimata.</li>
										<li class="list-group-item px-0">Amet kasd gubergren sit
											sanctus et lorem eos sadipscing at.</li>
										<li class="list-group-item px-0">Duo amet accusam eirmod
											nonumy stet et et stet eirmod.</li>
										<li class="list-group-item px-0">Takimata ea clita labore
											amet ipsum erat justo voluptua. Nonumy.</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="tab-pane-3">
							<div class="row">
								<div class="col-md-6">
									<h4 class="mb-4">1 review for "Colorful Stylish Shirt"</h4>
									<div class="media mb-4">
										<img src="<c:url value = "/template/"/>img/user.jpg" alt="Image"
											class="img-fluid mr-3 mt-1" style="width: 45px;">
										<div class="media-body">
											<h6>
												John Doe<small> - <i>01 Jan 2045</i></small>
											</h6>
											<div class="text-primary mb-2">
												<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i> <i class="fas fa-star-half-alt"></i>
												<i class="far fa-star"></i>
											</div>
											<p>Diam amet duo labore stet elitr ea clita ipsum, tempor
												labore accusam ipsum et no at. Kasd diam tempor rebum magna
												dolores sed sed eirmod ipsum.</p>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<h4 class="mb-4">Leave a review</h4>
									<small>Your email address will not be published.
										Required fields are marked *</small>
									<div class="d-flex my-3">
										<p class="mb-0 mr-2">Your Rating * :</p>
										<div class="text-primary">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i>
										</div>
									</div>
									<form>
										<div class="form-group">
											<label for="message">Your Review *</label>
											<textarea id="message" cols="30" rows="5"
												class="form-control"></textarea>
										</div>
										<div class="form-group">
											<label for="name">Your Name *</label> <input type="text"
												class="form-control" id="name">
										</div>
										<div class="form-group">
											<label for="email">Your Email *</label> <input type="email"
												class="form-control" id="email">
										</div>
										<div class="form-group mb-0">
											<input type="submit" value="Leave Your Review"
												class="btn btn-primary px-3">
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<!-- Shop Detail End -->
	<script>
	//Product Quantity
	$('.quantity button').on('click', function () {
	    var button = $(this);
	    var oldValue = button.parent().parent().find('input').val();
	    if (button.hasClass('btn-plus')) {
	        var newVal = parseFloat(oldValue) + 1;
	    } else {
	        if (oldValue > 1) {
	            var newVal = parseFloat(oldValue) - 1;
	        } else {
	            newVal = 1;
	        }
	    }
	    button.parent().parent().find('input').val(newVal);
	});
	//Add to cart
	function addToCart() {
        // Lấy giá trị từ input
        var quantity = document.getElementById('quantityInput').value;
        // Tạo URL với giá trị quantity được thêm vào
        var url = new URL(window.location.href);
        var pid = url.searchParams.get("pid");
        var url = "cart/add?pid=" + pid + "&amount=" + quantity;
		console.log(url)
        // Chuyển hướng đến URL mới
        window.location.href = url;
    }
	//
	document.addEventListener('DOMContentLoaded', function() {
	    // Kiểm tra nếu có thông tin Toastify trong Local Storage
	    const toastMessage = localStorage.getItem('toastMessage');
	    if (toastMessage) {
	        const toastLiveExample = document.getElementById('liveToast');
	        toastLiveExample.classList.add('d-block');
	        // Hiển thị Toastify
	        const toast = new bootstrap.Toast(toastLiveExample)
	        
        	toast.show()
        	
       	 	setTimeout(() => {
       	 		toastLiveExample.classList.remove('d-block');
	        },2000)

	        // Xóa thông tin Toastify từ Local Storage sau khi đã hiển thị
	        localStorage.removeItem('toastMessage');
	    }
	});
	</script>
</body>
