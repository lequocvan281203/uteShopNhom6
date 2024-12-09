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

        // Lấy danh sách tất cả các danh mục để hiển thị trên navbar
        List<CategoryModel> allCategory = categoryservice.findAll();
        req.setAttribute("allcategory", allCategory);

        // Tạo ProductModel để xử lý tìm kiếm và phân trang
        ProductModel model = FormUtil.toModel(ProductModel.class, req);

        // Lấy giá trị từ request cho khoảng giá và tìm kiếm
        String startPrice = req.getParameter("startPrice");
        String endPrice = req.getParameter("endPrice");
        String searchKey = req.getParameter("key");
        String search = req.getParameter("search");

        // Phân trang
        Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem());

        // Kiểm tra nếu không có tìm kiếm hoặc lọc giá
        if (searchKey == null && search == null) {
            // Lọc theo khoảng giá nếu có
            if (startPrice != null && endPrice != null) {
                try {
                    Long start = Long.parseLong(startPrice);
                    Long end = Long.parseLong(endPrice);
                    model.setListResult(productservice.findAllPrice(pageble, start, end));
                    model.setTotalItem(productservice.getTotalItemPrice(start, end));
                    model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
                } catch (NumberFormatException e) {
                    // Xử lý lỗi nếu khoảng giá không hợp lệ
                    req.setAttribute("error", "Khoảng giá không hợp lệ.");
                }
            } else {
                // Nếu không có lọc giá, hiển thị tất cả sản phẩm
                model.setListResult(productservice.findAll(pageble));
                model.setTotalItem(productservice.getTotalItem());
                model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
            }
        } else {
            // Tìm kiếm sản phẩm
            if (searchKey != null && !searchKey.isEmpty()) {
                model.setListResult(productservice.findAllSearch(pageble, searchKey, search));
                model.setTotalItem(productservice.getTotalItemSearch(searchKey, search));
                model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
            } else {
                // Nếu không có tìm kiếm từ khóa, chỉ lọc theo khoảng giá
                if (startPrice != null && endPrice != null) {
                    try {
                        Long start = Long.parseLong(startPrice);
                        Long end = Long.parseLong(endPrice);
                        model.setListResult(productservice.findAllSearchPrice(pageble, searchKey, search, start, end));
                        model.setTotalItem(productservice.getTotalItemSearchPrice(searchKey, search, start, end));
                        model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
                    } catch (NumberFormatException e) {
                        req.setAttribute("error", "Khoảng giá không hợp lệ.");
                    }
                } else {
                    model.setListResult(productservice.findAllSearch(pageble, searchKey, search));
                    model.setTotalItem(productservice.getTotalItemSearch(searchKey, search));
                    model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
                }
            }
        }

        // Đặt model sản phẩm vào request để sử dụng trong JSP
        req.setAttribute("model", model);

        // Chuyển hướng đến trang shop.jsp để hiển thị kết quả
        RequestDispatcher rd = req.getRequestDispatcher("/views/shop.jsp");
        rd.forward(req, res);
    }



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Optionally handle POST requests, such as adding products to cart
        super.doPost(req, resp);
    }
}


