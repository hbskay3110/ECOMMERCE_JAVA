package controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDAO;


import javax.mail.*;
import javax.mail.internet.*;

/**
 * Servlet implementation class ForgotPass
 */
@WebServlet("/ForgotPass")
public class ForgotPass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ForgotPass() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String email = request.getParameter("email");
			String userName = request.getParameter("userName");
			HttpSession session = request.getSession();
			AccountDAO tk = new AccountDAO();

			if (tk.checkUserExist(userName) == null) {
				request.setAttribute("message", "Tài khoản chưa tồn tại");
				request.getRequestDispatcher("forgotPass.jsp").forward(request, response);
			}else if(!email.equals(tk.mapAccount.get(userName).getEmail())){
				request.setAttribute("erorrEmail", "Email không khớp");
				request.getRequestDispatcher("forgotPass.jsp").forward(request, response);
			} else  {
				Random random = new Random();
				int otp = random.nextInt(9999999);
				String to = email;
				Properties pro = new Properties();
				pro.put("mail.smtp.host", "smtp.gmail.com");
				pro.put("mail.smtp.socketFactory.port", "465");
				pro.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				pro.put("mail.smtp.auth", "true");
				pro.put("mail.smtp.port", "465");
				Session ses = Session.getDefaultInstance(pro, new Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("brothershop2023@gmail.com", "aimmzztwktiodrrl");
					}
				});
				try {
					MimeMessage mess = new MimeMessage(ses);
					mess.setFrom(new InternetAddress(email));
					mess.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
					mess.setSubject("Hello " + userName);
					mess.setText("Your OTP is: " + otp);
					Transport.send(mess);
					System.out.println("send success");
				} catch (MessagingException m) {
					m.getStackTrace();
				}
				request.setAttribute("mess", "OTP is sent to your email id");
				session.setAttribute("userName", userName);
				session.setAttribute("otp", otp);
				session.setAttribute("email", email);
				request.getRequestDispatcher("EnterOtp.jsp").forward(request, response);
			}

		} catch (Exception e) {
			e.getStackTrace();
		}
	}

}
