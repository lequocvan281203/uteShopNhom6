package dao;

import java.util.List;

import model.PromotionModel;
import paging.Pageble;

public interface PromotionDao {
	List<PromotionModel> findAll();
	List<PromotionModel> findAll(Pageble pageble);
	int getTotalItem();
	PromotionModel getOne(Long id);
	List<PromotionModel> findAllSearch(Pageble pageble,String key,String Search);
	int getTotalItemSearch(String key,String Search);

	Long insertPromotion(PromotionModel promotionModel);
	void updatePromotion(PromotionModel promotionModel);
	void deletePromotion(long id);
}