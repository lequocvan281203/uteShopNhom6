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

@WebServlet(urlPatterns = { "/shop" })
public class ShopController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CategoryService categoryservice = new CategoryServiceImpl();
    ProductService productservice = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        res.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        // Get all categories for navbar
        List<CategoryModel> allCategory = categoryservice.findAll();
        req.setAttribute("allcategory", allCategory);

        // Create a ProductModel to handle search and pagination
        ProductModel model = FormUtil.toModel(ProductModel.class, req);
        String startPrice = req.getParameter("startPrice");
        String endPrice = req.getParameter("endPrice");

        // Page Request for Pagination
        Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem());

        if (model.getKey() == null && model.getSearch() == null) {
            // No search criteria, handle price filtering
            if (startPrice != null && endPrice != null) {
                try {
                    Long start = Long.parseLong(startPrice);
                    Long end = Long.parseLong(endPrice);
                    model.setListResult(productservice.findAllPrice(pageble, start, end));
                    model.setTotalItem(productservice.getTotalItemPrice(start, end));
                    model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
                } catch (NumberFormatException e) {
                    // Handle invalid price format (maybe show an error message or reset)
                    req.setAttribute("error", "Invalid price range.");
                }
            } else {
                model.setListResult(productservice.findAll(pageble));
                model.setTotalItem(productservice.getTotalItem());
                model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
            }
        } else {
            // Handle search functionality if there's a key or search parameter
            String searchKey = model.getKey();
            String searchValue = model.getSearch();
            model.setListResult(productservice.findAllSearch(pageble, searchKey, searchValue));
            model.setTotalItem(productservice.getTotalItemSearch(searchKey, searchValue));
            model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
        }

        // Set the model attributes to forward to the view
        req.setAttribute("productModel", model);

        // Forward to the shop view page
        RequestDispatcher rq = req.getRequestDispatcher("views/shop.jsp");
        rq.forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Optionally handle POST requests, such as adding products to cart
        super.doPost(req, resp);
    }
}

