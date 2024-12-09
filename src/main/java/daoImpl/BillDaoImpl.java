package daoImpl;

import java.util.List;

import dao.BillDao;
import mapper.BillMapper;
import mapper.ImageMapper;
import mapper.OrderItemMapper;
import mapper.ProductMapper;
import mapper.RevenueYearMapper;
import model.BillModel;
import model.OrderItemModel;
import paging.Pageble;

public class BillDaoImpl extends AbstractDao<BillModel> implements BillDao{
	@Override
	public List<BillModel> findAll() {
		String query = "select bill.*,fullname,sdt from bill inner join user on bill.UserID = user.id";
		List<BillModel> allBill = query(query, new BillMapper());
		for (BillModel i : allBill) {
			String subquery = "select * from orderitem where BillID = ?";
			if(i.getBillID() != null) {
				i.setOrderItem(query(subquery, new OrderItemMapper(), i.getBillID()));
			}
		}
		return allBill;
	}

	@Override
	public List<BillModel> findAll(Pageble pageble) {
		StringBuilder query = new StringBuilder(
				"select bill.*,fullname,sdt from bill inner join user on bill.UserID = user.id");
		if (pageble.getOffset() != null && pageble.getLimit() != null) {
			query.append(" limit " + pageble.getOffset() + "," + pageble.getLimit());
		}
		List<BillModel> allBill = query(query.toString(), new BillMapper());
		for (BillModel i : allBill) {
			String subquery = "select * from orderitem where BillID = ?";
			if(i.getBillID() != null) {
				i.setOrderItem(query(subquery, new OrderItemMapper(), i.getBillID()));
			}

		}
		return allBill;
	}

	@Override
	public List<BillModel> findAllSearch(Pageble pageble, String key, String search) {
		StringBuilder query = new StringBuilder("select bill.*,id,fullname,sdt from bill inner join user on bill.UserID = user.id");
		if (key != null && search != null) {
			query.append(" where " + key + " like ? ");
		}
		if (pageble.getOffset() != null && pageble.getLimit() != null) {
			query.append(" limit " + pageble.getOffset() + "," + pageble.getLimit());
		}
		search = "%" + search + "%";

		List<BillModel> allBill = query(query.toString(), new BillMapper(), search);
		for (BillModel i : allBill) {
			String subquery = "select * from orderitem where BillID = ?";
			if(i.getBillID() != null)
			{
				i.setOrderItem(query(subquery, new OrderItemMapper(), i.getBillID()));
			}
			for(OrderItemModel j : i.getOrderItem()) {
				String subquery2 = "select product.*, OrderItemID from product inner join orderitem on product.ProductID = orderitem.ProductID where OrderItemID = ?";
				j.setProduct((query(subquery2, new ProductMapper(), j.getOrderItemID())).get(0));
				String subquery3 = "select * from image where ProductID = ?";
				j.getProduct().setImage(query(subquery3, new ImageMapper(), j.getProduct().getProductID()));
			}
		}

		return allBill;
	}

	@Override
	public int getTotalItem() {
		String query = "select count(*) from bill";
		return count(query);
	}

	@Override
	public int getTotalItemSearch(String key, String search) {
		String query = "select count(*) from bill inner join user on bill.UserID = user.id where " + key + " like ? ";
		search = "%" + search + "%";
		return count(query, search);
	}

	@Override
	public Long insertBill(BillModel bill) {
		String query = "insert into bill (UserID, Date, TotalPrice, ShippingAddress, Note, Status) values(?,?,?,?,?,?)";
		Long id = insert(query, bill.getUserID(), bill.getDate(), bill.getTotalPrice(), bill.getShippingAddress(), bill.getNote(), bill.getStatus());
		return id;
	}

	@Override
	public void updateBill(BillModel bill) {
	    StringBuilder query = new StringBuilder(
	        "UPDATE bill SET status = ?, total_price = ?, user_id = ? WHERE id = ?");

	    // Truyền các tham số cần thiết vào câu lệnh
	    Object[] parameters = {
	        bill.getStatus(),           // Giả sử có trường status
	        bill.getTotalPrice(),       // Giả sử có trường total_price
	        bill.getUserID(),           // Giả sử có trường user_id
	        bill.getBillID()            // Truyền id của hóa đơn cần cập nhật
	    };

	    // Thực hiện câu lệnh UPDATE
	    update(query.toString(), parameters);
	}

	@Override
	public void deleteBill(Long id) {
	    String query = "DELETE FROM bill WHERE id = ?";

	    // Truyền tham số id vào câu lệnh DELETE
	    Object[] parameters = { id };

	    // Thực hiện câu lệnh DELETE
	    update(query, parameters);
	}

	@Override
	public BillModel getOne(Long id) {
		String sql ="select bill.*,fullname,sdt from bill inner join user on bill.UserID = user.id where BillID = ?";
		List<BillModel> billModels = query(sql, new BillMapper(), id);
		for (BillModel i : billModels) {
			String subquery = "select  orderitem.*,ProductName,product.Description,Price,CategoryName,brand.BrandName from orderitem inner join product on orderitem.ProductID = product.ProductID INNER JOIN category on product.CategoryID = category.CategoryID left outer JOIN brand on product.BrandID=brand.BrandID where BillID = ?";
			List<OrderItemModel> orderItemModels = query(subquery, new OrderItemMapper(), id);
			for(OrderItemModel itemModel : orderItemModels) {
				String subquery1 = "select * from image where ProductID = ?";
				itemModel.getProductModel().setImage(query(subquery1, new ImageMapper(), itemModel.getProductID()));
			}
			i.setOrderItem(orderItemModels);
		}
		return billModels.isEmpty() ? null : billModels.get(0);
	}

	@Override
	public void ThanhToanBill(Long id) {
		String sql ="UPDATE bill SET Status = 1 WHERE BillID = ?";
		update(sql, id);

	}

	@Override
	public void HuyThanhToanBill(Long id) {
		String sql ="UPDATE bill SET Status = 0 WHERE BillID = ?";
		update(sql, id);
		BillModel billModels = getOne(id);
		for(OrderItemModel itemModel : billModels.getOrderItem()) {
			String UpdateSql="call updateAmountWhenRevertStatus(?,?)";
			update(UpdateSql,itemModel.getProductID(),itemModel.getAmount());
		}

	}

	@Override
	public void HuyDonHang(Long id) {
		String sql ="UPDATE bill SET Status = 2 WHERE BillID = ?";
		update(sql, id);
		BillModel billModels = getOne(id);
		for(OrderItemModel itemModel : billModels.getOrderItem()) {
			String UpdateSql="call updateAmount(?,?)";
			update(UpdateSql,itemModel.getProductID(),itemModel.getAmount());
		}


	}

	@Override
	public double GetTotalPrice() {
		String sql ="select sum(TotalPrice) from bill where Status = 1";
		return getPrice(sql);
	}

	@Override
	public int billToday() {
		String query = "SELECT count(*) FROM webfinalproject.bill WHERE DATE(Date) = CURDATE()";
		return count(query);
	}

	@Override
	public int getTotalItemDaThanhToan() {
		String query = "select count(*) from bill where status = 1";
		return count(query);
	}

	@Override
	public int getTotalItemChuaThanhToan() {
		String query = "select count(*) from bill where status = 0";
		return count(query);
	}

	@Override
	public int getTotalItemDaBiHuy() {
		String query = "select count(*) from bill where status = 2";
		return count(query);
	}

	@Override
	public List<BillModel> revenueYear(String year) {
		String sql = "SELECT MONTH(Date) AS Date, SUM(TotalPrice) AS TotalPrice "
				+ "FROM bill "
				+ "WHERE Status = '1' AND YEAR(Date) = ? "
				+ "GROUP BY MONTH(Date)";
		return query(sql, new RevenueYearMapper(), year);
	}



}