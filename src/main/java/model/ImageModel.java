package model;

public class ImageModel {
	private long ImageID;
	private long ProductID;
	private String ImageLink;

	public long getImageID() {
		return ImageID;
	}

	public void setImageID(long imageID) {
		ImageID = imageID;
	}

	public long getProductID() {
		return ProductID;
	}

	public void setProductID(long productID) {
		ProductID = productID;
	}

	public String getImageLink() {
		return ImageLink;
	}

	public void setImageLink(String imageLink) {
		ImageLink = imageLink;
	}

	public ImageModel(long imageID, long productID, String imageLink) {
		super();
		ImageID = imageID;
		ProductID = productID;
		ImageLink = imageLink;
	}

	public ImageModel() {
		super();
	}

}