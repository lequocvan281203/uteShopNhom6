package controller.admin.api;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.BillModel;
import model.OrderItemModel;
import model.PromotionModel;
import service.BillService;
import service.ProductService;
import serviceImpl.BillServiceImpl;
import serviceImpl.ProductServiceImpl;
import utils.HttpUtil;
@WebServlet(urlPatterns = {"/api-bill"})

public class BillAPI extends HttpServlet{

	private static final long serialVersionUID = 1L;
	BillService billService = new BillServiceImpl();
	ProductService productService = new ProductServiceImpl();
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		BillModel billModel = HttpUtil.of(request.getReader()).toModel(BillModel.class);
		Boolean check = true;
		int SoLuong;
		BillModel billModels = billService.getOne(billModel.getBillID());
		for(OrderItemModel itemModel : billModels.getOrderItem()) {
			SoLuong = productService.checkAmountProductAfterResetStatus(itemModel.getProductID(),itemModel.getAmount());
			if(SoLuong<0) {
				check=false;
			}
		}
		if(check==true) 
		{
			billModel = billService.HuyThanhToanBill(billModel.getBillID());
			mapper.writeValue(response.getOutputStream(), billModel);
		}
		else 
		{
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Đặt mã trạng thái 400
		}
		
	}
	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		BillModel billModel = HttpUtil.of(request.getReader()).toModel(BillModel.class);
		billModel = billService.ThanhToanBill(billModel.getBillID());
		mapper.writeValue(response.getOutputStream(), billModel);
	}
	
	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8"); // định form tiếng việt
		response.setContentType("application/json");
		BillModel billModel = HttpUtil.of(request.getReader()).toModel(BillModel.class);
		billService.HuyDonHang(billModel.getIds());
		mapper.writeValue(response.getOutputStream(), "{}");
	}
}