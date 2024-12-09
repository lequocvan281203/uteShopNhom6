package model;

public class BrandModel extends AbstractModel<BrandModel>{
	private Long brandID;
	private String brandName;
	private String description;
	private String imageLink;

	public Long getBrandID() {
		return brandID;
	}
	public void setBrandID(Long brandID) {
		this.brandID = brandID;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImageLink() {
		return imageLink;
	}
	public void setImageLink(String imageLink) {
		this.imageLink = imageLink;
	}

}