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
				<p class="m-0">${USERMODEL.fullName}</p>
			</div>
		</div>
	</div>
    <!-- Page Header End -->


    <!-- Checkout Start -->
    <form>
	    <div class="container-fluid pt-5">
              <div class="mb-4">
                  <h4 class="font-weight-semi-bold mb-4 text-center">Thông tin tài khoản</h4>
                  <div class="row justify-content-center">
                      <div class="col-md-4 form-group">
                          <label>Họ tên</label>
                          <input class="form-control" type="text" name='username' value="${USERMODEL.fullName}" disabled>
                      </div>
                      <div class="col-md-4 form-group">
                          <label>Số điện thoại</label>
                          <input class="form-control" type="text" name='sdt' value="${USERMODEL.sdt}" disabled>
                      </div>
                  </div>
              </div>
              
              <div class="mb-4" style="border: 1px solid gray">
                  <h4 class="font-weight-semi-bold mb-4 text-center p-2">Lịch sử đặt hàng</h4>
                  <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary">
                        <tr>
                            <th>Ngày đặt</th>
                            <th>Tổng tiền</th>
                            <th>Trạng thái</th>
                            <th>Địa chỉ</th>
                            <th>Danh sách sản phẩm</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                    	<c:forEach items="${model.listResult}" var="bill">
	                        <tr>
                            	<td class="">
	                            	<p>${bill.date}</p>
                            	</td>
	                            <td class="">
		                            <fmt:setLocale value="vi_VN" />
									<fmt:formatNumber value="${bill.totalPrice}" type="currency" />
	                            </td>
	                            <td>
                               		<c:if test="${bill.status==0}">
						        		<span class="badge badge-warning" style="border-radius: 7px; font-size: .8rem">Chưa thanh toán</span>
						        	</c:if>
						        	<c:if test="${bill.status==1}">
						        		<span class="badge badge-success" style="border-radius: 7px; font-size: .8rem">Đã thanh toán</span>
						        	</c:if>
						        	<c:if test="${bill.status==2}">
						        		<span class="badge badge-danger" style="border-radius: 7px; font-size: .8rem">Đã bị hủy</span>
						        	</c:if>   
	                            </td>
                            	<td class="">
	                            	<p>${bill.shippingAddress}</p>
                            	</td>
	                            <td style="padding: 0">
                                	<table style="width: 100%">
                                		<thead>
                                			<tr>
	                                			<th>Hình ảnh</th>
					                            <th>Tên sản phẩm</th>
					                            <th>Giá</th>
					                            <th>SL</th>
	                                		</tr>
                                		</thead>
                                		<tbody>
	                                		<c:forEach items="${bill.orderItem}" var="orderitem">
	                                			<tr>
	                                				<td>
			                                			<img alt="" src="<c:url value = "/uploads/"/>${orderitem.product.image[0].imageLink}" style="max-width: 120px">
													</td>
	                                				<td style="max-width: 250px">
				                                		<p>${orderitem.product.productName}</p>
													</td>
	                                				<td>
					                                	<p>
					                                		<fmt:setLocale value="vi_VN" />
															<fmt:formatNumber value="${orderitem.product.price}" type="currency" />
					                                	</p>
													</td>
	                                				<td>
				                                		<p>${orderitem.amount}</p>	                                			
													</td>
	                                			</tr>
		                                	</c:forEach>
                                		</tbody>
                                	</table>
	                            </td>
	                        </tr>
                    	</c:forEach>
                    </tbody>
                </table>
              </div>
       </div>

    </form>
    <!-- Checkout End -->
</body>