package model;

import java.util.List;

public class ProductModel extends AbstractModel<ProductModel> {
	private Long ProductID;
	private String ProductName;
	private String Description;
	private Double Price;
	List<ImageModel> image;
	private CategoryModel categoryModel = new CategoryModel();
	private BrandModel brandModel = new BrandModel();
	private long CategoryID;
	private Long brandID;
	private Integer Amount;
	private List<String> imageNames;


	public String getProductName() {
		return ProductName;
	}

	public void setProductName(String productName) {
		ProductName = productName;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}


	public List<ImageModel> getImage() {
		return image;
	}

	public void setImage(List<ImageModel> image) {
		this.image = image;
	}

	public long getCategoryID() {
		return CategoryID;
	}

	public void setCategoryID(long categoryID) {
		CategoryID = categoryID;
	}



	public ProductModel(long productID, String productName, String description, Double price, List<ImageModel> image,
			long categoryID, Integer amount,Long brandID) {
		super();
		setProductID(productID);
		ProductName = productName;
		Description = description;
		setPrice(price);
		this.image = image;
		CategoryID = categoryID;
		setAmount(amount);
		this.brandID=brandID;
	}

	public ProductModel() {
		super();
	}

	public CategoryModel getCategoryModel() {
		return categoryModel;
	}

	public void setCategoryModel(CategoryModel categoryModel) {
		this.categoryModel = categoryModel;
	}

	public Long getProductID() {
		return ProductID;
	}

	public void setProductID(Long productID) {
		ProductID = productID;
	}

	public List<String> getImageNames() {
		return imageNames;
	}

	public void setImageNames(List<String> imageNames) {
		this.imageNames = imageNames;
	}

	public BrandModel getBrandModel() {
		return brandModel;
	}

	public void setBrandModel(BrandModel brandModel) {
		this.brandModel = brandModel;
	}

	public Long getBrandID() {
		return brandID;
	}

	public void setBrandID(Long brandID) {
		this.brandID = brandID;
	}

	public Integer getAmount() {
		return Amount;
	}

	public void setAmount(Integer amount) {
		Amount = amount;
	}

	public Double getPrice() {
		return Price;
	}

	public void setPrice(Double price) {
		Price = price;
	}



}