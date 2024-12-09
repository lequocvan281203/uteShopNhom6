<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-brand"/>

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
                <li class="active">Quản lý sản phẩm</li>
	            <li class="">
	            	<a href="<c:url value = '/admin-brand-list?page=1&maxPageItem=6'/>">Danh sách thương hiệu</a>
	            </li>
	            <c:if test="${empty model.brandID }">
	            	<li class="active">Thêm thương hiệu</li>
	            </c:if>
	            
	             <c:if test="${not empty model.brandID }">
	            	<li class="active">Cập nhập thông tin</li>
	            </c:if>
            </ul><!-- /.breadcrumb -->
            
        </div>
        <div class="page-content">
        	<div class="page-header">
				<c:if test="${empty model.brandID }">
					<h1>
						Nhập thông tin thương hiệu
					</h1>
				</c:if>
				
				<c:if test="${not empty model.brandID }">
					<h1>
						Cập nhập thông tin thương hiệu
					</h1>
				</c:if>
			</div><!-- /.page-header -->
            <div class="row" >
                <div class="col-xs-12">
                		<form class="form-horizontal">				
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="brandName"> Tên thương hiệu </label>
									<div class="col-sm-9">
										<input type="text" id="brandName" name="brandName"  placeholder="Nhập tên thương hiệu" class="col-xs-10 col-sm-4" value="${model.brandName}" />
									</div>					    
							</div>
							<c:if test="${empty model.brandID}">
								<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="image" id="imageTitle"></label>
										<div class="col-sm-9">
											<img alt="" src="" width="300px" id="image">
										</div>					    
								</div>
							</c:if>
							
							<div class="form-group">
							<c:if test="${not empty model.brandID}">
								<label class="col-sm-3 control-label no-padding-right" for="imageLink">  Hình ảnh cũ </label>
									<div class="col-sm-9">
										<img alt="" src="<c:url value = '${model.imageLink}'/>" width="300px" id="imageOld">
									</div>
							</c:if>
							<c:if test="${empty model.brandID}">
								<label class="col-sm-3 control-label no-padding-right" for="imageLink">  Hình ảnh </label>
									<div class="col-sm-9">
										<input type="text" id="imageLink" name="imageLink"  placeholder="Nhập link hình ảnh" class="col-xs-10 col-sm-5" value="" />
									</div>	
									<div class="col-sm-9 col-sm-offset-3">
							       		 <div id="LinkError" class="text-danger" style="font-size: 14px;font-weight: bold;" ></div>
							    	</div>
							   
							
							</c:if>
							</div>
							<c:if test="${not empty model.brandID}">
								
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="imageLink"> Link hình ảnh mới</label>
									<div class="col-sm-9">
										<input type="text" id="imageLink" name="imageLink"  placeholder="Nhập link hình ảnh mới" class="col-xs-10 col-sm-5" value="" />
									</div>	
									<div class="col-sm-9 col-sm-offset-3">
							       		 <div id="LinkError" class="text-danger" style="font-size: 14px;font-weight: bold;" ></div>
							    	</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="image" id="imageTitle"></label>
									<div class="col-sm-9">
										<img alt="" src="" width="300px" id="image">
									</div>					    
								</div>
							</c:if>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="description"> Mô tả </label>
								<div class="col-sm-9">
									<textarea class="form-control" rows="5" cols="10" id="description" name="description">${model.description}</textarea> 
								</div>		
									
								<div class="col-sm-9 col-sm-offset-3">
								         <div id="Error" class="text-danger" style="font-size: 14px;font-weight: bold;"></div>
								         <div id="success" class="text-success" style="font-size: 14px;font-weight: bold;"></div>
							    </div>			    
							</div>
							
							<div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-9">
									<c:if test="${empty model.brandID}">
										<button class="btn btn-info" type="button" id="btnAdd">
											<i class="ace-icon fa fa-check bigger-110"></i>
											Đăng ký
										</button>
									</c:if>
									
									<c:if test="${not empty model.brandID }">
										<button class="btn btn-info" type="button" id="btnUpdate">
											<i class="ace-icon fa fa-check bigger-110"></i>
											Cập nhập
										</button>
									</c:if>

									&nbsp; &nbsp; &nbsp;
									<button class="btn" type="reset" id="btnCancel">	
										<i class="ace-icon fa fa-undo bigger-110"></i>
										Hủy
									</button>
								</div>
							</div>
                	</form>
                	<c:if test="${not empty model.brandID }">
                		<input type="hidden" id="brandID" value="${model.brandID}">
                	</c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
$('#imageLink').change(function(){
	var newSrc = $(this).val();
	$('#image').attr('src', newSrc);
    $('#imageTitle').text("Hình ảnh hiện thị");
    $('#image').on('error', function () {
    	$('#image').attr('alt', "Ảnh không tồn tại");
    	$('#success').text("");
    });
    
    $('#image').on('load', function () {
    	$('#image').attr('alt', "");
    	$('#LinkError').text("");
    });
})

$('#btnAdd').click(function (e) {
	e.preventDefault();
	check = true;
	var brandName = $("#brandName").val();
	var imageLink = $("#imageLink").val();
	var description = $("#description").val();
	data = {};
	data["brandName"]=brandName;
	data["imageLink"]=imageLink;
	data["description"]=description;
	if($('#image').attr('alt') == ""){
		addBrand(data);
	}
	else{
		$('#LinkError').text("Link hình ảnh không hợp lệ");
	}
})

$('#btnUpdate').click(function (e) {
	e.preventDefault();
	data = {};
	var brandName = $("#brandName").val();
	var description = $("#description").val();
	var imageLink = $("#imageLink").val();
	var brandID = $("#brandID").val();
	var imageOld = $("#imageOld").attr('src');
	if(imageLink===""){
		imageLink=imageOld;
	}
	data["brandID"]=brandID;
	data["brandName"]=brandName;
	data["imageLink"]=imageLink;
	data["description"]=description;
	if($('#image').attr('alt') == ""){
		updateBrand(data);
	}
	else{
		$('#LinkError').text("Link hình ảnh không hợp lệ");
	}
})

function updateBrand(data){
		$.ajax({
            url: '${APIurl}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) { //result la ket qua tra ve vd : newModel,...
            	//location.reload(); loadlaitrang
            	window.location.href = "/WEB_FINAL_PROJECT/admin-brand-edit?brandID=${model.brandID}";
            	$('#Error').text("");
            	alert("Cập nhập thành công");
            },
            error: function (error) {
            	$('#success').text("");
            	$('#Error').text("Lỗi rồi");
            }
        });
	}
function addBrand(data){
		$.ajax({
            url: '${APIurl}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',	
            success : function(result) 
            { //result la ket qua tra ve vd : newModel,...
            	$('#Error').text("");
            	$('#success').text("Thêm thành công");
			},
			error: function(error) 
			{
				$('#success').text("");
            	$('#Error').text("Lỗi rồi");
		    }
        });
}
</script>
</body>
</html>