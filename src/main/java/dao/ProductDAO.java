package dao;

import java.util.List;

import model.ProductModel;
import paging.Pageble;

public interface ProductDAO {
	List<ProductModel> findAll();
	List<ProductModel> get8NewProduct();
	List<ProductModel> getProductByCID(String CategoryID);
	List<ProductModel> getProductByPID(int ProductID);
	List<ProductModel> getProductByName(String ProductName);
	ProductModel getOne(Long productID);

	List<ProductModel> findAll(Pageble pageble);
	List<ProductModel> findAllSearch(Pageble pageble, String key, String search);
	int getTotalItem();
	int getTotalItemSearch(String key, String search);
	List<ProductModel> findAllSearchAll(Pageble pageble, String key, String search);
	int getTotalItemSearchAll(String key, String search);
	List<ProductModel> findAllPrice(Pageble pageble,Long startPrice, Long endPrice);
	List<ProductModel> findAllSearchPrice(Pageble pageble, String key, String search,Long startPrice, Long endPrice);
	int getTotalItemPrice(Long startPrice, Long endPrice);
	int getTotalItemSearchPrice(String key, String search,Long startPrice, Long endPrice);

	Long insertProduct(ProductModel productModel);
	void updateProduct(ProductModel productModel);
	void deleteProduct(Long id);

	int checkProductByBrandID(Long brandID);
	int checkProductByCategoryID(Long categoryID);
	int checkProductByCategoryIDChild(Long categoryID);
	List<ProductModel> getTotalProductSell();
	List<ProductModel> findAllOderByAmount();
	void updateProductAmount(Long productID, int amount);

	int checkAmountProductAfterResetStatus(Long id,int SL);
}