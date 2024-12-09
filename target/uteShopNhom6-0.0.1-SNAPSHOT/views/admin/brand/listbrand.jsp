<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-brand"/>

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
	                <li class="active">Quản lý sản phẩm</li>
	                <li class="active">
	                	<a href="<c:url value = 'admin-brand-list?page=1&maxPageItem=6'/>">Danh sách thương hiệu</a>
	                </li>
	            </ul><!-- /.breadcrumb -->
	             <div class="nav-search" id="nav-search">
					<form class="form-search" action="<c:url value="/admin-brand-list"/>" id="formSreach" method="get">
						<input type="hidden" value="1" name="page">
						<input type="hidden" value="${model.maxPageItem}" name="maxPageItem">
						<span class="input-icon">
							<input type="text" placeholder="Nhập gì đó ..." value="${model.search}" name="search" class="nav-search-input" id="nav-search-input" autocomplete="off" style="padding-left: 12px!important;"/>
							<button type="submit" id="btnSerach" title="Tìm kiếm"><i class="ace-icon fa fa-search nav-search-icon"></i></button>
						</span>
					</form>
				</div><!-- /.nav-search -->
	        </div>
	       <form action="<c:url value="/admin-brand-list"/>" id="formSubmitBrand" method="get"> <!-- khi submit thi nhay vao url admin-new voi method get  -->
	        <div class="page-content">
	            <div class="row" >
	                <div class="col-xs-12">
	                <div class="widget-box table-filter">
									<div class="table-btn-controls">
										<div class="pull-right tableTools-container">
											<div class="dt-buttons btn-overlap btn-group">
												<a flag="info"
												   class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
												   title='Thêm thương hiệu' href='<c:url value = '/admin-brand-edit'/>'>
															<span>
																<i class="fa fa-plus-circle bigger-110 purple"></i>
															</span>
												</a>
												<button id="btnDelete" type="button"
														class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" title='Xóa thương hiệu'>
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
									        <th class="center112">Tên thuơng hiệu</th>
									        <th class="center112">Hình ảnh </th>
									        <th class="center112">Mô tả</th>
									        <th class="center112">Thao tác </th>
									      </tr>
									    </thead>
									    <tbody>
									    <c:forEach var="item" items="${Allbrand}">
									      <tr>
										      	<td class="center112"><input type="checkbox"value="${item.brandID}" id="checkbox_${item.brandID}"/></td>
										        <td class="center112">${item.brandName}</td>
										        <td width="300px" class="center112">
										        	<img alt="" src="${item.imageLink}" width="300px">
										        </td>
										        <td class="center112">${item.description}</td>
										        <td class="center112">
										        	<c:url var="editURL" value="/admin-brand-edit">
														<c:param name="brandID" value="${item.brandID}"/>
													</c:url>
													<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
													   title="Cập nhật thương hiệu" href='${editURL}'>
													   <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
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
									 	<input type="hidden" value ="${model.search}" id = "search" name="search">	<!-- khi bao name de mapping len url -->
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
 	            $("#formSubmitBrand").submit(); /* su kien jquery khi submit action form qua trang */
            }
        }
    });
});
$("#CheckAll").click(function(e){
	if(this.checked){
		 $('tbody input[type=checkbox]:not(:disabled)').prop('checked', true);
	}
	else{
		$('tbody input[type=checkbox]:not(:disabled)').prop('checked', false);
	}
})

$("#btnDelete").click(function(e) {
	e.preventDefault();
	var data = {};
	var ids = $('tbody input[type=checkbox]:checked').map(function () {
        return $(this).val();
    }).get();
	data['ids'] = ids;
	if (ids.length === 0) {
	    alert("Vui lòng chọn ít nhất một thương hiệu cần xóa.");
	    // Hoặc thực hiện các hành động cần thiết khi có lỗi.
	} else {
		data['ids'] = ids;
	    deleteBrand(data);
	}
})
function deleteBrand(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
            	window.location.href = "/WEB_FINAL_PROJECT/admin-brand-list?page="+${model.page}+"&maxPageItem=6";
            	alert("Xóa thành công.");
            	
            },
            error: function (error) 
            {
            	window.location.href = "/WEB_FINAL_PROJECT/admin-brand-list?page="+${model.page}+"&maxPageItem=6";
            	if (error.status === 400) {
            		alert("Xóa không thành công vì một số thương hiệu bạn chọn đang dùng cho một số sản phẩm");
            	}
            	else{
            		alert("Lỗi rồi");
            	}
            	
            }
        });
	}
</script>
</body>
</html>