package serviceImpl;

import java.util.List;

import dao.RoleDao;
import daoImpl.RoleDaoImpl;
import model.RoleModel;
import service.RoleService;

public class RoleServiceImpl implements RoleService{
	RoleDao roleDao = new RoleDaoImpl();
	@Override
	public List<RoleModel> findAll() {
		return roleDao.findAll();
	}

}