package service;

import java.util.List;

import model.ProductModel;
import paging.Pageble;

public interface ProductService {
	List<ProductModel> findAll();
	List<ProductModel> get8NewProduct();
	List<ProductModel> getProductByCID(String CategoryID);
	List<ProductModel> getProductByPID(int ProductID);
	List<ProductModel> getProductByName(String ProductName);
	ProductModel getOne(Long productID);
	//Paging
	
	List<ProductModel> findAll(Pageble pageble);
	List<ProductModel> findAllSearch(Pageble pageble,String key,String search);
	int getTotalItem();
	int getTotalItemSearch(String key,String search);
	List<ProductModel> findAllSearchAll(Pageble pageble, String key, String search);
	int getTotalItemSearchAll(String key, String search);
	List<ProductModel> findAllPrice(Pageble pageble,Long startPrice, Long endPrice);
	List<ProductModel> findAllSearchPrice(Pageble pageble, String key, String search,Long startPrice, Long endPrice);
	int getTotalItemPrice(Long startPrice, Long endPrice);
	int getTotalItemSearchPrice(String key, String search,Long startPrice, Long endPrice);
	
	ProductModel insertProduct(ProductModel productModel);
	ProductModel updateProduct(ProductModel productModel); 
	void updateProductAmount(Long productID, int amount);
	void deleteProducts(long[] ids);
	
	int checkProductByBrandID(Long brandID);
	int checkProductByCategoryID(Long categoryID);
	int checkProductByCategoryIDChild(Long categoryID);
	List<ProductModel> getTotalProductSell();
	List<ProductModel> findAllOderByAmount();
	
	int checkAmountProductAfterResetStatus(Long id,int SL);
}