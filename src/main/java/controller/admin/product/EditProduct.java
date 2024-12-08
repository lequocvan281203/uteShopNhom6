package controller.admin.product;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.ProductModel;
import service.CategoryService;
import service.BrandService;
import service.ProductService;
import serviceImpl.BrandServiceImpl;
import serviceImpl.CategoryServiceImpl;
import serviceImpl.ProductServiceImpl;
import utils.FormUtil;

@WebServlet(urlPatterns = { "/admin-product-edit" })
@MultipartConfig
public class EditProduct extends HttpServlet{

	CategoryService categoryService = new CategoryServiceImpl();
	BrandService brandService = new BrandServiceImpl();
	ProductService productService = new ProductServiceImpl();
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		ProductModel model = FormUtil.toModel(ProductModel.class, req);
		if(model.getProductID()!=null) {
			model=productService.getOne(model.getProductID());
			req.setAttribute("imgHienTai",model.getImage());
		}
		req.setAttribute("Allbrand", brandService.findAll());
		req.setAttribute("Allcategory", categoryService.findAll());
		req.setAttribute("model",model);
		RequestDispatcher rq = req.getRequestDispatcher("views/admin/product/editproduct.jsp");
		rq.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		ProductModel model = FormUtil.toModel(ProductModel.class, req);
		try {
			List<String> imgs = new ArrayList<>();
			Collection<Part> parts = req.getParts();
			String realPath = req.getServletContext().getRealPath("/uploads");
			if(!Files.exists(Paths.get(realPath))) //kiem tra neu co thi bo qua co thi tao thu muc moi
			{
				Files.createDirectory(Paths.get(realPath));
			}
			
			for (Part part : parts) {
			    String filename = part.getSubmittedFileName();
			    if (filename != null && !filename.isEmpty()) {
			        String sanitizedFilename = Paths.get(filename).getFileName().toString();
			        if (!sanitizedFilename.isEmpty()) {
			            part.write(realPath + "/" + sanitizedFilename);
			            imgs.add(sanitizedFilename);
			        }
			    }
			}
			
			req.setAttribute("imgs",imgs);
		}
		catch (Exception e) {
			 System.out.println("Lỗi rồi");
			 e.printStackTrace();
		}
		if(model.getProductID()!=null) {
			ProductModel image = productService.getOne(model.getProductID());
			req.setAttribute("imgHienTai",image.getImage());
		}
		req.setAttribute("Allbrand", brandService.findAll());
		req.setAttribute("Allcategory", categoryService.findAll());
		req.setAttribute("model",model);
		RequestDispatcher rq = req.getRequestDispatcher("views/admin/product/editproduct.jsp");
		rq.forward(req, resp);
	}

}