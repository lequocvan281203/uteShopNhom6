package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CategoryModel;
import model.ProductModel;
import service.CategoryService;
import service.ProductService;
import serviceImpl.CategoryServiceImpl;
import serviceImpl.ProductServiceImpl;

@WebServlet(urlPatterns = { "/detail" })
public class DetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
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
		// Get PID
		int pid = Integer.parseInt(req.getParameter("pid"));
		// Get product by PID
		List<ProductModel> product = productservice.getProductByPID(pid);
		req.setAttribute("product", product);
		// Get 8 new products
		List<ProductModel> top8newproduct = productservice.get8NewProduct();
		req.setAttribute("top8newproduct", top8newproduct);

		RequestDispatcher rq = req.getRequestDispatcher("views/detail.jsp");
		rq.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
