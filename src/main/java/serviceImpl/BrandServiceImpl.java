package serviceImpl;

import java.util.List;

import dao.BrandDao;
import daoImpl.BrandDaoImpl;
import model.BrandModel;
import paging.Pageble;
import service.BrandService;

public class BrandServiceImpl implements BrandService
{
	BrandDao brandDao = new BrandDaoImpl();

	@Override
	public List<BrandModel> findAll() {
		return brandDao.findAll();
	}

	@Override
	public List<BrandModel> findAll(Pageble pageble) {
		// TODO Auto-generated method stub
		return brandDao.findAll(pageble);
	}

	@Override
	public int getTotalItem() {
		// TODO Auto-generated method stub
		return brandDao.getTotalItem();
	}

	@Override
	public BrandModel getOne(Long id)
	{
		return brandDao.getOne(id);
	}

	@Override
	public BrandModel insertBrand(BrandModel brandModel) {
		Long id = brandDao.insertBrand(brandModel);
		return brandDao.getOne(id);
	}

	@Override
	public BrandModel updateBrand(BrandModel brandModel) {
		brandDao.updateBrand(brandModel);
		return brandDao.getOne(brandModel.getBrandID());
	}

	@Override
	public void deleteBrand(long[] ids) {
		for(Long id : ids) {
			brandDao.deleteBrand(id);
		}

	}

	@Override
	public List<BrandModel> findAllSearch(Pageble pageble, String Search) {
		// TODO Auto-generated method stub
		return brandDao.findAllSearch(pageble, Search);
	}

	@Override
	public int getTotalItemSearch(String Search) {
		// TODO Auto-generated method stub
		return brandDao.getTotalItemSearch(Search);
	}

}