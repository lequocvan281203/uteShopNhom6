package controller.admin.product;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constant.SystemConstant;
import model.ProductModel;
import paging.PageRequest;
import paging.Pageble;
import service.ProductService;
import serviceImpl.ProductServiceImpl;
import utils.FormUtil;
@WebServlet(urlPatterns = { "/admin-product-list" })

public class ListProduct extends HttpServlet {

	private static final long serialVersionUID = 1L;
	ProductService productService = new ProductServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		ProductModel model = FormUtil.toModel(ProductModel.class, req);
		Map<String, String> dataMap = new HashMap<String, String>();
		dataMap.put("ProductName", "Tên sản phẩm");
		dataMap.put("Description", "Mô tả");
		dataMap.put("Price", "Giá");
		dataMap.put("Amount", "Số lượng");
		dataMap.put("CategoryName", "Thể loại");
		dataMap.put("BrandName", "	Thương hiệu");
		req.setAttribute("dataMap", dataMap);
		
		req.setAttribute("Allproduct",productService.findAll());
		Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem());
		if(model.getKey() == null && model.getSearch()==null) {
			List<ProductModel> allProduct = productService.findAll(pageble);
			model.setTotalItem(productService.getTotalItem());
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem()/ model.getMaxPageItem()));
			req.setAttribute("Allproduct", allProduct);
		}
		else 
		{
			List<ProductModel> allProduct = productService.findAllSearchAll(pageble, model.getKey(), model.getSearch());
			if(productService.getTotalItemSearchAll(model.getKey(), model.getSearch())==0) {
				model.setTotalItem(1);
			}
			else 
			{
				model.setTotalItem(productService.getTotalItemSearchAll(model.getKey(), model.getSearch()));
			}
			
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem()/ model.getMaxPageItem()));
			req.setAttribute("Allproduct", allProduct);
		}
		req.setAttribute(SystemConstant.MODEL, model);
		RequestDispatcher rq = req.getRequestDispatcher("views/admin/product/listproduct.jsp");
		rq.forward(req, resp);
	}

}