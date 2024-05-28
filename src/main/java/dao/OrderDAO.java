package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.*;
import java.sql.*;


import com.google.gson.Gson;
import model.ConnectToDatabase;
import model.OrderProduct;

public class OrderDAO implements ObjectDAO {
	public static Map<String, OrderProduct> mapDonHang = loadData();

	public OrderDAO() {
		// TODO Auto-generated constructor stub
	}
	private static Map<String, OrderProduct> loadData(){
		Map<String, OrderProduct> mapTemp = new HashMap<String, OrderProduct>();
		try {
			String query = "select * from OrderProducts";
			Connection connect = new ConnectToDatabase().getConnection();
			Statement stmt =  connect.createStatement();
			ResultSet rs=	stmt.executeQuery(query);

			while (rs.next()) {
				String idOrder = rs.getString(1);
				String nameAcc  = rs.getString(2);
				String dateOrder  = rs.getString(3);
				String dateDelivery  = rs.getString(4);
				String totalMoney  = rs.getString(5);
				String phone  = rs.getString(6);
				String nameRecipient  = rs.getString(7);
				String address  = rs.getString(8);
				String note  = rs.getString(9);
				String checkout = rs.getString(10);
				String status  = rs.getString(11);
				OrderProduct donHang = new OrderProduct(idOrder, nameAcc, dateOrder,dateDelivery, totalMoney, phone, nameRecipient, address, note, checkout, status);
				mapTemp.put(donHang.getIdOrder(), donHang);

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mapTemp;

	}
	@Override
	public boolean add(Object obj) {
		OrderProduct sp = (OrderProduct) obj;
		mapDonHang.put(sp.getIdOrder(), sp);
		String sql = "insert into OrderProducts values(?,?,?,?,?,?,?,?,?,?,?)";
		try {
			Connection connect = new ConnectToDatabase().getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1,sp.getIdOrder());
			ppstm.setString(2,sp.getNameAcc());
			ppstm.setString(3,sp.getDateOrder());
			ppstm.setString(4,sp.getDateDelivery());
			ppstm.setString(5,sp.getTotalMoney());
			ppstm.setString(6,sp.getPhone());
			ppstm.setString(7,sp.getNameRecipient());
			ppstm.setString(8,sp.getAddress());
			ppstm.setString(9,sp.getNote());
			ppstm.setString(10,sp.getCheckout());
			ppstm.setString(11, sp.getStatus());
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
		OrderProduct donHang = (OrderProduct) obj;
		mapDonHang.replace(id, donHang);
		try {
			String sql = "update OrderProducts set nameAcc=?,dateOrder=?,dateDelivery=?,totalMoney=?,phone=?,nameRecipient=?,address=?,note=?, checkout=?,status=? where idOrder=?";
			Connection connect = new ConnectToDatabase().getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1,donHang.getNameAcc());
			ppstm.setString(2,donHang.getDateOrder());
			ppstm.setString(3,donHang.getDateDelivery());
			ppstm.setString(4,donHang.getTotalMoney());
			ppstm.setString(5,donHang.getPhone());
			ppstm.setString(6,donHang.getNameRecipient());
			ppstm.setString(7,donHang.getAddress());
			ppstm.setString(8,donHang.getNote());
			ppstm.setString(9, donHang.getCheckout());
			ppstm.setString(10,donHang.getStatus());
			ppstm.setString(11,donHang.getIdOrder());
			ppstm.executeUpdate();
			return true;

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return false;

	}
	@Override
	public boolean delete(String id) {
		mapDonHang.remove(id);
		try {

			String sql = "delete from OrderProducts where idOrder='"+id+"'";
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
	public List<OrderProduct> top5DonHang(String userName){
		try {
			String query = "with x as (select *, ROW_NUMBER() over (order by dateOrder DESC) as r from OrderProducts  where nameAcc = ? )\r\n"
					+ "	select * from x where r between 1 and 5";
			Connection connect = new ConnectToDatabase().getConnection();
			PreparedStatement ppstm = connect.prepareStatement(query);
			ppstm.setString(1, userName);
			ResultSet rs = null;
			rs =ppstm.executeQuery();
			List<OrderProduct> list = new ArrayList<OrderProduct>();
			while(rs.next()) {
				OrderProduct sp = new OrderProduct(rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7),
						rs.getString(8),
						rs.getString(9),
						rs.getString(10),
						rs.getString(11)
				);
				list.add(sp);
			}
			return list;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	public List<OrderProduct> searchByAttribute(int index, int size, String txtSearch){
		try {
			Connection connect = new ConnectToDatabase().getConnection();
			ResultSet rs = null;
			PreparedStatement ppstm;
			List<OrderProduct> list = new ArrayList<OrderProduct>();
			String query="";
			if(txtSearch==null) {
				query = "with x as (select *, ROW_NUMBER() over (order by nameAcc ASC ) as r from OrderProducts)\r\n"
						+ "select * from x where r between ?*?-(?-1) and ?*?";
				ppstm = connect.prepareStatement(query);
				ppstm.setInt(1, index);
				ppstm.setInt(2, size);
				ppstm.setInt(3, size);
				ppstm.setInt(4, index);
				ppstm.setInt(5, size);
			}else {
				query = "with x as (select *,  ROW_NUMBER() over (order by nameAcc ASC ) as r from OrderProducts where nameAcc like ?)\r\n"
						+ "select * from x where r between ?*?-(?-1) and ?*?";
				ppstm = connect.prepareStatement(query);
				ppstm.setString(1, "%"+txtSearch+"%");
				ppstm.setInt(2, index);
				ppstm.setInt(3, size);
				ppstm.setInt(4, size);
				ppstm.setInt(5, index);
				ppstm.setInt(6, size);
			}
			rs= ppstm.executeQuery();
			while(rs.next()) {
				OrderProduct dh = new OrderProduct(rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7),
						rs.getString(8),
						rs.getString(9),
						rs.getString(10),
						rs.getString(11));

				list.add(dh);
			}
			return list;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;

	}
	public String maxMaDH() {
		try {
			String query = "select MAX(MaDH)  from OrderProducts";
			Connection connect = new ConnectToDatabase().getConnection();
			PreparedStatement ppstm = connect.prepareStatement(query);
			ResultSet rs = null;
			rs =ppstm.executeQuery();
			String max= "";
			while(rs.next()) {
				max = rs.getString(1);
			}
			return max;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	public String getRevenueStats(){
		Map<String,Integer> map = new LinkedHashMap<>();
		String[] monthNames = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
		try {
			String sql = "SELECT YEAR(dateOrder) as year, MONTH(dateOrder) as month, SUM(totalMoney) as total_revenue\n" +
					"FROM OrderProducts\n" +
					"GROUP BY YEAR(dateOrder), MONTH(dateOrder) order by MONTH(dateOrder)";
			Connection connect = new ConnectToDatabase().getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ResultSet rss = null;
			rss =ppstm.executeQuery();

			while(rss.next()) {

				int	month = rss.getInt(2);
				// Chuyển đổi số tháng sang tên tiếng Anh
				String monthName = monthNames[month - 1];
				System.out.println(monthName);
				int 	total = rss.getInt(3);

				map.put(monthName,total);
			}
			Gson gson = new Gson();
			String rs = gson.toJson(map);

			return rs;
		}catch (Exception e){
			e.printStackTrace();
		}
		return null;
	}
	public int  getOrderNotProcessed(){
		int numOrderNoProcessed = 0;
		for(OrderProduct o : mapDonHang.values()){
			if(o.getStatus().equals("0")){
				numOrderNoProcessed++;
			}
		}
		System.out.println(numOrderNoProcessed);
		return numOrderNoProcessed;
	}
	public int getTotloPriceYear(){
		int rs = 0;
		for(OrderProduct o : mapDonHang.values()){
			if(o.getStatus().equals("1")){
				rs+= Double.parseDouble(o.getTotalMoney());
			}
		}
		System.out.println(rs);

		return rs;
	}
	public int getTotalMonthNow(){
		// Lấy thời gian hiện tại
		Calendar calendar = Calendar.getInstance();
		// Lấy ngày, tháng và năm từ thời gian hiện tại
		int month = calendar.get(Calendar.MONTH) + 1; // Tháng bắt đầu từ 0, nên cần cộng 1
		int year = calendar.get(Calendar.YEAR);
		String sql = "select sum(totalMoney) from OrderProducts where " + month+" = month(now()) and "+ year +" = year(now()) and status =1";

		try {
			Connection connect = new ConnectToDatabase().getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ResultSet rss = null;
			rss =ppstm.executeQuery();

			while(rss.next()) {
				int	total = rss.getInt(1);
				return total;

			}
		}catch (Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	public static void main(String[] args) {
		OrderDAO dh = new OrderDAO();

//		System.out.println(dh.top5DonHang("anphan219"));
//		System.out.println(dh.maxMaDH());
//		System.out.println(dh.searchByAttribute(1, 1, null));
		System.out.println(dh.getTotalMonthNow());
	}


}
