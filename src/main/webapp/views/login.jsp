<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<div class="modal fade" id="loginModal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="card modal-content" style="border-radius: 15px;">
			<div class="card-body p-5 ">
				<div id="success2" class="text-success text-center"
					style="font-size: 14px; font-weight: bold;"></div>
				<div id="Error2" class="text-danger"
					style="font-size: 14px; font-weight: bold;"></div>
				<h2 class="text-uppercase text-center mb-3">Đăng nhập</h2>

				<form action="<c:url value="/dang-nhap"/>" id="formLogin" method="post">

					<div class="form-outline mb-3">
						<label class="form-label" for="userName2">Tài khoản</label> 
						<input type="text" id="userName2" name="username" class="form-control form-control-lg " />
						<div id="userNameError2" class="text-danger"
							style="font-size: 14px; font-weight: bold;"></div>
					</div>

					<div class="form-outline mb-3">
						<label class="form-label" for="password2">Mật khẩu</label> 
						<input type="password" id="password2" name="password" class="form-control form-control-lg" />

					</div>

					<div class="d-flex justify-content-center">
						<input type="hidden" value="login" name="action">
						<button type="submit"
							class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Đăng nhập</button>
					</div>
					
					<div id="empty2" class="text-danger"
						style="font-size: 14px; font-weight: bold;">
					</div>
					<p class="text-center text-muted mt-4 mb-0">
						Bạn chưa có tài khoản?
						<button type="button" class="text-body btn" data-toggle="modal" data-target="#registModal" data-dismiss="modal"
						>Đăng ký ngay</button>
					</p>
					<div class="d-flex justify-content-center">
						<button type="button" class="mx-2 text-body btn" style="" data-toggle="modal" data-target="#forgotPasswordModal" data-dismiss="modal"
						>Quên mật khẩu</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
