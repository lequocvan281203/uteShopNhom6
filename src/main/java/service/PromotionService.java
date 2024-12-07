package service;

import java.util.List;

import model.PromotionModel;
import paging.Pageble;

public interface PromotionService {
	List<PromotionModel> findAll();
	List<PromotionModel> findAll(Pageble pageble);
	int getTotalItem();
	PromotionModel getOne(Long id);
	
	PromotionModel insertPromotion(PromotionModel promotionModel);
	PromotionModel updatePromotion(PromotionModel promotionModel);
	void deletePromotion(long[] ids);
	List<PromotionModel> findAllSearch(Pageble pageble,String key,String Search);
	int getTotalItemSearch(String key,String Search);
}