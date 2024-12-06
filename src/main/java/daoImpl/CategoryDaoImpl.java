package daoImpl;

import java.util.List;

import dao.CategoryDao;
import mapper.CategoryMapper;
import model.CategoryModel;
import paging.Pageble;

public class CategoryDaoImpl extends AbstractDao<CategoryModel> implements CategoryDao {

	@Override
	public List<CategoryModel> findAll() {
		String query = "select * from category where ParentID=0";
		List<CategoryModel> category = query(query, new CategoryMapper());
		for(CategoryModel i : category) {
			String subquery = "select * from category where ParentID=?";
			i.setChildCategory(query(subquery, new CategoryMapper(), i.getCategoryID()));
		}
		return category;
	}


	@Override
	public List<CategoryModel> findAllPaging(Pageble pageble) {
		StringBuilder sql = new StringBuilder("select * from category where ParentID=0");
		if(pageble.getOffset() !=null && pageble.getLimit() !=null) {
			sql.append(" LIMIT "+pageble.getOffset()+","+pageble.getLimit()+"");
		}
		List<CategoryModel> category = query(sql.toString(), new CategoryMapper());
		for(CategoryModel i : category) {
			String subquery = "select * from category where ParentID=?";
			i.setChildCategory(query(subquery, new CategoryMapper(), i.getCategoryID()));
		}
		return category;
	}

	@Override
	public int getTotalItem() {
		String sql = "SELECT count(*) from category where ParentID = 0";
		return count(sql);
	}


	@Override
	public CategoryModel getOne(Long CategoryID) {
		String query = "select * from category where categoryID = ? ";
		List<CategoryModel> category = query(query, new CategoryMapper(),CategoryID);
		for(CategoryModel i : category) {
			String subquery = "select * from category where ParentID = ? ";
			i.setChildCategory(query(subquery, new CategoryMapper(), i.getCategoryID()));
		}
		return category.isEmpty() ? null : category.get(0);
	}


	@Override
	public Long insertCategory(CategoryModel categoryModel) {
		String sql = "INSERT INTO category (CategoryName, ImageLink, Icon,ParentID) VALUES(?,?,?,0)";
		Long id = insert(sql, categoryModel.getCategoryName(),categoryModel.getImageLink(),categoryModel.getIcon());
		for(String name : categoryModel.getNameChildCategorys()) {
			String sqlchild = "INSERT INTO category (CategoryName,ParentID) VALUES(?,"+id+")";
			insert(sqlchild, name);
		}
		return id;
	}


	@Override
	public void updateCategory(CategoryModel categoryModel) {
		String sql ="UPDATE category SET CategoryName = ?, ImageLink = ? WHERE CategoryID = ?";
		update(sql, categoryModel.getCategoryName(),categoryModel.getImageLink(),categoryModel.getCategoryID());
		for(String name : categoryModel.getCategoryNews()) {
			String sqlInsertCategory = "INSERT INTO category (CategoryName,ParentID) VALUES(?,"+categoryModel.getCategoryID()+")";
			insert(sqlInsertCategory, name);
		}
		for(Long id : categoryModel.getIdDeletes()) {
			String sqlDeleteCategory = "DELETE FROM category where CategoryID = ?";
			update(sqlDeleteCategory, id);
		}
	}


	@Override
	public void deleteCategory(long id) {
		String sqlChild = "delete FROM category WHERE ParentID = ?";
		update(sqlChild, id);
		String sql = "delete FROM category WHERE CategoryID = ?";
		update(sql, id);
	}


	

}