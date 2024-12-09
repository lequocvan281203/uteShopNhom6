package controller;

import java.io.IOException;
import java.util.List;
import java.util.ResourceBundle;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        // Kiểm tra nếu action là "login"
        if ("login".equals(action)) {
            List<CategoryModel> allCategory = categoryService.findAll();
            request.setAttribute("allcategory", allCategory);

            // Thông báo lỗi hoặc thành công nếu có
            String message = request.getParameter("message");
            if (message != null && resourceBundle.containsKey(message)) {
                request.setAttribute("message", resourceBundle.getString(message));
            } else {
                // Nếu không có khóa, có thể sử dụng mặc định
                request.setAttribute("message", "Thông tin không chính xác.");
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


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        // Xử lý hành động đăng nhập
        if ("login".equals(action)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            // Sử dụng phương thức findByUserNamePasswordStatus để kiểm tra đăng nhập
            UserModel user = userService.findByUserNamePasswordStatus(username, password);

            // Kiểm tra đăng nhập thành công
            if (user != null) {
                // Lưu thông tin người dùng vào session
                SessionUtil.getInstance().putValue(request, "USERMODEL", user);
                response.sendRedirect(request.getContextPath() + "/home");  // Chuyển hướng về trang chủ sau khi đăng nhập
            } else {
                // Nếu đăng nhập thất bại, chuyển hướng lại trang login với thông báo lỗi
                response.sendRedirect(request.getContextPath() + "/dang-nhap?action=login&message=error&alert=danger");
            }
        }
    }

}

