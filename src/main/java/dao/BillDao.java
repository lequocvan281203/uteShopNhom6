package dao;

import java.util.List;

import model.BillModel;
import paging.Pageble;

public interface BillDao {
	List<BillModel> findAll();
	List<BillModel> findAll(Pageble pageble);
	List<BillModel> findAllSearch(Pageble pageble, String key, String search);
	int getTotalItem();
	int getTotalItemSearch(String key, String search);
	BillModel getOne(Long id);
	Long insertBill(BillModel bill);
	void updateBill(BillModel bill);
	void deleteBill(Long id);
	void ThanhToanBill(Long id);
	void HuyThanhToanBill(Long id);
	void HuyDonHang(Long id);
	double GetTotalPrice();
	int billToday();
	int getTotalItemDaThanhToan();
	int getTotalItemChuaThanhToan();
	int getTotalItemDaBiHuy();
	List<BillModel> revenueYear(String year);
}