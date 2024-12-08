package dao;

import java.util.List;

import mapper.RowMapper;

public interface GenericDao<T> {
	@SuppressWarnings("hiding")
	<T> List<T> query(String sql, RowMapper<T> RowMapper, Object... parameters);
	// Logic thực thi SQL và ánh xạ kết quả vào đối tượng User
    // Chẳng hạn sử dụng JDBC hoặc JPA để truy vấn cơ sở dữ liệu

	void update(String sql, Object... patameters);
	// Cập nhật thông tin người dùng trong cơ sở dữ liệu

	Long insert(String sql, Object... patameters);
	// Thực hiện insert một User mới vào cơ sở dữ liệu

	int count(String sql, Object... patameters);
	// Đếm số lượng bản ghi của người dùng

	double getPrice(String sql, Object... patameters);
	// Ví dụ tính tổng giá trị các đơn hàng của người dùng, hoặc giá trị khác liên quan đến người dùng
}