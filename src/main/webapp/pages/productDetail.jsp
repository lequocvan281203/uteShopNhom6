<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chi Tiết Sản Phẩm</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-6">
                <img src="https://via.placeholder.com/300" class="img-fluid" alt="Sản phẩm">
            </div>
            <div class="col-md-6">
                <h2><%= request.getParameter("name") %></h2>
                <p>Giá: 1.000.000đ</p>
                <p>Mô tả sản phẩm...</p>
                <div class="d-flex align-items-center">
                    <input type="number" class="form-control w-25 me-2" value="1">
                    <button class="btn btn-success">Thêm vào giỏ hàng</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
