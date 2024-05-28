package controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDAO;
import dao.AccountLockDAO;
import dao.LogDAO;
import model.*;
import util.EncryptionPass;

/**
 * Servlet implementation class LoginSerlet
 */
@WebServlet("/Login")
public class LoginSerlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// set Tiếng Việt cho serverlet
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String src = request.getHeader("Referer");
		//
		Map<String, String> erorr = new HashMap<String, String>();
		AccountLockDAO ald = new AccountLockDAO();
		String action = request.getParameter("action");
		System.out.println(action);
		if (action == null) {
			System.out.println("Không thực hiện");
		}
		if (action.equals("Logout")) {

			HttpSession session = request.getSession();
			Account tk = (Account) session.getAttribute("userLogin");

			Log log = new Log(Log.INFO,tk.getNameAcc(),src,"Logout",1);
			new LogDAO().add(log, request);
			session.invalidate();
			getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);

		}

		if (action.equals("Login")) {
			String userName = request.getParameter("email");
			String passOld = request.getParameter("pass");
			// capcha
			HttpSession session = request.getSession();


			System.out.println(passOld);
			System.out.println(userName);

			// lấy ra ngày hiện tại
			LocalDateTime currentDateTime = LocalDateTime.now();
			Date  currentDate = Date.valueOf(currentDateTime.toLocalDate());
			System.out.println(ald.mapAccountLock.get(userName));
			if(ald.mapAccountLock.get(userName)==null ||ald.mapAccountLock.get(userName).getDateLock()==null || ald.mapAccountLock.get(userName).getDateUnlock().compareTo(currentDate)< 0) {
				if (new AccountDAO().checkLogin(userName, passOld)) {
					Account tk = AccountDAO.mapAccount.get(userName);
					System.out.println(tk);

					session.setAttribute("userLogin", tk);

					Log log = new Log(Log.ALERT, userName, src, "Login Success", 1);
					new LogDAO().add(log, request);
					AccountLock al = ald.mapAccountLock.get(tk.getNameAcc());
					if(al!=null){
						al.setDateUnlock(null);
						al.setDateLock(null);
						al.setNumLoginFalse(0);
						ald.edit(tk.getNameAcc(),al);
					}
					System.out.println(src);
					request.getRequestDispatcher("/renderSP").forward(request, response);
				}
				// đăng nhập thất bại
				else {
					Account tk = AccountDAO.mapAccount.get(userName);
					if (tk == null) {
						erorr.put("erorrUser", "Tên đăng nhập không tồn tại");
						Log log = new Log(Log.WARNING, userName, src, "Login false because does not exist", 1);
						new LogDAO().add(log, request);
					} else {
						Log log = new Log(Log.ALERT, userName, src, "Login false because wrong password", 1);
						AccountLock accLock = ald.mapAccountLock.get(tk.getNameAcc());
						if (accLock == null) {
							AccountLock al = new AccountLock(tk.getNameAcc(), 1, null, null);
							ald.add(al);
						} else {
							int numLoginFalse = accLock.getNumLoginFalse();
							numLoginFalse++;
							accLock.setNumLoginFalse(numLoginFalse);

							LocalDateTime futureDateTime;
							// nếu sô lần đăng nhập sai bằng 5
							if (numLoginFalse == 5) {
								// lấy ra ngày hiện tại cộng 1
								futureDateTime = currentDateTime.plusDays(1);
								Date futureDate = Date.valueOf(futureDateTime.toLocalDate());
								accLock.setDateLock(currentDate);
								accLock.setDateUnlock(futureDate);
							} else if(numLoginFalse > 5) {
								futureDateTime = currentDateTime.plusDays(5);
								Date futureDate = Date.valueOf(futureDateTime.toLocalDate());
								accLock.setDateLock(currentDate);
								accLock.setDateUnlock(futureDate);
							}
							// cập nhật xuống database
							ald.edit(accLock.getNameAcc(), accLock);

						}

						erorr.put("erorrPass", "Sai mật khẩu");
						new LogDAO().add(log, request);
					}

					request.setAttribute("email", userName);
					request.setAttribute("erorr", erorr);
					getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);

				}
			}
			// nêú ngày khóa lớn hơn bằng 5
			else {
				long firstDateInMillis = currentDate.getTime();
				long secondDateInMillis  = ald.mapAccountLock.get(userName).getDateUnlock().getTime();
				// Tính số ngày chênh lệch

				long hourBetween = (secondDateInMillis - firstDateInMillis) / (1000 * 60 * 60);
				System.out.println(hourBetween);
				long daysBetween = (secondDateInMillis - firstDateInMillis) / (24 * 60 * 60 * 1000);
				if(hourBetween<25){
					erorr.put("erorrPass", "Tài khoản này hiện tại đang bị tạm khóa trong vòng " + hourBetween + " giờ ");
				}else {
					erorr.put("erorrPass", "Tài khoản này hiện tại đang bị tạm khóa trong vòng " + daysBetween + "ngày");
				}

				request.setAttribute("email", userName);
				request.setAttribute("erorr", erorr);
				getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
			}
		}else if (action.equals("Res")) {
			String ho = request.getParameter("lastName");
			String ten = request.getParameter("firstName");
			String tenTaiKhoan = request.getParameter("userName");
			String matKhau = request.getParameter("pass");
			String email = request.getParameter("email");
			String reMatKhau = request.getParameter("repass");
			String gioiTinh = request.getParameter("sex");
			String ngaySinh = request.getParameter("dob");
			String sdt = request.getParameter("telephone");
			boolean ok = true;
			Account user = AccountDAO.mapAccount.get(tenTaiKhoan);
			if(user != null) {
				erorr.put("erorrTK", "Tài khoản đã tồn tại");
				ok =false;
			}
			if(!matKhau.equals(reMatKhau)){
				erorr.put("erorrRepass", "Mật khẩu không trùng khớp");
				ok =false;

			}
			if(ok) {
				try {
					src = "/Register";
					matKhau = EncryptionPass.toSHA1(matKhau);
					Account tk = new Account( tenTaiKhoan, matKhau, ho+" "+ten, gioiTinh, sdt, email, ngaySinh, null,0 ,"0");
					HttpSession session = request.getSession();
					AccountDAO.mapAccount.put(tk.getNameAcc(), tk);
					session.setAttribute("userLogin", tk);
					Log log = new Log(Log.ALERT, tenTaiKhoan, src, "Register Success", 1);
					new LogDAO().add(log, request);
					// add vào db
					new AccountDAO().add(tk);
					getServletContext().getRequestDispatcher("/renderSP").forward(request, response);

				}catch(Exception e){
					e.getStackTrace();
				}
			}else {
				request.setAttribute("erorr", erorr);
				Log log = new Log(Log.WARNING, tenTaiKhoan, src, erorr.values().toString(), 1);
				new LogDAO().add(log, request);
				getServletContext().getRequestDispatcher("/register.jsp").forward(request, response);
			}
		}else if(action.equals("change")) {
			String passOld = request.getParameter("passOld");
			String passNew = request.getParameter("passNew");
			String rePassNew  = request.getParameter("rePassNew");
			HttpSession session = request.getSession();
			Account tk = (Account) session.getAttribute("userLogin");
			boolean ok = true;
			if(!tk.getPassword().equals(EncryptionPass.toSHA1(passOld))) {
				erorr.put("FaslePass", "Sai mật khẩu");
				ok= false;
			}
			if(!passNew.equals(rePassNew)) {
				erorr.put("notMatch", "Mật khẩu không khớp");
				ok =false;
			}
			if(ok) {
				String pass = EncryptionPass.toSHA1(passNew);

				Account user = new Account(tk.getNameAcc(), pass, tk.getUserName(), tk.getSex(), tk.getPhoneNum(), tk.getEmail(), tk.getDayOfBirth(), tk.getAddress(), 0,tk.getRole());
				new AccountDAO().edit(tk.getNameAcc(), user);
				session.setAttribute("userLogin", user);
				request.getRequestDispatcher("renderSP").forward(request, response);
			}else {
				request.setAttribute("erorr", erorr);
				getServletContext().getRequestDispatcher("/changePass.jsp").forward(request, response);
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// set Tiếng Việt cho serverlet
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//
		doGet(request, response);

	}

}
