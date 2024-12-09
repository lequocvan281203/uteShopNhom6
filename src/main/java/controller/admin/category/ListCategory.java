package controller.admin.category;

import java.io.IOException;
import java.util.List;

import  jakarta.servlet.RequestDispatcher;
import  jakarta.servlet.ServletException;
import  jakarta.servlet.annotation.WebServlet;
import  jakarta.servlet.http.HttpServlet;
import  jakarta.servlet.http.HttpServletRequest;
import  jakarta.servlet.http.HttpServletResponse;

import constant.SystemConstant;
import model.CategoryModel;
import paging.PageRequest;
import paging.Pageble;
import service.CategoryService;
import serviceImpl.CategoryServiceImpl;
import utils.FormUtil;

@WebServlet(urlPatterns = { "/admin-category-list" })

public class ListCategory extends HttpServlet{

	private static final long serialVersionUID = 1L;
	CategoryService categoryservice = new CategoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		CategoryModel model = FormUtil.toModel(CategoryModel.class, request);
		Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem());
		List<CategoryModel> allCategory = categoryservice.findAllPaging(pageble);
		model.setTotalItem(categoryservice.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem()/ model.getMaxPageItem()));
		request.setAttribute("allcategory", allCategory);
		request.setAttribute(SystemConstant.MODEL, model);
		RequestDispatcher rq = request.getRequestDispatcher("views/admin/category/listcategory.jsp");
		rq.forward(request, resp);
	}
}