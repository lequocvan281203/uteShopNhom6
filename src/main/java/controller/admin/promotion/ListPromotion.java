package controller.admin.promotion;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PromotionModel;
import paging.PageRequest;
import paging.Pageble;
import service.PromotionService;
import serviceImpl.PromotionServiceImpl;
import utils.FormUtil;
@WebServlet(urlPatterns = { "/admin-promotion-list" })

public class ListPromotion extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	PromotionService promotionService = new PromotionServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		Map<String, String> dataMap = new HashMap<String, String>();
		dataMap.put("ProductName", "Tên sản phẩm");
		dataMap.put("StartDate", "Ngày bắt đầu");
		dataMap.put("EndDate", "Ngày kết thúc");
		dataMap.put("SaleOff", "Khuyễn mãi(%)");
		req.setAttribute("dataMap", dataMap);
		
		PromotionModel model = FormUtil.toModel(PromotionModel.class, req);
		Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem());
		if(model.getKey() == null && model.getSearch()==null) {
			model.setTotalItem(promotionService.getTotalItem());
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem()/ model.getMaxPageItem()));
			model.setListResult(promotionService.findAll(pageble));
		}
		else {
			model.setListResult(promotionService.findAllSearch(pageble,model.getKey(), model.getSearch()));
			if(promotionService.getTotalItemSearch(model.getKey(), model.getSearch())==0) {
				model.setTotalItem(1);
			}
			else 
			{
				model.setTotalItem(promotionService.getTotalItemSearch(model.getKey(), model.getSearch()));
			}
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem()/ model.getMaxPageItem()));
		}
		req.setAttribute("model", model);
		RequestDispatcher rq = req.getRequestDispatcher("views/admin/promotion/listpromotion.jsp");
		rq.forward(req, resp);
	}

}