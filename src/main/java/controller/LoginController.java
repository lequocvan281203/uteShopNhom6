package controller;

import java.io.IOException;
import java.util.List;
import java.util.ResourceBundle;

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
import utils.SessionUtil;

@WebServlet(urlPatterns = { "/dang-nhap", "/thoat" })
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService = new UserServiceImpl();
    private CategoryService categoryService = new CategoryServiceImpl();
    private ResourceBundle resourceBundle = ResourceBundle.getBundle("message");

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        // Kiểm tra nếu action là "login"
        if ("login".equals(action)) {
            List<CategoryModel> allCategory = categoryService.findAll();
            request.setAttribute("allcategory", allCategory);

            // Thông báo lỗi hoặc thành công nếu có
            String message = request.getParameter("message");
            String alert = request.getParameter("alert");
            if (message != null && alert != null) {
                request.setAttribute("message", resourceBundle.getString(message));
                request.setAttribute("alert", alert);
            }

            // Forward đến trang login.jsp
            RequestDispatcher rd = request.getRequestDispatcher("/views/login.jsp");
            rd.forward(request, response);
        } 
        // Kiểm tra nếu action là "loguot" để xử lý đăng xuất
        else if ("loguot".equals(action)) {
            SessionUtil.getInstance().removeValue(request, "USERMODEL");
            response.sendRedirect(request.getContextPath() + "/home");  // Chuyển hướng về trang chủ
        } 
        // Nếu không có action, forward về trang home
        else {
            RequestDispatcher rd = request.getRequestDispatcher("/views/home.jsp");
            rd.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("username");
        String password = request.getParameter("password");

        // Xử lý đăng nhập
        UserModel user = userService.findByUserNamePasswordStatus(userName, password);
        if (user != null) {
            // Lưu thông tin người dùng vào session
            SessionUtil.getInstance().putValue(request, "USERMODEL", user);
            response.sendRedirect(request.getContextPath() + "/home");  // Chuyển hướng về trang chủ
        } else {
            // Nếu đăng nhập không thành công, hiển thị thông báo lỗi
            request.setAttribute("message", resourceBundle.getString("login.error"));
            request.setAttribute("alert", "danger");
            doGet(request, response);  // Forward lại trang login.jsp
        }
    }
}

