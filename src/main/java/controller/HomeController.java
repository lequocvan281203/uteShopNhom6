package controller;

import java.io.IOException;
import java.util.List;

import  jakarta.servlet.RequestDispatcher;
import  jakarta.servlet.ServletException;
import  jakarta.servlet.annotation.WebServlet;
import  jakarta.servlet.http.HttpServlet;
import  jakarta.servlet.http.HttpServletRequest;
import  jakarta.servlet.http.HttpServletResponse;

import model.CategoryModel;
import model.ProductModel;
import service.CategoryService;
import service.UserService;
import service.ProductService;
import serviceImpl.CategoryServiceImpl;
import serviceImpl.ProductServiceImpl;
import serviceImpl.UserServiceImpl;


@WebServlet(urlPatterns = { "/home" })
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 8306445746662697977L;

	CategoryService categoryservice = new CategoryServiceImpl();
	ProductService productservice = new ProductServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		// Get all category for navbar
		
		List<CategoryModel> allCategory = categoryservice.findAll();
		req.setAttribute("allcategory", allCategory);
		
		// Get 8 new product
		List<ProductModel> top8newproduct = productservice.get8NewProduct();
		req.setAttribute("top8newproduct", top8newproduct);
		
		// Current page
		req.setAttribute("page", "home");
		
		RequestDispatcher rq = req.getRequestDispatcher("views/home.jsp");
		rq.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
