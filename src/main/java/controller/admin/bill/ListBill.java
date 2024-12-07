package controller.admin.bill;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BillModel;
import paging.PageRequest;
import paging.Pageble;
import service.BillService;
import serviceImpl.BillServiceImpl;
import utils.FormUtil;
@WebServlet(urlPatterns = { "/admin-bill-list" })

public class ListBill extends HttpServlet{

	private static final long serialVersionUID = 1L;
	BillService billService = new BillServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		Map<String, String> dataMap = new HashMap<String, String>();
		dataMap.put("fullname", "Tên khách hàng");
		dataMap.put("sdt", "Số điện thoại");
		dataMap.put("Date", "Ngày đặt hàng");
		dataMap.put("TotalPrice", "Giá");
		dataMap.put("ShippingAddress", "Địa chỉ");
		dataMap.put("Note", "Ghi chú");
		req.setAttribute("dataMap", dataMap);
		BillModel model = FormUtil.toModel(BillModel.class, req);
		Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem());
		if(model.getKey() == null && model.getSearch()==null) {
			model.setListResult(billService.findAll(pageble));
			model.setTotalItem(billService.getTotalItem());
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem()/ model.getMaxPageItem()));
		}
		else {
			model.setListResult(billService.findAllSearch(pageble, model.getKey(), model.getSearch()));
			if(billService.getTotalItemSearch(model.getKey(), model.getSearch())==0) {
				model.setTotalItem(1);
			}
			else 
			{
				model.setTotalItem(billService.getTotalItemSearch(model.getKey(), model.getSearch()));
			}
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem()/ model.getMaxPageItem()));
		}
		req.setAttribute("model", model);
		RequestDispatcher rq = req.getRequestDispatcher("views/admin/bill/listbill.jsp");
		rq.forward(req, resp);
		
	}

}