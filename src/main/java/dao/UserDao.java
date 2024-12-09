package dao;

import java.util.List;

import model.UserModel;
import paging.Pageble;

public interface UserDao extends GenericDao<UserModel> {
	UserModel findByUserNamePasswordStatus(String userName,String password);
	Long insertUser(UserModel userModel);
	UserModel findOne(Long id);
	List<UserModel> findAll();
	void chagePassword(UserModel userModel);
	UserModel findByUserNameSdt(String userName,String Sdt);
	void deleteUser(Long id);
	void updateUser(UserModel userModel);

	UserModel findByUserName(String userName);

	// paging

	List<UserModel> findAll(Pageble pageble);
	List<UserModel> findAllSearch(Pageble pageble,String key,String search);
	int getTotalItem();
	int getTotalItemSearch(String key,String search);
	int getTotalUser();
	void updateStatusUser(Long id);
}