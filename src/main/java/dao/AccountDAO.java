package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import javax.mail.*;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import model.ConnectToDatabase;
import model.OrderProduct;
import util.EncryptionPass;
import model.Account;

public class AccountDAO implements ObjectDAO {
	public static Map<String, Account> mapAccount = loadData();


	public AccountDAO() {
		// TODO Auto-generated constructor stub
	}

	private static Map<String, Account> loadData() {
		Map<String, Account> mapTemp = new HashMap<String, Account>();
		try {
			String query = "select * from Accounts";
			Connection connect = new ConnectToDatabase().getConnection();
			Statement stmt =  connect.createStatement();
			ResultSet rs=	stmt.executeQuery(query);
			while (rs.next()) {
				String nameAcc = rs.getString(1);
				String password = rs.getString(2);
				String userName = rs.getString(3);
				String sex = rs.getString(4);
				String phoneNum = rs.getString(5);
				String email = rs.getString(6);
				String dayOfBirth = rs.getString(7);
				String address = rs.getString(8);
				int    typeAccount = rs.getInt(9);
				String role = rs.getString(10);

				Account user = new Account(nameAcc, password, userName, sex, phoneNum, email, dayOfBirth,
						address, typeAccount, role);
				mapTemp.put(user.getNameAcc(), user);

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mapTemp;

	}

	public boolean checkLogin(String userName, String passWord) {
		Account user = mapAccount.get(userName);
		passWord = EncryptionPass.toSHA1(passWord);
		if (user != null) {
			if (user.getPassword().equals(passWord)) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

	public boolean changePass(String userName, String newPass) {
		Account user = mapAccount.get(userName);
		if (user != null) {
			user.setPassword(newPass);
			mapAccount.replace(user.getNameAcc(), user);
			edit(user.getNameAcc(), user);
			return true;
		} else {
			return false;
		}
	}

//	public static boolean sendMail(String to, String subject, String text) {
//		Properties props = new Properties();
//		props.put("mail.smtp.auth", "true");
//		props.put("mail.smtp.starttls.enable", "true");
//		props.put("mail.smtp.host", "smtp.gmail.com");
//		props.put("mail.smtp.port", "587");
//
//		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
//			@Override
//			protected PasswordAuthentication getPasswordAuthentication() {
//				return new PasswordAuthentication("ntkien123@gmail.com", "");
//			}
//		});
//		try {
//			Message message = new MimeMessage(session);
//			message.setHeader("Content-Type", "text/plain; charset=UTF-8");
//			message.setFrom(new InternetAddress("shopphoneltw@gmail.com"));
//			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
//			message.setSubject(subject);
//			message.setText(text);
//			Transport.send(message);
//		} catch (MessagingException e) {
//			e.getMessage();
//			return false;
//		}
//
//		return true;
//	}

//	public boolean passRecorvery(String userName, String email) {
//
//		Account tk = mapAccount.get(userName);
//		if (tk != null) {
//			sendMail(email, "Cập nhật lại mật khẩu", tk.getPassword());
//			return true;
//		} else {
//			return false;
//		}
//
//	}

	public static void main(String[] args) {
		AccountDAO tkDao = new AccountDAO();
		System.out.println(tkDao.mapAccount);
//		System.out.println(tkDao.checkLogin("anphan219", "phanan219"));
//		System.out.println(tkDao.checkLogin("anphan29", "phanan219"));
//		System.out.println(tkDao.passRecorvery("anphan219", "phanthyan123@gmail.com"));
	}
	// kiểm tra một tài khoản đã tồn tại hay chưa
		public Account checkUserExist(String userName) {
			Account tk = mapAccount.get(userName);
			if(tk!=null) {
				return tk;
			}else {
				return null;
			}
		}
	@Override
	public boolean add(Object obj) {
		Account tk = (Account) obj;
		mapAccount.put(tk.getNameAcc(), tk);
		String sql = "insert into Accounts values(?,?,?,?,?,?,?,?,?,?)";

		try {
			Connection connect = new ConnectToDatabase().getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			;
			ppstm.setString(1, tk.getNameAcc());
			ppstm.setString(2, tk.getPassword());
			ppstm.setString(3, tk.getUserName());
			ppstm.setString(4, tk.getSex());
			ppstm.setString(5, tk.getPhoneNum());
			ppstm.setString(6, tk.getEmail());
			ppstm.setString(7, tk.getDayOfBirth());
			ppstm.setString(8, tk.getAddress());
			ppstm.setInt   (9, tk.getTypeAccount());
			ppstm.setString(10, tk.getRole());
			ppstm.executeUpdate();
			return true;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return false;
	}

	@Override
	public boolean edit(String id, Object obj) {
		Account tk = (Account) obj;
		mapAccount.replace(id, tk);
		try {
			String sql = "update Accounts set Password=?,UserName=?,Sex=?,PhoneNum=?,Email=?,DayOfBirth=?,Address=?,typeAccount=?,Role=? where NameAcc=?";
			Connection connect = new ConnectToDatabase().getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1, tk.getPassword());
			ppstm.setString(2, tk.getUserName());
			ppstm.setString(3, tk.getSex());
			ppstm.setString(4, tk.getPhoneNum());
			ppstm.setString(5, tk.getEmail());
			ppstm.setString(6, tk.getDayOfBirth());
			ppstm.setString(7, tk.getAddress());
			ppstm.setInt(8, tk.getTypeAccount());
			ppstm.setString(9, tk.getRole());
			ppstm.setString(10, id);
			ppstm.executeUpdate();
			return true;

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return false;

	}

	public List<Account> getUser(String role) {
		List<Account> rs = new ArrayList<>();
		for(Account a : mapAccount.values()){
			if(role.equals("1")){
				if(a.getRole().equals("0")){
					rs.add(a);
				}
			}
			if(role.equals("2")){
				if(!a.getRole().equals("2")){
					rs.add(a);
				}
			}
		}
		return rs;
	}

	@Override
	public boolean delete(String nameAcc) {
		mapAccount.remove(nameAcc);
		try {
			String sql = "delete from Accounts where nameAcc='" + nameAcc + "'";
			Connection connect = new ConnectToDatabase().getConnection();
			Statement stmt =  connect.createStatement();
			stmt.executeUpdate(sql);
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

}
