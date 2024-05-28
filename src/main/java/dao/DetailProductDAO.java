package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.ConnectToDatabase;
import model.DetailProduct;

public class DetailProductDAO implements ObjectDAO {
	public static Map<String, DetailProduct> mapDetailProduct = loadData();

	public DetailProductDAO() {
		// TODO Auto-generated constructor stub
	}
	private static Map<String, DetailProduct> loadData(){
		Map<String, DetailProduct> mapTemp = new HashMap<String, DetailProduct>();
		try {
			String query = "select * from DetailProducts";
			Connection connect = new ConnectToDatabase().getConnection();
			Statement stmt =  connect.createStatement();
			ResultSet rs=	stmt.executeQuery(query);
			while (rs.next()) {
				String 	maSP = rs.getString(1);
				String 	maNCC  = rs.getString(2);
				String  moTa  = rs.getString(3);
				String loaiSP  = rs.getString(4);
				String gioiTinh = rs.getString(5);
				String chatLieu  = rs.getString(6);
				String kieuDang = rs.getString(7);
				String xuatXu  = rs.getString(8);
				String phongCach  = rs.getString(9);
				String thBaoHanh = rs.getString(10);


				DetailProduct ct_sp = new DetailProduct(maSP, maNCC, moTa, loaiSP, gioiTinh,chatLieu,kieuDang, xuatXu, phongCach,thBaoHanh);
				mapTemp.put(ct_sp.getIdP(), ct_sp);

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mapTemp;

	}
	public static void main(String[] args) {
//		System.out.println(ChiTietSanPhamDAO.mapChiTiet_SanPham);
		DetailProductDAO c = new DetailProductDAO();
		System.out.println(c.loadData());
	}
	@Override
	public boolean add(Object obj) {
		DetailProduct ct_sp = (DetailProduct) obj;
		mapDetailProduct.put(ct_sp.getIdP(), ct_sp);
		String sql = "insert into DetailProducts values(?,?,?,?,?,?,?,?,?,?)";

		try {
			Connection connect = new ConnectToDatabase().getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1,ct_sp.getIdP());
			ppstm.setString(2,ct_sp.getVendorId());
			ppstm.setString(3,ct_sp.getDesciption());
			ppstm.setString(4,ct_sp.getTypeP());
			ppstm.setString(5,ct_sp.getSex());
			ppstm.setString(6,ct_sp.getMaterial());
			ppstm.setString(7,ct_sp.getDesigns());
			ppstm.setString(8,ct_sp.getOrigin());
			ppstm.setString(9,ct_sp.getStyle());
			ppstm.setString(10,ct_sp.getWarrantyPeriod());

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
		DetailProduct ct_sp = (DetailProduct) obj;
		mapDetailProduct.replace(id, ct_sp);
		try {
			String sql = "update DetailProducts set vendorId=?,desciption=?,typeP=?,sex=?,material=?,designs=?,origin=?,style=?,warrantyPeriod=? where idP=?";
			Connection connect = new ConnectToDatabase().getConnection();
			PreparedStatement ppstm = connect.prepareStatement(sql);
			ppstm.setString(1,ct_sp.getVendorId());
			ppstm.setString(2,ct_sp.getDesciption());
			ppstm.setString(3,ct_sp.getTypeP());
			ppstm.setString(4,ct_sp.getSex());
			ppstm.setString(5,ct_sp.getMaterial());
			ppstm.setString(6,ct_sp.getDesigns());
			ppstm.setString(7,ct_sp.getOrigin());
			ppstm.setString(8,ct_sp.getStyle());
			ppstm.setString(9,ct_sp.getWarrantyPeriod());
			ppstm.setString(10,id);
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
		mapDetailProduct.remove(id);
		try {
			String sql = "delete from DetailProducts where idP='"+id+"'";
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
	public int tongLoai(String loai) {
		try {
			String query = "select count(*) from DetailProducts where typeP like ?";
			//mở kết nối tới db
			Connection connect = new ConnectToDatabase().getConnection();
			// truyền câu lệnh query vào sql
			PreparedStatement ppstm = connect.prepareStatement(query);
			ppstm.setString(1, "%"+loai+"%");
			//execute và nhận kết quả trả về
			ResultSet rs = null;
			rs =ppstm.executeQuery();
			while(rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}
	public List<String> listLoaiSP(){
		try {
			String query = "select distinct typeP from DetailProducts order by typeP ASC";

			//mở kết nối tới db
			Connection connect = new ConnectToDatabase().getConnection();
			// truyền câu lệnh query vào sql
			PreparedStatement ppstm = connect.prepareStatement(query);
			//execute và nhận kết quả trả về
			ResultSet rs = null;
			rs =ppstm.executeQuery();
			List<String> list = new ArrayList<String>();
			while(rs.next()) {
				//trả về dữ liệu của chỉ mục cột được chỉ định
				list.add(rs.getString(1));
			}
			return list;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}




}
