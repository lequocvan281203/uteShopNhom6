package controller.admin.promotion;

import java.io.IOException;

import  jakarta.servlet.RequestDispatcher;
import  jakarta.servlet.ServletException;
import  jakarta.servlet.annotation.WebServlet;
import  jakarta.servlet.http.HttpServlet;
import  jakarta.servlet.http.HttpServletRequest;
import  jakarta.servlet.http.HttpServletResponse;

import model.PromotionModel;
import service.PromotionService;
import service.ProductService;
import serviceImpl.ProductServiceImpl;
import serviceImpl.PromotionServiceImpl;
import utils.FormUtil;
@WebServlet(urlPatterns = { "/admin-promotion-edit" })

public class EditPromotion extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	PromotionService promotionService = new PromotionServiceImpl();
	ProductService productService = new ProductServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		PromotionModel model = FormUtil.toModel(PromotionModel.class, req);
		if(model.getPromotionID()!=null) {
			model = promotionService.getOne(model.getPromotionID());
		}
		model.setTotalItem(promotionService.getTotalItem());
		req.setAttribute("allPromotion", promotionService.findAll());
		req.setAttribute("allProduct",productService.findAll());
		req.setAttribute("model",model);
		RequestDispatcher rq = req.getRequestDispatcher("views/admin/promotion/editpromotion.jsp");
		rq.forward(req, resp);
	}
}