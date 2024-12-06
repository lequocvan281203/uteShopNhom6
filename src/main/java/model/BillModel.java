package model;

import java.util.List;

public class BillModel extends AbstractModel<BillModel> {
	private Long BillID;
	private Long UserID;
	private String Date;
	private Double TotalPrice;
	private String ShippingAddress;
	private String Note;
	private List<OrderItemModel> OrderItem;
	private UserModel userModel = new UserModel();
	private int Status;

	public Long getBillID() {
		return BillID;
	}

	public void setBillID(Long billID) {
		BillID = billID;
	}

	public Long getUserID() {
		return UserID;
	}

	public void setUserID(Long userID) {
		UserID = userID;
	}

	public String getDate() {
		return Date;
	}

	public void setDate(String date) {
		Date = date;
	}

	public Double getTotalPrice() {
		return TotalPrice;
	}

	public void setTotalPrice(Double totalPrice) {
		TotalPrice = totalPrice;
	}

	public String getShippingAddress() {
		return ShippingAddress;
	}

	public void setShippingAddress(String shippingAddress) {
		ShippingAddress = shippingAddress;
	}

	public String getNote() {
		return Note;
	}

	public void setNote(String note) {
		Note = note;
	}

	public List<OrderItemModel> getOrderItem() {
		return OrderItem;
	}

	public void setOrderItem(List<OrderItemModel> orderItem) {
		OrderItem = orderItem;
	}

	public UserModel getUserModel() {
		return userModel;
	}

	public void setUserModel(UserModel userModel) {
		this.userModel = userModel;
	}

	public int getStatus() {
		return Status;
	}

	public void setStatus(int status) {
		Status = status;
	}

	public BillModel() {
		super();
	}

	public BillModel(Long billID, Long userID, String date, Double totalPrice, String shippingAddress, String note,
			List<OrderItemModel> orderItem, UserModel userModel, int status) {
		super();
		BillID = billID;
		UserID = userID;
		Date = date;
		TotalPrice = totalPrice;
		ShippingAddress = shippingAddress;
		Note = note;
		OrderItem = orderItem;
		this.userModel = userModel;
		Status = status;
	}

}