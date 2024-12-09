<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url var="APIurl" value="/api-bill"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
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
	                <li class="active">
	                	<a href="<c:url value = '/admin-bill-list?page=1&maxPageItem=9'/>">Thông tin đơn hàng</a>
	                </li>
	            </ul><!-- /.breadcrumb -->
	             <div class="nav-search" id="nav-search">
					<form class="form-search" action="<c:url value="/admin-bill-list"/>" id="formSreach" method="get">
						<input type="hidden" value="1" name="page">
						<input type="hidden" value="${model.maxPageItem}" name="maxPageItem">
						<select name="key" title="Chọn nội dụng tìm kiếm">
						<c:if test="${empty model.key }">
							<c:forEach var="item" items="${dataMap}">
								<option value="${item.key}">${item.value}</option>
							</c:forEach>
						</c:if>
						<c:if test="${not empty model.key }">
							<c:forEach var="item" items="${dataMap}">
							<c:if test="${item.key==model.key }">
								<option value="${item.key}" selected="selected">${item.value}</option>
							</c:if>
							<c:if test="${item.key!=model.key }">
								<option value="${item.key}">${item.value}</option>
							</c:if>
								
							</c:forEach>
						</c:if>
						</select>
						<span class="input-icon">
							<input type="text" placeholder="Nhập gì đó ..." value="${model.search}" name="search" class="nav-search-input" id="nav-search-input" autocomplete="off" style="padding-left: 12px!important;"/>
							<button type="submit" id="btnSerach" title="Tìm kiếm"><i class="ace-icon fa fa-search nav-search-icon"></i></button>
						</span>
					</form>
				</div><!-- /.nav-search -->
	        </div>
	   <form action="<c:url value="/admin-bill-list"/>" id="formSubmitBill" method="get"> <!-- khi submit thi nhay vao url admin-new voi method get  -->
	        <div class="page-content">
	            <div class="row" >
	                <div class="col-xs-12">
	                <div class="widget-box table-filter">
									<div class="table-btn-controls">
										<div class="pull-right tableTools-container">
											<div class="dt-buttons btn-overlap btn-group">
												<button id="btnDelete" type="button"
														class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" title='Hủy đơn hàng'>
																<span>
																	<i class="fa fa-trash-o bigger-110 pink"></i>
																</span>
												</button>
											</div>
										</div>
									</div>
								</div>
						<div class="row">
							<div class="col-xs-12">
								<div class="table-responsive paging">
									<table class="table table-bordered">
									    <thead>
									      <tr>
									      	<th class="center112"><input type="checkbox" value="" id="CheckAll"/></th>
									        <th class="center112">Tên khách hàng</th>
									        <th class="center112">Số điện thoại</th>
									        <th class="center112">Ngày đặt hàng</th>
									        <th class="center112">Địa chỉ</th>
									        <th class="center112">Tổng giá(VNĐ)</th>
									        <th class="center112">Ghi chú</th>
									        <th class="center112">Trạng thái</th>
									        <th class="center112">Thao tác</th>
									      </tr>
									    </thead>
									    <tbody>
									    <c:forEach var="item" items="${model.listResult}">
										      <tr>
										      		<td class="center112 ">
										      		<c:if test="${item.status!=2}">
										      			<input type="checkbox"value="${item.billID}" id="checkbox_${item.billID}"/>
										      		</c:if>
										      		
										      		<c:if test="${item.status==2}">
										      			<input type="checkbox"value="${item.billID}" id="checkbox_${item.billID}" disabled="disabled"	/>
										      		</c:if>
										      		</td>
											        <td class="center112">${item.userModel.fullName}</td>
											        <td class="center112">${item.userModel.sdt}</td>
											        <td class="center112">${item.date}</td>
											        <td class="center112">${item.shippingAddress}</td>
											        <td class="center112">
												        <fmt:setLocale value="vi_VN" />
														<fmt:formatNumber value="${item.totalPrice}" type="currency" />
											        </td>
											        <td class="center112">${item.note}</td>
											        <td class="center112">
												        <c:if test="${item.status==0}">
											        		<span class="label label-sm label-warning" style="border-radius: 5px;padding: 4px;width: 80px">Chưa thanh toán</span>
											        	</c:if>
											        	<c:if test="${item.status==1}">
											        		<span class="label label-sm label-success" style="border-radius: 5px;padding: 4px;width: 80px">Đã thanh toán</span>
											        	</c:if>
											        	<c:if test="${item.status==2}">
											        		<span class="label label-sm label-danger" style="border-radius: 5px;padding: 4px;width: 80px">Đã bị hủy</span>
											        	</c:if>
											        </td>
										        <td class="center112">
											        	
														<c:if test="${item.status==0}">
															<button class="btn btn-sm btn-success btn-edit" id="${item.billID}" data-toggle="tooltip"
															   title="Thanh toán" type="button">
															   <i class="fa fa-credit-card" aria-hidden="true"></i>
															</button>
														</c:if>
														<c:if test="${item.status!=0}">
															<button class="btn btn-sm btn-success btn-edit disabled" data-toggle="tooltip"
															   title="Thanh toán" type="button">
															   <i class="fa fa-credit-card" aria-hidden="true"></i>
															</button>
														</c:if>
														
														<c:if test="${item.status==0}">
															<button class="btn btn-sm btn-warning btn-edit disabled"   data-toggle="tooltip"
															   title="Hủy thanh toán" type="button">
															   <i class="fa fa-undo bigger" aria-hidden="true"></i>
															</button>
														</c:if>
														<c:if test="${item.status!=0}">
															<button class="btn btn-sm btn-warning btn-edit "  value="${item.billID}" data-toggle="tooltip"
															   title="Đặt lại trạng thái thanh toán" type="button">
															   <i class="fa fa-undo bigger" aria-hidden="true"></i>
															</button>
														</c:if>
														<c:url var="editURL" value="/admin-bill-detail">
															<c:param name="billID" value="${item.billID}"/>
														</c:url>
														<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
														   title="Xem chi tiết" href="${editURL}">
														   <i class="fa fa-book" aria-hidden="true"></i>
														</a>
														
														
														
													</td>
											      </tr>
										  </c:forEach>
									    </tbody>
									  </table>
									  <ul class="pagination" id="pagination"></ul>
									    <input type="hidden" value =" " id = "page" name="page">	<!-- name phai giong trong model -->
									 <input type="hidden" value =" " id = "maxPageItem" name="maxPageItem">	<!-- khi bao name de mapping len url -->
									 <c:if test="${not empty model.search}">
									 	<input type="hidden" value ="${model.key}" name="key">
									 	<input type="hidden" value ="${model.search }" name="search">
									 </c:if>
								</div>
							</div>
						</div>
	                </div>
	            </div>
	            
	        </div>
	        </form>
	    </div>
</div><!-- /.main-content -->
<script type="text/javascript">
var currentPage = ${model.page};
var totalPages = ${model.totalPage};
//var visiblePages = ${model.maxPageItem};
var limit = ${model.maxPageItem};
$(function () {
    window.pagObj = $('#pagination').twbsPagination({
        totalPages: totalPages,
        startPage: currentPage,
        visiblePages: 10,
        onPageClick: function (event, page) {
            //console.info(page + ' (from options)');
            if(currentPage != page)//new khong su ly cho nay page se load lien tuc
            {
            	$("#page").val(page);
 	            $("#maxPageItem").val(limit);//dung de put data
 	            $("#formSubmitBill").submit(); /* su kien jquery khi submit action form qua trang */
            }
        }
    });
});

$(".btn-success").click(function(e) 
{
	data={};
	billID=$(this).attr("id");
	data["billID"]=billID;
	if (confirm("Bạn muốn thanh toán hóa đơn hàng này")) {
		ThanhToanBill(data);
	}
})

$("#CheckAll").click(function(e){
	if(this.checked){
		 $('tbody input[type=checkbox]:not(:disabled)').prop('checked', true);
	}
	else{
		$('tbody input[type=checkbox]:not(:disabled)').prop('checked', false);
	}
})

function ThanhToanBill(data){
	$.ajax({
        url: '${APIurl}',
        type: 'PUT',
        contentType: 'application/json',
        data: JSON.stringify(data),
        dataType: 'json',
        success: function (result) { //result la ket qua tra ve vd : newModel,...
        	//location.reload(); loadlaitrang
        	window.location.href = "/WEB_FINAL_PROJECT/admin-bill-list?page=${model.page}&maxPageItem=9";
        	alert("Thanh toán thành công");
        },
        error: function (error) {
        	alert("Lỗi rồi");
        }
    });
}

$(".btn-warning	").click(function(e) 
{
	data={};
	billID=$(this).val();
	data["billID"]=billID;
	if (confirm("Bạn muốn đặt lại trạng thái chưa thanh toán cho đơn này")) {
		HuyThanhToanBill(data);
	}
})
		
function HuyThanhToanBill(data){
	$.ajax({
        url: '${APIurl}',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(data),
        dataType: 'json',
        success: function (result) { //result la ket qua tra ve vd : newModel,...
        	//location.reload(); loadlaitrang
        	window.location.href = "/WEB_FINAL_PROJECT/admin-bill-list?page=${model.page}&maxPageItem=9";
        	alert("Đã đặt lại trạng thái thanh toán");
        },
        error: function (error) {
        	
        	if (error.status === 400) {
        		alert("Có một số sản phẩm đã hết hàng trong đơn này vui lòng bỏ sung thêm số lượng sản phẩm");
        	}
        	else{
        		alert("Lỗi rồi");
        	}
        }
    });
}	

$("#btnDelete").click(function(e) {
	e.preventDefault();
	var data = {};
	var ids = $('tbody input[type=checkbox]:checked').map(function () {
        return $(this).val();
    }).get();
	data['ids'] = ids;
	if (ids.length === 0) {
	    alert("Vui lòng chọn ít nhất một đơn hàng cần hủy.");
	    // Hoặc thực hiện các hành động cần thiết khi có lỗi.
	} else {
		if (confirm("Bạn có muốn hủy những đơn hàng đang chọn")) {
			data['ids'] = ids;
		    HuyDonHang(data);
		}
	}
})
function HuyDonHang(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
            	window.location.href = "/WEB_FINAL_PROJECT/admin-bill-list?page=${model.page}&maxPageItem=9";
            	alert("Đã hủy đơn hàng.");
            },
            error: function (error) 
            {
            	window.location.href = "/WEB_FINAL_PROJECT/admin-bill-list?page=${model.page}&maxPageItem=9";
            	alert("Lỗi rồi");
            	
            }
        })
       }
</script>
</body>
</html>