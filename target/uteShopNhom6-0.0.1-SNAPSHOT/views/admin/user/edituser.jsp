
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-web-rigist"/>
<c:url var="APIurlUpdate" value="/api-admin-updateuser"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng ký</title>
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
                <li class="active">Quản lý đăng nhập</li>
	            <li class="">
	            	<a href="<c:url value = '/admin-user-list?page=1&maxPageItem=7'/>">Danh sách người dùng</a>
	            </li>
	            <c:if test="${empty model.id }">
	            	<li class="active">Thêm tài khoản</li>
	            </c:if>
	            
	             <c:if test="${not empty model.id }">
	            	<li class="active">Cập nhập thông tin</li>
	            </c:if>
            </ul><!-- /.breadcrumb -->
            
        </div>
        <div class="page-content">
        	<div class="page-header">
				<c:if test="${empty model.id }">
					<h1>
						Nhập thông tin đăng ký
					</h1>
				</c:if>
				
				<c:if test="${not empty model.id }">
					<h1>
						Cập nhập thông tin người dùng
					</h1>
				</c:if>
			</div><!-- /.page-header -->
            <div class="row" >
                <div class="col-xs-12">
                		<form id="formSubmit" class="form-horizontal">
                		
                			<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-4"> Quyền </label>

								<div class="col-sm-9">
									<select class="form-control col-xs-10 col-sm-2" id="roleId" name="roleId">
									 <c:if test="${empty model.roleId}">	
										<option value="#">Phân quyền cho tài khoản</option>
										<c:forEach var="item" items="${roles}">
											<option value="${item.id}">${item.name}</option>
										</c:forEach>
									</c:if>
									
									<c:if test="${not empty model.roleId}">	
										<c:forEach var ="item" items="${roles}">
                                        	<c:if test="${item.id == model.roleId }">
                                        		<option value="${item.id }" selected="selected">${item.name }</option>
                                        	</c:if>
                                        	<c:if test="${item.id != model.roleId }">
                                        		<option value="${item.id }">${item.name }</option>
                                        	</c:if>
                                        </c:forEach>
                                        <option value="#">Phân quyền cho tài khoản</option>
									</c:if>
									</select>
								</div>
								<div class="col-sm-9 col-sm-offset-3">
							        <div id="roleError" class="text-danger" style="font-size: 14px;font-weight: bold;" ></div>
							    </div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="userName"> Tài khoản </label>

								<c:if test="${empty model.id }">
									<div class="col-sm-9">
										<input type="text" id="userName" name="userName"  placeholder="Nhập tài khoản" class="col-xs-10 col-sm-4" value="" />
									</div>
								</c:if>
								
								<c:if test="${not empty model.id }">
									<div class="col-sm-9">
										<input type="text" id="userName" name="userName"  placeholder="Nhập tài khoản" class="col-xs-10 col-sm-4" value="${model.userName}" disabled />
									</div>
								</c:if>
								<div class="col-sm-9 col-sm-offset-3">
							        <div id="userNameError" class="text-danger" style="font-size: 14px;font-weight: bold;" ></div>
							    </div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="fullName"> Họ tên </label>

								<div class="col-sm-9">
									<input type="text" id="fullName" name="fullName"  placeholder="Nhập họ tên" value="${model.fullName}" class="col-xs-10 col-sm-8"  />
								</div>
								<div class="col-sm-9 col-sm-offset-3">
							        <div id="fullNameError" class="text-danger" style="font-size: 14px;font-weight: bold;"></div>
							    </div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"  for="sdt"> Số điện thoại </label>

								<div class="col-sm-9">
									<input type="text" id="sdt" name="sdt"  placeholder="Nhập số điện thoại" value="${model.sdt}" class="col-xs-10 col-sm-3" />
								</div>
								<div class="col-sm-9 col-sm-offset-3">
							        <div id="sdtError" class="text-danger" style="font-size: 14px;font-weight: bold;" ></div>
							    </div>
							</div>

							<div class="space-4"></div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="password"> Mật khẩu </label>

								<div class="col-sm-9">
									<input type="password" id="password" name="password"  placeholder="Nhập mật khẩu" value="${model.password}" class="col-xs-10 col-sm-4" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-3"> Nhập lại mật khẩu </label>

								<div class="col-sm-9">
									<input type="password" id="repeatPassword" name="repeatPassword" value="${model.password}" placeholder="Nhập lại mật khẩu" class="col-xs-10 col-sm-4" />
									
								</div>
								<div class="col-sm-9 col-sm-offset-3">
							        <div id="passwordError" class="text-danger" style="font-size: 14px;font-weight: bold;"></div>
							         <div id="empty" class="text-danger" style="font-size: 14px;font-weight: bold;"></div>
							         <div id="Error" class="text-danger" style="font-size: 14px;font-weight: bold;"></div>
							         <div id="success" class="text-success" style="font-size: 14px;font-weight: bold;"></div>
							    </div>
							    
							</div>
							<div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-9">
									<c:if test="${empty model.id }">
										<button class="btn btn-info" type="button" id="btnAdd">
											<i class="ace-icon fa fa-check bigger-110"></i>
											Đăng ký
										</button>
									</c:if>
									
									<c:if test="${not empty model.id }">
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
                		<c:forEach var="user" items="${users}">
						    <input type="hidden" id="${user.id}" name ="name" value="${user.userName}">
						</c:forEach>
						<input type="hidden" id="id" name ="name" value="${model.id}">
                </div>
            </div>
        </div>
    </div>
</div>
<script>
	$('#btnAdd').click(function (e) 
	{
		e.preventDefault();
		var data = {};
		var userName = $('#userName').val();
		var password = $('#password').val();
		var repeatPassword = $('#repeatPassword').val();
		var fullName = $('#fullName').val();
		var sdt = $('#sdt').val();
		var check = false;
		$('#passwordError').text("");
	    $('#sdtError').text("");
	    $('#fullNameError').text("");
	    $('#empty').text("");
	    $('#userNameError').text("");
	    $('#roleError').text("");
		var role = $('#roleId').val();
		var formData = $('#formSubmit').serializeArray();
		$.each(formData,function(i,v){
			data[""+v.name+""] = v.value;
			if(v.value == ""){
				 $('#empty').text("Hãy nhập đầy đủ thông tin");
				 check=true;
			}
		});
		if(check == true){
	   		return;
	   	}
		 var inputs = $('input[name="name"]');
	        inputs.each(function() {
	            var userNameOld = $(this).val();
	            if(userNameOld==userName)
	            {
	            	$('#userNameError').text("Tài khoản đã tồn tại");
	            	check = true;
	            }
	        });
	        if(role == "#")
	        {
	        	$('#roleError').text("Hãy phân quyền cho user này");
	        	check=true;
	        }
			if(password != repeatPassword){
				 $('#passwordError').text("Mật khẩu nhập lại chưa đúng");
				 check=true;
			}
			if (!/^\d+$/.test(sdt)) 
			{
		        $('#sdtError').text("Phải nhập số");
		        check=true;
		    }
			if(/^[a-zA-Z\sàáảãạăắằẳẵặâấầẩẫậèéẻẽẹêềếểễệđìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵ]+$/u.test(fullName) == false){
				$('#fullNameError').text("Chỉ được nhập chữ cái và khoảng trắng");
				check=true;
			}
			$('#success').text("");
		if(check==false){
			addUser(data);
		}
	});
	
	$('#btnUpdate').click(function (e) 
	{
		e.preventDefault();
		var data = {};
		var userName = $('#userName').val();
		var password = $('#password').val();
		var repeatPassword = $('#repeatPassword').val();
		var fullName = $('#fullName').val();
		var sdt = $('#sdt').val();
		var check = false;
		$('#passwordError').text("");
	    $('#sdtError').text("");
	    $('#fullNameError').text("");
	    $('#empty').text("");
	    $('#userNameError').text("");
	    $('#roleError').text("");
		var role = $('#roleId').val();
		var formData = $('#formSubmit').serializeArray();
		$.each(formData,function(i,v){
			data[""+v.name+""] = v.value;
			if(v.value == ""){
				 $('#empty').text("Hãy nhập đầy đủ thông tin");
				 check=true;
			}
		});
		if($('#id').val()!=null){
			data["id"] =  $('#id').val();
		}
		
		
		
		if(check == true){
	   		return;
	   	}
        if(role == "#")
        {
        	$('#roleError').text("Hãy phân quyền cho user này");
        	check=true;
        }
		if(password != repeatPassword){
			 $('#passwordError').text("Mật khẩu nhập lại chưa đúng");
			 check=true;
		}
		if (!/^\d+$/.test(sdt)) 
		{
	        $('#sdtError').text("Phải nhập số");
	        check=true;
	    }
		if(/^[a-zA-Z\sàáảãạăắằẳẵặâấầẩẫậèéẻẽẹêềếểễệđìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵÀÁẢÃẠĂẮẰẲẴẶÂẤẦẨẪẬÈÉẺẼẸÊỀẾỂỄỆĐĐ̣̀̀̉̃ÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴÔỐỒỔỖỘƠỜỚỞỠỢ]+$/u.test(fullName) == false){
			$('#fullNameError').text("Chỉ được nhập chữ cái và khoảng trắng");
			check=true;
		}
		$('#success').text("");
		if(check==false){
			updateUser(data);
		}
	});
	
	function updateUser(data){
		$.ajax({
            url: '${APIurlUpdate}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) { //result la ket qua tra ve vd : newModel,...
            	$('#Error').text("");
            	$('#success').text("Cập nhập thành công");
            	 console.log(result);
            },
            error: function (error) {
            	$('#success').text("");
            	$('#Error').text("Lỗi rồi");
            	 console.log(error);
            }
        });
	}
	
	function addUser(data){
		$.ajax({
            url: '${APIurl}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success : function(result) { //result la ket qua tra ve vd : newModel,...
				$('#Error').text("");
				$('#success').text("Đăng ký thành công");s
			},
			error: function(xhr) {
				$('#success').text("");
		        if (xhr.status === 400) {
		            // Trường hợp lỗi 400 Bad Request
		            $('#Error').text("Tên người dùng đã tồn tại");
		        } else {
		            $('#Error').text("Lỗi rồi");
		            console.log(xhr);
		        }
		    }
        });
	}
	
</script>
</body>
</html>