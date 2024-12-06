package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.BillModel;
import model.UserModel;

public class BillMapper implements RowMapper<BillModel>{

	@Override
	public BillModel mapRow(ResultSet rs) {
		try {
			BillModel bill = new BillModel();
			bill.setBillID(rs.getLong("BillID"));
			bill.setUserID(rs.getLong("UserID"));
			bill.setDate(rs.getString("Date"));
			bill.setShippingAddress(rs.getString("ShippingAddress"));
			bill.setNote(rs.getString("Note"));
			bill.setTotalPrice(rs.getDouble("TotalPrice"));
			bill.setStatus(rs.getInt("Status"));
			try {
				UserModel userModel = new UserModel();
				userModel.setFullName(rs.getString("fullname"));
				userModel.setSdt(rs.getString("sdt"));
				bill.setUserModel(userModel);
			}
			catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return bill;
		} catch (SQLException e) {
			return null;
		}
	}

}