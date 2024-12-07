package dao;

import java.util.List;

import model.RoleModel;

public interface RoleDao {
	List<RoleModel> findAll();
}