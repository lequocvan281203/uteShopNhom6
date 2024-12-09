package daoImpl;

import java.util.List;

import dao.BrandDao;
import mapper.BrandMapper;
import model.BrandModel;
import paging.Pageble;

public class BrandDaoImpl extends AbstractDao<BrandModel> implements BrandDao {

	@Override
	public List<BrandModel> findAll()
	{
		String query="select * from brand";
		return query(query, new BrandMapper());
	}

	@Override
	public List<BrandModel> findAll(Pageble pageble) {
		StringBuilder sql= new StringBuilder("select * from brand");
		if(pageble.getOffset() !=null && pageble.getLimit() !=null) {
			sql.append(" LIMIT "+pageble.getOffset()+","+pageble.getLimit()+"");
		}
		return query(sql.toString(), new BrandMapper());
	}

	@Override
	public int getTotalItem() {
		String sql = "SELECT count(*) from brand";
		return count(sql);
	}

	@Override
	public BrandModel getOne(Long id) {
		String sql ="select * from brand where BrandID = ?";
		List<BrandModel> brandModels = query(sql, new BrandMapper(), id);
		return brandModels.isEmpty() ? null : brandModels.get(0);
	}

	@Override
	public Long insertBrand(BrandModel brandModel) {
		String sql ="INSERT INTO brand (BrandName, Description, ImageLink) VALUES(?,?,?)";
		return insert(sql, brandModel.getBrandName(),brandModel.getDescription(),brandModel.getImageLink());
	}

	@Override
	public void updateBrand(BrandModel brandModel) {
		String sql ="UPDATE brand SET  BrandName = ?,Description = ?,ImageLink = ? WHERE BrandID = ?";
		update(sql, brandModel.getBrandName(),brandModel.getDescription(),brandModel.getImageLink(),brandModel.getBrandID());
	}

	@Override
	public void deleteBrand(Long id) {
		String sql = "delete FROM brand WHERE BrandID = ?";
		update(sql, id);

	}

	@Override
	public List<BrandModel> findAllSearch(Pageble pageble, String Search) {
		StringBuilder sql= new StringBuilder("select * from brand");
		if (Search != null) {
			sql.append(" where BrandName like ? ");
		}
		Search = "%" +  Search + "%";
		if(pageble.getOffset() !=null && pageble.getLimit() !=null) {
			sql.append(" LIMIT "+pageble.getOffset()+","+pageble.getLimit()+"");
		}
		return query(sql.toString(), new BrandMapper(),Search);
	}

	@Override
	public int getTotalItemSearch(String Search) {
		String sql = "SELECT count(*) from brand where BrandName like ?";
		Search = "%" + Search + "%";
		return count(sql,Search);
	}

}