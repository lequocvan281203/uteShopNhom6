<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-promotion"/>

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
	            	<a href="<c:url value = '/admin-promotion-list?page=1&maxPageItem=10'/>">Sản phẩm khuyến mãi</a>
	            </li>
	            <c:if test="${empty model.promotionID }">
	            	<li class="active">Thêm khuyến mãi</li>
	            </c:if>
	            
	             <c:if test="${not empty model.promotionID }">
	            	<li class="active">Cập nhập thông tin</li>
	            </c:if>
            </ul><!-- /.breadcrumb -->
            
        </div>
        <div class="page-content">
        	<div class="page-header">
				<c:if test="${empty model.promotionID }">
					<h1>
						Nhập thông tin khuyến mãi
					</h1>
				</c:if>
				
				<c:if test="${not empty model.promotionID }">
					<h1>
						Cập nhập thông tin khuyễn mãi
					</h1>
				</c:if>
			</div><!-- /.page-header -->
            <div class="row" >
                <div class="col-xs-12">
                		<form class="form-horizontal">				
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="productName"> Tên sản phẩm </label>
									<div class="col-sm-9">
									<c:if test="${empty model.promotionID }">
										<select class="chosen-select form-control" id="productName" name="productName" data-placeholder="Chọn sản phẩm...">
											
											<option value="#">  </option>
												<c:forEach var="item" items="${allProduct}">
													<option value="${item.productID}">${item.productName}</option>
												</c:forEach>
										</select>
										</c:if>
										
										<c:if test="${not empty model.promotionID }">
										<select class="chosen-select form-control" id="productName" name="productName" data-placeholder="Chọn sản phẩm..." disabled="disabled">
											<option value="#">  </option>
												<c:forEach var="item" items="${allProduct}">
														<c:if test="${item.productID==model.productID}">
									 					<option value="${item.productID}" selected="selected">${item.productName}</option>
											 			</c:if>
											 			<c:if test="${item.productID!=model.productID}">
											 					<option value="${item.productID}">${item.productName}</option>
											 			</c:if>
												</c:forEach>
											</select>
											</c:if>
									</div>			
									<div class="col-sm-9 col-sm-offset-3">
							        	<div id="productError" class="text-danger" style="font-size: 14px;font-weight: bold;" ></div>
							    	</div>		    
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="spinner3"> Khuyễn mãi(%) </label>
									<div class="col-sm-9">
										<input type="text" id="spinner3" value="${model.saleOff}" name="saleOff"/>
									</div>					    
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="startDate"> Ngày bắt đầu </label>
									<div class="col-sm-2">
										<div class="input-group">
											<input class="form-control date-picker" id="startDate" name="startDate" type="text" data-date-format="yyyy-mm-dd" value="${model.startDate}" />
											<span class="input-group-addon">
												<i class="fa fa-calendar bigger-110"></i>
											</span>
										</div>
									</div>					    
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="endDate"> Ngày kết thúc</label>
									<div class="col-sm-2">
										<div class="input-group">
											<input class="form-control date-picker" id="endDate" name="endDate" type="text" data-date-format="yyyy-mm-dd" value="${model.endDate}" />
											<span class="input-group-addon">
												<i class="fa fa-calendar bigger-110"></i>
											</span>
										</div>
									</div>	
								<div class="col-sm-9 col-sm-offset-3">
							         <div id="Error" class="text-danger" style="font-size: 14px;font-weight: bold;"></div>
							         <div id="success" class="text-success" style="font-size: 14px;font-weight: bold;"></div>
							    </div>						    
							</div>
							
							<div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-9">
									<c:if test="${empty model.promotionID}">
										<button class="btn btn-info" type="button" id="btnAdd">
											<i class="ace-icon fa fa-check bigger-110"></i>
											Đăng ký
										</button>
									</c:if>
									
									<c:if test="${not empty model.promotionID }">
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
                	<c:if test="${not empty model.promotionID }">
                		<input type="hidden" id="promotionID" value="${model.promotionID}">
                	</c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
  // Lấy ngày hiện tại
  var today = new Date();

  // Định dạng ngày theo yyyy-mm-dd
  var year = today.getFullYear();
  var month = String(today.getMonth() + 1).padStart(2, '0');
  var day = String(today.getDate()).padStart(2, '0');
  var formattedDate = year + '-' + month + '-' + day;

  // Gán giá trị cho trường startDate
  if(document.getElementById("startDate").value==-""){
	  document.getElementById("startDate").value = formattedDate;
	  document.getElementById("endDate").value = formattedDate;
  }
  
</script>
<script>
jQuery(function($) 
{
	$('#spinner3').ace_spinner({value:0,min:0,max:100,step:10, on_sides: true, icon_up:'ace-icon fa fa-plus bigger-110', icon_down:'ace-icon fa fa-minus bigger-110', btn_up_class:'btn-success' , btn_down_class:'btn-danger'});
	
	$('.date-picker').datepicker({
		autoclose: true,
		todayHighlight: true
	})
	//show datepicker when clicking on the icon
	.next().on(ace.click_event, function(){
		$(this).prev().focus();
	});
	$('.chosen-select').chosen({allow_single_deselect:true}); 
})

$("#productName").change(function (e){
	var productID = $("#productName").val();
	var idPromotions = [];
	var idProducts = [];
	 <c:forEach items="${allPromotion}" var="item">
	 	idPromotions.push(${item.promotionID});
	 	idProducts.push(${item.productID});
	 </c:forEach>
	 for(var i = 0 ; i<idProducts.length;i++){
		 if(idProducts[i]==productID){
			  if (confirm("Đã có thông tin khuyến mã sản phẩm này bạn có muốn chuyển đến xem chi tiết")) 
			  {
				  window.location.href = "/WEB_FINAL_PROJECT/admin-promotion-edit?promotionID="+idPromotions[i]+"";
			  }	
			  else{
				  window.location.href = "/WEB_FINAL_PROJECT/admin-promotion-edit";
			  }
		 }
	 }
})
function reset(){
	$('#Error').text("");
	$('#productError').text("");
}
$('#btnAdd').click(function (e) 
{	
	e.preventDefault();
	reset();
	var productID = $("#productName").val();
	var saleOff = $("#spinner3").val();
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	data = {};
	data["productID"]=productID;
	data["saleOff"]=saleOff;
	data["startDate"]=startDate;
	data["endDate"]=endDate;
	var firstDate = new Date(data["startDate"]);
	var secondDate = new Date(data["endDate"])
	var timeDiff = secondDate - firstDate;
	var daysDiff = timeDiff / (1000 * 60 * 60 * 24);
	var check=true;
	if(data["productID"]==="#"){
		check=false;
		$("#productError").text("Hãy chọn sản phẩm cần giảm giá");
	}
	if(daysDiff < 0){
		$('#Error').text("Ngày kết thúc không thể nhỏ hơn ngày bắt đầu");
	}
	else
	{
		if(check)
		{
			addPromotion(data);
		}
	}
})

function addPromotion(data){
	$.ajax({
           url: '${APIurl}',
           type: 'POST',
           contentType: 'application/json',
           data: JSON.stringify(data),
           dataType: 'json',	
           success : function(result) 
           { //result la ket qua tra ve vd : newModel,...
        	window.location.href = "/WEB_FINAL_PROJECT/admin-promotion-edit";
           	$('#Error').text("");
           	alert("Thêm thành công");
		},
		error: function(error) 
		{
			$('#success').text("");
           	$('#Error').text("Lỗi rồi");
	    }
       });
}

$('#btnUpdate').click(function (e) {
	e.preventDefault();
	reset();
	var promotionID = $("#promotionID").val();
	var productID = $("#productName").val();
	var saleOff = $("#spinner3").val();
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	
	data = {};
	data["promotionID"]=promotionID;
	data["saleOff"]=saleOff;
	data["startDate"]=startDate;
	data["endDate"]=endDate;
	var firstDate = new Date(data["startDate"]);
	var secondDate = new Date(data["endDate"])
	var timeDiff = secondDate - firstDate;
	var daysDiff = timeDiff / (1000 * 60 * 60 * 24);
	console.log(daysDiff);
	
	if(daysDiff < 0){
		$('#Error').text("Ngày kết thúc không thể nhỏ hơn ngày bắt đầu");
	}
	else{
		updatePromotion(data);
	}
});
function updatePromotion(data){
	$.ajax({
        url: '${APIurl}',
        type: 'PUT',
        contentType: 'application/json',
        data: JSON.stringify(data),
        dataType: 'json',
        success: function (result) { //result la ket qua tra ve vd : newModel,...
        	//location.reload(); loadlaitrang
        	window.location.href = "/WEB_FINAL_PROJECT/admin-promotion-edit?promotionID=${model.promotionID}";
        	$('#Error').text("");
        	alert("Cập nhập thành công");
        },
        error: function (error) {
        	$('#success').text("");
        	$('#Error').text("Lỗi rồi");
        }
    });
}
</script>
</body>
</html>