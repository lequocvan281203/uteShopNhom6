package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.ImageModel;

public class ImageMapper implements RowMapper<ImageModel>{

	@Override
	public ImageModel mapRow(ResultSet rs) {
		try {
			ImageModel image = new ImageModel();
			image.setImageID(rs.getLong("ImageID"));
			image.setProductID(rs.getLong("ProductID"));
			image.setImageLink(rs.getString("ImageLink"));
			return image;
		} catch (SQLException e) {
			return null;
		}
	}

}