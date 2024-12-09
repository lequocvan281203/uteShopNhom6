package controller.admin.api;

import java.io.IOException;

import  jakarta.servlet.ServletException;
import  jakarta.servlet.annotation.WebServlet;
import  jakarta.servlet.http.HttpServlet;
import  jakarta.servlet.http.HttpServletRequest;
import  jakarta.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.ProductDAO;
import model.BrandModel;
import model.CategoryModel;
import model.ProductModel;
import service.BrandService;
import service.ProductService;
import serviceImpl.BrandServiceImpl;
import serviceImpl.ProductServiceImpl;
import utils.HttpUtil;

@WebServlet(urlPatterns = {"/api-brand"})

public class BrandAPI extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	BrandService brandService = new BrandServiceImpl();
	ProductService productService = new ProductServiceImpl();
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		BrandModel brandModel = HttpUtil.of(request.getReader()).toModel(BrandModel.class);
		brandModel = brandService.insertBrand(brandModel);
		mapper.writeValue(response.getOutputStream(), brandModel);
	}
	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		BrandModel brandModel = HttpUtil.of(request.getReader()).toModel(BrandModel.class);
		brandModel = brandService.updateBrand(brandModel);
		mapper.writeValue(response.getOutputStream(), brandModel);
	}
	
	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8"); // định form tiếng việt
		response.setContentType("application/json");
		BrandModel brandModel = HttpUtil.of(request.getReader()).toModel(BrandModel.class);
		Boolean check = true;
		for(long id : brandModel.getIds()) {
			int SLProductByBrandID = productService.checkProductByBrandID(id);
			if(SLProductByBrandID>0) 
			{
				check=false;
			}
		}
		if(check==true) 
		{
			brandService.deleteBrand(brandModel.getIds());
			mapper.writeValue(response.getOutputStream(), "{}");
		}
		else 
		{
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Đặt mã trạng thái 400
		}
	
	}
}