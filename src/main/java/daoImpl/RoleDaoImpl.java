package daoImpl;

import java.util.List;

import dao.RoleDao;
import mapper.RoleMapper;
import model.RoleModel;

public class RoleDaoImpl extends AbstractDao<RoleModel> implements RoleDao{
	@Override
	public List<RoleModel> findAll() {
		String sql = "SELECT * FROM role";
		return query(sql,new RoleMapper());
	}
}