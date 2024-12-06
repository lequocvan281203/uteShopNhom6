package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.RoleModel;
import model.UserModel;



public class UserMapper implements RowMapper<UserModel>{

	@Override
	public UserModel mapRow(ResultSet resultSet) {
		try {
			UserModel users = new UserModel();
			users.setId(resultSet.getLong(1));
			users.setUserName(resultSet.getString("username"));
			users.setFullName(resultSet.getString("fullname"));
			users.setPassword(resultSet.getString("password"));
			users.setStatus(resultSet.getInt("status"));
			users.setSdt(resultSet.getString("sdt"));
			users.setRoleId(resultSet.getLong("roleid"));
			try { // Trường hợp SQL không kết nối bảng role
				RoleModel role = new RoleModel();
				role.setCode(resultSet.getString("code"));
				role.setName(resultSet.getString("name"));
				users.setRole(role);// Gán đối tượng role cho thuộc tính role của UserModel
			}
			catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return users;
		} catch (SQLException e) {
			return null;
		}
	}

}