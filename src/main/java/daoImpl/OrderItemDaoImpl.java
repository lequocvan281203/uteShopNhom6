package daoImpl;

import java.util.List;

import dao.OrderItemDao;
import mapper.OrderItemMapper;
import model.OrderItemModel;

public class OrderItemDaoImpl extends AbstractDao<OrderItemModel> implements OrderItemDao {

	@Override
	public List<OrderItemModel> findAll() {
		String query = "select * from oderitem";
		return query(query, new OrderItemMapper());
	}

	@Override
	public OrderItemModel getOne(Long orderItemId) {
	    String query = "SELECT * FROM orderitem WHERE id = ?";
	    List<OrderItemModel> list = query(query, new OrderItemMapper(), orderItemId);
	    return list.isEmpty() ? null : list.get(0); // If no result is found, return null
	}


	@Override
	public Long insertOrderItem(OrderItemModel orderitem) {
		String query = "insert into orderitem (BillID, ProductID, Quantity) values(?,?,?)";
		Long id = insert(query, orderitem.getBillID(), orderitem.getProduct().getProductID(), orderitem.getAmount());
		return id;
	}
	
	@Override
	public void updateOrderItem(OrderItemModel orderitem) {
	    String query = "UPDATE orderitem SET Quantity = ? WHERE BillID = ? AND ProductID = ?";
	    // Cập nhật số lượng cho sản phẩm trong đơn hàng
	    update(query, orderitem.getAmount(), orderitem.getBillID(), orderitem.getProduct().getProductID());
	}

	@Override
	public void deleteOrderItem(Long id) {
	    String query = "DELETE FROM orderitem WHERE id = ?";
	    // Xóa mục sản phẩm khỏi đơn hàng theo ID của OrderItem
	    update(query, id);
	}



}