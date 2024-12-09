package controller;

import java.io.IOException;
import java.util.List;

import  jakarta.servlet.RequestDispatcher;
import  jakarta.servlet.ServletException;
import  jakarta.servlet.annotation.WebServlet;
import  jakarta.servlet.http.HttpServlet;
import  jakarta.servlet.http.HttpServletRequest;
import  jakarta.servlet.http.HttpServletResponse;

import model.CategoryModel;
import model.UserModel;
import service.CategoryService;
import service.UserService;
import serviceImpl.CategoryServiceImpl;
import serviceImpl.UserServiceImpl;

@WebServlet(urlPatterns = { "/dang-ky" })
public class RegisterController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	CategoryService categoryservice = new CategoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		List<CategoryModel> allCategory = categoryservice.findAll();
		req.setAttribute("allcategory", allCategory);
		RequestDispatcher rq = req.getRequestDispatcher("views/regist.jsp");
		rq.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	    // Lấy dữ liệu từ form đăng ký
	    String username = req.getParameter("username");
	    String password = req.getParameter("password");
	    String fullName = req.getParameter("fullname");  // Thêm fullName
	    String sdt = req.getParameter("sdt");  // Thêm số điện thoại
	    //String email = req.getParameter("email");  // Có thể dùng email nếu cần
	    long roleId = 2; // Hoặc lấy từ form nếu bạn muốn chọn role từ phía người dùng

	    // Kiểm tra tính hợp lệ của thông tin đăng ký
	    if (username == null || password == null || fullName == null || sdt == null) {
	        req.setAttribute("error", "Thông tin không hợp lệ");
	        req.getRequestDispatcher("views/regist.jsp").forward(req, res);
	    } else {
	        // Xử lý đăng ký, gọi UserService để lưu thông tin người dùng
	        UserService userService = new UserServiceImpl();
	        UserModel registeredUser = userService.register(username, password, fullName, sdt, roleId);

	        if (registeredUser != null) {
	            // Đăng ký thành công, chuyển hướng đến trang đăng nhập
	            res.sendRedirect("login.jsp");
	        } else {
	            // Đăng ký thất bại, hiển thị lỗi
	            req.setAttribute("error", "Đăng ký thất bại");
	            req.getRequestDispatcher("views/regist.jsp").forward(req, res);
	        }
	    }
	}


}
