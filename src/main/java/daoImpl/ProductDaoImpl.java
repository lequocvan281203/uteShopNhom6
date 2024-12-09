package daoImpl;

import java.util.List;

import dao.CategoryDao;
import dao.ProductDAO;
import mapper.ImageMapper;
import mapper.ProductMapper;
import model.CategoryModel;
import model.ProductModel;
import paging.Pageble;

public class ProductDaoImpl extends AbstractDao<ProductModel> implements ProductDAO {
	CategoryDao categoryDao = new CategoryDaoImpl();
	@Override
	public List<ProductModel> findAll() {
		String query = "select product.*,CategoryName,brand.BrandName from product INNER JOIN category on product.CategoryID = category.CategoryID left outer JOIN brand on product.BrandID=brand.BrandID	";
		List<ProductModel> allProduct = query(query, new ProductMapper());
		for (ProductModel i : allProduct) {
			String subquery = "select * from image where ProductID = ?";
			i.setImage(query(subquery, new ImageMapper(), i.getProductID()));
		}
		return allProduct;
	}

	@Override
	public List<ProductModel> get8NewProduct() {
		String query = "select * from product order by ProductID ASC LIMIT 8";
		List<ProductModel> NewProduct = query(query, new ProductMapper());
		for (ProductModel i : NewProduct) {
			String subquery = "select * from image where ProductID = ?";
			i.setImage(query(subquery, new ImageMapper(), i.getProductID()));
		}
		return NewProduct;
	}

	@Override
	public List<ProductModel> getProductByCID(String CategoryID) {
		String query = "select * from product where CategoryID = ?";
		return query(query, new ProductMapper(), CategoryID);
	}

	@Override
	public List<ProductModel> getProductByPID(int ProductID) {
		String query = "select * from product where ProductID = ?";
		List<ProductModel> product = query(query, new ProductMapper(), ProductID);
		for (ProductModel i : product) {
			String subquery = "select * from image where ProductID = ?";
			i.setImage(query(subquery, new ImageMapper(), i.getProductID()));
		}
		return product;
	}

	@Override
	public List<ProductModel> getProductByName(String ProductName) {
		String query = "select * from product where ProductName like ?";
		return query(query, new ProductMapper(), '%' + ProductName + '%');
	}

	// Paging

	@Override
	public List<ProductModel> findAll(Pageble pageble) {
		StringBuilder query = new StringBuilder(
				"select product.*,CategoryName,brand.BrandName from product INNER JOIN category on product.CategoryID = category.CategoryID left outer JOIN brand on product.BrandID=brand.BrandID");
		if (pageble.getOffset() != null && pageble.getLimit() != null) {
			query.append(" limit " + pageble.getOffset() + "," + pageble.getLimit());
		}
		List<ProductModel> allProduct = query(query.toString(), new ProductMapper());
		for (ProductModel i : allProduct) {
			String subquery = "select * from image where ProductID = ?";
			i.setImage(query(subquery, new ImageMapper(), i.getProductID()));
		}
		return allProduct;
	}

	@Override
	public List<ProductModel> findAllSearch(Pageble pageble, String key, String search) {
		StringBuilder query = new StringBuilder("select * from product");
		if (key != null && search != null) {
			query.append(" where " + key + " like ? ");
		}
		if (pageble.getOffset() != null && pageble.getLimit() != null) {
			query.append(" limit " + pageble.getOffset() + "," + pageble.getLimit());
		}
		search = "%" + search + "%";
		List<ProductModel> allProduct = query(query.toString(), new ProductMapper(), search);
		for (ProductModel i : allProduct) {
			String subquery = "select * from image where ProductID = ?";
			i.setImage(query(subquery, new ImageMapper(), i.getProductID()));
		}
		return allProduct;
	}
	
	

	@Override
	public int getTotalItem() {
		// TODO Auto-generated method stub
		String query = "select count(*) from product";
		return count(query);
	}

	@Override
	public int getTotalItemSearch(String key, String search) {
		String query = "select count(*) from product where " + key + " like ? ";
		search = "%" + search + "%";
		return count(query, search);
	}

	@Override
	public List<ProductModel> findAllPrice(Pageble pageble, Long startPrice, Long endPrice) {
		StringBuilder query = new StringBuilder(
				"select product.*,CategoryName from product INNER JOIN category on product.CategoryID = category.CategoryID");
		query.append(" where Price BETWEEN ? AND ? order by Price");
		if (pageble.getOffset() != null && pageble.getLimit() != null) {
			query.append(" limit " + pageble.getOffset() + "," + pageble.getLimit());
		}
		List<ProductModel> allProduct = query(query.toString(), new ProductMapper(), startPrice, endPrice);
		for (ProductModel i : allProduct) {
			String subquery = "select * from image where ProductID = ?";
			i.setImage(query(subquery, new ImageMapper(), i.getProductID()));
		}
		return allProduct;
	}

	@Override
	public List<ProductModel> findAllSearchPrice(Pageble pageble, String key, String search, Long startPrice,
			Long endPrice) {
		StringBuilder query = new StringBuilder("select * from product");
		if (key != null && search != null) {
			query.append(" where " + key + " like ? ");
		}
		query.append(" AND Price BETWEEN ? AND ? order by Price");
		if (pageble.getOffset() != null && pageble.getLimit() != null) {
			query.append(" limit " + pageble.getOffset() + "," + pageble.getLimit());
		}
		search = "%" + search + "%";
		List<ProductModel> allProduct = query(query.toString(), new ProductMapper(), search, startPrice, endPrice);
		for (ProductModel i : allProduct) {
			String subquery = "select * from image where ProductID = ?";
			i.setImage(query(subquery, new ImageMapper(), i.getProductID()));
		}
		return allProduct;
	}

	@Override
	public int getTotalItemPrice(Long startPrice, Long endPrice) {
		String query = "select count(*) from product where Price BETWEEN ? AND ?";
		return count(query, startPrice, endPrice);
	}

	@Override
	public int getTotalItemSearchPrice(String key, String search, Long startPrice, Long endPrice) {
		String query = "select count(*) from product where " + key + " like ? AND Price BETWEEN ? AND ?";
		search = "%" + search + "%";
		return count(query, search, startPrice, endPrice);
	}

	@Override
	public Long insertProduct(ProductModel productModel) {
		String sql = "INSERT INTO product (ProductName, Description, Price,CategoryID,Amount,BrandID) VALUES(?,?,?,?,?,?)";
		System.out.println("asdadassaadthong6 báo" + productModel.getBrandID());
		Long id = insert(sql, productModel.getProductName(),productModel.getDescription(),productModel.getPrice(),productModel.getCategoryID(),productModel.getAmount(),productModel.getBrandID());
		for(String imageName : productModel.getImageNames()) {
			String sqlImage = "INSERT INTO image (ProductID,ImageLink) VALUES("+id+",?)";
			insert(sqlImage,imageName);
		}
		return id;
	}

	@Override
	public ProductModel getOne(Long productID) {
		String sql = "select * from product where ProductID = ? ";
		List<ProductModel> products = query(sql, new ProductMapper(), productID);
		for (ProductModel i : products) {
			String subquery = "select * from image where ProductID = ?";
			i.setImage(query(subquery, new ImageMapper(), i.getProductID()));
		}
		return products.isEmpty() ? null : products.get(0);
	}

	@Override
	public void updateProduct(ProductModel productModel) {
		String sql = "UPDATE product SET  ProductName = ?,Description = ?,Price = ?,CategoryID = ?,Amount = ?,BrandID = ? WHERE ProductID=?";
		update(sql, productModel.getProductName(),productModel.getDescription(),productModel.getPrice(),productModel.getCategoryID(),productModel.getAmount(),productModel.getBrandID(),productModel.getProductID());
		String deleteSql = "delete from image where ProductID=?";
		update(deleteSql, productModel.getProductID());
		for(String imageName : productModel.getImageNames()) {
			String sqlImage = "INSERT INTO image (ProductID,ImageLink) VALUES("+productModel.getProductID()+",?)";
			insert(sqlImage,imageName);
		}
	}

	@Override
	public void updateProductAmount(Long productID, int amount) {
		String sql = "UPDATE product SET  Amount = ? WHERE ProductID=?";
		update(sql, amount, productID);
	}

	@Override
	public void deleteProduct(Long id) {
		String sql = "UPDATE product SET Amount = 0 where ProductID = ?";
		update(sql, id);
	}

	@Override
	public List<ProductModel> findAllSearchAll(Pageble pageble, String key, String search) {
		StringBuilder query = new StringBuilder("select product.*,CategoryName,brand.BrandName from product INNER JOIN category on product.CategoryID = category.CategoryID left outer JOIN brand on product.BrandID=brand.BrandID");
		if (key != null && search != null) {
			query.append(" where " + key + " like ? ");
		}
		if (pageble.getOffset() != null && pageble.getLimit() != null) {
			query.append(" limit " + pageble.getOffset() + "," + pageble.getLimit());
		}
		search = "%" + search + "%";
		List<ProductModel> allProduct = query(query.toString(), new ProductMapper(), search);
		for (ProductModel i : allProduct) {
			String subquery = "select * from image where ProductID = ?";
			i.setImage(query(subquery, new ImageMapper(), i.getProductID()));
		}
		return allProduct;
	}

	@Override
	public int getTotalItemSearchAll(String key, String search) {
		String query = "select count(*) from product INNER JOIN category on product.CategoryID = category.CategoryID left outer JOIN brand on product.BrandID=brand.BrandID where " + key + " like ? ";
		search = "%" + search + "%";
		return count(query, search);
	}

	@Override
	public int checkProductByBrandID(Long brandID) {
		String sql ="SELECT count(*) FROM product where BrandID = ?";
		return count(sql, brandID);
	}

	@Override
	public int checkProductByCategoryID(Long categoryID)
	{
		int AllSL = 0;
		CategoryModel categoryModel = categoryDao.getOne(categoryID);
		for(CategoryModel categoryModelChild : categoryModel.getChildCategory()) {
			String sql = "SELECT count(*) FROM product where CategoryID = ?";
			int SL = count(sql, categoryModelChild.getCategoryID());
			AllSL = AllSL + SL;
		}
		return AllSL;
	}

	@Override
	public int checkProductByCategoryIDChild(Long categoryID) {
		String sql = "SELECT count(*) FROM product where CategoryID = ?";
		return count(sql, categoryID);
	}

	@Override
	public List<ProductModel> getTotalProductSell() {
		String sql ="SELECT product.ProductID, product.ProductName, product.Price,product.Description,product.CategoryID,product.BrandID, SUM(Q.Quantity) AS Amount "
				+ "FROM ( "
				+ "    SELECT orderitem.ProductID, product.ProductName, product.Price, orderitem.Quantity "
				+ "    FROM orderitem "
				+ "    INNER JOIN bill ON orderitem.BillID = bill.BillID "
				+ "    INNER JOIN product ON orderitem.ProductID = product.ProductID "
				+ "    WHERE bill.status = 1 "
				+ ") Q "
				+ "right outer JOIN product ON Q.ProductID = product.ProductID "
				+ "GROUP BY product.ProductID, product.Price,product.ProductName ORDER BY Amount DESC";
		return query(sql, new ProductMapper());
	}

	@Override
	public List<ProductModel> findAllOderByAmount() {
		String sql = "select * from product order by Amount";
		return query(sql, new ProductMapper());
	}

	@Override
	public int checkAmountProductAfterResetStatus(Long id,int SL) {
		String query = "select TinhSLSP(?,?) as Amount";
		return count(query,id,SL);
	}



}