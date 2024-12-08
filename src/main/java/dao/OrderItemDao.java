package dao;

import java.util.List;

import model.OrderItemModel;

public interface OrderItemDao {
	List<OrderItemModel> findAll();

	OrderItemModel getOne(Long id);

	Long insertOrderItem(OrderItemModel orderitem);
	void updateOrderItem(OrderItemModel orderitem);
	void deleteOrderItem(Long id);
}