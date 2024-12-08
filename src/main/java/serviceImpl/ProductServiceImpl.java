package serviceImpl;

import java.util.List;

import dao.ProductDAO;
import daoImpl.ProductDaoImpl;
import model.ProductModel;
import paging.Pageble;
import service.ProductService;

public class ProductServiceImpl implements ProductService {
	ProductDAO productdao = new ProductDaoImpl();

	@Override
	public List<ProductModel> findAll() {
		return productdao.findAll();
	}

	@Override
	public List<ProductModel> get8NewProduct() {
		return productdao.get8NewProduct();
	}

	@Override
	public List<ProductModel> getProductByCID(String CategoryID) {
		return productdao.getProductByCID(CategoryID);
	}

	@Override
	public List<ProductModel> getProductByPID(int ProductID) {
		return productdao.getProductByPID(ProductID);
	}

	@Override
	public List<ProductModel> getProductByName(String ProductName) {
		return productdao.getProductByName(ProductName);
	}

	@Override
	public List<ProductModel> findAll(Pageble pageble) {
		return productdao.findAll(pageble);
	}

	@Override
	public List<ProductModel> findAllSearch(Pageble pageble, String key, String search) {
		return productdao.findAllSearch(pageble, key, search);
	}

	@Override
	public int getTotalItem() {
		return productdao.getTotalItem();
	}

	@Override
	public int getTotalItemSearch(String key, String search) {
		return productdao.getTotalItemSearch(key, search);
	}

	@Override
	public List<ProductModel> findAllPrice(Pageble pageble, Long startPrice, Long endPrice) {
		return productdao.findAllPrice(pageble, startPrice, endPrice);
	}

	@Override
	public List<ProductModel> findAllSearchPrice(Pageble pageble, String key, String search, Long startPrice, Long endPrice) {
		return productdao.findAllSearchPrice(pageble, key, search, startPrice, endPrice);
	}

	@Override
	public int getTotalItemPrice(Long startPrice, Long endPrice) {
		return productdao.getTotalItemPrice(startPrice, endPrice);
	}

	@Override
	public int getTotalItemSearchPrice(String key, String search, Long startPrice, Long endPrice) {
		return productdao.getTotalItemSearchPrice(key, search, startPrice, endPrice);
	}

	@Override
	public ProductModel insertProduct(ProductModel productModel) {
		Long productID = productdao.insertProduct(productModel);
		return productdao.getOne(productID);
	}

	@Override
	public ProductModel getOne(Long productID) {
		return productdao.getOne(productID);
	}

	@Override
	public ProductModel updateProduct(ProductModel productModel) {
		productdao.updateProduct(productModel);
		return productdao.getOne(productModel.getProductID());
	}

	@Override
	public void deleteProducts(long[] ids) {
		for(long id : ids) {
			productdao.deleteProduct(id);
		}

	}

	@Override
	public List<ProductModel> findAllSearchAll(Pageble pageble, String key, String search) {

		return productdao.findAllSearchAll(pageble, key, search);
	}

	@Override
	public int getTotalItemSearchAll(String key, String search) {
		// TODO Auto-generated method stub
		return productdao.getTotalItemSearchAll(key, search);
	}

	@Override
	public int checkProductByBrandID(Long brandID) {
		return productdao.checkProductByBrandID(brandID);
	}

	@Override
	public int checkProductByCategoryID(Long categoryID) {
		// TODO Auto-generated method stub
		return productdao.checkProductByCategoryID(categoryID);
	}

	@Override
	public int checkProductByCategoryIDChild(Long categoryID) {
		// TODO Auto-generated method stub
		return productdao.checkProductByCategoryIDChild(categoryID);
	}

	@Override
	public List<ProductModel> getTotalProductSell() {
		// TODO Auto-generated method stub
		return productdao.getTotalProductSell();
	}

	@Override
	public List<ProductModel> findAllOderByAmount() {
		// TODO Auto-generated method stub
		return productdao.findAllOderByAmount();
	}

	@Override
	public void updateProductAmount(Long productID, int amount) {
		// TODO Auto-generated method stub
		productdao.updateProductAmount(productID, amount);
	}

	@Override
	public int checkAmountProductAfterResetStatus(Long id,int SL) {
		return productdao.checkAmountProductAfterResetStatus(id,SL);
	}

}