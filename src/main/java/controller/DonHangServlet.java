package controller;

import dao.DetailOrderDAO;
import dao.OrderDAO;
import model.Account;
import model.BillProduct;
import model.DetailOrder;
import model.OrderProduct;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

/**
 * Servlet implementation class DonHang
 */
@WebServlet("/DonHang")
public class DonHangServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @param date 
     * @param string2 
     * @param string 
     * @see HttpServlet#HttpServlet()
     */


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String radio = request.getParameter("radio_button");
			String fName= request.getParameter("Firstname");
			String telephone = request.getParameter("telephone");
			String note = request.getParameter("note");
			String id = request.getParameter("idOder");
			String dateDeliveryOder = request.getParameter("dateDeliveryOder");
			String addressOder = request.getParameter("addressOder");
			String addressDetail = request.getParameter("address-details");
			addressOder = addressDetail + ","+ addressOder;
			HttpSession session = request.getSession();
			Account tk = (Account) session.getAttribute("userLogin");
			Map<String, BillProduct> ds = (Map<String, BillProduct>) session.getAttribute("cart");
			double tong = (double) session.getAttribute("fullPrice");
			String fee = (String) session.getAttribute("fee");

			int feeInt;
			try{
				feeInt  = Integer.parseInt(fee)/1000;
				tong = tong +feeInt;
			} catch (Exception e){
				feeInt = 0;
				e.printStackTrace();
			}
			String tongS = String.valueOf(tong);
			if(fName==null) fName = tk.getUserName();
			if(telephone==null) telephone = tk.getPhoneNum();

			String date = String.valueOf(java.time.LocalDate.now());

			for (BillProduct product : ds.values()) {

				DetailOrder ds_dh = new DetailOrder(id, product.getIdP(), product.getQuantity(), product.getTotal());
				new DetailOrderDAO().add(ds_dh);
			}
			if(radio.equals("button1")) {
				OrderProduct dh = new OrderProduct(id, tk.getNameAcc(), date,dateDeliveryOder, tongS, telephone, fName, addressOder, note,"0", "0");
				new OrderDAO().add(dh);
				session.removeAttribute("sizeCart");
				session.removeAttribute("cart");
				request.getRequestDispatcher("/renderSP").forward(request, response);
			}
			if(radio.equals("button2")) {
				request.setAttribute("total", tong);
				session.removeAttribute("sizeCart");
				session.removeAttribute("cart");
				request.getRequestDispatcher("paypal.jsp").forward(request, response);
			}

		}catch (Exception e){
			e.printStackTrace();
		}

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
