package controller.admin.category;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CategoryModel;
import service.CategoryService;
import serviceImpl.CategoryServiceImpl;
import utils.FormUtil;

@WebServlet(urlPatterns = { "/admin-category-edit" })

public class EditCategory extends HttpServlet  {

	private static final long serialVersionUID = 1L;
	CategoryService categoryService = new CategoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		CategoryModel model = FormUtil.toModel(CategoryModel.class, request);
		if(model.getCategoryID() != null) {
			request.setAttribute("categoryEdit",categoryService.getOne(model.getCategoryID()));
		}
		request.setAttribute("model",model);
		RequestDispatcher rq = request.getRequestDispatcher("views/admin/category/editcategory.jsp");
		rq.forward(request, resp);
	}
}