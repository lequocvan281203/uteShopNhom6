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

@WebServlet(urlPatterns = {"/api-web-rigist"})

public class RigistAPI extends HttpServlet{
	UserService userService = new UserServiceImpl();
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		UserModel userModel = HttpUtil.of(request.getReader()).toModel(UserModel.class);
		UserModel checkUser = userService.findByUserNamePasswordStatus(userModel.getUserName(),null);
		if(checkUser==null) {
			userModel = userService.insertUser(userModel);
			mapper.writeValue(response.getOutputStream(), userModel);
		}
		else {
			 response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Đặt mã trạng thái 400
		}
		
	}
	
	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		UserModel userModel = HttpUtil.of(request.getReader()).toModel(UserModel.class);
		UserModel checkUser = userService.findByUserNamePasswordStatus(userModel.getUserName(),null);
		if(checkUser!=null) {
			UserModel checkSdt = userService.findByUserNameSdt(userModel.getUserName(),userModel.getSdt());
			if(checkSdt != null) {
				userModel.setId(checkSdt.getId());
				userModel = userService.changePassword(userModel);
				mapper.writeValue(response.getOutputStream(), userModel);
			}
			else {
				response.setStatus(HttpServletResponse.SC_CONFLICT); //Đặt mã trạng thái 409
			}
		}
		else {
			 response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Đặt mã trạng thái 400
		}
	}
	
	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8"); // định form tiếng việt
		response.setContentType("application/json");
		UserModel userModel = HttpUtil.of(request.getReader()).toModel(UserModel.class);
		userService.deleteUser(userModel.getIds());
		mapper.writeValue(response.getOutputStream(), "{}");
	}
}