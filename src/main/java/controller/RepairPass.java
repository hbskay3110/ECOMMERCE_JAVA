package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Account;

/**
 * Servlet implementation class RepairPass
 */
@WebServlet("/RepairPass")
public class RepairPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RepairPass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession();
		Account tk = (Account) session.getAttribute("userLogin");
		String pass= request.getParameter("pass");
		String rePass = request.getParameter("rePass");
		String oldPass = request.getParameter("oldPass");
		Map<String, String> erorr = new HashMap<String, String>();
		if(oldPass==null) {
			erorr.put("noOldPass", "Trường này không được để trống");
		}
		if(pass==null) {
			erorr.put("noPass", "Trường này không được để trống");
		}
		if(rePass==null) {
			erorr.put("noRePass", "Trường này không được để trống");
		}
		if(tk.getPassword().equals(oldPass)) {
			if(rePass.equals(pass)) {
				request.getRequestDispatcher("/product/DetailUser").forward(request, response);
			}else {
				erorr.put("noMatchPass", "Mật khẩu không trùng khớp");
			}
		}else {
			erorr.put("falsePass", "Sai mật khẩu");
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
