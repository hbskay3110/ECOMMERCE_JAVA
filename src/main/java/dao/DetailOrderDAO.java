package dao;

import model.ConnectToDatabase;
import model.DetailOrder;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DetailOrderDAO implements ObjectDAO {
	public List<DetailOrder> mapDS_DonHang = loadData();
	
	public DetailOrderDAO() {
		// TODO Auto-generated constructor stub
	}
	private List<DetailOrder> loadData(){
		List<DetailOrder> mapTemp = new ArrayList<DetailOrder>();
		try {
			String query = "select * from DetailOrders";
			Connection connect = new ConnectToDatabase().getConnection();
			Statement stmt =  connect.createStatement();
			ResultSet rs=	stmt.executeQuery(query);
			while (rs.next()) {
				String 	maDH = rs.getString("idOrder");
				String 	maSP  = rs.getString("idP");
				String  soLuongMua  = rs.getString("amount");
				String  gia  = rs.getString("price");
				int sl = Integer.parseInt(soLuongMua);
				double giaD = Double.parseDouble(gia);
				DetailOrder ds_dh = new DetailOrder(maDH, maSP, sl, giaD);
				mapTemp.add(ds_dh);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mapTemp;
		
	}
	@Override
	public boolean add(Object obj) {
		DetailOrder ds_dh = (DetailOrder) obj;
		mapDS_DonHang.add(ds_dh);
		String sql = "insert into DetailOrders values(?,?,?,?)";
		
		try {
			Connection connect = new ConnectToDatabase().getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1,ds_dh.getIdOrder());
			ppstm.setString(2,ds_dh.getIdP());
			ppstm.setInt(3,ds_dh.getAmount());
			ppstm.setDouble(4,ds_dh.getPrice());
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
	public boolean delete(String id) {
		for (int i= 0; i<mapDS_DonHang.size();i++) {
			if(mapDS_DonHang.get(i).getIdOrder().equals(id)) {
				mapDS_DonHang.remove(i);
			}
		}
		try {
			String sql = "delete from DetailOrders where idOrder='"+id+"'";
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
	public List<DetailOrder> dsDHByMaDH(String id) {
		List<DetailOrder> rs = new ArrayList<DetailOrder>();
		for (DetailOrder ds_DonHang : mapDS_DonHang) {	
			if(ds_DonHang.getIdOrder().equals(id)) {
				rs.add(ds_DonHang);		
			}
		}
		return rs;
	}
	public static void main(String[] args) {
		DetailOrderDAO d= new DetailOrderDAO();
		System.out.println(d.mapDS_DonHang);
		System.out.println(d.dsDHByMaDH("54d28a1e0f8a4606afbd40325c2e277f"));
	}

}
