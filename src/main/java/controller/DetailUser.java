package controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.FavouriteProductDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import model.Favourite;
import model.OrderProduct;
import model.Account;

/**
 * Servlet implementation class DetailUser
 */
@WebServlet("/product/DetailUser")
public class DetailUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DetailUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			HttpSession session = request.getSession();
			Account tk = (Account) session.getAttribute("userLogin");

			OrderDAO dhDAO = new OrderDAO();
			List<OrderProduct> dh = dhDAO.top5DonHang(tk.getNameAcc());
			request.setAttribute("donHang", dh);
			System.out.println("Đơn hàng : "+dh);

			FavouriteProductDAO favDAO = new FavouriteProductDAO();
			List<Favourite> fav = favDAO.getFavoriteProducts(tk.getNameAcc());

			request.setAttribute("favourite", fav);
			System.out.println("Sản phẩm yêu thích: " + fav);
			request.getRequestDispatcher("/product/my-account.jsp").forward(request, response);
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