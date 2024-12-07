package mapper;

import java.sql.ResultSet;

import model.ProductModel;
import model.PromotionModel;

public class PromotionMapper implements RowMapper<PromotionModel>
{

	@Override
	public PromotionModel mapRow(ResultSet rs) {
		try {
			PromotionModel promotion = new PromotionModel();
			promotion.setPromotionID(rs.getLong("PromotionID"));
			promotion.setProductID(rs.getLong("ProductID"));
			promotion.setStartDate(rs.getDate("StartDate"));
			promotion.setEndDate(rs.getDate("EndDate"));
			promotion.setSaleOff(rs.getInt("SaleOff"));
			try {
				ProductModel product = new ProductModel();
				product.setProductName(rs.getString("ProductName"));
				promotion.setProductModel(product);
			}
			catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return promotion;
		}
		catch (Exception e) {
			return null;
		}
	}
	
}