package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constant.SystemConstant;
import model.UserModel;
import utils.SessionUtil;

public class AuthorizationFilter implements Filter {
    private ServletContext context;

    // Khởi tạo Filter, lấy ServletContext
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.context = filterConfig.getServletContext();
    }

    // Phương thức doFilter chính để xử lý yêu cầu HTTP
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String url = request.getRequestURI();  // Lấy URL đang được truy cập

        // Kiểm tra xem URL có bắt đầu bằng "/admin" không, nếu có nghĩa là người dùng đang cố gắng truy cập vào trang admin
        if(url.startsWith(request.getContextPath() + "/admin")) {
            // Lấy thông tin người dùng từ session
            UserModel model = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");

            if(model != null) {
                // Kiểm tra vai trò người dùng
                if(model.getRole().getCode().equals(SystemConstant.ADMIN)) {
                    // Nếu người dùng là admin, cho phép truy cập
                    filterChain.doFilter(servletRequest, servletResponse);
                } else if(model.getRole().getCode().equals(SystemConstant.USER)) {
                    // Nếu người dùng là user (không phải admin), từ chối truy cập và thông báo lỗi
                    PrintWriter out = response.getWriter();
                    response.setContentType("text/html");
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Bạn không có quyền truy cập vào đường dẫn này');");
                    out.print("location='" + request.getContextPath() + "/home'");
                    out.println("</script>");
                }
            } else {
                // Nếu không có thông tin người dùng trong session, điều hướng về trang đăng nhập
                response.sendRedirect(request.getContextPath() + "/login");
            }
        } else {
            // Nếu URL không thuộc /admin, cho phép truy cập bình thường
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    // Phương thức destroy, giải phóng tài nguyên nếu có
    @Override
    public void destroy() {
    }
}
