<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Danh Mục</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h3>Danh mục sản phẩm</h3>
        <div class="row">
            <div class="col-md-3">
                <div class="list-group">
                    <a href="category.jsp?cat=1" class="list-group-item">Danh mục 1</a>
                    <a href="category.jsp?cat=2" class="list-group-item">Danh mục 2</a>
                </div>
            </div>
            <div class="col-md-9">
                <div class="row">
                    <!-- Sản phẩm -->
                    <div class="col-md-4">
                        <div class="card">
                            <img src="https://via.placeholder.com/150" class="card-img-top" alt="Sản phẩm">
                            <div class="card-body">
                                <h5 class="card-title">Tên Sản Phẩm</h5>
                                <p class="card-text">Giá: 1.000.000đ</p>
                                <a href="productDetail.jsp" class="btn btn-primary">Chi tiết</a>
                            </div>
                        </div>
                    </div>
                    <!-- Thêm sản phẩm -->
                </div>
            </div>
        </div>
    </div>
</body>
</html>