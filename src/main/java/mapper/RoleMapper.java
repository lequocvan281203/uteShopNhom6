package mapper;

import java.sql.ResultSet;

import model.RoleModel;

public class RoleMapper implements RowMapper<RoleModel>{

	@Override
	public RoleModel mapRow(ResultSet rs) {
		try {
			RoleModel model = new RoleModel();
			model.setId(rs.getLong("id"));
			model.setCode(rs.getString("code"));
			model.setName(rs.getString("name"));
			return model;
		}
		catch (Exception e) {
			return null;
		}
	}

}