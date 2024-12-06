-- Tạo database
CREATE DATABASE uteshop;

-- Sử dụng database
USE uteshop;
-- xoá khuyến mãi--
-- TRUNCATE TABLE uteshop.promotion;
 
-- xoá dữ liệu--

-- SET FOREIGN_KEY_CHECKS = 0; -- Tắt kiểm tra khóa ngoại

-- -- Xóa toàn bộ dữ liệu trong các bảng
-- TRUNCATE TABLE uteshop.product;
-- TRUNCATE TABLE uteshop.category;
-- TRUNCATE TABLE uteshop.brand;
-- TRUNCATE TABLE uteshop.bill;
-- TRUNCATE TABLE uteshop.promotion;

-- -- Xóa dữ liệu trong bảng user, ngoại trừ dòng có id = 1
-- DELETE FROM uteshop.user WHERE id <> 1;

-- SET FOREIGN_KEY_CHECKS = 1; -- Bật lại kiểm tra khóa ngoại
