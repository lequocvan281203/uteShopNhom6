package serviceImpl;

import java.util.List;

import dao.UserDao;
import daoImpl.UserDaoImpl;
import model.UserModel;
import paging.Pageble;
import service.UserService;

public class UserServiceImpl implements UserService{

	UserDao userDAO = new UserDaoImpl();

	@Override
	public UserModel findByUserNamePasswordStatus(String userName, String password) 
	{
			return userDAO.findByUserNamePasswordStatus(userName, password);
	}
	
	@Override
	public UserModel findByUserName(String userName) {
	    return userDAO.findByUserName(userName);
	}

	@Override
	public UserModel register(String userName, String password, String fullName, String sdt, long roleId) {
	    UserModel user = new UserModel();
	    user.setUserName(userName);
	    user.setPassword(password);
	    user.setFullName(fullName);
	    user.setSdt(sdt);
	    user.setRoleId(roleId);  // Gán roleId (ví dụ: 2 cho user bình thường)

	    // Gọi UserDao để lưu thông tin người dùng
	    Long userId = userDAO.insertUser(user);

	    if (userId != null) {
	        user.setId(userId);
	        return user;
	    }
	    return null; // Nếu không thành công, trả về null
	}
	
	@Override
	public UserModel findOne(Long id) {
		return userDAO.findOne(id);
	}

	@Override
	public UserModel insertUser(UserModel userModel) {
		Long newId = userDAO.insertUser(userModel);
		return userDAO.findOne(newId);
	}

	@Override
	public List<UserModel> findAll() 
	{
		return userDAO.findAll();
	}

	@Override
	public UserModel changePassword(UserModel userModel) {
		userDAO.chagePassword(userModel);
		return userDAO.findOne(userModel.getId());
	}

	@Override
	public int getTotalItem() {
		return userDAO.getTotalItem();
	}

	@Override
	public List<UserModel> findAll(Pageble pageble) {
		return userDAO.findAll(pageble);
	}

	@Override
	public void deleteUser(long[] ids) {
		for(long id: ids) {
			userDAO.deleteUser(id);
		}
	}

	@Override
	public UserModel updateUser(UserModel userModel) {
		userDAO.updateUser(userModel);
		return userDAO.findOne(userModel.getId());
	}

	@Override
	public UserModel findByUserNameSdt(String userName, String Sdt) {
		return userDAO.findByUserNameSdt(userName, Sdt);
	}

	@Override
	public int getTotalItemSearch(String key, String search) {
		return userDAO.getTotalItemSearch(key, search);
	}

	@Override
	public List<UserModel> findAllSearch(Pageble pageble, String key, String search) {
		return userDAO.findAllSearch(pageble, key, search);
	}

	@Override
	public int getTotalUser() {
		// TODO Auto-generated method stub
		return userDAO.getTotalUser();
	}

	@Override
	public UserModel updateStatusUser(Long id) {
		userDAO.updateStatusUser(id);
		return userDAO.findOne(id);
		
	}
	
	
	

}