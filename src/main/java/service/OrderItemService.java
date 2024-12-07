package service;

import java.util.List;

import model.OrderItemModel;

public interface OrderItemService {
	List<OrderItemModel> findAll();
	OrderItemModel getOne(Long id);
	
	Long insertOrderItem(OrderItemModel orderitem);
	void updateOrderItem(OrderItemModel orderitem);
	void deleteOrderItem(Long id);
}