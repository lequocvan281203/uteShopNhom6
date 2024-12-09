package controller;

import java.io.IOException;
import java.util.List;

import  jakarta.servlet.RequestDispatcher;
import  jakarta.servlet.ServletException;
import  jakarta.servlet.annotation.WebServlet;
import  jakarta.servlet.http.HttpServlet;
import  jakarta.servlet.http.HttpServletRequest;
import  jakarta.servlet.http.HttpServletResponse;

import model.CategoryModel;
import model.ProductModel;
import paging.PageRequest;
import paging.Pageble;
import service.CategoryService;
import service.ProductService;
import serviceImpl.CategoryServiceImpl;
import serviceImpl.ProductServiceImpl;
import utils.FormUtil;

//@WebServlet(urlPatterns = {"/search", "/tim-kiem"})
//public class ProductSearchByName extends HttpServlet {
//
//	private static final long serialVersionUID = 1L;
//	CategoryService categoryservice = new CategoryServiceImpl();
//    ProductService productservice = new ProductServiceImpl();
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//        res.setContentType("text/html");
//        res.setCharacterEncoding("UTF-8");
//        req.setCharacterEncoding("UTF-8");
//
//        // Get All Categories
//        List<CategoryModel> allCategory = categoryservice.findAll();
//        req.setAttribute("allcategory", allCategory);
//
//        // Get Product search form parameters
//        ProductModel model = FormUtil.toModel(ProductModel.class, req);
//
//        String startPrice = req.getParameter("startPrice");
//        String endPrice = req.getParameter("endPrice");
//
//        // Initialize page request for pagination
//        Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem());
//
//        // Search by name or other filters
//        if (model.getKey() == null && model.getSearch() == null) {
//            // No search criteria provided
//            if (startPrice != null && endPrice != null) {
//                Long start = Long.parseLong(startPrice);
//                Long end = Long.parseLong(endPrice);
//                model.setListResult(productservice.findAllPrice(pageble, start, end));
//                model.setTotalItem(productservice.getTotalItemPrice(start, end));
//                model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
//            } else {
//                model.setListResult(productservice.findAll(pageble));
//                model.setTotalItem(productservice.getTotalItem());
//                model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
//            }
//        } else {
//			if (startPrice != null && endPrice != null) {
//				Long start = Long.parseLong(startPrice);
//				Long end = Long.parseLong(endPrice);
//				model.setListResult(
//						productservice.findAllSearchPrice(pageble, model.getKey(), model.getSearch(), start, end));
//				model.setTotalItem(productservice.getTotalItemSearchPrice(model.getKey(), model.getSearch(), start, end));
//				model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
//			} else {
//				model.setListResult(productservice.findAllSearch(pageble, model.getKey(), model.getSearch()));
//				model.setTotalItem(productservice.getTotalItemSearch(model.getKey(), model.getSearch()));
//				model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
//			}
//		}
//
//        // Forward result to JSP
//        req.setAttribute("productModel", model);
//        RequestDispatcher rq = req.getRequestDispatcher("views/product-search.jsp");
//        rq.forward(req, res);
//    }
//}
@WebServlet(urlPatterns = {"/search", "/tim-kiem"})
public class ProductSearchByName extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private CategoryService categoryService = new CategoryServiceImpl();
    private ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Đặt content type và encoding
        res.setContentType("text/html");
        res.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        // Lấy tất cả danh mục
        List<CategoryModel> allCategory = categoryService.findAll();
        req.setAttribute("allcategory", allCategory);

        // Lấy các tham số tìm kiếm
        String key = req.getParameter("key"); // Từ khóa tìm kiếm
        String search = req.getParameter("search"); // Từ khóa mô tả tìm kiếm
        String startPrice = req.getParameter("startPrice"); // Giá bắt đầu
        String endPrice = req.getParameter("endPrice"); // Giá kết thúc

        // Tạo model chứa các tham số phân trang
        ProductModel model = FormUtil.toModel(ProductModel.class, req);
        Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem());

        // Kiểm tra tìm kiếm
        if (key == null && search == null) {
            // Nếu không có từ khóa tìm kiếm, hiển thị tất cả sản phẩm
            if (startPrice != null && endPrice != null) {
                Long start = Long.parseLong(startPrice);
                Long end = Long.parseLong(endPrice);
                model.setListResult(productService.findAllPrice(pageble, start, end));
                model.setTotalItem(productService.getTotalItemPrice(start, end));
                model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
            } else {
                model.setListResult(productService.findAll(pageble));
                model.setTotalItem(productService.getTotalItem());
                model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
            }
        } else {
            // Tìm kiếm theo từ khóa
            if (startPrice != null && endPrice != null) {
                Long start = Long.parseLong(startPrice);
                Long end = Long.parseLong(endPrice);
                model.setListResult(productService.findAllSearchPrice(pageble, key, search, start, end));
                model.setTotalItem(productService.getTotalItemSearchPrice(key, search, start, end));
            } else {
                model.setListResult(productService.findAllSearch(pageble, key, search));
                model.setTotalItem(productService.getTotalItemSearch(key, search));
            }
            model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
        }

        // Trả về kết quả tìm kiếm
        req.setAttribute("model", model);
        req.setAttribute("key", key);
        req.setAttribute("search", search);

        // Chuyển tiếp kết quả tìm kiếm đến trang JSP
        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/shop.jsp");
        dispatcher.forward(req, res);
    }
}
