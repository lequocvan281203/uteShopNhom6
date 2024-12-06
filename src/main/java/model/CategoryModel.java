package model;

import java.util.List;

public class CategoryModel extends AbstractModel<CategoryModel>{
	private Long CategoryID;
	private String CategoryName;
	private String ImageLink;
	private String Icon;
	private List<CategoryModel> ChildCategory;
	private List<String> nameChildCategorys;
	private List<Long> idDeletes;
	private List<String> CategoryNews;
	public Long getCategoryID() {
		return CategoryID;
	}

	public void setCategoryID(Long categoryID) {
		CategoryID = categoryID;
	}

	public String getCategoryName() {
		return CategoryName;
	}

	public void setCategoryName(String categoryName) {
		CategoryName = categoryName;
	}

	public String getImageLink() {
		return ImageLink;
	}

	public void setImageLink(String imageLink) {
		ImageLink = imageLink;
	}

	public String getIcon() {
		return Icon;
	}

	public void setIcon(String icon) {
		Icon = icon;
	}

	public List<CategoryModel> getChildCategory() {
		return ChildCategory;
	}

	public void setChildCategory(List<CategoryModel> childCategory) {
		ChildCategory = childCategory;
	}

	public CategoryModel(long categoryID, String categoryName, String imageLink, String icon,
			List<CategoryModel> childCategory) {
		super();
		CategoryID = categoryID;
		CategoryName = categoryName;
		ImageLink = imageLink;
		Icon = icon;
		ChildCategory = childCategory;
	}

	public CategoryModel() {
		super();
	}

	public List<String> getNameChildCategorys() {
		return nameChildCategorys;
	}

	public void setNameChildCategorys(List<String> nameChildCategorys) {
		this.nameChildCategorys = nameChildCategorys;
	}

	public List<Long> getIdDeletes() {
		return idDeletes;
	}

	public void setIdDeletes(List<Long> idDeletes) {
		this.idDeletes = idDeletes;
	}

	public List<String> getCategoryNews() {
		return CategoryNews;
	}

	public void setCategoryNews(List<String> categoryNews) {
		CategoryNews = categoryNews;
	}

	

}