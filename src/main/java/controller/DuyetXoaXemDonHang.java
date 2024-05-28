package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.*;
import model.*;

/**
 * Servlet implementation class DuyetXoaXemDonHang
 */
@WebServlet("/startbootstrap-sb-admin-2-master/DuyetXoaXemDonHang")
public class DuyetXoaXemDonHang extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DuyetXoaXemDonHang() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String maDH = request.getParameter("id");
			String chucNang = request.getParameter("chucNang");
			String index = request.getParameter("index");
			OrderDAO dhDAO = new OrderDAO();
			DetailOrderDAO dsDH_DAO = new DetailOrderDAO();
			HttpSession session = request.getSession();
			Account tkLogin = (Account) session.getAttribute("userLogin");
			String src = request.getHeader("Referer");

			if(chucNang.equals("Xoa")) {
				Log log = new Log(Log.DANGER,tkLogin.getNameAcc(),src,"Delete Order: " + dhDAO.mapDonHang.get(maDH),1);
				new LogDAO().add(log);
				dhDAO.delete(maDH);
				dsDH_DAO.delete(maDH);
				request.getRequestDispatcher("/startbootstrap-sb-admin-2-master/manage?loai=oder&index="+index+"").forward(request, response);
			}else if(chucNang.equals("Duyet")) {
				OrderProduct dh = dhDAO.mapDonHang.get(maDH);
				Log log = new Log(Log.ALERT,tkLogin.getNameAcc(),src,"Order browsing: " +dh,1);
				new LogDAO().add(log);
				OrderProduct dhNew = new OrderProduct(maDH, dh.getNameAcc(), dh.getDateOrder(),dh.getDateDelivery(), dh.getTotalMoney(), dh.getPhone(), dh.getNameRecipient(), dh.getAddress(), dh.getNote(), dh.getCheckout(), "1");
				dhDAO.edit(maDH, dhNew);
				request.getRequestDispatcher("/startbootstrap-sb-admin-2-master/manage?loai=oder").forward(request, response);
			}else if(chucNang.equals("Xem")){
				DetailOrderDAO ds = new DetailOrderDAO();
				List<DetailOrder> listDS = ds.dsDHByMaDH(maDH);
				ProductDAO spDAO = new ProductDAO();
				List<BillProduct> listBill = new ArrayList<BillProduct>();
				for (DetailOrder d : listDS) {
					Product s = spDAO.mapProduct.get(d.getIdP());
					BillProduct bill = new BillProduct(s.getIdP(), s.getNameP(),s.getPriceP(),d.getAmount(),d.getPrice(),s.getListImage().get(0).getNameI());
					listBill.add(bill);
				}
				System.out.println(listBill);
				OrderProduct donHang = OrderDAO.mapDonHang.get(maDH);
				request.setAttribute("donHang", donHang);
				request.setAttribute("index", index);
				request.setAttribute("listBill", listBill);
				request.getRequestDispatcher("/startbootstrap-sb-admin-2-master/DetailOder.jsp").forward(request, response);
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		// TODO Auto-generated method stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
