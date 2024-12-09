package controller.admin.user;

import java.io.IOException;

import  jakarta.servlet.RequestDispatcher;
import  jakarta.servlet.ServletException;
import  jakarta.servlet.annotation.WebServlet;
import  jakarta.servlet.http.HttpServlet;
import  jakarta.servlet.http.HttpServletRequest;
import  jakarta.servlet.http.HttpServletResponse;

import model.UserModel;
import service.RoleService;
import service.UserService;
import serviceImpl.RoleServiceImpl;
import serviceImpl.UserServiceImpl;
import utils.FormUtil;

@WebServlet(urlPatterns = { "/admin-user-edit" })

public class EditUser extends HttpServlet{

	private static final long serialVersionUID = 1L;
	RoleService roleSevice = new RoleServiceImpl();
	UserService userService = new UserServiceImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		UserModel model = FormUtil.toModel(UserModel.class, request);
		if(model.getId() != null) {
			model = userService.findOne(model.getId());
		}
		request.setAttribute("users", userService.findAll());
		request.setAttribute("roles", roleSevice.findAll());
		request.setAttribute("model", model);
		RequestDispatcher rq = request.getRequestDispatcher("views/admin/user/edituser.jsp");
		rq.forward(request, resp);
	}
}