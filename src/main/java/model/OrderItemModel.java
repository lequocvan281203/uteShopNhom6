package model;

public class OrderItemModel extends AbstractModel<OrderItemModel> {
	private long OrderItemID;
	private ProductModel product;
	private long ProductID;
	private int Amount;
	private long BillID;
	private ProductModel productModel = new ProductModel();

	public long getOrderItemID() {
		return OrderItemID;
	}

	public void setOrderItemID(long orderItemID) {
		OrderItemID = orderItemID;
	}

	public ProductModel getProduct() {
		return product;
	}

	public void setProduct(ProductModel product) {
		this.product = product;
	}

	public long getProductID() {
		return ProductID;
	}

	public void setProductID(long productID) {
		ProductID = productID;
	}

	public int getAmount() {
		return Amount;
	}

	public void setAmount(int amount) {
		Amount = amount;
	}

	public long getBillID() {
		return BillID;
	}

	public void setBillID(long billID) {
		BillID = billID;
	}

	public OrderItemModel() {
		super();
	}

	public OrderItemModel(long orderItemID, ProductModel product, long productID, int amount, long billID) {
		super();
		OrderItemID = orderItemID;
		this.product = product;
		ProductID = productID;
		Amount = amount;
		BillID = billID;
	}

	public ProductModel getProductModel() {
		return productModel;
	}

	public void setProductModel(ProductModel productModel) {
		this.productModel = productModel;
	}

}