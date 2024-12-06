package serviceImpl;

import java.util.List;

import dao.BillDao;
import daoImpl.BillDaoImpl;
import model.BillModel;
import paging.Pageble;
import service.BillService;

public class BillServiceImpl implements BillService{
	BillDao billDao = new BillDaoImpl();
	@Override
	public List<BillModel> findAll() {
		return billDao.findAll();
	}

	@Override
	public List<BillModel> findAll(Pageble pageble) {
		return billDao.findAll(pageble);
	}

	@Override
	public List<BillModel> findAllSearch(Pageble pageble, String key, String search) {
		return billDao.findAllSearch(pageble, key, search);
	}

	@Override
	public int getTotalItem() {
		return billDao.getTotalItem();
	}

	@Override
	public int getTotalItemSearch(String key, String search) {
		return billDao.getTotalItemSearch(key, search);
	}

	@Override
	public Long insertBill(BillModel bill) {
		Long id = this.billDao.insertBill(bill);
		return id;
	}

	@Override
	public void updateBill(BillModel bill) {
	    // Kiểm tra xem bill có hợp lệ hay không
	    if (bill != null && bill.getBillID() != null) {
	        // Gọi phương thức updateBill của BillDaoImpl để cập nhật dữ liệu
	    	billDao.updateBill(bill);
	    } else {
	        // Xử lý trường hợp không có hóa đơn hợp lệ
	        // Có thể ném ngoại lệ hoặc xử lý theo yêu cầu
	        System.out.println("Invalid bill data.");
	    }
	}

	@Override
	public void deleteBill(Long id) {
	    // Kiểm tra xem id có hợp lệ không
	    if (id != null) {
	        // Gọi phương thức deleteBill của BillDaoImpl để xóa hóa đơn
	        billDao.deleteBill(id);
	    } else {
	        // Xử lý trường hợp không có ID hợp lệ
	        System.out.println("Invalid bill ID.");
	    }
	}


	@Override
	public BillModel getOne(Long id) 
	{
		return billDao.getOne(id);
	}

	@Override
	public BillModel ThanhToanBill(Long id) {
		billDao.ThanhToanBill(id);
		return billDao.getOne(id);
	}

	@Override
	public BillModel HuyThanhToanBill(Long id) {
		billDao.HuyThanhToanBill(id);
		return billDao.getOne(id);
	}

	@Override
	public void HuyDonHang(long[] ids) {
		for(long id : ids) {
			billDao.HuyDonHang(id);
		}
		
	}

	@Override
	public double GetTotalPrice() {
		
		return billDao.GetTotalPrice();
	}

	@Override
	public int billToday() {
		// TODO Auto-generated method stub
		return billDao.billToday();
	}

	@Override
	public int getTotalItemDaThanhToan() {
		// TODO Auto-generated method stub
		return billDao.getTotalItemDaThanhToan();
	}

	@Override
	public int getTotalItemChuaThanhToan() {
		// TODO Auto-generated method stub
		return billDao.getTotalItemChuaThanhToan();
	}

	@Override
	public int getTotalItemDaBiHuy() {
		// TODO Auto-generated method stub
		return billDao.getTotalItemDaBiHuy();
	}

	@Override
	public List<BillModel> revenueYear(String year) {
		// TODO Auto-generated method stub
		return billDao.revenueYear(year);
	}

}