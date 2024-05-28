package controller;

import java.io.IOException;
import java.net.InetAddress;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DetailProductDAO;
import dao.LogDAO;
import dao.ProductDAO;
import model.Account;
import model.Log;
import model.Product;

/**
 * Servlet implementation class SearchSP
 */
@WebServlet("/SearchSP")
public class SearchSP extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchSP() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String attribute = request.getParameter("attribute");
		String src = request.getHeader("Referer");
		if(attribute == null || attribute=="") {
			attribute = "searchTxt";
		}
		DetailProductDAO ct_spDAO = new DetailProductDAO();
		List<String> listLoai = ct_spDAO.listLoaiSP();
		request.setAttribute("listLoai", listLoai);
		if(attribute.equals("searchTxt")) {
			try {
				String txtSearch = request.getParameter("txtSearch");

				String indexString = request.getParameter("index");
				if(indexString==null) {
					indexString ="1";
				}
				System.out.println(indexString);
				int index= Integer.parseInt(indexString);
				System.out.println(txtSearch);
				ProductDAO spDAO = new ProductDAO();
				int count = spDAO.countSP(txtSearch);
				int pageSize = 15;
				int endPage =0;
				endPage = count/pageSize;
				if(count% pageSize !=0 && count> pageSize) {
					endPage ++;
				}
				if(endPage==0) {
					endPage=1;
				}
				HttpSession session = request.getSession();
				Account acc = (Account) session.getAttribute("userLogin");

				List<Product> listSearch = spDAO.search(txtSearch, index,pageSize);

				System.out.println(listSearch.toString());
				String nameAcc;
				if(acc==null){
					InetAddress ip = InetAddress.getLocalHost();
						nameAcc = ip.toString();

				}else {
					nameAcc = acc.getNameAcc();
				}


				if(listSearch.size() != 0){

					System.out.println(11);
					Log log = new Log(Log.ALERT, nameAcc, src, listSearch.toString(), 1);
					System.out.println(2);
					new LogDAO().add(log,request);

					System.out.println(log.toString());
				}
				if(listSearch.size() == 0){
					Log log;
					System.out.println(12);
					log = new Log(Log.WARNING, nameAcc, src, txtSearch, 3);
					new LogDAO().add(log,request);
				}
				request.setAttribute("list", listSearch);
				request.setAttribute("endPage", endPage);
				request.setAttribute("txtSearch", txtSearch);
				request.setAttribute("index", index);
				request.getRequestDispatcher("/SearchProduct.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}else {
			try {
				String txtSearch = request.getParameter("txtSearch");
				String proviso = request.getParameter("proviso");
				String loaiSP =  request.getParameter("loaiSP");
				String indexString = request.getParameter("index");
				if(indexString==null) {
					indexString ="1";
				}
				System.out.println(loaiSP);
				int index= Integer.parseInt(indexString);
				int pageSize = 15;
				ProductDAO spDAO = new ProductDAO();
				System.out.println(index);
				System.out.println(pageSize);
				System.out.println(proviso);
				System.out.println(attribute);
				System.out.println(txtSearch);
				System.out.println(loaiSP);
				List<Product> listSearch = spDAO.searchByAttribute(index, pageSize, proviso, attribute,txtSearch,loaiSP);
				System.out.println(listSearch);
				int count = new DetailProductDAO().tongLoai(loaiSP);
				System.out.println(count);
				int endPage =0;
				endPage = count/pageSize;
				if(count% pageSize !=0 && count> pageSize) {
					endPage ++;
				}
				if(endPage==0) {
					endPage=1;
				}
				request.setAttribute("loaiSP", loaiSP);
				request.setAttribute("list", listSearch);
				request.setAttribute("endPage", endPage);
				request.setAttribute("index", index);
				request.setAttribute("attribute", attribute);
				request.setAttribute("proviso", proviso);
				request.setAttribute("txtSearch", txtSearch);
				request.getRequestDispatcher("/SearchProduct.jsp").forward(request, response);
			} catch (Exception e) {
				e.getMessage();
			}


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
