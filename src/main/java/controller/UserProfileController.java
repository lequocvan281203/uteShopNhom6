package controller;

import java.io.IOException;
import java.util.Collections;

import  jakarta.servlet.RequestDispatcher;
import  jakarta.servlet.ServletException;
import  jakarta.servlet.annotation.WebServlet;
import  jakarta.servlet.http.HttpServlet;
import  jakarta.servlet.http.HttpServletRequest;
import  jakarta.servlet.http.HttpServletResponse;
import  jakarta.servlet.http.HttpSession;

import model.BillModel;
import model.UserModel;
import paging.PageRequest;
import paging.Pageble;
import service.BillService;
import serviceImpl.BillServiceImpl;
import utils.FormUtil;

@WebServlet(urlPatterns = { "/userprofile" })
public class UserProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BillService billService = new BillServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		res.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");

		HttpSession httpSession = req.getSession();
		UserModel objUser = (UserModel) httpSession.getAttribute("USERMODEL");

		BillModel model = FormUtil.toModel(BillModel.class, req);
		Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem());
		model.setListResult(billService.findAllSearch(pageble, "id", objUser.getId().toString()));
		model.setTotalItem(billService.getTotalItemSearch("id", objUser.getId().toString()));
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
		Collections.reverse(model.getListResult());
		req.setAttribute("model", model);

		RequestDispatcher rq = req.getRequestDispatcher("views/userprofile.jsp");
		rq.forward(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, res);
	}
}