package model;

public class UserModel extends AbstractModel<UserModel> {
	private String userName;
	private String fullName;
	private String password;
	private int status;
	private Long roleId;
	private String sdt;
	private RoleModel role = new RoleModel();
	private String repeatPassword;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Long getRoleId() {
		return roleId;
	}
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public RoleModel getRole() {
		return role;
	}
	public void setRole(RoleModel role) {
		this.role = role;
	}
	public String getRepeatPassword() {
		return repeatPassword;
	}
	public void setRepeatPassword(String repeatPassword) {
		this.repeatPassword = repeatPassword;
	}

	@Override
	public String toString() {
	    return "UserModel{" +
	            "userName='" + userName + '\'' +
	            ", fullName='" + fullName + '\'' +
	            ", password='" + password + '\'' +
	            ", status=" + status +
	            ", roleId=" + roleId +
	            ", sdt='" + sdt + '\'' +
	            ", role=" + role +
	            ", repeatPassword='" + repeatPassword + '\'' +
	            '}';
	}

}
