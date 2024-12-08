package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.OrderItemModel;
import model.ProductModel;
import service.ProductService;
import serviceImpl.ProductServiceImpl;

@WebServlet(urlPatterns = { "/cart/add" })
public class CartAddController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    ProductService productService = new ProductServiceImpl();

    @SuppressWarnings("unchecked")
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            Long PID = Long.parseLong(req.getParameter("pid"));
            int Amount = Integer.parseInt(req.getParameter("amount"));

            if (Amount <= 0) {
                res.sendRedirect(req.getContextPath() + "/cart");
                return;
            }

            ProductModel product = productService.getOne(PID);
            if (product == null) {
                res.sendRedirect(req.getContextPath() + "/cart");
                return;
            }

            OrderItemModel orderItem = new OrderItemModel();
            orderItem.setProduct(product);
            orderItem.setAmount(Amount);

            HttpSession session = req.getSession();
            Object obj = session.getAttribute("cart");
            Map<Long, OrderItemModel> cart;

            if (obj == null) {
                cart = new HashMap<>();
            } else {
                cart = (Map<Long, OrderItemModel>) obj;
            }

            // Kiểm tra nếu sản phẩm đã có trong giỏ hàng
            OrderItemModel existingItem = cart.get(PID);
            if (existingItem == null) {
                cart.put(PID, orderItem);
            } else {
                existingItem.setAmount(existingItem.getAmount() + Amount);
                if (existingItem.getAmount() <= 0) {
                    cart.remove(PID); // Xóa sản phẩm nếu số lượng <= 0
                }
            }

            session.setAttribute("cart", cart);

            // Quay lại trang giỏ hàng hoặc trang trước đó
            String referer = req.getHeader("referer");
            if (referer != null) {
                res.sendRedirect(referer);
            } else {
                res.sendRedirect(req.getContextPath() + "/cart");
            }
        } catch (NumberFormatException e) {
            // Xử lý trường hợp tham số không hợp lệ
            res.sendRedirect(req.getContextPath() + "/cart");
        }
    }

    @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, res);
	}
}
