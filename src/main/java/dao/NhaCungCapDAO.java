package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import model.ConnectToDatabase;
import model.Vendor;
import model.Vendor;

public class NhaCungCapDAO implements ObjectDAO {
	public static Map<String, Vendor> mapNhaCC = loadData();
	
	public NhaCungCapDAO() {
		// TODO Auto-generated constructor stub
	}
	private static Map<String, Vendor> loadData(){
		Map<String, Vendor> mapTemp = new HashMap<String, Vendor>();
		try {
			String query = "select * from NHACUNGCAP";
			Connection connect = new ConnectToDatabase().getConnection();
			Statement stmt =  connect.createStatement();
			ResultSet rs=	stmt.executeQuery(query);
			while (rs.next()) {
				String maNCC = rs.getString(1);
				String tenNCC  = rs.getString(2);
				String diaChi  = rs.getString(3);
				String sdt  = rs.getString(4);

				Vendor ncc = new Vendor(maNCC, tenNCC, diaChi, sdt);
				mapTemp.put(ncc.getVendorId(), ncc);
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mapTemp;
		
	}
	@Override
	public boolean add(Object obj) {
		Vendor ncc = (Vendor) obj;
		mapNhaCC.put(ncc.getVendorId(), ncc);
		String sql = "insert into NHACUNGCAP values(?,?,?,?)";
		
		try {
			Connection connect = new ConnectToDatabase().getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1,ncc.getVendorId());
			ppstm.setString(2,ncc.getVendorName());
			ppstm.setString(3,ncc.getAddressV());
			ppstm.setString(4,ncc.getPhoneV());
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
		Vendor sp = (Vendor) obj;
		mapNhaCC.replace(id, sp);
		try {	
			String sql = "update NHACUNGCAP set TenNCC=?,Diachi=?,Sdt=? where MaNCC=?";
				Connection connect = new ConnectToDatabase().getConnection();
				PreparedStatement ppstm = connect.prepareStatement(sql);
				ppstm.setString(1,sp.getVendorName());
				ppstm.setString(2,sp.getAddressV());
				ppstm.setString(3,sp.getPhoneV());
				ppstm.setString(4,id);
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
		mapNhaCC.remove(id);
		try {
			String sql = "delete from NHACUNGCAP where MaNCC='"+id+"'";
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
