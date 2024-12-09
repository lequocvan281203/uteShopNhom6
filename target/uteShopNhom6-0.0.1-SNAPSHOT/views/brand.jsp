<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<body>
	<div class="container-fluid pt-5">
        <div class="row px-xl-5 pb-3">
        	<c:forEach items="${ allbrand }" var="brand">
	            <div class="col-md-6 col-sm-12 pb-1">
	                <a href="shop?page=1&maxPageItem=9&key=BrandID&search=${ brand.brandID }">
	                	<div class="mb-5">
		                    <img alt="" src="${brand.imageLink}" width="100%" class="row">
		                    <h5 class="font-weight-semi-bold m-0 row justify-content-center">${ brand.brandName }</h5>
		                </div>
	                </a>
	            </div>
        	</c:forEach>
        </div>
    </div>
</body>