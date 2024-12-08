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
import model.UserModel;
import service.CategoryService;
import serviceImpl.CategoryServiceImpl;


@WebServlet(urlPatterns = { "/contact" })
public class ContactController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	CategoryService categoryservice = new CategoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");

		List<CategoryModel> allCategory = categoryservice.findAll();
		req.setAttribute("allcategory", allCategory);

		RequestDispatcher rq = req.getRequestDispatcher("views/contact.jsp");
		rq.forward(req, resp);

		// Current page
		req.setAttribute("page", "contact");
	}

	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        // Get user input from the form
        String fullName = req.getParameter("fullName");
        String phoneNumber = req.getParameter("phoneNumber");
        String message = req.getParameter("message");

        // Assuming that you may need to create a UserModel for this contact
        UserModel user = new UserModel();
        user.setFullName(fullName);
        user.setSdt(phoneNumber);

        // Display a success message or redirect back to contact page
        req.setAttribute("successMessage", "Cảm ơn bạn đã liên hệ với chúng tôi. Chúng tôi sẽ phản hồi sớm.");
        RequestDispatcher rq = req.getRequestDispatcher("views/contact.jsp");
        rq.forward(req, resp);
    }
}