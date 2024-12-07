package service;

import java.util.List;

import model.BrandModel;
import paging.Pageble;

public interface BrandService {
	List<BrandModel> findAll();
	List<BrandModel> findAll(Pageble pageble);
	int getTotalItem();
	BrandModel getOne(Long id);
	BrandModel insertBrand(BrandModel brandModel);
	BrandModel updateBrand(BrandModel brandModel);
	void deleteBrand(long[] ids);
	List<BrandModel> findAllSearch(Pageble pageble,String Search);
	int getTotalItemSearch(String Search);
}