package dao;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;
import javax.mail.*;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.google.gson.Gson;
import com.restfb.json.Json;
import model.ConnectToDatabase;
import model.OrderProduct;
import util.EncryptionPass;
import model.Log;

public class LogDAO implements ObjectDAO {
	public static List<Log> mapLog = loadData();

	public LogDAO() {
		
		// TODO Auto-generated constructor stub
	}

	private static List<Log> loadData() {
		List<Log> mapTemp = new ArrayList<>();
		try {
			String query = "select * from Logs o";
			Connection connect = new ConnectToDatabase().getConnection();
			Statement stmt =  connect.createStatement();
			ResultSet rs=	stmt.executeQuery(query);
			while (rs.next()) {
				int id = rs.getInt(1);
				int level = rs.getInt(2);
				String nameAcc = rs.getString(3);
				String src = rs.getString(4);
				String ip_address = rs.getString(5);
				String user_agent = rs.getString(6);
				String content = rs.getString(7);
				Date createAt = rs.getDate(8);
				int status = rs.getInt(9);
				Log log = new Log(id,level, nameAcc, src,ip_address,user_agent, content,createAt , status);
				mapTemp.add(log);

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mapTemp;

	}

	


		public static void main(String[] args) throws Exception {
			System.out.println(mapLog);
	}
	@Override
	public boolean add(Object obj){
		return false;
	}
	public boolean add(Object obj, HttpServletRequest request) {

		String ipAddress = request.getRemoteAddr();
		String userAgent = request.getHeader("User-Agent");
		Log log = (Log) obj;
		mapLog.add(log);
		String sql = "insert into Logs (level, nameAcc, src,ip_address,user_agent, content, status) values(?,?,?,?,?,?,?);";
		try {
			Connection connect = new ConnectToDatabase().getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setInt(1, log.getLevel());
			ppstm.setString(2, log.getUserId());
			ppstm.setString(3, log.getSrc());
			ppstm.setString(4, ipAddress);
			ppstm.setString(5, userAgent);
			ppstm.setString(6, log.getContent());
			ppstm.setInt(7, log.getStatus());
			
			
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
		Log log = (Log) obj;
		mapLog.add(log);
		try {
			String sql = "update Logs set level=?,nameAcc=?,src=?,content=?,createAt=?,status=? where id=?";
			Connection connect = new ConnectToDatabase().getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setInt(1, log.getLevel());
			ppstm.setString(2, log.getUserId());
			ppstm.setString(3, log.getSrc());
			ppstm.setString(4, log.getContent());
			ppstm.setDate(5, log.getCreatAt());
			ppstm.setInt(6, log.getStatus());
			ppstm.setString(7, id);
			
			return true;

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return false;

	}

	public String getVisitOfMonth(){
		Map<String, Integer> map = new LinkedHashMap<>();
		String sql = "SELECT DATE_FORMAT(createAt, '%Y-%m') AS month, COUNT(*) AS visits\n" +
				"FROM Logs\n" +
				"GROUP BY month\n" +
				"ORDER BY month ASC";
		try {
			Connection connect = new ConnectToDatabase().getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ResultSet rss = null;
			rss =ppstm.executeQuery();

			while(rss.next()) {
				String	month = rss.getString(1);
				// Chuyển đổi số tháng sang tên tiếng Anh

				int total = rss.getInt(2);

				map.put(month,total);
			}
			Gson gson = new Gson();
			String rs = gson.toJson(map);
			return rs;
		}catch (Exception e){
			e.printStackTrace();
		}

		return null;
	}
	@Override
	public boolean delete(String nameAcc) {
		return false;
		
	}

}
