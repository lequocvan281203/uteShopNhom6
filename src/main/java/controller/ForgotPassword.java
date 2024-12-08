package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CategoryModel;
import model.UserModel;
import service.CategoryService;
import service.UserService;
import serviceImpl.CategoryServiceImpl;
import serviceImpl.UserServiceImpl;

@WebServlet(urlPatterns = { "/change-password" })

public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CategoryService categoryservice = new CategoryServiceImpl();
	UserService userService = new UserServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		res.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		List<CategoryModel> allCategory = categoryservice.findAll();
		req.setAttribute("allcategory", allCategory);
		req.setAttribute("users", userService.findAll());
		RequestDispatcher rq = req.getRequestDispatcher("views/forgotpassword.jsp");
		rq.forward(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	    String username = req.getParameter("username");
	    String sdt = req.getParameter("sdt");  // Số điện thoại người dùng nhập vào

	    // Kiểm tra tính hợp lệ của username và số điện thoại
	    if (username == null || username.isEmpty() || sdt == null || sdt.isEmpty()) {
	        req.setAttribute("error", "Tên đăng nhập hoặc số điện thoại không hợp lệ");
	        req.getRequestDispatcher("views/forgotpassword.jsp").forward(req, res);
	    } else {
	        // Kiểm tra người dùng có tồn tại với username và số điện thoại
	        UserModel user = userService.findByUserNameSdt(username, sdt);

	        if (user != null) {
	            // Nếu người dùng tồn tại, có thể gửi thông báo hoặc mã xác nhận để thay đổi mật khẩu
	            req.setAttribute("message", "Một email hoặc tin nhắn đã được gửi để thay đổi mật khẩu.");
	            req.getRequestDispatcher("views/forgotpassword.jsp").forward(req, res);
	        } else {
	            // Nếu không tìm thấy username hoặc số điện thoại
	            req.setAttribute("error", "Tên đăng nhập hoặc số điện thoại không tồn tại");
	            req.getRequestDispatcher("views/forgotpassword.jsp").forward(req, res);
	        }
	    }
	}

}