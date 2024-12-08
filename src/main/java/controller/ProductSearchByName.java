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
import paging.PageRequest;
import paging.Pageble;
import service.CategoryService;
import service.ProductService;
import serviceImpl.CategoryServiceImpl;
import serviceImpl.ProductServiceImpl;
import utils.FormUtil;

@WebServlet(urlPatterns = {"/search", "/tim-kiem"})
public class ProductSearchByName extends HttpServlet {

	private static final long serialVersionUID = 1L;
	CategoryService categoryservice = new CategoryServiceImpl();
    ProductService productservice = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        res.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        // Get All Categories
        List<CategoryModel> allCategory = categoryservice.findAll();
        req.setAttribute("allcategory", allCategory);

        // Get Product search form parameters
        ProductModel model = FormUtil.toModel(ProductModel.class, req);

        String startPrice = req.getParameter("startPrice");
        String endPrice = req.getParameter("endPrice");

        // Initialize page request for pagination
        Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem());

        // Search by name or other filters
        if (model.getKey() == null && model.getSearch() == null) {
            // No search criteria provided
            if (startPrice != null && endPrice != null) {
                Long start = Long.parseLong(startPrice);
                Long end = Long.parseLong(endPrice);
                model.setListResult(productservice.findAllPrice(pageble, start, end));
                model.setTotalItem(productservice.getTotalItemPrice(start, end));
                model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
            } else {
                model.setListResult(productservice.findAll(pageble));
                model.setTotalItem(productservice.getTotalItem());
                model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
            }
        } else {
			if (startPrice != null && endPrice != null) {
				Long start = Long.parseLong(startPrice);
				Long end = Long.parseLong(endPrice);
				model.setListResult(
						productservice.findAllSearchPrice(pageble, model.getKey(), model.getSearch(), start, end));
				model.setTotalItem(productservice.getTotalItemSearchPrice(model.getKey(), model.getSearch(), start, end));
				model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
			} else {
				model.setListResult(productservice.findAllSearch(pageble, model.getKey(), model.getSearch()));
				model.setTotalItem(productservice.getTotalItemSearch(model.getKey(), model.getSearch()));
				model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
			}
		}

        // Forward result to JSP
        req.setAttribute("productModel", model);
        RequestDispatcher rq = req.getRequestDispatcher("views/product-search.jsp");
        rq.forward(req, res);
    }
}
