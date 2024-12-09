package controller.admin.bill;

import java.io.IOException;

import  jakarta.servlet.RequestDispatcher;
import  jakarta.servlet.ServletException;
import  jakarta.servlet.annotation.WebServlet;
import  jakarta.servlet.http.HttpServlet;
import  jakarta.servlet.http.HttpServletRequest;
import  jakarta.servlet.http.HttpServletResponse;

import model.BillModel;
import service.BillService;
import serviceImpl.BillServiceImpl;
import utils.FormUtil;

@WebServlet(urlPatterns = { "/admin-bill-detail" })

public class DetailBill extends HttpServlet{

	private static final long serialVersionUID = 1L;
	BillService billService = new BillServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		res.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		BillModel model = FormUtil.toModel(BillModel.class, req);
		model = billService.getOne(model.getBillID());
		req.setAttribute("model", model);
		RequestDispatcher rq = req.getRequestDispatcher("views/admin/bill/detailbill.jsp");
		rq.forward(req, res);
	}

}