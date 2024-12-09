package controller;

import java.io.IOException;
import java.util.List;

import  jakarta.servlet.RequestDispatcher;
import  jakarta.servlet.ServletException;
import  jakarta.servlet.annotation.WebServlet;
import  jakarta.servlet.http.HttpServlet;
import  jakarta.servlet.http.HttpServletRequest;
import  jakarta.servlet.http.HttpServletResponse;

import model.BrandModel;
import model.CategoryModel;
import paging.PageRequest;
import paging.Pageble;
import service.BrandService;
import service.CategoryService;
import serviceImpl.BrandServiceImpl;
import serviceImpl.CategoryServiceImpl;
import utils.FormUtil;

@WebServlet(urlPatterns = { "/brand" })
public class BrandController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    BrandService brandService = new BrandServiceImpl();
    CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        res.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        // Lấy tất cả các danh mục để hiển thị trên navbar
        List<CategoryModel> allCategory = categoryService.findAll();
        req.setAttribute("allcategory", allCategory);

        // Xử lý phân trang
        BrandModel model = FormUtil.toModel(BrandModel.class, req);
        Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem());
        List<BrandModel> allBrand = brandService.findAll(pageble);

        // Tính toán tổng số mặt hàng và số trang
        model.setTotalItem(brandService.getTotalItem());
        int totalPage = (int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem());
        model.setTotalPage(totalPage);

        req.setAttribute("allbrand", allBrand);
        req.setAttribute("page", model);  // Truyền thông tin trang vào request để có thể hiển thị trên giao diện

        // Chuyển tiếp yêu cầu tới view
        RequestDispatcher rq = req.getRequestDispatcher("views/brand.jsp");
        rq.forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
