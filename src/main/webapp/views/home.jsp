<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
  	<meta charset="UTF-8">
    <title>FINAL_PROJECT</title>
 
</head>

<body>
  


    <!-- Featured Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">Quality Product</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                    <h5 class="font-weight-semi-bold m-0">Free Shipping</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">14-Day Return</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
                </div>
            </div>
        </div>
    </div>
    <!-- Featured End -->


    <!-- Categories Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5 pb-3">
        	<c:forEach items="${allcategory}" var="category">
	            <div class="col-lg-4 col-md-6 pb-1">
	                <div class="cat-item d-flex flex-column border mb-4 h-100" style="padding: 30px;">
	                    <a href="shop?page=1&maxPageItem=9" class="cat-img position-relative overflow-hidden mb-3">
	                        <img class="img-fluid" src="${category.imageLink}" alt="">
	                    </a>
	                    <h5 class="font-weight-semi-bold m-0">${category.categoryName}</h5>
	                </div>
	            </div>
			</c:forEach>
        </div>
    </div>
    <!-- Categories End -->


    <!-- Offer Start -->
    <div class="container-fluid offer pt-5">
        <div class="row px-xl-5">
            <div class="col-md-6 pb-4">
                <div class="position-relative bg-secondary text-center text-md-right text-white mb-2 py-5 px-5">
                    <img src="https://picare.vn/wp-content/uploads/2018/08/loreal.png" alt="">
                    <div class="position-relative" style="z-index: 1;">
                        <h5 class="text-uppercase text-primary mb-3">Giảm 10% cho đơn hàng đầu tiên</h5>
                        <h1 class="mb-4 font-weight-semi-bold">Thương hiệu uy tín</h1>
                        <a href="shop?page=1&maxPageItem=9" class="btn btn-outline-primary py-md-2 px-md-3">Mua sắm ngay</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 pb-4">
                <div class="position-relative bg-secondary text-center text-md-left text-white mb-2 py-5 px-5">
                    <img src="https://www.wheystore.vn/upload/news_optimize/main/1043_catalog_tang_ma_giam_gia_50_000d_cho_don_tren_1_trieu_tu_3_3_toi_10_3_2020_main_1587725915.png" alt="">
                    <div class="position-relative" style="z-index: 1;">
                        <h5 class="text-uppercase text-primary mb-3">Giảm 10% cho đơn hàng đầu tiên</h5>
                        <h1 class="mb-4 font-weight-semi-bold">Giá cả cạnh tranh</h1>
                        <a href="shop?page=1&maxPageItem=9" class="btn btn-outline-primary py-md-2 px-md-3">Deal hời</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Offer End -->
    <!-- Products Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Sản phẩm nổi bật</span></h2>
        </div>
        <div class="row px-xl-5 pb-3">
        	<c:forEach items="${top8newproduct}" var="product">
	            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
	                <a href="detail?pid=${product.productID}">
	                	<div class="card product-item border-0 mb-4">
		                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
		                        <img class="img-fluid w-100" src="<c:url value = "/uploads/"/>${product.image[0].imageLink}" alt="">
		                    </div>
		                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
		                        <h6 class="text-truncate mb-3">${product.productName}</h6>
		                        <div class="d-flex justify-content-center">
		                            <h6>
		                            	<fmt:setLocale value="vi_VN" />
										<fmt:formatNumber value="${product.price}" type="currency" />
		                            </h6>
		                        </div>
		                    </div>
		                    <div class="card-footer d-flex justify-content-between bg-light border">
		                        <a href="detail?pid=${product.productID}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>Chi tiết</a>
		                        <a href="cart/add?pid=${product.productID}&amount=1" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Thêm sản phẩm</a>
		                    </div>
		                </div>
	                </a>
	            </div>
            </c:forEach>
        </div>
    </div>
    <!-- Products End -->


</body>

</html>