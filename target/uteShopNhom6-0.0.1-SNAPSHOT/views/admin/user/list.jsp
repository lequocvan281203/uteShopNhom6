<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Hashtable"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-web-rigist"/>
<c:url var="APIurlUpdateUser" value="/api-admin-updateuser"/>
<c:url var ="NewURL" value="/admin-user-edit"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách bài viết</title>
<style type="text/css">
	.btn-edit.disabled {
    pointer-events: none; /* Ngăn chặn sự kiện click */
    opacity: 0.6; /* Làm mờ thẻ */
    cursor: no-drop; /* Thay đổi con trỏ chuột thành dấu "không cho phép" */
    }
    .center{
       position: absolute;
       left: 50%;
       transform: translateX(-50%);
        
	}
	 html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
        body {
            position: relative;
        }
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
	                <li class="active">Quản lý người dùng</li>
	                <li class="active">
	                	<a href="<c:url value = '/admin-user-list?page=1&maxPageItem=7'/>">Danh sách tài khoản</a>
	                </li>
	            </ul><!-- /.breadcrumb -->
	            <div class="nav-search" id="nav-search">
					<form class="form-search" action="<c:url value="/admin-user-list"/>" id="formSreach" method="get">
						<input type="hidden" value="1" name="page">
						<input type="hidden" value="7" name="maxPageItem">
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
	  <form action="<c:url value="/admin-user-list"/>" id="formSubmit" method="get"> <!-- khi submit thi nhay vao url admin-new voi method get  -->
	        <div class="page-content">
	            <div class="row" >
	                <div class="col-xs-12">
					<c:if test="${not empty alert }">
						<div class="alert alert-block alert-${alert}">
							<button type="button" class="close" data-dismiss="alert">
								<i class="ace-icon fa fa-times"></i>
							</button>
							<i class="ace-icon fa fa-check green"></i>
							${message}
						</div>
					</c:if>
	                 
	                <div class="widget-box table-filter">
									<div class="table-btn-controls">
										<div class="pull-right tableTools-container">
											<div class="dt-buttons btn-overlap btn-group">
												<a flag="info"
												   class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
												   title='Thêm user' href='<c:url value = '/admin-user-edit'/>'>
															<span>
																<i class="fa fa-plus-circle bigger-110 purple"></i>
															</span>
												</a>
												<button id="btnDelete" type="button"
														class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" title='Xóa user'>
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
									      	<th class="center112"><input type="checkbox" value="" id="CheckAll" /></th>
									        <th class="center112">UserName</th>
									        <th class="center112">Password</th>
									        <th class="center112">Họ tên</th>
									        <th class="center112">Số điện thoại</th>
									        <th class="center112">Quyền</th>
									        <th class="center112">Trạng thái</th>
									        <th class="center112">Cập nhập</th>
									      </tr>
									    </thead>
									    <tbody>
									    <c:forEach var ="item" items="${model.listResult}">
										      <tr>
										      	<c:if test="${item.status==0 || item.userName==USERMODEL.userName || item.roleId=='1'}">
										      		<td class="center112"><input type="checkbox" value="${item.id}" id="checkbox_${item.id}" disabled /></td>
										      	</c:if>
										      	<c:if test="${item.status==1 && item.userName!=USERMODEL.userName && item.roleId!='1'}">
										      		<td class="center112"><input type="checkbox" value="${item.id}" id="checkbox_${item.id}" /></td>
										      	</c:if>
										        <td class="center112">${item.userName}</td>
										        <td class="center112">${item.password}</td> 	
										        <td class="center112">${item.fullName}</td>
										        <td class="center112">${item.sdt}</td>
										        <td class="center112">${item.role.name}</td>
										        <td class="center112">
										        	<c:if test="${item.status==1}">
										        		<span class="label label-sm label-success" style="border-radius: 5px;padding: 4px;width: 80px">Đang hoạt động</span>
										        	</c:if>
										        	<c:if test="${item.status!=1}">
										        		<span class="label label-sm label-danger" style="border-radius: 5px;padding: 4px;width: 80px">Hết hiệu lực</span>
										        	</c:if>
										        </td>
										        <td class="center112">
											        <c:url var="editURL" value="/admin-user-edit">
														<c:param name="id" value="${item.id}"/>
													</c:url>
												<c:if test="${item.status==0 || item.roleId=='1'}">
													<a class="btn btn-sm btn-primary btn-edit disabled " data-toggle="tooltip"
													   title="Cập nhật thông tin user" href='${editURL}'  >
													   <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
													</a>
													<c:if test="${item.roleId!='1' }">
														<button class="btn btn-sm btn-warning btn-edit  "  value="${item.id}" data-toggle="tooltip"
														   title="Đặt lại trạng thái tài khoản" type="button">
														   <i class="fa fa-undo bigger" aria-hidden="true"></i>
														</button>
													</c:if>
												</c:if>
												
												<c:if test="${item.status==1 && item.roleId!='1'}">
													<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
													   title="Cập nhật thông tin user" href='${editURL}'>
													   <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
													</a>
													<button class="btn btn-sm btn-warning btn-edit disabled "  value="${item.id}" data-toggle="tooltip"
														   title="Đặt lại trạng thái tài khoản" type="button">
														   <i class="fa fa-undo bigger" aria-hidden="true"></i>
													</button>
												</c:if>
												</td>
										      </tr>
									      </c:forEach>
									    </tbody>
									  </table>	
									  <div >
									  	<ul class="pagination " id="pagination"></ul>
									  </div>
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
<script>
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
	 	            $("#formSubmit").submit(); /* su kien jquery khi submit action form qua trang */
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
	$(".btn-warning").click(function(e) 
	{
		data={};
		userID=$(this).val();
		data["id"]=userID;
		if (confirm("Bạn muốn đặt lại trạng thái hoạt động cho tài khoản này")) {
			CapNhapTrangThaiUser(data);
		}
	})
	
	function CapNhapTrangThaiUser(data){
	$.ajax({
        url: '${APIurlUpdateUser}',
        type: 'DELETE',
        contentType: 'application/json',
        data: JSON.stringify(data),
        dataType: 'json',
        success: function (result) { //result la ket qua tra ve vd : newModel,...
        	//location.reload(); loadlaitrang
        	window.location.href = "/WEB_FINAL_PROJECT/admin-user-list?page=${model.page}&maxPageItem=7";
        	alert("Đã đặt lại trạng thái tài khoản");
        },
        error: function (error) {
        	alert("Lỗi rồi");
        }
    });
}	
	
	$("#btnDelete").click(function() {
		var data = {};
		var ids = $('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
		data['ids'] = ids;
		if (ids.length === 0) {
		    alert("Vui lòng chọn ít nhất một user cần xóa.");
		    // Hoặc thực hiện các hành động cần thiết khi có lỗi.
		} else {
		    data['ids'] = ids;
		    deleteNew(data);
		}
	});
	
	function deleteNew(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) 
            {
            	window.location.href = "/WEB_FINAL_PROJECT/admin-user-list?page=1&maxPageItem=7&message=delete_success";
            },
            error: function (error) 
            {
            	window.location.href = "/WEB_FINAL_PROJECT/admin-user-list?page=1&maxPageItem=7&message=error_system";
            	
            }
        });
	}
</script>

</body>
</html>