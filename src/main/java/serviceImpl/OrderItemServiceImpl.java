package serviceImpl;

import java.util.List;

import dao.OrderItemDao;
import daoImpl.OrderItemDaoImpl;
import model.OrderItemModel;
import service.OrderItemService;

public class OrderItemServiceImpl implements OrderItemService {
    // Khởi tạo đối tượng DAO
    OrderItemDao orderitemdao = new OrderItemDaoImpl();

    @Override
    public List<OrderItemModel> findAll() {
        // Gọi phương thức findAll từ OrderItemDao để lấy danh sách tất cả các order items
        return orderitemdao.findAll();
    }

    @Override
    public OrderItemModel getOne(Long id) {
        // Gọi phương thức getOne từ OrderItemDao để lấy một order item theo id
        return orderitemdao.getOne(id);
    }

    @Override
    public Long insertOrderItem(OrderItemModel orderitem) {
        // Gọi phương thức insertOrderItem từ OrderItemDao để thêm một order item mới vào CSDL
        Long id = orderitemdao.insertOrderItem(orderitem);
        return id;
    }

    @Override
    public void updateOrderItem(OrderItemModel orderitem) {
        // Gọi phương thức updateOrderItem từ OrderItemDao để cập nhật thông tin của một order item
        orderitemdao.updateOrderItem(orderitem);
    }

    @Override
    public void deleteOrderItem(Long id) {
        // Gọi phương thức deleteOrderItem từ OrderItemDao để xóa một order item theo id
        orderitemdao.deleteOrderItem(id);
    }
}

