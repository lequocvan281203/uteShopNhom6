package dao;

import java.util.List;

import model.BrandModel;
import paging.Pageble;

public interface BrandDao {
	List<BrandModel> findAll();
	List<BrandModel> findAll(Pageble pageble);
	int getTotalItem();
	List<BrandModel> findAllSearch(Pageble pageble,String Search);
	int getTotalItemSearch(String Search);
	BrandModel getOne(Long id);
	Long insertBrand(BrandModel brandModel);
	void updateBrand(BrandModel brandModel);
	void deleteBrand(Long id);
}