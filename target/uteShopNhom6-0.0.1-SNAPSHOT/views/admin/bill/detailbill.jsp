<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-brand"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs ace-save-state" id="breadcrumbs">
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="<c:url value = '/admin-home'/>">Trang chủ</a>
                </li>
	            <li class="">
	            	<a href="<c:url value = '/admin-bill-list?page=1&maxPageItem=9'/>">Thông tin đơn hàng</a>
	            </li>
	            	<li class="active">Thông tin chi  tiết</li>
            </ul><!-- /.breadcrumb -->
            
        </div>
        <div class="page-content">
        	<div class="page-header">	
				<h1>
					Thông tin chi tiết
				</h1>
			</div><!-- /.page-header -->
            <div class="row" >
                <div class="col-xs-12">
                		<div class="widget-box">
						<div class="widget-header widget-header-flat">
							<h4 class="widget-title smaller">Thông tin đơn hàng</h4>

							
						</div>

						<div class="widget-body">
							<div class="widget-main">
								<dl id="dt-list-1" class="dl-horizontal">
									<dt>Họ tên</dt>
									<dd>${model.userModel.fullName}</dd>
									<dt>Số điện thoại</dt>
									<dd>${model.userModel.sdt}</dd>
									<dt>Ngày đặt hàng</dt>
									<dd>${model.date}</dd>
									<dt>Địa chỉ</dt>
									<dd>${model.shippingAddress}</dd>
									<dt>Tổng giá</dt>
									<dd>
										<fmt:setLocale value="vi_VN" />
										<fmt:formatNumber value="${model.totalPrice}" type="currency" />
									</dd>
									<dt>Ghi chú</dt>
									<dd>${model.note}</dd>
									<dt>Trạng thái</dt>
									<dd>
										<c:if test="${model.status==0}">
							        		<span class="label label-sm label-warning" style="border-radius: 5px;padding: 4px;width: 80px">Chưa thanh toán</span>
							        	</c:if>
							        	<c:if test="${model.status==1}">
							        		<span class="label label-sm label-success" style="border-radius: 5px;padding: 4px;width: 80px">Đã thanh toán</span>
							        	</c:if>
							        	<c:if test="${model.status==2}">
							        		<span class="label label-sm label-danger" style="border-radius: 5px;padding: 4px;width: 80px">Đã bị hủy</span>
							        	</c:if>
									</dd>
								</dl>
							</div>
						</div>
					</div>
					
					<div class="widget-box">
						<div class="widget-header widget-header-flat">
							<h4 class="widget-title smaller">Thông tin sản phẩm trong đơn hàng</h4>

							
						</div>

						<div class="widget-body">
							<div class="widget-main">
								<dl id="dt-list-2" class="dl-horizontal">
								<c:forEach varStatus="loop" var="item" items="${model.orderItem}">
									<h4>Thông tin sản phẩm thứ ${loop.index+1}</h4>
									<dt>Tên sản phẩm </dt>
									<dd>${item.productModel.productName}</dd>
									<dt>Hình ảnh </dt>
									<dd>
										<c:forEach var="itemImage" items="${item.productModel.image}">
											<img alt="" src="<c:url value = "/uploads/"/>${itemImage.imageLink}" width="200px">
										</c:forEach>
									</dd>
									<dt>Thương hiệu</dt>
									<dd>${item.productModel.brandModel.brandName}</dd>
									<dt>Thể loại</dt>
									<dd>${item.productModel.categoryModel.categoryName}</dd>
									<dt>Giá</dt>
									<dd>
										<fmt:setLocale value="vi_VN" />
										<fmt:formatNumber value="${item.productModel.price}" type="currency" />
									</dd>
									<dt>Số lượng</dt>
									<dd>${item.amount}</dd>
								</c:forEach>
								</dl>
							</div>
						</div>
					</div>	
					
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
jQuery(function($) {
	
	window.prettyPrint && prettyPrint();
	$('#id-check-horizontal').removeAttr('checked').on('click', function(){
		$('#dt-list-1').toggleClass('dl-horizontal').prev().html(this.checked ? '&lt;dl class="dl-horizontal"&gt;' : '&lt;dl&gt;');
	});
	
	$('#id-check-horizontal1').removeAttr('checked').on('click', function(){
		$('#dt-list-2').toggleClass('dl-horizontal').prev().html(this.checked ? '&lt;dl class="dl-horizontal"&gt;' : '&lt;dl&gt;');
	});

})
</script>
</body>
</html>