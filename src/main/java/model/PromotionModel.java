package model;

import java.sql.Date;

public class PromotionModel extends AbstractModel<PromotionModel>
{
	private Long promotionID;
	private Long productID;
	private Date startDate;
	private Date endDate;
	private int saleOff;
	private ProductModel productModel = new ProductModel();

	public Long getPromotionID() {
		return promotionID;
	}
	public void setPromotionID(Long promotionID) {
		this.promotionID = promotionID;
	}
	public Long getProductID() {
		return productID;
	}
	public void setProductID(Long productID) {
		this.productID = productID;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getSaleOff() {
		return saleOff;
	}
	public void setSaleOff(int saleOff) {
		this.saleOff = saleOff;
	}
	public ProductModel getProductModel() {
		return productModel;
	}
	public void setProductModel(ProductModel productModel) {
		this.productModel = productModel;
	}

}