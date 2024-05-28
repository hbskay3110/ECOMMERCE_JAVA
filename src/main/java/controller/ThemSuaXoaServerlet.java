package controller;



import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDAO;
import dao.LogDAO;
import model.ConnectToDatabase;
import model.Account;
import model.Log;
import util.EncryptionPass;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/startbootstrap-sb-admin-2-master/ThemSuaXoaServerlet")
public class ThemSuaXoaServerlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ThemSuaXoaServerlet() {
		super();

	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String chucNang = request.getParameter("chucNang");
		HttpSession session = request.getSession();
		Account tkLogin = (Account) session.getAttribute("userLogin");
		String src = request.getHeader("Referer");
		Map<String, String> erorr = new HashMap<String, String>();
		// set Tiếng Việt cho serverlet
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		// kiểm tra chức năng
		// lấy dữ liệu
		System.out.println("chucNang " +chucNang);
		AccountDAO tk = new AccountDAO();
		if(chucNang==null) {
			chucNang="Them";
		}
		String a = request.getParameter("action");
		System.out.println(a);
		//Xóa
		if(chucNang.equals("Xoa")) {
			chucNang = request.getParameter("chucNang");
			String id = request.getParameter("id");
			System.out.println(id);
			Log log = new Log(Log.DANGER,tkLogin.getNameAcc(),src,"Delete: " + tk.mapAccount.get(id).toString(),1);
			new LogDAO().add(log,request);
			new AccountDAO().delete(id);
			System.out.println(tk.mapAccount);
			request.setAttribute("tkAdmin", tk.mapAccount);
			getServletContext().getRequestDispatcher("/startbootstrap-sb-admin-2-master/manage?loai=user").forward(request, response);
		}
		//Thêm
		if(chucNang.equals("Them")) {
			boolean isOk = true;
			String tenTaiKhoan = request.getParameter("userName");
			String matKhau = request.getParameter("passWord");
			String reMatKhau = request.getParameter("rePassWord");

			ConnectToDatabase con = new ConnectToDatabase();
			try {
				String query = "select * from Accounts";
				Connection connect = new ConnectToDatabase().getConnection();
				Statement stmt =  connect.createStatement();
				ResultSet rs=	stmt.executeQuery(query);
				while (rs.next()) {
					if(rs.getString(2).equals(tenTaiKhoan)) {
						erorr.put("duplicateUserName", "Tài khoản đã tồn tại");
						isOk =false;
					}

				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(tenTaiKhoan== null || tenTaiKhoan.equals("")) {
				erorr.put("NoUserName", "Trường này không được bỏ trống");
				isOk =false;
			}
			if(matKhau== null || matKhau.equals("")) {
				erorr.put("NoPass", "Trường này không được bỏ trống");
				isOk =false;
			}
			if(reMatKhau== null || reMatKhau.equals("")) {
				erorr.put("NoRePass", "Trường này không được bỏ trống");
				isOk =false;
			}
			//check có trùng tài khoản không

			// check mật khẩu
			if(!matKhau.equals(reMatKhau)) {
				erorr.put("erorrRepass", "Mật khẩu không trùng khớp");
				isOk =false;
			}
			if(isOk) {
				try {
					String tenKhachHang = request.getParameter("NameKH");
					System.out.println(tenKhachHang);
					String gioiTinh = request.getParameter("sex");
					String sdt = request.getParameter("telephone");
					String email = request.getParameter("email");
					String ngaySinh = request.getParameter("dayOfBith");
					String diaChi = request.getParameter("address");
					String quyen =  request.getParameter("rights");
					Account user = new Account(tenTaiKhoan, matKhau, tenKhachHang, gioiTinh, sdt, email, ngaySinh, diaChi,0, quyen);
					new AccountDAO().add(user);
					request.setAttribute("tkAdmin",  new AccountDAO().mapAccount);
					Log log = new Log(Log.ALERT,tkLogin.getNameAcc(),src,"Add: " + user.toString(),1);
					new LogDAO().add(log,request);
					getServletContext().getRequestDispatcher("/startbootstrap-sb-admin-2-master/manage?loai=user").forward(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println(e.getMessage());
				}
			}else {
				Log log = new Log(Log.WARNING,tkLogin.getNameAcc(),src,"Add false: " + erorr.toString(),1);
				new LogDAO().add(log,request);
				request.setAttribute("erorr", erorr);
				getServletContext().getRequestDispatcher("/startbootstrap-sb-admin-2-master/addUser.jsp").forward(request, response);
			}


		}
		String taikhoan = request.getParameter("userName");
		if(chucNang.equals("Sua")) {
			ServletContext contextID = getServletContext();
			String id = (String) contextID.getAttribute("id");
			String tenTaiKhoan = request.getParameter("userName");
			String matKhau = request.getParameter("passWord");
			String reMatKhau = request.getParameter("rePassWord");
			ConnectToDatabase con = new ConnectToDatabase();
			boolean isOk = true;
			try {
				String query = "select * from Accounts";
				Connection connect = new ConnectToDatabase().getConnection();
				Statement stmt =  connect.createStatement();
				ResultSet rs=	stmt.executeQuery(query);
				while (rs.next()) {
					if(rs.getString(1).equals(tenTaiKhoan) && taikhoan!= tenTaiKhoan) {
						erorr.put("duplicateUserName", "Tài khoản đã tồn tại");
						isOk =false;
					}

				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			if(isOk) {
				String tenKhachHang = request.getParameter("NameKH");
				String gioiTinh = request.getParameter("sex");
				String sdt = request.getParameter("telephone");
				String email = request.getParameter("email");
				String ngaySinh = request.getParameter("dayOfBith");
				String diaChi = request.getParameter("address");
				String quyen =  request.getParameter("rights");
				matKhau = EncryptionPass.toSHA1(matKhau);
				Log log = new Log(Log.ALERT,tkLogin.getNameAcc(),src,"Edit" + tk.mapAccount.get(id).toString(),1);
				new LogDAO().add(log,request);
				Account user = new Account(id, matKhau, tenKhachHang, gioiTinh, sdt, email, ngaySinh, diaChi,0, quyen);
				new AccountDAO().edit(id, user);
				request.setAttribute("tkAdmin", tk.mapAccount);
				getServletContext().getRequestDispatcher("/startbootstrap-sb-admin-2-master/manage?loai=user").forward(request, response);
			}else {
				Log log = new Log(Log.WARNING,tkLogin.getNameAcc(),src,"Edit False" + tk.mapAccount.get(id).toString(),1);
				new LogDAO().add(log,request);
				request.setAttribute("erorr", erorr);
				getServletContext().getRequestDispatcher("/startbootstrap-sb-admin-2-master/addUser.jsp").forward(request, response);
			}

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		doGet(request, response);
	}

}
