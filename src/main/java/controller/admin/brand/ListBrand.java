package controller.admin.brand;

import java.io.IOException;
import java.util.List;

import  jakarta.servlet.RequestDispatcher;
import  jakarta.servlet.ServletException;
import  jakarta.servlet.annotation.WebServlet;
import  jakarta.servlet.http.HttpServlet;
import  jakarta.servlet.http.HttpServletRequest;
import  jakarta.servlet.http.HttpServletResponse;

import constant.SystemConstant;
import model.BrandModel;
import paging.PageRequest;
import paging.Pageble;
import service.BrandService;
import serviceImpl.BrandServiceImpl;
import utils.FormUtil;

@WebServlet(urlPatterns = { "/admin-brand-list" })

public class ListBrand extends HttpServlet{

	private static final long serialVersionUID = 1L;
	BrandService brandService = new BrandServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		BrandModel model = FormUtil.toModel(BrandModel.class, req);
		Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem());
		if(model.getSearch()==null) {
			List<BrandModel> allBrand =  brandService.findAll(pageble);
			model.setTotalItem(brandService.getTotalItem());
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem()/ model.getMaxPageItem()));
			req.setAttribute("Allbrand", allBrand);
		}
		else {
			List<BrandModel> allBrand =  brandService.findAllSearch(pageble,model.getSearch());
			if(brandService.getTotalItemSearch(model.getSearch())==0) {
				model.setTotalItem(1);
			}
			else
			{
				model.setTotalItem(brandService.getTotalItemSearch(model.getSearch()));
			}
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem()/ model.getMaxPageItem()));
			req.setAttribute("Allbrand", allBrand);
		}
		req.setAttribute(SystemConstant.MODEL, model);
		RequestDispatcher rq = req.getRequestDispatcher("views/admin/brand/listbrand.jsp");
		rq.forward(req, resp);
	}
}