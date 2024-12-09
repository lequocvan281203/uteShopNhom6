package daoImpl;

import java.util.List;

import dao.PromotionDao;
import mapper.PromotionMapper;
import model.PromotionModel;
import paging.Pageble;

public class PromotionDaoImpl extends AbstractDao<PromotionModel> implements PromotionDao{
	@Override
	public List<PromotionModel> findAll()
	{
		String sql = "SELECT promotion.*,ProductName FROM promotion inner join product on promotion.productID = product.productID";
		return query(sql, new PromotionMapper());
	}

	@Override
	public List<PromotionModel> findAll(Pageble pageble) {
		StringBuilder sql= new StringBuilder("SELECT promotion.*,ProductName FROM promotion inner join product on promotion.productID = product.productID");
		if(pageble.getOffset() !=null && pageble.getLimit() !=null) {
			sql.append(" LIMIT "+pageble.getOffset()+","+pageble.getLimit()+"");
		}
		return query(sql.toString(), new PromotionMapper());
	}

	@Override
	public int getTotalItem() {
		String sql = "SELECT count(*) FROM promotion inner join product on promotion.productID = product.productID ;";
		return count(sql);
	}

	@Override
	public PromotionModel getOne(Long id) {
		String sql ="SELECT promotion.*,ProductName FROM promotion inner join product on promotion.productID = product.productID where PromotionID = ?";
		List<PromotionModel> promotionModels = query(sql, new PromotionMapper(), id);
		return promotionModels.isEmpty() ? null : promotionModels.get(0);

	}

	@Override
	public Long insertPromotion(PromotionModel promotionModel) {
		String sql="INSERT INTO promotion (ProductID, StartDate, EndDate,SaleOff) VALUES(?,?,?,?)";
		return insert(sql, promotionModel.getProductID(),promotionModel.getStartDate(),promotionModel.getEndDate(),promotionModel.getSaleOff());
	}

	@Override
	public void updatePromotion(PromotionModel promotionModel) {
		String sql = "UPDATE promotion SET  StartDate = ?,EndDate = ?,SaleOff = ? WHERE PromotionID = ?";
		update(sql, promotionModel.getStartDate(),promotionModel.getEndDate(),promotionModel.getSaleOff(),promotionModel.getPromotionID());
	}

	@Override
	public void deletePromotion(long id) {
		// TODO Auto-generated method stub
		String sql = "delete FROM promotion WHERE PromotionID = ?";
		update(sql, id);
	}

	@Override
	public List<PromotionModel> findAllSearch(Pageble pageble, String key, String Search) {
		StringBuilder sql= new StringBuilder("SELECT promotion.*,ProductName FROM promotion inner join product on promotion.productID = product.productID");
		if (key != null && Search != null) {
			sql.append(" where " + key + " like ? ");
		}
		 Search = "%" +  Search + "%";
		if(pageble.getOffset() !=null && pageble.getLimit() !=null) {
			sql.append(" LIMIT "+pageble.getOffset()+","+pageble.getLimit()+"");
		}
		return query(sql.toString(), new PromotionMapper(),Search);
	}

	@Override
	public int getTotalItemSearch(String key, String Search) {
		String sql = "SELECT count(*) FROM promotion inner join product on promotion.productID = product.productID where " + key + " like ?;";
		Search = "%" + Search + "%";
		return count(sql,Search);
	}

}