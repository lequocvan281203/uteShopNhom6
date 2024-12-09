<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-web-rigist" />
<body>
	<div class="modal fade" id="registModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="card modal-content" style="border-radius: 15px;">
				<div class="card-body p-5 ">
					<div id="success" class="text-success text-center"
						style="font-size: 14px; font-weight: bold;"></div>
					<div id="Error" class="text-danger text-center"
						style="font-size: 14px; font-weight: bold;"></div>
					<h2 class="text-uppercase text-center mb-3">Đăng ký tài khoản</h2>
	
					<form id="formSubmit">
	
						<div class="form-outline mb-3">
							<label class="form-label" for="userName">Tài khoản</label> 
							<input type="text" id="userName" name="userName" class="form-control form-control-lg " />
							<div id="userNameError" class="text-danger" style="font-size: 14px; font-weight: bold;"></div>
						</div>
	
						<div class="form-outline mb-3">
							<label class="form-label" for="sdt">Số điện thoại</label> 
							<input type="text" id="sdt" name="sdt" class="form-control form-control-lg" />
							<div id="sdtError" class="text-danger" style="font-size: 14px; font-weight: bold;"></div>
	
						</div>
	
						<div class="form-outline mb-3">
							<label class="form-label" for="fullName">Họ tên</label> 
							<input type="text" id="fullName" name="fullName" class="form-control form-control-lg" />
							<div id="fullNameError" class="text-danger" style="font-size: 14px; font-weight: bold;"></div>
						</div>
	
						<div class="form-outline mb-3">
							<label class="form-label" for="password">Mật khẩu</label> 
							<input type="password" id="password" name="password" class="form-control form-control-lg" />
	
						</div>
	
						<div class="form-outline mb-3">
							<label class="form-label" for="repeatPassword">Nhập lại mật khẩu</label> 
							<input type="password" id="repeatPassword" name="repeatPassword" class="form-control form-control-lg" />
							<div id="passwordError" class="text-danger" style="font-size: 14px; font-weight: bold;"></div>
						</div>
						<div class="d-flex justify-content-center">
							<button type="button" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body" id="btnAdd">
							Đăng ký
							</button>
						</div>
						<div id="empty" class="text-danger"
							style="font-size: 14px; font-weight: bold;"></div>
						<p class="text-center text-muted mt-4 mb-0">
							Bạn đã có tài khoản?
							<button type="button" class="mx-2 text-body btn" data-toggle="modal" data-target="#loginModal" data-dismiss="modal">
							Đăng nhập ngay
							</button>
						</p>
	
					</form>
					
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$('#btnAdd').click(function(e) {
			e.preventDefault();
			var data = {};
			var formData = $('#formSubmit').serializeArray();
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
			$.each(formData, function(i, v) {
				data["" + v.name + ""] = v.value;
				if (v.value == "") {
					$('#empty').text("Hãy nhập đầy đủ thông tin");
					check = true;
				}
			});
			if (check == true) {
				return;
			}
			
			if (password != repeatPassword) {
				$('#passwordError').text(
						"Mật khẩu nhập lại chưa đúng");
				check = true;
			}
			if (!/^\d+$/.test(sdt)) {
				$('#sdtError').text("Phải nhập số");
				check = true;
			}
			if (/^[a-zA-Z\sàáảãạăắằẳẵặâấầẩẫậèéẻẽẹêềếểễệđìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵÀÁẢÃẠĂẮẰẲẴẶÂẤẦẨẪẬÈÉẺẼẸÊỀẾỂỄỆĐĐ̣̀̀̉̃ÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴÔỐỒỔỖỘƠỜỚỞỠỢ]+$/u.test(fullName) == false) {
				$('#fullNameError').text(
						"Chỉ được nhập chữ cái và khoảng trắng");
				check = true;
			}
			$('#success').text("");
			if (check == false) {
				addUser(data);
			}
		})
		
		function addUser(data) {
			$.ajax({
				url : '${APIurl}',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) { //result la ket qua tra ve vd : newModel,...
					$('#Error').text("");
					$('#success').text("Đăng ký thành công");s
				},
				error: function(xhr) {
					$('#success').text("");
			        if (xhr.status === 400) {
			            // Trường hợp lỗi 400 Bad Request
			            $('#userNameError').text("Tên người dùng đã tồn tại");
			        } else {
			            $('#Error').text("Lỗi rồi");
			            console.log(xhr);
			        }
			    }
			});
		}
	
	</script>
</body>