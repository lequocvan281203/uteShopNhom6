<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title><dec:title default="Trang chủ" /></title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">
<!-- bootstrap -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!-- jquery-ui -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<!-- fontawesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<!-- Favicon -->
<link href="<c:url value='/template/img/favicon.ico' />" rel="icon">
<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<!-- Customized Bootstrap Stylesheet -->
<link href="<c:url value="/template/css/style.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/template/regist/style.css' />" rel="stylesheet" type="text/css" media="all" />
<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/template/paging/jquery.twbsPagination.js' />"></script>

</head>
<body>
	<div>
		<!-- header -->
		<%@ include file="/common/web/header.jsp"%>
		<!-- header -->

		<!-- Navbar Start -->
		<%@ include file="/common/web/navbar.jsp"%>
		<!-- Navbar End -->

		<div style="width: 85%; margin: 0 auto">
			<dec:body />
		</div>


		<!-- footer -->
		<%@ include file="/common/web/footer.jsp"%>
		<!-- footer -->
		<!-- Modal -->
		<%@ include file="/views/regist.jsp"%>
		<%@ include file="/views/login.jsp"%>
		<%@ include file="/views/forgotpassword.jsp"%>
		<%@ include file="/views/toast.jsp" %>
		<!-- Modal -->
	</div>
</body>
</html>