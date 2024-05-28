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

import dao.AccountDAO;
import model.Account;
import util.EncryptionPass;

/**
 * Servlet implementation class Admin
 */
@WebServlet("/startbootstrap-sb-admin-2-master/Admin")
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// set Tiếng Việt cho serverlet
		try{
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			String LogInOrOut = request.getParameter("Logout");
			if(LogInOrOut==null) {
				LogInOrOut = "in";
			}
			if(LogInOrOut.equals("Out")) {
				HttpSession session = request.getSession();
				session.invalidate();
				getServletContext().getRequestDispatcher("/startbootstrap-sb-admin-2-master/Login.jsp").forward(request, response);
			}else {
				String adminName = request.getParameter("adminName");
				String pass = request.getParameter("adminPass");
				System.out.println(pass);
				Map<String, String> erorr = new HashMap<String, String>();
				boolean ok = true;
				AccountDAO tk = new AccountDAO();
				Account user = tk.mapAccount.get(adminName);
				System.out.println(user);
				HttpSession session = request.getSession();
				if(user == null || user.getRole().equals("0")) {
					erorr.put("noAdmin", "Tài khoản không tồn tại");
					ok= false;
				}else {
					String mk = EncryptionPass.toSHA1(pass);
					if(!user.getPassword().equals(mk)) {
						request.setAttribute("adminName", adminName);
						erorr.put("falsePass", "Sai mật khẩu");
						ok= false;
					}
				}


				if(!ok) {
					request.setAttribute("erorr", erorr);
					request.getRequestDispatcher("/startbootstrap-sb-admin-2-master/Login.jsp").forward(request, response);
				}
				if(ok) {
					session.setAttribute("userLogin", user);
					request.setAttribute("tkAdmin", tk.mapAccount);
					request.getRequestDispatcher("/startbootstrap-sb-admin-2-master/index.jsp").forward(request, response);

				}
			}
		}catch (Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

				
					
				
				
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		doGet(request, response);
	}

}
