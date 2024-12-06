package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.CategoryModel;

public class CategoryMapper implements RowMapper<CategoryModel> {

	@Override
	public CategoryModel mapRow(ResultSet rs) {
		try {
			CategoryModel category = new CategoryModel();
			category.setCategoryID(rs.getLong("CategoryID"));
			category.setCategoryName(rs.getString("CategoryName"));
			category.setImageLink(rs.getString("ImageLink"));
			category.setIcon(rs.getString("Icon"));
			return category;
		} catch (SQLException e) {
			return null;
		}
	}

}