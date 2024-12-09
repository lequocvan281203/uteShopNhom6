package controller.admin.brand;

import java.io.IOException;

import  jakarta.servlet.RequestDispatcher;
import  jakarta.servlet.ServletException;
import  jakarta.servlet.annotation.WebServlet;
import  jakarta.servlet.http.HttpServlet;
import  jakarta.servlet.http.HttpServletRequest;
import  jakarta.servlet.http.HttpServletResponse;

import dao.BrandDao;
import daoImpl.BrandDaoImpl;
import model.BrandModel;
import utils.FormUtil;

@WebServlet(urlPatterns = { "/admin-brand-edit" })

public class EditBrand extends HttpServlet{

	private static final long serialVersionUID = 1L;
	BrandDao brandDao = new BrandDaoImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		BrandModel model = FormUtil.toModel(BrandModel.class, req);
		if(model.getBrandID() != null)
		{
			model = brandDao.getOne(model.getBrandID());
		}
		req.setAttribute("model",model);
		RequestDispatcher rq = req.getRequestDispatcher("views/admin/brand/editbrand.jsp");
		rq.forward(req, resp);
	}

}