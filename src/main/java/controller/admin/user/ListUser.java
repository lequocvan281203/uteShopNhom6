package controller.admin.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constant.SystemConstant;
import model.UserModel;
import paging.PageRequest;
import paging.Pageble;
import service.UserService;
import serviceImpl.UserServiceImpl;
import utils.FormUtil;

@WebServlet(urlPatterns = { "/admin-user-list" })

public class ListUser extends HttpServlet{

	private static final long serialVersionUID = 1L;
	UserService userService = new UserServiceImpl();
	ResourceBundle resourceBundle = ResourceBundle.getBundle("message");

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		UserModel model = FormUtil.toModel(UserModel.class, request);
		Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem());
		Map<String, String> dataMap = new HashMap<>();
		dataMap.put("username", "UserName");
		dataMap.put("password", "Password");
		dataMap.put("fullname", "Họ tên");
		dataMap.put("sdt", "Số điện thoại");
		dataMap.put("name", "Quyền");
		dataMap.put("status", "Trạng thái");
		request.setAttribute("dataMap", dataMap);
		if(request.getParameter("message") != null) {
			String message = request.getParameter("message");
			if(message.equals("error_system"))
			{
				request.setAttribute("alert","danger");
				request.setAttribute("message",resourceBundle.getString(message) );
			}
			else
			{
				request.setAttribute("alert","success");
				request.setAttribute("message",resourceBundle.getString(message) );
			}

		}
		if(model.getKey() == null && model.getSearch()==null) {
			model.setListResult(userService.findAll(pageble));
			model.setTotalItem(userService.getTotalItem());
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem()/ model.getMaxPageItem()));
		}
		else
		{
			model.setListResult(userService.findAllSearch(pageble, model.getKey(), model.getSearch()));
			if(userService.getTotalItemSearch(model.getKey(), model.getSearch())==0) {
				model.setTotalItem(1);
			}
			else {
				model.setTotalItem(userService.getTotalItemSearch(model.getKey(), model.getSearch()));
			}

			model.setTotalPage((int) Math.ceil((double) model.getTotalItem()/ model.getMaxPageItem()));
		}
		request.setAttribute(SystemConstant.MODEL, model);
		RequestDispatcher rq = request.getRequestDispatcher("views/admin/user/list.jsp");
		rq.forward(request, resp);
	}
}