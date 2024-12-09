<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Tìm kiếm sản phẩm</title>
</head>

<body>
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-12">
                <nav class="breadcrumb bg-light mb-30">
                    <a class="breadcrumb-item text-dark" href="home">Trang chủ</a>
                    <span class="breadcrumb-item active">Tìm kiếm sản phẩm</span>
                </nav>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-lg-12 col-md-12">
                <div class="row pb-3">
                    <div class="col-12 pb-1">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <div>
                                <button class="btn btn-sm btn-light"><i class="fa fa-th-large"></i></button>
                                <button class="btn btn-sm btn-light ml-2"><i class="fa fa-bars"></i></button>
                            </div>
                            <div class="ml-2">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">Sắp xếp theo</button>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" href="#">Mới nhất</a>
                                        <a class="dropdown-item" href="#">Phổ biến</a>
                                        <a class="dropdown-item" href="#">Giá tăng dần</a>
                                        <a class="dropdown-item" href="#">Giá giảm dần</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:forEach items="${productlist}" var="product">
                        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                            <a href="detail?pid=${product.productID}">
                            <div class="product-item bg-light mb-4">
                                <div class="product-img position-relative overflow-hidden">
                                    <img class="img-fluid w-100" src="<c:url value = "/uploads/"/>${product.image[0].imageLink}" alt="">
                                    <div class="product-action">
                                        <a class="btn btn-outline-dark btn-square" href="cart/add?pid=${product.productID}&amount=1"><i class="fa fa-shopping-cart"></i></a>
                                        <a class="btn btn-outline-dark btn-square" href="detail?pid=${product.productID}"><i class="fa fa-search"></i></a>
                                    </div>
                                </div>
                                <div class="text-center py-4">
                                    <a class="h6 text-decoration-none text-truncate" href="detail?pid=${product.productID}">${product.productName}</a>
                                    <div class="d-flex align-items-center justify-content-center mt-2">
                                        <h5>
                                            <fmt:setLocale value="vi_VN" />
                                            <fmt:formatNumber value="${product.price}" type="currency" />
                                        </h5>
                                    </div>
                                </div>
                            </div>
                            </a>
                        </div>
                    </c:forEach>
                    <div class="col-12">
                        <nav>
                          <ul class="pagination justify-content-center">
                            <li class="page-item disabled"><a class="page-link" href="#">Trước</a></li>
                            <c:forEach begin="1" end="${endP}" var="i">
                            	<li class="page-item active"><a class="page-link" href="search?txtSearch=${txtSearch}&page=${i}&maxPageItem=9">${i}</a></li>
                            </c:forEach>
                            <li class="page-item"><a class="page-link" href="#">Sau</a></li>
                          </ul>
                        </nav>
                    </div>
                </div>
            </div>
            </div>
    </div>
    </body>

</html>