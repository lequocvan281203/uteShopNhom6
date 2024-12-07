package mapper;

import java.sql.ResultSet;

import model.BrandModel;

public class BrandMapper implements RowMapper<BrandModel> {

	@Override
	public BrandModel mapRow(ResultSet rs) {
		try {
			BrandModel brandModel = new BrandModel();
			brandModel.setBrandID(rs.getLong("BrandID"));
			brandModel.setBrandName(rs.getString("BrandName"));
			brandModel.setDescription(rs.getString("Description"));
			brandModel.setImageLink(rs.getString("ImageLink"));
			return brandModel;
		}
		catch (Exception e) {
			return null;
		}
	}

}