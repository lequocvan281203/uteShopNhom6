package controller.admin.api;

import java.io.IOException;

import  jakarta.servlet.ServletException;
import  jakarta.servlet.annotation.WebServlet;
import  jakarta.servlet.http.HttpServlet;
import  jakarta.servlet.http.HttpServletRequest;
import  jakarta.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;


import model.CategoryModel;
import service.CategoryService;
import service.ProductService;
import serviceImpl.CategoryServiceImpl;
import serviceImpl.ProductServiceImpl;
import utils.HttpUtil;

@WebServlet(urlPatterns = {"/api-category"})

public class CategoryAPI extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = -1983174333334291007L;
	CategoryService categoryService = new CategoryServiceImpl();
	ProductService productService = new ProductServiceImpl();
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		CategoryModel categoryModel = HttpUtil.of(request.getReader()).toModel(CategoryModel.class);
		categoryModel = categoryService.insertCategory(categoryModel);
		mapper.writeValue(response.getOutputStream(), categoryModel);
	}
	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		CategoryModel categoryModel = HttpUtil.of(request.getReader()).toModel(CategoryModel.class);
		Boolean check = true;
		for(long id : categoryModel.getIdDeletes()) {
			int SLProductByBrandID = productService.checkProductByCategoryIDChild(id);
			if(SLProductByBrandID>0) 
			{
				check=false;
			}
		}
		if(check==true) {
			categoryModel = categoryService.updateCategory(categoryModel);
			mapper.writeValue(response.getOutputStream(), categoryModel);
		}
		else {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Đặt mã trạng thái 400
		}
	}
	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8"); // định form tiếng việt
		response.setContentType("application/json");
		CategoryModel categoryModel = HttpUtil.of(request.getReader()).toModel(CategoryModel.class);
		Boolean check = true;
		for(long id : categoryModel.getIds()) {
			int SLProductByBrandID = productService.checkProductByCategoryID(id);
			if(SLProductByBrandID>0) 
			{
				check=false;
			}
		}
		if(check==true) 
		{
			categoryService.deleteCategory(categoryModel.getIds());
			mapper.writeValue(response.getOutputStream(), "{}");
		}
		else 
		{
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Đặt mã trạng thái 400
		}
	}
}