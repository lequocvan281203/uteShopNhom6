package controller.api;

import java.io.IOException;

import  jakarta.servlet.ServletException;
import  jakarta.servlet.annotation.WebServlet;
import  jakarta.servlet.http.HttpServlet;
import  jakarta.servlet.http.HttpServletRequest;
import  jakarta.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.UserModel;
import service.UserService;
import serviceImpl.UserServiceImpl;
import utils.HttpUtil;

@WebServlet(urlPatterns = {"/api-admin-updateuser"})

public class UpdateUserAPI extends HttpServlet {
	UserService userService = new UserServiceImpl();
	private static final long serialVersionUID = 8705980353891812140L;
	
	
	
	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		UserModel userModel = HttpUtil.of(request.getReader()).toModel(UserModel.class);
		userModel = userService.updateUser(userModel);
		mapper.writeValue(response.getOutputStream(), userModel);
		
	}
	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		UserModel userModel = HttpUtil.of(request.getReader()).toModel(UserModel.class);
		userModel = userService.updateStatusUser(userModel.getId());
		mapper.writeValue(response.getOutputStream(), userModel);
	}
	
}