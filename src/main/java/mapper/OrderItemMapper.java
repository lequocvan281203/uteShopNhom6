package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.BrandModel;
import model.CategoryModel;
import model.OrderItemModel;
import model.ProductModel;

public class OrderItemMapper implements RowMapper<OrderItemModel>{

	@Override
	public OrderItemModel mapRow(ResultSet rs) {
		try {
			OrderItemModel orderItem = new OrderItemModel();
			orderItem.setOrderItemID(rs.getLong("OrderItemID"));
			orderItem.setAmount(rs.getInt("Quantity"));
			orderItem.setProductID(rs.getLong("ProductID"));
			orderItem.setBillID(rs.getLong("BillID"));
			try {
				ProductModel productModel = new ProductModel();
				productModel.setProductName(rs.getString("ProductName"));
				productModel.setDescription(rs.getString("Description"));
				productModel.setPrice(rs.getDouble("Price"));
				try {
					BrandModel brandModel = new BrandModel();
					brandModel.setBrandName(rs.getString("BrandName"));
					productModel.setBrandModel(brandModel);
				}
				catch (Exception e) {
					System.out.println(e.getMessage());
				}
				try {
					CategoryModel categoryModel = new CategoryModel();
					categoryModel.setCategoryName(rs.getString("CategoryName"));
					productModel.setCategoryModel(categoryModel);
				}
				catch (Exception e) {
					System.out.println(e.getMessage());
				}
				orderItem.setProductModel(productModel);
			}
			catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return orderItem;
		} catch (SQLException e) {
			return null;
		}
	}

}