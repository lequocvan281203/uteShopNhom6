<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>


    <!-- Page Header Start -->
    <div class="mb-1">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 50px">
            <div class="d-inline-flex">
                <p class="m-0"><a href="">Trang chủ</a></p>
                <p class="m-0 px-1">/</p>
                <p class="m-0">Giỏ hàng</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Cart Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>Sản phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Tổng tiền</th>
                            <th>Hủy</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                    	<c:forEach items="${sessionScope.cart}" var="cart">
	                        <tr>
	                            <td class="align-middle d-flex justify-content-between align-items-center">
	                            	<img src="<c:url value = "/uploads/"/>${cart.value.product.image[0].imageLink}" style="width: 120px;">
	                            	${cart.value.product.productName}
                            	</td>
	                            <td class="align-middle">
	                            <fmt:setLocale value="vi_VN" />
								<fmt:formatNumber value="${cart.value.product.price}" type="currency" />
	                            </td>
	                            <td class="align-middle">
	                                <div class="input-group quantity mx-auto align-items-center" style="width: 100px;">
	                                    <div class="input-group-btn">
	                                    	<a href="cart/add?pid=${cart.value.product.productID}&amount=-1">
		                                        <button class="btn btn-sm btn-primary btn-minus" >
		                                        <i class="fa fa-minus"></i>
		                                        </button>
	                                    	</a>
	                                    </div>
	                                    <input type="text" class="form-control form-control-sm bg-secondary text-center" value="${cart.value.amount}" data-product-id="${cart.value.product.productID}">
	                                    <div class="input-group-btn">
	                                        <a href="cart/add?pid=${cart.value.product.productID}&amount=1">
	                                        	<button class="btn btn-sm btn-primary btn-plus">
		                                            <i class="fa fa-plus"></i>
		                                        </button>
	                                        </a>
	                                    </div>
	                                </div>
	                            </td>
	                            <td class="align-middle">
		                            <fmt:setLocale value="vi_VN" />
									<fmt:formatNumber value="${ cart.value.product.price * cart.value.amount }" type="currency" />
	                            </td>
	                            <td class="align-middle">
	                            	<a href="cart/add?pid=${cart.value.product.productID}&amount=-99999999">
	                            		<button class="btn btn-sm btn-primary"><i class="fa fa-times"></i></button>
	                            	</a>
	                            </td>
	                        </tr>
                    	</c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="col-lg-4">
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Giỏ hàng</h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Tổng tiền sản phẩm</h6>
                            <h6 class="font-weight-medium">
	                            <c:set var="totalItemPrice" value="${0}" />
								<c:forEach items="${sessionScope.cart}" var="cart">
										<c:set var="totalCartItemPrice" value="${totalCartItemPrice + cart.value.product.price * cart.value.amount}" />
								</c:forEach>
								<fmt:setLocale value="vi_VN" />
								<fmt:formatNumber value="${ totalCartItemPrice }" type="currency" />
                            </h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Phí giao hàng</h6>
                            <h6 class="font-weight-medium">
                            	<c:set var="shippingPrice" value="${20000}" />
                            	<fmt:setLocale value="vi_VN" />
								<fmt:formatNumber value="${ shippingPrice }" type="currency" />
                            </h6>
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Tổng tiền</h5>
                            <h5 class="font-weight-bold">
                            	<c:set var="totalPrice" value="${0}" />
								<c:forEach items="${sessionScope.cart}" var="cart">
										<c:set var="totalPrice" value="${totalPrice + cart.value.product.price * cart.value.amount}" />
								</c:forEach>
								<fmt:setLocale value="vi_VN" />
								<fmt:formatNumber value="${ totalPrice + shippingPrice}" type="currency" />
                            </h5>
                        </div>
                        
                        <c:if test="${not empty sessionScope.cart }">
							<a href="checkout" style="color: black; font-weight: bold; text-decoration: none">
	                        	<button class="btn btn-block btn-primary my-3 py-3">Thanh Toán</button>
	                        </a>
						</c:if>
						<c:if test="${ empty sessionScope.cart }">
							<a href="checkout" style="color: black; font-weight: bold; text-decoration: none">
	                        	<button class="btn btn-block btn-primary my-3 py-3" disabled>Thanh Toán</button>
	                        </a>
                	        <div class="text-danger" style="font-size: 14px; font-weight: bold;">Vui lòng thêm sản phẩm</div>
						</c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Cart End -->
	<script>
	//Product Quantity
	$('.quantity button').on('click', function () {
	    var button = $(this);
	    var oldValue = button.parent().parent().find('input').val();
	    if (button.hasClass('btn-plus')) {
	        var newVal = parseFloat(oldValue) + 1;
	    } else {
	        if (oldValue > 0) {
	            var newVal = parseFloat(oldValue) - 1;
	        } else {
	            newVal = 0;
	        }
	    }
	    button.parent().parent().find('input').val(newVal);
	});
	$('.quantity input').on('change', function () {
	    var newValue = $(this).val();
	    var productId = $(this).data('product-id');
	    if (newValue > 0) {
		    window.location.href = "cart/add?pid="+productId+"&amount=-99999999"
		    window.location.href = "cart/add?pid="+productId+"&amount="+newValue	    	
	    } else {
	    	window.location.href = ""
	    }
	});
	</script>
</body>