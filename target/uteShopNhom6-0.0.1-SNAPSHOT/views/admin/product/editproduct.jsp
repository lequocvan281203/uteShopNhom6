<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-product"/>

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
                <li class="active">Quản lý thể loại</li>
	            <li class="">
	            	<a href="<c:url value = '/admin-product-list?page=1&maxPageItem=3'/>">Danh sách sản phẩm</a>
	            </li>
	            <c:if test="${empty model.productID}">
	            	<li class="active">Thêm sản phẩm</li>
	            </c:if>
	            
	             <c:if test="${not empty model.productID}">
	            	<li class="active">Cập nhập sản phẩm</li>
	            </c:if>
            </ul><!-- /.breadcrumb -->
            
        </div>
        <div class="page-content">
        	<div class="page-header">
				<c:if test="${empty model.productID}">
					<h1>
						Nhập thông tin sản phẩm
					</h1>
				</c:if>
				
				<c:if test="${not empty model.productID}">
					<h1>
						Cập nhập thông tin sẩn phẩm
					</h1>
				</c:if>
			</div><!-- /.page-header -->
            <div class="row" >
                <div class="col-xs-12">
                <form method="post" action="<c:url value="/admin-product-edit"/>" enctype="multipart/form-data" id="formImg" class="form-horizontal">
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="productName"> Tên sản phẩm </label>
									<div class="col-sm-9">
										<input type="text" id="productName" name="productName"  placeholder="Nhập tên sản phẩm" class="col-xs-10 col-sm-12" value="${model.productName}" />
									</div>					    
							</div>
							<c:if test="${not empty model.productID}">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="imageHienTai"> Hình ảnh sản phẩm </label>
										<div class="col-sm-9">
											<div id="imageHienTai">
												<c:forEach var="item" items="${imgHienTai}">
												<div class="image-container">
														<img alt="" src="<c:url value="/uploads/${item.imageLink}"/>" width="200px" id="${item.imageID }" name="${item.imageLink}">
														 <div title="Xóa" class="delete-icon" onclick="deleteImage(this)"><i class="ace-icon glyphicon glyphicon-remove"></i></div>
												</div>
												</c:forEach>
												
												<c:forEach var="item" items="${imgs}">
												<div class="image-container">
														<img alt="" src="<c:url value="/uploads/${item}"/>" width="200px" name="${item}">
														<div title="Xóa" class="delete-icon" onclick="deleteImage(this)"><i  class="ace-icon glyphicon glyphicon-remove"></i></div>
												</div>
												</c:forEach>
											</div>			
										</div>					    
								</div>
							</c:if>	
								
							<div class="form-group">
							<c:if test="${empty model.productID}">
								<label class="col-sm-3 control-label no-padding-right" for="file"> Chọn hình ảnh </label>
							</c:if>	
							<c:if test="${not empty model.productID}">
								<label class="col-sm-3 control-label no-padding-right" for="file"> Thêm hình ảnh </label>
							</c:if>	
									<div class="col-sm-9">
											<input type="file" name="file" id="file" multiple="true" accept="image/*">
									
									</div>					    
							</div>
							<c:if test="${not empty imgs && empty model.productID}">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="file"> Hình ảnh được chọn </label>
										<div class="col-sm-9">
											<div id="imageContainer">
												<c:forEach var="item" items="${imgs}">
														<img alt="" src="<c:url value="/uploads/${item}"/>" width="200px" name="${item}">
												</c:forEach>
											</div>			
										</div>					    
								</div>
							</c:if>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="description"> Mô tả </label>
									<div class="col-sm-9">
										<textarea class="form-control" rows="5" cols="10" id="description" name="description">${model.description}</textarea> 
									</div>					    
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="categoryID"> Thể loại </label>
									<div class="col-sm-9">
										<select class="form-control col-xs-10 col-sm-2" id="categoryID" name="categoryID">
										<c:if test="${model.categoryID==0}">	
									 		<option value="#">--Chọn thể loại</option>
									 		<c:forEach var="category" items="${Allcategory}">
									 			<c:forEach var="childCategory" items="${category.childCategory}">
									 				<option value="${childCategory.categoryID}">${childCategory.categoryName}</option>
									 			</c:forEach>
									 		</c:forEach>
									 	</c:if>
									 	
									 	<c:if test="${model.categoryID!=0}">	
									 		<c:forEach var="category" items="${Allcategory}">
									 			<c:forEach var="childCategory" items="${category.childCategory}">
										 			<c:if test="${childCategory.categoryID==model.categoryID}">
										 					<option value="${childCategory.categoryID}" selected="selected">${childCategory.categoryName}</option>
										 			</c:if>
										 			<c:if test="${childCategory.categoryID!=model.categoryID}">
										 					<option value="${childCategory.categoryID}">${childCategory.categoryName}</option>
										 			</c:if>
									 			</c:forEach>
									 		</c:forEach>
									 		<option value="#">--Chọn thể loại</option>
									 	</c:if>
										</select> 
										
									</div>
									<div class="col-sm-9 col-sm-offset-3">
							       		<div id="categoryError" class="text-danger" style="font-size: 14px;font-weight: bold;" ></div>
							    	</div>						    
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="brandID"> Thương hiệu </label>
									<div class="col-sm-9">
										<select class="form-control col-xs-10 col-sm-2" id="brandID" name="brandID">
										<c:if test="${model.brandID==null || model.brandID==0}">	
									 		<option value="#">--Chọn thương hiệu</option>
									 		<c:forEach var="brand" items="${Allbrand}">
								 				<option value="${brand.brandID}">${brand.brandName}</option>
									 		</c:forEach>
									 	</c:if>
									 	
									 	<c:if test="${model.brandID!=null &&	 model.brandID!=0}">	
									 		<c:forEach var="brand" items="${Allbrand}">
									 			<c:if test="${brand.brandID==model.brandID}">
									 					<option value="${brand.brandID}" selected="selected">${brand.brandName}</option>
									 			</c:if>
									 			<c:if test="${brand.brandID!=model.brandID}">
									 					<option value="${brand.brandID}">${brand.brandName}</option>
									 			</c:if>
									 		</c:forEach>
									 		<option value="#">--Chọn thương hiệu</option>
									 	</c:if>
										</select> 
										
									</div>		
									<div class="col-sm-9 col-sm-offset-3">
							       		<div id="brandError" class="text-danger" style="font-size: 14px;font-weight: bold;" ></div>
							    	</div>			    
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="spinner3"> Số lượng </label>
									<div class="col-sm-9">
										<input type="text" id="spinner3" value="${model.amount}" name="amount"/>
									</div>					    
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="price"> Giá sản phẩm </label>
									<div class="col-sm-9">
										<input type="text" id="price" name="price"  placeholder="Nhập giá" class="col-xs-10 col-sm-4" value="${model.price}" />
									</div>	
									
									<div class="col-sm-9 col-sm-offset-3">
							         <div id="Error" class="text-danger" style="font-size: 14px;font-weight: bold;"></div>
							         <div id="success" class="text-success" style="font-size: 14px;font-weight: bold;"></div>
							    </div>				    
							</div>
							<div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-9">
									<c:if test="${empty model.productID}">
										<button class="btn btn-info" type="button" id="btnAdd">
											<i class="ace-icon fa fa-check bigger-110"></i>
											Đăng ký
										</button>
									</c:if>
									
									<c:if test="${not empty model.productID}">
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
							<c:if test="${not empty model.productID}">
								<input type="hidden" value="${model.productID}" name="productID" id="productID">
							</c:if>	
                	</form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
jQuery(function($) 
{
	$('#spinner3').ace_spinner({value:0,min:0,max:1000,step:10, on_sides: true, icon_up:'ace-icon fa fa-plus bigger-110', icon_down:'ace-icon fa fa-minus bigger-110', btn_up_class:'btn-success' , btn_down_class:'btn-danger'});
})
function deleteImage(deleteButton) {
            var imageContainer = deleteButton.parentNode;
            imageContainer.remove();
        }
</script>
<script>
	var btn = document.getElementById('file');
    btn.addEventListener("change", () => {
    	$("#formImg").submit();
    })
    
    $('#btnAdd').click(function (e){
    	e.preventDefault();
    	var data = {};
    	var imageNames = [];
    	 $('#imageContainer img').each(function() { 
    		 imageNames.push($(this).attr('name'));
    	 });
   	 	$("#categoryError").text("");
   	 	$("#brandError").text("");
    	var productName = $("#productName").val();
    	var description = $("#description").val();
    	var categoryID = $("#categoryID").val();
    	var amount = $("#spinner3").val();
    	var price = $("#price").val();
    	var brand = $("#brandID").val();
    	data["productName"] = productName;
    	data["imageNames"] = imageNames;
    	data["description"]= description;
    	data["categoryID"] = categoryID;
    	data["brandID"] = brand;
    	data["amount"] = amount;
    	data["price"] = price;
    	var check=true;
    	if(data["categoryID"]==="#"){
    		check=false;
    		$("#categoryError").text("Hãy chọn thể loại cho sản phẩm");
    	}
    	if(data["brandID"]==="#"){
    		check=false;
    		$("#brandError").text("Hãy chọn thương hiệu cho sản phẩm");
    	}
    	if(check){
    		addProduct(data);
    	}
    })
    
     $('#btnUpdate').click(function (e){
    	 e.preventDefault();
    	 var data = {};
     	var imageNames = [];
     	var idImageHienTai = [];
     	$("#categoryError").text("");
   	 	$("#brandError").text("");
     	var productID = $("#productID").val();
     	$('#imageHienTai img').each(function() { 
     		idImageHienTai.push($(this).attr('name'));
    	 });
     	var productName = $("#productName").val();
     	var description = $("#description").val();
     	var categoryID = $("#categoryID").val();
     	var amount = $("#spinner3").val();
     	var price = $("#price").val();
     	var brand = $("#brandID").val();
     	data["productID"] = productID;
     	data["productName"] = productName;
     	data["imageNames"] = idImageHienTai;
     	data["description"]= description;
     	data["categoryID"] = categoryID;
     	data["brandID"] = brand;
     	data["amount"] = amount;
     	data["price"] = price;
     	var check=true;
    	if(data["categoryID"]==="#"){
    		check=false;
    		$("#categoryError").text("Hãy chọn thể loại cho sản phẩm");
    	}
    	if(data["brandID"]==="#"){
    		check=false;
    		$("#brandError").text("Hãy chọn thương hiệu cho sản phẩm");
    	}
    	if(check){
     		updateProduct(data);
    	}
     })
     function updateProduct(data){
		$.ajax({
            url: '${APIurl}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) { //result la ket qua tra ve vd : newModel,...
            	window.location.href = "/WEB_FINAL_PROJECT/admin-product-edit?productID=${model.productID}";
            	$('#Error').text("");
            	alert("Cập nhập thành công");
            },
            error: function (error) {
            	$('#success').text("");
            	$('#Error').text("Lỗi rồi");
            }
        });
	}
    function addProduct(data){
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