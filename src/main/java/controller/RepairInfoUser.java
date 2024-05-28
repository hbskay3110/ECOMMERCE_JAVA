package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDAO;
import model.Account;

/**
 * Servlet implementation class RepairInfoUser
 */
@WebServlet("/product/RepairInfoUser")
public class RepairInfoUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RepairInfoUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String ten = request.getParameter("name");
		String email = request.getParameter("email");
		String sdt = request.getParameter("telephone");
		String gioiTinh = request.getParameter("sex");
		String dob = request.getParameter("dob");
		String diaChi = request.getParameter("address");
		HttpSession session = request.getSession();
		Account userLogin  = (Account) session.getAttribute("userLogin");
		Account tk = new Account(userLogin.getNameAcc(), userLogin.getPassword(), ten, gioiTinh, ten, email, dob, diaChi, 0,userLogin.getRole());
		new AccountDAO().edit(userLogin.getNameAcc(), tk);
		session.setAttribute("userLogin", tk);
		request.getRequestDispatcher("/product/DetailUser").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		doGet(request, response);
	}

}
