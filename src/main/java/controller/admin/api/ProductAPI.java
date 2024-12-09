package controller.admin.api;

import java.io.IOException;

import  jakarta.servlet.ServletException;
import  jakarta.servlet.annotation.WebServlet;
import  jakarta.servlet.http.HttpServlet;
import  jakarta.servlet.http.HttpServletRequest;
import  jakarta.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.ProductModel;
import service.ProductService;
import serviceImpl.ProductServiceImpl;
import utils.HttpUtil;

@WebServlet(urlPatterns = {"/api-product"})

public class ProductAPI extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6001596298679492098L;
	ProductService productService = new ProductServiceImpl();
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		ProductModel productModel = HttpUtil.of(request.getReader()).toModel(ProductModel.class);
		productModel = productService.insertProduct(productModel);
		mapper.writeValue(response.getOutputStream(),productModel);
	}
	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		ProductModel productModel = HttpUtil.of(request.getReader()).toModel(ProductModel.class);
		productModel = productService.updateProduct(productModel);
		mapper.writeValue(response.getOutputStream(), productModel);
	}
	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8"); // định form tiếng việt
		response.setContentType("application/json");
		ProductModel productModel = HttpUtil.of(request.getReader()).toModel(ProductModel.class);
		productService.deleteProducts(productModel.getIds());
		mapper.writeValue(response.getOutputStream(), "{}");
	}
}