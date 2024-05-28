package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class NewPassword
 */
@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String newPassword = request.getParameter("password");
		String newPass = EncryptionPass.toSHA1(newPassword);
		String confPassword = request.getParameter("confPassword");
		String email = request.getParameter("email");
	
		String userName = (String) session.getAttribute("userName");
		RequestDispatcher dispatcher = null;
		System.out.println("newPassword"+newPassword);
		System.out.println("confPassword" + confPassword);
		System.out.println("userName"+ userName);
		
		
			try {
				Account tk = AccountDAO.mapAccount.get(userName);
				if(!newPassword.equals(confPassword)) {
					request.setAttribute("error", "Mật khẩu nhập lại không đúng");
				}else if (tk != null & newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
					tk.setPassword(newPass);
					System.out.println(tk.toString());
					new AccountDAO().edit(userName, tk);
					request.setAttribute("status", "resetSuccess");
					session.removeAttribute("userName");
					request.getRequestDispatcher("Login.jsp").forward(request, response);
				} else {
					request.setAttribute("status", "resetFailed");
					request.getRequestDispatcher("forgotPass.jsp").forward(request, response);;
				}
							} catch (Exception e) {
				e.printStackTrace();
			}
	}
}
